package com.cet4.platform.support;

import com.cet4.platform.common.BusinessException;
import com.cet4.platform.domain.ExamStatus;
import com.cet4.platform.domain.QuestionTypes;
import com.cet4.platform.dto.AnswerItemDTO;
import com.cet4.platform.dto.ExamSubmitRequest;
import com.cet4.platform.dto.SubmitAnswerDTO;
import com.cet4.platform.entity.ExamRecord;
import com.cet4.platform.entity.Question;
import com.cet4.platform.entity.User;
import com.cet4.platform.entity.UserAnswer;
import com.cet4.platform.mapper.ExamRecordMapper;
import com.cet4.platform.mapper.QuestionMapper;
import com.cet4.platform.mapper.UserAnswerMapper;
import com.cet4.platform.support.ExamScoringSupport.ScoringResult;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Component
@RequiredArgsConstructor
public class ExamSubmissionCoordinator {

    private final ExamPaperResolver examPaperResolver;
    private final ExamRecordAccessSupport examRecordAccessSupport;
    private final ExamQuerySupport examQuerySupport;
    private final ExamCacheStore examCacheStore;
    private final ExamScoringSupport examScoringSupport;
    private final ExamSubmissionWriter examSubmissionWriter;
    private final ExamRecordMapper examRecordMapper;
    private final QuestionMapper questionMapper;
    private final UserAnswerMapper userAnswerMapper;

    public Map<String, Object> submitExamSession(ExamSubmitRequest request, User user) {
        Long examId = examPaperResolver.resolveExamIdByPaperId(request.getPaperId());
        String submitLockToken = examCacheStore.acquireSubmitLock(user.getId(), examId);
        if (submitLockToken == null) {
            log.warn("重复提交被拦截: userId={}, examId={}", user.getId(), examId);
            throw new BusinessException("请勿重复提交，请稍后再试");
        }

        boolean success = false;
        try {
            List<Question> questions = examQuerySupport.listQuestions(examId);
            if (questions.isEmpty()) {
                throw new BusinessException("试卷未配置题目");
            }

            Map<String, String> answers = request.getAnswers() == null ? Map.of() : request.getAnswers();
            ScoringResult scoringResult = examScoringSupport.score(answers, questions);

            LocalDateTime now = LocalDateTime.now();
            LocalDateTime startTime = readStartedAt(user, now);
            ExamRecord examRecord = examSubmissionWriter.saveSubmittedSession(
                    user,
                    examId,
                    request.getPaperId(),
                    startTime,
                    now,
                    answers,
                    questions,
                    scoringResult);

            examCacheStore.clearSession(user.getId(), request.getPaperId());
            success = true;
            log.info("考试提交成功: userId={}, examId={}, recordId={}, score={}, total={}",
                    user.getId(), examId, examRecord.getId(), scoringResult.getScore(), scoringResult.getTotal());

            Map<String, Object> result = new HashMap<>();
            result.put("recordId", examRecord.getId());
            result.put("score", scoringResult.getScore());
            result.put("total", scoringResult.getTotal());
            return result;
        } finally {
            if (!success) {
                examCacheStore.releaseSubmitLock(user.getId(), examId, submitLockToken);
            }
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public Map<String, Object> submitExamRecord(Long recordId, User user, SubmitAnswerDTO submitAnswerDTO) {
        ExamRecord examRecord = examRecordAccessSupport.getAndValidateExamRecord(recordId, user.getId());
        String submitLockToken = examCacheStore.acquireSubmitLock(user.getId(), examRecord.getExamId());
        if (submitLockToken == null) {
            log.warn("重复提交被拦截: userId={}, examId={}", user.getId(), examRecord.getExamId());
            throw new BusinessException("请勿重复提交，请稍后再试");
        }

        boolean success = false;
        try {
            if (!ExamStatus.IN_PROGRESS.equals(examRecord.getStatus())) {
                throw new BusinessException("考试记录状态不是 in_progress，无法提交");
            }

            List<AnswerItemDTO> answerItems = submitAnswerDTO == null || submitAnswerDTO.getAnswers() == null
                    ? List.of()
                    : submitAnswerDTO.getAnswers();

            int totalObjectiveScore = saveRecordAnswers(recordId, user, examRecord, answerItems);
            examRecord.setTotalScore(totalObjectiveScore);
            examRecord.setStatus(ExamStatus.SUBMITTED);
            examRecord.setSubmitTime(LocalDateTime.now());
            examRecordMapper.updateById(examRecord);

            success = true;
            Map<String, Object> result = new HashMap<>();
            result.put("totalScore", totalObjectiveScore);
            result.put("examRecordId", recordId);
            return result;
        } finally {
            if (!success) {
                examCacheStore.releaseSubmitLock(user.getId(), examRecord.getExamId(), submitLockToken);
            }
        }
    }

    private LocalDateTime readStartedAt(User user, LocalDateTime fallback) {
        try {
            return examCacheStore.readStartedAt(user.getId(), fallback);
        } catch (Exception e) {
            log.warn("解析 Redis session startedAt 失败，使用当前时间作为 startTime", e);
            return fallback;
        }
    }

    private int saveRecordAnswers(Long recordId, User user, ExamRecord examRecord, List<AnswerItemDTO> answerItems) {
        List<Long> questionIds = answerItems.stream()
                .map(AnswerItemDTO::getQuestionId)
                .filter(Objects::nonNull)
                .distinct()
                .toList();

        Map<Long, Question> questionMap = questionIds.isEmpty()
                ? Map.of()
                : questionMapper.selectBatchIds(questionIds).stream()
                .collect(Collectors.toMap(Question::getId, q -> q));

        int totalObjectiveScore = 0;
        for (AnswerItemDTO answerItem : answerItems) {
            totalObjectiveScore += saveOneAnswer(recordId, user, examRecord, answerItem, questionMap);
        }
        return totalObjectiveScore;
    }

    private int saveOneAnswer(Long recordId,
                              User user,
                              ExamRecord examRecord,
                              AnswerItemDTO answerItem,
                              Map<Long, Question> questionMap) {
        Long questionId = answerItem.getQuestionId();
        if (questionId == null) {
            throw new BusinessException("questionId 不能为空");
        }

        Question question = questionMap.get(questionId);
        if (question == null || !Objects.equals(question.getExamId(), examRecord.getExamId())) {
            throw new BusinessException("题目不存在或不属于当前考试");
        }

        UserAnswer userAnswer = new UserAnswer();
        userAnswer.setExamRecordId(recordId);
        userAnswer.setUserId(user.getId());
        userAnswer.setQuestionId(questionId);
        userAnswer.setUserAnswer(answerItem.getAnswer());

        int score = 0;
        if (QuestionTypes.isObjective(question.getQuestionType())) {
            boolean isCorrect = Objects.equals(ExamScoringSupport.normalizeAnswer(answerItem.getAnswer()),
                    ExamScoringSupport.normalizeAnswer(question.getCorrectAnswer()));
            score = isCorrect ? question.getScore() : 0;
            userAnswer.setIsCorrect(isCorrect ? 1 : 0);
            userAnswer.setScore(score);
        }

        userAnswerMapper.insert(userAnswer);
        return score;
    }
}

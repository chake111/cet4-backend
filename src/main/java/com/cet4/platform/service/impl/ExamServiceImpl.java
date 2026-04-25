package com.cet4.platform.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.cet4.platform.common.BusinessException;
import com.cet4.platform.dto.AnswerItemDTO;
import com.cet4.platform.dto.ExamDraftSaveRequest;
import com.cet4.platform.dto.ExamStartRequest;
import com.cet4.platform.dto.ExamSubmitRequest;
import com.cet4.platform.dto.SubmitAnswerDTO;
import com.cet4.platform.entity.Exam;
import com.cet4.platform.entity.ExamRecord;
import com.cet4.platform.entity.Question;
import com.cet4.platform.entity.User;
import com.cet4.platform.entity.UserAnswer;
import com.cet4.platform.mapper.ExamMapper;
import com.cet4.platform.mapper.ExamRecordMapper;
import com.cet4.platform.mapper.QuestionMapper;
import com.cet4.platform.mapper.UserAnswerMapper;
import com.cet4.platform.mapper.UserMapper;
import com.cet4.platform.service.ExamService;
import com.cet4.platform.vo.AnswerDetailVO;
import com.cet4.platform.vo.ExamResultVO;
import com.cet4.platform.vo.ExamVO;
import com.cet4.platform.vo.QuestionVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.Duration;
import java.util.HashMap;
import java.util.List;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ExamServiceImpl implements ExamService {

    private static final String IN_PROGRESS = "in_progress";
    private static final String SUBMITTED = "submitted";
    private static final Set<String> OBJECTIVE_TYPES = Set.of("single_choice", "blank_filling", "matching");
    private static final String DRAFT_KEY_FORMAT = "exam:draft:%d:%s";
    private static final String SESSION_KEY_FORMAT = "exam:session:%d";
    private static final Duration SESSION_TTL = Duration.ofMinutes(130);

    private final ExamMapper examMapper;
    private final QuestionMapper questionMapper;
    private final ExamRecordMapper examRecordMapper;
    private final UserMapper userMapper;
    private final UserAnswerMapper userAnswerMapper;
    private final StringRedisTemplate stringRedisTemplate;
    private final ObjectMapper objectMapper;

    @Override
    public List<ExamVO> listPublishedExams() {
        List<Exam> exams = examMapper.selectList(new LambdaQueryWrapper<Exam>()
                .eq(Exam::getStatus, 1)
                .orderByDesc(Exam::getYear)
                .orderByDesc(Exam::getMonth)
                .orderByDesc(Exam::getSetNo));

        return exams.stream().map(exam -> {
            ExamVO examVO = new ExamVO();
            BeanUtils.copyProperties(exam, examVO);
            return examVO;
        }).toList();
    }

    @Override
    public List<QuestionVO> listExamQuestions(Long examId) {
        List<Question> questions = questionMapper.selectList(new LambdaQueryWrapper<Question>()
                .eq(Question::getExamId, examId)
                .orderByAsc(Question::getSortOrder));

        return questions.stream().map(question -> {
            QuestionVO questionVO = new QuestionVO();
            BeanUtils.copyProperties(question, questionVO);
            return questionVO;
        }).toList();
    }

    @Override
    public Map<String, Long> startExam(Long examId, String username) {
        User user = getUserByUsername(username);

        ExamRecord existing = examRecordMapper.selectOne(new LambdaQueryWrapper<ExamRecord>()
                .eq(ExamRecord::getUserId, user.getId())
                .eq(ExamRecord::getExamId, examId)
                .eq(ExamRecord::getStatus, IN_PROGRESS)
                .orderByDesc(ExamRecord::getId)
                .last("limit 1"));

        Long examRecordId;
        if (existing != null) {
            examRecordId = existing.getId();
        } else {
            ExamRecord examRecord = new ExamRecord();
            examRecord.setUserId(user.getId());
            examRecord.setExamId(examId);
            examRecord.setStatus(IN_PROGRESS);
            examRecord.setStartTime(LocalDateTime.now());
            examRecordMapper.insert(examRecord);
            examRecordId = examRecord.getId();
        }

        Map<String, Long> result = new HashMap<>();
        result.put("examRecordId", examRecordId);
        return result;
    }

    @Override
    public Map<String, Object> startExamSession(ExamStartRequest request, String username) {
        User user = getUserByUsername(username);
        Long examId = resolveExamIdByPaperId(request.getPaperId());

        List<Question> questions = questionMapper.selectList(new LambdaQueryWrapper<Question>()
                .eq(Question::getExamId, examId)
                .orderByAsc(Question::getSortOrder));
        if (questions.isEmpty()) {
            throw new BusinessException("试卷未配置题目");
        }

        Map<String, List<QuestionVO>> questionsByStage = questions.stream().map(question -> {
            QuestionVO questionVO = new QuestionVO();
            BeanUtils.copyProperties(question, questionVO);
            return questionVO;
        }).collect(Collectors.groupingBy(
                questionVO -> mapStageKey(questionVO.getPart()),
                LinkedHashMap::new,
                Collectors.toList()));

        LocalDateTime startedAt = LocalDateTime.now();
        String draftKey = buildDraftKey(user.getId(), request.getPaperId());
        String sessionKey = buildSessionKey(user.getId());

        stringRedisTemplate.opsForValue().set(draftKey, "{}");
        stringRedisTemplate.opsForValue().set(sessionKey,
                toJson(Map.of("paperId", request.getPaperId(), "startedAt", startedAt.toString())),
                SESSION_TTL);

        Map<String, Object> result = new HashMap<>();
        result.put("paperId", request.getPaperId());
        result.put("questionsByStage", questionsByStage);
        result.put("startedAt", startedAt);
        return result;
    }

    private String mapStageKey(String part) {
        if (part != null && part.startsWith("reading")) {
            return "reading";
        }
        return part;
    }

    @Override
    public Map<String, Boolean> saveExamDraft(ExamDraftSaveRequest request, String username) {
        User user = getUserByUsername(username);
        String key = buildDraftKey(user.getId(), request.getPaperId());
        String raw = stringRedisTemplate.opsForValue().get(key);
        Map<String, String> draft = raw == null || raw.isBlank()
                ? new HashMap<>()
                : fromJson(raw, new TypeReference<>() {
                });

        String mapKey = request.getStage() + ":" + request.getQuestionId();
        draft.put(mapKey, request.getAnswer());
        stringRedisTemplate.opsForValue().set(key, toJson(draft));

        return Map.of("success", true);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Map<String, Object> submitExamSession(ExamSubmitRequest request, String username) {
        User user = getUserByUsername(username);
        Long examId = resolveExamIdByPaperId(request.getPaperId());

        List<Question> questions = questionMapper.selectList(new LambdaQueryWrapper<Question>()
                .eq(Question::getExamId, examId));
        if (questions.isEmpty()) {
            throw new BusinessException("试卷未配置题目");
        }

        int score = 0;
        int total = 0;
        for (Question question : questions) {
            total += question.getScore() == null ? 0 : question.getScore();
            String answer = request.getAnswers().get(String.valueOf(question.getId()));
            if (Objects.equals(normalizeAnswer(answer), normalizeAnswer(question.getCorrectAnswer()))) {
                score += question.getScore() == null ? 0 : question.getScore();
            }
        }

        LocalDateTime now = LocalDateTime.now();
        ExamRecord examRecord = new ExamRecord();
        examRecord.setUserId(user.getId());
        examRecord.setExamId(examId);
        examRecord.setPaperId(request.getPaperId());
        examRecord.setStartTime(now);
        examRecord.setSubmitTime(now);
        examRecord.setTotalScore(score);
        examRecord.setAnswers(toJson(request.getAnswers()));
        examRecord.setStatus(SUBMITTED);
        examRecordMapper.insert(examRecord);

        stringRedisTemplate.delete(buildDraftKey(user.getId(), request.getPaperId()));
        stringRedisTemplate.delete(buildSessionKey(user.getId()));

        Map<String, Object> result = new HashMap<>();
        result.put("recordId", examRecord.getId());
        result.put("score", score);
        result.put("total", total);
        return result;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Map<String, Object> submitExamRecord(Long recordId, String username, SubmitAnswerDTO submitAnswerDTO) {
        User user = getUserByUsername(username);
        ExamRecord examRecord = getAndValidateExamRecord(recordId, user.getId());

        if (!IN_PROGRESS.equals(examRecord.getStatus())) {
            throw new BusinessException("考试记录状态不是 in_progress，无法提交");
        }

        List<AnswerItemDTO> answerItems = submitAnswerDTO == null || submitAnswerDTO.getAnswers() == null
                ? List.of()
                : submitAnswerDTO.getAnswers();

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

            if (OBJECTIVE_TYPES.contains(question.getQuestionType())) {
                boolean isCorrect = Objects.equals(normalizeAnswer(answerItem.getAnswer()), normalizeAnswer(question.getCorrectAnswer()));
                int score = isCorrect ? question.getScore() : 0;
                userAnswer.setIsCorrect(isCorrect ? 1 : 0);
                userAnswer.setScore(score);
                totalObjectiveScore += score;
            }

            userAnswerMapper.insert(userAnswer);
        }

        examRecord.setTotalScore(totalObjectiveScore);
        examRecord.setStatus(SUBMITTED);
        examRecord.setSubmitTime(LocalDateTime.now());
        examRecordMapper.updateById(examRecord);

        Map<String, Object> result = new HashMap<>();
        result.put("totalScore", totalObjectiveScore);
        result.put("examRecordId", recordId);
        return result;
    }

    @Override
    public ExamResultVO getExamResult(Long recordId, String username) {
        User user = getUserByUsername(username);
        ExamRecord examRecord = getAndValidateExamRecord(recordId, user.getId());

        List<UserAnswer> userAnswers = userAnswerMapper.selectList(new LambdaQueryWrapper<UserAnswer>()
                .eq(UserAnswer::getExamRecordId, recordId)
                .eq(UserAnswer::getUserId, user.getId())
                .orderByAsc(UserAnswer::getId));

        List<Long> questionIds = userAnswers.stream()
                .map(UserAnswer::getQuestionId)
                .distinct()
                .toList();

        Map<Long, Question> questionMap = questionIds.isEmpty()
                ? Map.of()
                : questionMapper.selectBatchIds(questionIds).stream()
                .collect(Collectors.toMap(Question::getId, q -> q));

        List<AnswerDetailVO> answerDetails = userAnswers.stream().map(userAnswer -> {
            Question question = questionMap.get(userAnswer.getQuestionId());
            AnswerDetailVO detailVO = new AnswerDetailVO();
            detailVO.setQuestionId(userAnswer.getQuestionId());
            detailVO.setUserAnswer(userAnswer.getUserAnswer());
            detailVO.setIsCorrect(userAnswer.getIsCorrect());
            detailVO.setScore(userAnswer.getScore());
            detailVO.setAiFeedback(userAnswer.getAiFeedback());
            if (question != null) {
                detailVO.setQuestionNo(question.getQuestionNo());
                detailVO.setPart(question.getPart());
                detailVO.setQuestionType(question.getQuestionType());
                detailVO.setCorrectAnswer(question.getCorrectAnswer());
            }
            return detailVO;
        }).toList();

        ExamResultVO resultVO = new ExamResultVO();
        resultVO.setExamRecordId(examRecord.getId());
        resultVO.setExamId(examRecord.getExamId());
        resultVO.setStartTime(examRecord.getStartTime());
        resultVO.setSubmitTime(examRecord.getSubmitTime());
        resultVO.setTotalScore(examRecord.getTotalScore());
        resultVO.setStatus(examRecord.getStatus());
        resultVO.setAnswers(answerDetails);
        return resultVO;
    }

    private User getUserByUsername(String username) {
        User user = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .eq(User::getUsername, username)
                .last("limit 1"));

        if (user == null) {
            throw new BusinessException("用户不存在");
        }
        return user;
    }

    private ExamRecord getAndValidateExamRecord(Long recordId, Long userId) {
        ExamRecord examRecord = examRecordMapper.selectById(recordId);
        if (examRecord == null) {
            throw new BusinessException("考试记录不存在");
        }
        if (!Objects.equals(examRecord.getUserId(), userId)) {
            throw new AccessDeniedException("无权访问该考试记录");
        }
        return examRecord;
    }

    private String normalizeAnswer(String answer) {
        return answer == null ? null : answer.trim().toUpperCase();
    }

    private Long resolveExamIdByPaperId(String paperId) {
        try {
            return Long.parseLong(paperId);
        } catch (NumberFormatException ignored) {
            List<String> segments = List.of(paperId.split("-"));
            if (segments.size() != 3) {
                throw new BusinessException("paperId 格式不正确");
            }
            Integer year = parsePaperIdPart(segments.get(0), "year");
            Integer month = parsePaperIdPart(segments.get(1), "month");
            Integer setNo = parsePaperIdPart(segments.get(2), "setNo");
            Exam exam = examMapper.selectOne(new LambdaQueryWrapper<Exam>()
                    .eq(Exam::getYear, year)
                    .eq(Exam::getMonth, month)
                    .eq(Exam::getSetNo, setNo)
                    .last("limit 1"));
            if (exam == null) {
                throw new BusinessException("paperId 对应试卷不存在");
            }
            return exam.getId();
        }
    }

    private Integer parsePaperIdPart(String value, String partName) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException ex) {
            throw new BusinessException("paperId 的 " + partName + " 部分不合法");
        }
    }

    private String buildDraftKey(Long userId, String paperId) {
        return String.format(DRAFT_KEY_FORMAT, userId, paperId);
    }

    private String buildSessionKey(Long userId) {
        return String.format(SESSION_KEY_FORMAT, userId);
    }

    private String toJson(Object obj) {
        try {
            return objectMapper.writeValueAsString(obj);
        } catch (JsonProcessingException ex) {
            throw new BusinessException("JSON 序列化失败");
        }
    }

    private <T> T fromJson(String json, TypeReference<T> typeReference) {
        try {
            return objectMapper.readValue(json, typeReference);
        } catch (JsonProcessingException ex) {
            throw new BusinessException("JSON 解析失败");
        }
    }
}

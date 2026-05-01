package com.cet4.platform.support;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.cet4.platform.domain.QuestionTypes;
import com.cet4.platform.entity.Exam;
import com.cet4.platform.entity.ExamRecord;
import com.cet4.platform.entity.Question;
import com.cet4.platform.entity.UserAnswer;
import com.cet4.platform.mapper.ExamMapper;
import com.cet4.platform.mapper.QuestionMapper;
import com.cet4.platform.mapper.UserAnswerMapper;
import com.cet4.platform.vo.AnswerDetailVO;
import com.cet4.platform.vo.ExamResultVO;
import com.fasterxml.jackson.core.type.TypeReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ExamResultAssembler {

    private final ExamMapper examMapper;
    private final QuestionMapper questionMapper;
    private final UserAnswerMapper userAnswerMapper;
    private final JsonSupport jsonSupport;

    public ExamResultVO assemble(ExamRecord examRecord) {
        ExamResultVO resultVO = new ExamResultVO();
        resultVO.setRecordId(examRecord.getId());
        resultVO.setScore(examRecord.getTotalScore());
        resultVO.setPaperId(examRecord.getPaperId());
        resultVO.setStartTime(examRecord.getStartTime());
        resultVO.setSubmittedAt(examRecord.getSubmitTime());

        Exam exam = examMapper.selectById(examRecord.getExamId());
        resultVO.setTotal(exam != null && exam.getTotalScore() != null ? exam.getTotalScore() : 710);

        Map<String, Object> answerMap = examRecord.getAnswers() == null || examRecord.getAnswers().isBlank()
                ? Map.of()
                : jsonSupport.fromJson(examRecord.getAnswers(), new TypeReference<>() {
                });
        resultVO.setAnswers(answerMap);

        List<Question> questions = questionMapper.selectList(new LambdaQueryWrapper<Question>()
                .eq(Question::getExamId, examRecord.getExamId())
                .orderByAsc(Question::getSortOrder));

        List<UserAnswer> userAnswers = userAnswerMapper.selectList(new LambdaQueryWrapper<UserAnswer>()
                .eq(UserAnswer::getExamRecordId, examRecord.getId()));
        Map<Long, UserAnswer> userAnswerMap = userAnswers.stream()
                .collect(Collectors.toMap(UserAnswer::getQuestionId, ua -> ua, (a, b) -> a));

        ScoreSummary summary = new ScoreSummary();
        List<AnswerDetailVO> answerDetails = new ArrayList<>();
        for (Question question : questions) {
            answerDetails.add(toAnswerDetail(question, userAnswerMap.get(question.getId()), summary));
        }

        if (userAnswers.isEmpty() && examRecord.getTotalScore() != null) {
            summary.subjectiveScore = examRecord.getTotalScore() - summary.objectiveScore;
        }

        resultVO.setObjectiveScore(summary.objectiveScore);
        resultVO.setSubjectiveScore(summary.subjectiveScore);
        resultVO.setObjectiveCorrect(summary.objectiveCorrect);
        resultVO.setObjectiveTotal(summary.objectiveTotal);
        resultVO.setAnswerDetails(answerDetails);

        return resultVO;
    }

    private AnswerDetailVO toAnswerDetail(Question question, UserAnswer userAnswer, ScoreSummary summary) {
        AnswerDetailVO detail = new AnswerDetailVO();
        detail.setQuestionId(question.getId());
        detail.setQuestionNo(question.getQuestionNo());
        detail.setPart(question.getPart());
        detail.setQuestionType(question.getQuestionType());
        detail.setContent(question.getContent());
        detail.setFullScore(question.getScore());
        detail.setCorrectAnswer(question.getCorrectAnswer());

        boolean subjective = QuestionTypes.isSubjective(question.getQuestionType());
        if (userAnswer == null) {
            applyMissingAnswer(detail, question, subjective, summary);
            return detail;
        }

        detail.setUserAnswer(userAnswer.getUserAnswer());
        detail.setScore(userAnswer.getScore());
        detail.setAiFeedback(userAnswer.getAiFeedback());
        if (subjective) {
            detail.setCorrect(null);
            summary.subjectiveScore += userAnswer.getScore() != null ? userAnswer.getScore() : 0;
            return detail;
        }

        boolean isCorrect = userAnswer.getIsCorrect() != null && userAnswer.getIsCorrect() == 1;
        detail.setCorrect(isCorrect);
        summary.objectiveScore += userAnswer.getScore() != null ? userAnswer.getScore() : 0;
        if (hasCorrectAnswer(question)) {
            summary.objectiveTotal++;
            if (isCorrect) {
                summary.objectiveCorrect++;
            }
        }
        return detail;
    }

    private void applyMissingAnswer(AnswerDetailVO detail, Question question, boolean subjective, ScoreSummary summary) {
        detail.setUserAnswer(null);
        detail.setScore(0);
        if (subjective) {
            detail.setCorrect(null);
            return;
        }
        if (hasCorrectAnswer(question)) {
            detail.setCorrect(false);
            summary.objectiveTotal++;
        } else {
            detail.setCorrect(null);
        }
    }

    private boolean hasCorrectAnswer(Question question) {
        return question.getCorrectAnswer() != null && !question.getCorrectAnswer().isBlank();
    }

    private static class ScoreSummary {
        private int objectiveScore;
        private int subjectiveScore;
        private int objectiveCorrect;
        private int objectiveTotal;
    }
}

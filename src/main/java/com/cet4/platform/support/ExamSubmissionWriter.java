package com.cet4.platform.support;

import com.cet4.platform.domain.ExamStatus;
import com.cet4.platform.domain.QuestionTypes;
import com.cet4.platform.entity.ExamRecord;
import com.cet4.platform.entity.Question;
import com.cet4.platform.entity.User;
import com.cet4.platform.entity.UserAnswer;
import com.cet4.platform.mapper.ExamRecordMapper;
import com.cet4.platform.mapper.UserAnswerMapper;
import com.cet4.platform.support.ExamScoringSupport.ScoringResult;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
@RequiredArgsConstructor
public class ExamSubmissionWriter {

    private final ExamRecordMapper examRecordMapper;
    private final UserAnswerMapper userAnswerMapper;
    private final JsonSupport jsonSupport;

    @Transactional(rollbackFor = Exception.class)
    public ExamRecord saveSubmittedSession(User user,
                                           Long examId,
                                           String paperId,
                                           LocalDateTime startTime,
                                           LocalDateTime submitTime,
                                           Map<String, String> answers,
                                           List<Question> questions,
                                           ScoringResult scoringResult) {
        ExamRecord examRecord = new ExamRecord();
        examRecord.setUserId(user.getId());
        examRecord.setExamId(examId);
        examRecord.setPaperId(paperId);
        examRecord.setStartTime(startTime);
        examRecord.setSubmitTime(submitTime);
        examRecord.setTotalScore(scoringResult.getScore());
        examRecord.setAnswers(jsonSupport.toJson(answers));
        examRecord.setStatus(ExamStatus.SUBMITTED);
        examRecordMapper.insert(examRecord);

        Long recordId = examRecord.getId();
        for (Question question : questions) {
            UserAnswer userAnswer = new UserAnswer();
            userAnswer.setExamRecordId(recordId);
            userAnswer.setUserId(user.getId());
            userAnswer.setQuestionId(question.getId());
            userAnswer.setUserAnswer(answers.get(String.valueOf(question.getId())));
            userAnswer.setCreatedAt(submitTime);

            Integer questionScore = scoringResult.getQuestionScoreMap().get(question.getId());
            Boolean questionCorrect = scoringResult.getQuestionCorrectMap().get(question.getId());
            userAnswer.setScore(questionScore != null ? questionScore : 0);

            if (QuestionTypes.isSubjective(question.getQuestionType())) {
                userAnswer.setIsCorrect(null);
                if (questionScore != null) {
                    userAnswer.setAiScore(questionScore);
                }
                String feedback = scoringResult.getQuestionFeedbackMap().get(question.getId());
                if (feedback != null) {
                    userAnswer.setAiFeedback(feedback);
                }
            } else {
                userAnswer.setIsCorrect(Boolean.TRUE.equals(questionCorrect) ? 1 : 0);
            }

            userAnswerMapper.insert(userAnswer);
        }

        return examRecord;
    }
}

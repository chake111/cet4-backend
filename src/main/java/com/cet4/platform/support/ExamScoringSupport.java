package com.cet4.platform.support;

import com.cet4.platform.domain.QuestionTypes;
import com.cet4.platform.entity.Question;
import com.cet4.platform.service.AiScoringResult;
import com.cet4.platform.service.AiScoringService;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ExamScoringSupport {

    private final AiScoringService aiScoringService;

    public ScoringResult score(Map<String, String> answers, Iterable<Question> questions) {
        Map<Long, Question> questionMap = new HashMap<>();
        for (Question question : questions) {
            questionMap.put(question.getId(), question);
        }

        ScoringResult result = new ScoringResult();
        for (Question question : questionMap.values()) {
            int maxScore = question.getScore() == null ? 0 : question.getScore();
            result.total += maxScore;
            if (QuestionTypes.isSubjective(question.getQuestionType())) {
                continue;
            }
            String normalizedCorrectAnswer = normalizeAnswer(question.getCorrectAnswer());
            if (normalizedCorrectAnswer == null || normalizedCorrectAnswer.isBlank()) {
                continue;
            }
            String normalizedUserAnswer = normalizeAnswer(answers.get(String.valueOf(question.getId())));
            boolean correct = normalizedUserAnswer != null
                    && !normalizedUserAnswer.isBlank()
                    && Objects.equals(normalizedUserAnswer, normalizedCorrectAnswer);
            int questionScore = correct ? maxScore : 0;
            result.score += questionScore;
            result.questionScoreMap.put(question.getId(), questionScore);
            result.questionCorrectMap.put(question.getId(), correct);
        }

        for (Map.Entry<String, String> entry : answers.entrySet()) {
            Long questionId = parseQuestionId(entry.getKey());
            if (questionId == null) {
                continue;
            }
            Question question = questionMap.get(questionId);
            if (question == null || !QuestionTypes.isSubjective(question.getQuestionType())) {
                continue;
            }
            AiScoringResult aiResult = aiScoringService.scoreSubjectiveAnswer(
                    question.getQuestionType(),
                    question.getContent(),
                    entry.getValue(),
                    question.getScore() == null ? 0 : question.getScore());
            int aiScore = aiResult.getScore();
            result.score += aiScore;
            result.questionScoreMap.put(questionId, aiScore);
            result.questionCorrectMap.put(questionId, null);
            if (aiResult.getFeedback() != null) {
                result.questionFeedbackMap.put(questionId, aiResult.getFeedback());
            }
        }

        return result;
    }

    public static String normalizeAnswer(String answer) {
        return answer == null ? null : answer.trim().toUpperCase();
    }

    private Long parseQuestionId(String raw) {
        try {
            return Long.parseLong(raw);
        } catch (NumberFormatException ex) {
            return null;
        }
    }

    @Getter
    public static class ScoringResult {
        private int score;
        private int total;
        private final Map<Long, Integer> questionScoreMap = new HashMap<>();
        private final Map<Long, Boolean> questionCorrectMap = new HashMap<>();
        private final Map<Long, String> questionFeedbackMap = new HashMap<>();
    }
}

package com.cet4.platform.support;

import com.cet4.platform.entity.Question;
import com.cet4.platform.service.AiScoringResult;
import com.cet4.platform.service.AiScoringService;
import java.util.List;
import java.util.Map;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class ExamScoringSupportTest {

    @Test
    void scoresObjectiveAndSubjectiveQuestions() {
        AiScoringService aiScoringService = mock(AiScoringService.class);
        when(aiScoringService.scoreSubjectiveAnswer("writing", "prompt", "essay", 15))
                .thenReturn(AiScoringResult.of(12, "{\"overall\":\"ok\"}"));

        ExamScoringSupport support = new ExamScoringSupport(aiScoringService);

        Question choice = question(1L, "single_choice", "A", 10, "content");
        Question writing = question(2L, "writing", null, 15, "prompt");

        ExamScoringSupport.ScoringResult result = support.score(
                Map.of("1", " a ", "2", "essay"),
                List.of(choice, writing));

        assertEquals(22, result.getScore());
        assertEquals(25, result.getTotal());
        assertEquals(10, result.getQuestionScoreMap().get(1L));
        assertEquals(Boolean.TRUE, result.getQuestionCorrectMap().get(1L));
        assertEquals(12, result.getQuestionScoreMap().get(2L));
        assertNull(result.getQuestionCorrectMap().get(2L));
        assertEquals("{\"overall\":\"ok\"}", result.getQuestionFeedbackMap().get(2L));
    }

    private Question question(Long id, String type, String correctAnswer, Integer score, String content) {
        Question question = new Question();
        question.setId(id);
        question.setQuestionType(type);
        question.setCorrectAnswer(correctAnswer);
        question.setScore(score);
        question.setContent(content);
        return question;
    }
}

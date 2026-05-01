package com.cet4.platform.support;

import com.cet4.platform.service.AiScoringResult;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

class AiScoringResponseParserTest {

    private final AiScoringResponseParser parser = new AiScoringResponseParser(new ObjectMapper());

    @Test
    void parsesPlainJson() {
        AiScoringResult result = parser.parse("{\"score\":12,\"feedback\":{\"overall\":\"ok\"}}", 15);

        assertEquals(12, result.getScore());
        assertNotNull(result.getFeedback());
    }

    @Test
    void parsesMarkdownJsonBlock() {
        AiScoringResult result = parser.parse("```json\n{\"score\":9}\n```", 15);

        assertEquals(9, result.getScore());
    }

    @Test
    void parsesPlainNumberAndClampsToMaxScore() {
        AiScoringResult result = parser.parse("score: 99", 15);

        assertEquals(15, result.getScore());
        assertNull(result.getFeedback());
    }

    @Test
    void returnsFailResultForInvalidContent() {
        AiScoringResult result = parser.parse("no score here", 15);

        assertEquals(0, result.getScore());
        assertNull(result.getFeedback());
    }
}

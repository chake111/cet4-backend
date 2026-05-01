package com.cet4.platform.support;

import com.cet4.platform.service.AiScoringResult;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@RequiredArgsConstructor
public class AiScoringResponseParser {

    private static final Pattern SCORE_PATTERN = Pattern.compile("\\d+");
    private static final Pattern JSON_BLOCK_PATTERN =
            Pattern.compile("```(?:json)?\\s*\\n?(\\{[\\s\\S]*?\\})\\s*\\n?```", Pattern.MULTILINE);
    private static final Pattern JSON_OBJECT_PATTERN = Pattern.compile("\\{[\\s\\S]*\\}");

    private final ObjectMapper objectMapper;

    public AiScoringResult parse(String content, int maxScore) {
        if (content == null || content.isBlank()) {
            return AiScoringResult.fail();
        }

        String jsonStr = extractJson(content);
        if (jsonStr != null) {
            try {
                JsonNode root = objectMapper.readTree(jsonStr);
                int score = Math.max(0, Math.min(root.path("score").asInt(0), maxScore));
                JsonNode feedback = root.path("feedback");
                String feedbackJson = feedback.isMissingNode() || feedback.isNull()
                        ? null
                        : objectMapper.writeValueAsString(feedback);
                return AiScoringResult.of(score, feedbackJson);
            } catch (Exception ex) {
                log.warn("解析 AI 返回的 JSON 失败，尝试降级为纯数字解析。content={}", content, ex);
            }
        }

        Matcher scoreMatcher = SCORE_PATTERN.matcher(content);
        if (scoreMatcher.find()) {
            int score = Integer.parseInt(scoreMatcher.group());
            return AiScoringResult.of(Math.max(0, Math.min(score, maxScore)), null);
        }

        return AiScoringResult.fail();
    }

    private String extractJson(String content) {
        Matcher blockMatcher = JSON_BLOCK_PATTERN.matcher(content.trim());
        if (blockMatcher.find()) {
            return blockMatcher.group(1).trim();
        }

        Matcher objectMatcher = JSON_OBJECT_PATTERN.matcher(content.trim());
        return objectMatcher.find() ? objectMatcher.group().trim() : null;
    }
}

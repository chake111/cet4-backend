package com.cet4.platform.service;

import lombok.Data;

@Data
public class AiScoringResult {

    private int score;

    /**
     * AI 评语 JSON 字符串。
     * 示例：
     * {
     *   "overall": "...",
     *   "strengths": ["..."],
     *   "weaknesses": ["..."],
     *   "suggestions": ["..."]
     * }
     */
    private String feedback;

    public static AiScoringResult fail() {
        AiScoringResult result = new AiScoringResult();
        result.setScore(0);
        result.setFeedback(null);
        return result;
    }

    public static AiScoringResult of(int score, String feedback) {
        AiScoringResult result = new AiScoringResult();
        result.setScore(score);
        result.setFeedback(feedback);
        return result;
    }
}

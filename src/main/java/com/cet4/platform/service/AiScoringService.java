package com.cet4.platform.service;

public interface AiScoringService {

    /**
     * 对单道主观题进行 AI 评分
     *
     * @param questionType 题型：writing / translation
     * @param content      题目要求
     * @param answer       学生答案
     * @param maxScore     该题满分
     * @return AI 评分结果（包含分数和评语）
     */
    AiScoringResult scoreSubjectiveAnswer(String questionType, String content, String answer, int maxScore);
}

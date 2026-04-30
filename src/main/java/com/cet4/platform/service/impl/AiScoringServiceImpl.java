package com.cet4.platform.service.impl;

import com.cet4.platform.service.AiScoringResult;
import com.cet4.platform.service.AiScoringService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.annotation.PostConstruct;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Slf4j
@Service
public class AiScoringServiceImpl implements AiScoringService {

    private static final String WRITING = "writing";
    private static final String TRANSLATION = "translation";
    private static final Pattern SCORE_PATTERN = Pattern.compile("\\d+");
    private static final Pattern JSON_BLOCK_PATTERN = Pattern.compile("```(?:json)?\\s*\\n?(\\{[\\s\\S]*?\\})\\s*\\n?```", Pattern.MULTILINE);
    private static final Pattern JSON_OBJECT_PATTERN = Pattern.compile("\\{[\\s\\S]*\\}");

    private final ObjectMapper objectMapper;
    private RestTemplate restTemplate;

    @Value("${ai.deepseek.api-key}")
    private String apiKey;

    @Value("${ai.deepseek.base-url}")
    private String baseUrl;

    @Value("${ai.deepseek.model}")
    private String model;

    @Value("${ai.deepseek.timeout:30}")
    private int timeout;

    public AiScoringServiceImpl(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    @PostConstruct
    public void initRestTemplate() {
        SimpleClientHttpRequestFactory requestFactory = new SimpleClientHttpRequestFactory();
        int timeoutMs = Math.max(timeout, 1) * 1000;
        requestFactory.setConnectTimeout(timeoutMs);
        requestFactory.setReadTimeout(timeoutMs);
        restTemplate = new RestTemplate(requestFactory);
    }

    @Override
    public AiScoringResult scoreSubjectiveAnswer(String questionType, String content, String answer, int maxScore) {
        if (maxScore <= 0 || answer == null || answer.isBlank()) {
            return AiScoringResult.fail();
        }

        try {
            String prompt = buildPrompt(questionType, content, answer, maxScore);
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.setBearerAuth(apiKey);

            Map<String, Object> requestBody = Map.of(
                    "model", model,
                    "messages", List.of(Map.of("role", "user", "content", prompt)),
                    "temperature", 0
            );

            HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBody, headers);
            ResponseEntity<Map> response = restTemplate.postForEntity(baseUrl + "/v1/chat/completions", requestEntity, Map.class);

            if (!response.getStatusCode().is2xxSuccessful() || response.getBody() == null) {
                return AiScoringResult.fail();
            }

            String responseContent = extractContent(response.getBody());
            AiScoringResult result = parseScoringResult(responseContent, maxScore);
            log.info("AI评分完成: questionType={}, maxScore={}, score={}, hasFeedback={}",
                    questionType, maxScore, result.getScore(), result.getFeedback() != null);
            return result;
        } catch (Exception ex) {
            log.warn("AI评分失败，已降级为0分。questionType={}", questionType, ex);
            return AiScoringResult.fail();
        }
    }

    private String buildPrompt(String questionType, String content, String answer, int maxScore) {
        if (TRANSLATION.equalsIgnoreCase(questionType)) {
            return "你是一位专业的大学英语四级考试评卷老师。\n"
                    + "请根据以下评分标准对学生的汉译英翻译进行评分：\n\n"
                    + "评分标准：\n"
                    + "- 忠实原文（50%）：是否准确传达原文意思\n"
                    + "- 语言表达（30%）：英语是否地道流畅\n"
                    + "- 词汇语法（20%）：用词和语法是否正确\n\n"
                    + "特别规则：\n"
                    + "- 如果答案是乱码、随机字母、无意义内容，直接给 0 分\n"
                    + "- 如果答案与原文完全无关，最高给 5 分\n\n"
                    + "题目要求：\n"
                    + (content == null ? "" : content) + "\n\n"
                    + "学生答案：\n"
                    + answer + "\n\n"
                    + "满分为 " + maxScore + " 分。\n"
                    + "请严格按以下 JSON 格式返回，不要输出 Markdown，不要输出代码块，不要输出任何其他内容：\n\n"
                    + "{\n"
                    + "  \"score\": 85,\n"
                    + "  \"feedback\": {\n"
                    + "    \"overall\": \"总体评价，2到3句话。\",\n"
                    + "    \"accuracy\": \"准确性评价。\",\n"
                    + "    \"expression\": \"语言表达评价。\",\n"
                    + "    \"weaknesses\": [\"主要问题1\", \"主要问题2\"],\n"
                    + "    \"suggestions\": [\"修改建议1\", \"修改建议2\"]\n"
                    + "  }\n"
                    + "}";
        }

        return "你是一位专业的大学英语四级考试评卷老师。\n"
                + "请根据以下评分标准对学生的英语作文进行评分：\n\n"
                + "评分标准：\n"
                + "- 内容（40%）：是否切题，论点是否充分\n"
                + "- 语言（40%）：语法、词汇、句式是否准确丰富\n"
                + "- 结构（20%）：段落是否清晰，逻辑是否连贯\n\n"
                + "特别规则：\n"
                + "- 如果答案是乱码、随机字母、无意义内容，直接给 0 分\n"
                + "- 如果答案少于 20 个英文单词，最高给 20 分\n"
                + "- 如果答案与题目完全无关，最高给 10 分\n\n"
                + "题目要求：\n"
                + (content == null ? "" : content) + "\n\n"
                + "学生答案：\n"
                + answer + "\n\n"
                + "满分为 " + maxScore + " 分。\n"
                + "请严格按以下 JSON 格式返回，不要输出 Markdown，不要输出代码块，不要输出任何其他内容：\n\n"
                + "{\n"
                + "  \"score\": 85,\n"
                + "  \"feedback\": {\n"
                + "    \"overall\": \"总体评价，2到3句话。\",\n"
                + "    \"strengths\": [\"优点1\", \"优点2\"],\n"
                + "    \"weaknesses\": [\"问题1\", \"问题2\"],\n"
                + "    \"suggestions\": [\"改进建议1\", \"改进建议2\"]\n"
                + "  }\n"
                + "}";
    }

    private String extractContent(Map responseBody) {
        Object choicesObj = responseBody.get("choices");
        if (!(choicesObj instanceof List<?> choices) || choices.isEmpty()) {
            return "";
        }

        Object firstChoice = choices.get(0);
        if (!(firstChoice instanceof Map<?, ?> choiceMap)) {
            return "";
        }

        Object messageObj = choiceMap.get("message");
        if (!(messageObj instanceof Map<?, ?> messageMap)) {
            return "";
        }

        Object contentObj = messageMap.get("content");
        return contentObj == null ? "" : String.valueOf(contentObj);
    }

    /**
     * 解析 AI 返回的评分结果。
     * 支持以下格式：
     * 1. 纯 JSON 对象
     * 2. ```json ... ``` 代码块包裹的 JSON
     * 3. 纯数字（向后兼容）
     */
    private AiScoringResult parseScoringResult(String content, int maxScore) {
        if (content == null || content.isBlank()) {
            return AiScoringResult.fail();
        }

        String jsonStr = null;

        // 1. 尝试提取 ```json ... ``` 代码块
        Matcher blockMatcher = JSON_BLOCK_PATTERN.matcher(content.trim());
        if (blockMatcher.find()) {
            jsonStr = blockMatcher.group(1).trim();
        }

        // 2. 如果没有代码块，尝试直接提取 JSON 对象
        if (jsonStr == null) {
            Matcher objectMatcher = JSON_OBJECT_PATTERN.matcher(content.trim());
            if (objectMatcher.find()) {
                jsonStr = objectMatcher.group().trim();
            }
        }

        // 3. 如果提取到了 JSON，尝试解析 score 和 feedback
        if (jsonStr != null) {
            try {
                JsonNode root = objectMapper.readTree(jsonStr);
                int score = Math.max(0, Math.min(root.path("score").asInt(0), maxScore));
                JsonNode feedback = root.path("feedback");
                String feedbackJson = feedback.isMissingNode() || feedback.isNull() ? null : objectMapper.writeValueAsString(feedback);
                return AiScoringResult.of(score, feedbackJson);
            } catch (Exception ex) {
                log.warn("解析 AI 返回的 JSON 失败，尝试降级为纯数字解析。content={}", content, ex);
            }
        }

        // 4. 向后兼容：纯数字解析
        Matcher scoreMatcher = SCORE_PATTERN.matcher(content);
        if (scoreMatcher.find()) {
            int score = Integer.parseInt(scoreMatcher.group());
            score = Math.max(0, Math.min(score, maxScore));
            return AiScoringResult.of(score, null);
        }

        return AiScoringResult.fail();
    }
}

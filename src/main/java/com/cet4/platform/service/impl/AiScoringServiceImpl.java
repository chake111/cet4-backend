package com.cet4.platform.service.impl;

import com.cet4.platform.service.AiScoringService;
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

    private RestTemplate restTemplate;

    @Value("${ai.deepseek.api-key}")
    private String apiKey;

    @Value("${ai.deepseek.base-url}")
    private String baseUrl;

    @Value("${ai.deepseek.model}")
    private String model;

    @Value("${ai.deepseek.timeout:30}")
    private int timeout;


    @Override
    public int scoreSubjectiveAnswer(String questionType, String content, String answer, int maxScore) {
        if (maxScore <= 0 || answer == null || answer.isBlank()) {
            return 0;
        }

        try {
            if (restTemplate == null) {
                SimpleClientHttpRequestFactory requestFactory = new SimpleClientHttpRequestFactory();
                int timeoutMs = Math.max(timeout, 1) * 1000;
                requestFactory.setConnectTimeout(timeoutMs);
                requestFactory.setReadTimeout(timeoutMs);
                restTemplate = new RestTemplate(requestFactory);
            }

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
                return 0;
            }

            String responseContent = extractContent(response.getBody());
            Integer parsedScore = parseScore(responseContent);
            if (parsedScore == null) {
                return 0;
            }
            return Math.max(0, Math.min(parsedScore, maxScore));
        } catch (Exception ex) {
            log.warn("AI评分失败，已降级为0分。questionType={}", questionType, ex);
            return 0;
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
                    + "题目要求：\n"
                    + (content == null ? "" : content) + "\n\n"
                    + "学生答案：\n"
                    + answer + "\n\n"
                    + "满分为 " + maxScore + " 分，请给出一个整数分数，只输出数字，不要有任何其他内容。";
        }

        return "你是一位专业的大学英语四级考试评卷老师。\n"
                + "请根据以下评分标准对学生的英语作文进行评分：\n\n"
                + "评分标准：\n"
                + "- 内容（40%）：是否切题，论点是否充分\n"
                + "- 语言（40%）：语法、词汇、句式是否准确丰富\n"
                + "- 结构（20%）：段落是否清晰，逻辑是否连贯\n\n"
                + "题目要求：\n"
                + (content == null ? "" : content) + "\n\n"
                + "学生答案：\n"
                + answer + "\n\n"
                + "满分为 " + maxScore + " 分，请给出一个整数分数，只输出数字，不要有任何其他内容。";
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

    private Integer parseScore(String content) {
        if (content == null || content.isBlank()) {
            return null;
        }
        Matcher matcher = SCORE_PATTERN.matcher(content);
        if (!matcher.find()) {
            return null;
        }
        return Integer.parseInt(matcher.group());
    }
}

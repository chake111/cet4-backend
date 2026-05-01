package com.cet4.platform.support.admin;

import com.cet4.platform.common.BusinessException;
import com.cet4.platform.dto.admin.content.SingleChoiceContent;
import com.cet4.platform.dto.admin.content.TranslationContent;
import com.cet4.platform.dto.admin.content.WritingContent;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validator;
import java.util.Map;
import java.util.Set;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class AdminQuestionContentSupport {

    private final ObjectMapper objectMapper;
    private final Validator validator;

    public ContentParsedResult validateAndSerializeContent(String questionType, Object rawContent) {
        try {
            return switch (questionType) {
                case "single_choice", "listening" -> parseSingleChoice(rawContent);
                case "writing" -> parseWriting(rawContent);
                case "translation" -> parseTranslation(rawContent);
                default -> parseGeneric(rawContent);
            };
        } catch (IllegalArgumentException | JsonProcessingException e) {
            throw new BusinessException("content 格式不正确: " + e.getMessage());
        }
    }

    private ContentParsedResult parseSingleChoice(Object rawContent) throws JsonProcessingException {
        SingleChoiceContent content = objectMapper.convertValue(rawContent, SingleChoiceContent.class);
        validateContent(content);
        return new ContentParsedResult(
                objectMapper.writeValueAsString(content),
                content.getOptions().get(0),
                content.getOptions().get(1),
                content.getOptions().get(2),
                content.getOptions().get(3));
    }

    private ContentParsedResult parseWriting(Object rawContent) throws JsonProcessingException {
        WritingContent content = objectMapper.convertValue(rawContent, WritingContent.class);
        validateContent(content);
        return new ContentParsedResult(objectMapper.writeValueAsString(content), null, null, null, null);
    }

    private ContentParsedResult parseTranslation(Object rawContent) throws JsonProcessingException {
        TranslationContent content = objectMapper.convertValue(rawContent, TranslationContent.class);
        validateContent(content);
        return new ContentParsedResult(objectMapper.writeValueAsString(content), null, null, null, null);
    }

    private ContentParsedResult parseGeneric(Object rawContent) throws JsonProcessingException {
        Map<?, ?> content = objectMapper.convertValue(rawContent, Map.class);
        if (content == null || content.isEmpty()) {
            throw new BusinessException("content 不能为空对象");
        }
        return new ContentParsedResult(objectMapper.writeValueAsString(content), null, null, null, null);
    }

    private <T> void validateContent(T contentObj) {
        Set<ConstraintViolation<T>> violations = validator.validate(contentObj);
        if (!violations.isEmpty()) {
            String message = violations.stream()
                    .map(ConstraintViolation::getMessage)
                    .findFirst()
                    .orElse("content 校验失败");
            throw new BusinessException(message);
        }
    }

    public record ContentParsedResult(String contentJson,
                                      String optionA,
                                      String optionB,
                                      String optionC,
                                      String optionD) {
    }
}

package com.cet4.platform.service.impl.admin;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cet4.platform.common.BusinessException;
import com.cet4.platform.dto.admin.AdminQuestionUpsertRequest;
import com.cet4.platform.dto.admin.content.SingleChoiceContent;
import com.cet4.platform.dto.admin.content.TranslationContent;
import com.cet4.platform.dto.admin.content.WritingContent;
import com.cet4.platform.entity.Exam;
import com.cet4.platform.entity.Question;
import com.cet4.platform.mapper.ExamMapper;
import com.cet4.platform.mapper.QuestionMapper;
import com.cet4.platform.service.admin.AdminQuestionService;
import com.cet4.platform.vo.admin.AdminQuestionVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validator;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class AdminQuestionServiceImpl implements AdminQuestionService {

    private final QuestionMapper questionMapper;
    private final ExamMapper examMapper;
    private final ObjectMapper objectMapper;
    private final Validator validator;

    @Override
    public AdminQuestionVO create(AdminQuestionUpsertRequest request) {
        validateExamExists(request.getExamId());
        Question question = buildEntity(null, request);
        questionMapper.insert(question);
        return toVO(question, examMapper.selectById(question.getExamId()));
    }

    @Override
    public AdminQuestionVO update(Long id, AdminQuestionUpsertRequest request) {
        Question existing = getById(id);
        validateExamExists(request.getExamId());
        Question question = buildEntity(id, request);
        question.setCreatedAt(existing.getCreatedAt());
        questionMapper.updateById(question);
        return toVO(question, examMapper.selectById(question.getExamId()));
    }

    @Override
    public void delete(Long id) {
        Question existing = getById(id);
        questionMapper.deleteById(existing.getId());
    }

    @Override
    public Map<String, Object> page(Integer current, Integer size, String type, Integer year, Integer month) {
        Page<Question> page = new Page<>(current, size);
        LambdaQueryWrapper<Question> wrapper = new LambdaQueryWrapper<>();
        wrapper.orderByDesc(Question::getId);
        if (StringUtils.hasText(type)) {
            wrapper.eq(Question::getQuestionType, type);
        }
        if (year != null) {
            wrapper.inSql(Question::getExamId, "select id from exam where year = " + year);
        }
        if (month != null) {
            wrapper.inSql(Question::getExamId, "select id from exam where month = " + month);
        }
        IPage<Question> resultPage = questionMapper.selectPage(page, wrapper);

        List<AdminQuestionVO> records = resultPage.getRecords().stream().map(q ->
                toVO(q, examMapper.selectById(q.getExamId()))).toList();

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("current", resultPage.getCurrent());
        result.put("size", resultPage.getSize());
        result.put("total", resultPage.getTotal());
        result.put("records", records);
        return result;
    }

    private Question getById(Long id) {
        Question question = questionMapper.selectById(id);
        if (question == null) {
            throw new BusinessException("题目不存在");
        }
        return question;
    }

    private void validateExamExists(Long examId) {
        if (examMapper.selectById(examId) == null) {
            throw new BusinessException("exam 不存在");
        }
    }

    private Question buildEntity(Long id, AdminQuestionUpsertRequest request) {
        String normalizedType = request.getType().trim().toLowerCase(Locale.ROOT);
        ContentParsedResult contentParsedResult = validateAndSerializeContent(normalizedType, request.getContent());

        Question question = new Question();
        question.setId(id);
        question.setExamId(request.getExamId());
        question.setPart(request.getPart());
        question.setQuestionNo(request.getQuestionNo());
        question.setQuestionType(normalizedType);
        question.setContent(contentParsedResult.contentJson());
        question.setPassage(request.getPassage());
        question.setCorrectAnswer(request.getCorrectAnswer());
        question.setScore(request.getScore());
        question.setAudioUrl(request.getAudioUrl());
        question.setSortOrder(request.getSortOrder());
        question.setOptionA(contentParsedResult.optionA());
        question.setOptionB(contentParsedResult.optionB());
        question.setOptionC(contentParsedResult.optionC());
        question.setOptionD(contentParsedResult.optionD());
        question.setDeleted(0);
        return question;
    }

    private ContentParsedResult validateAndSerializeContent(String questionType, Object rawContent) {
        try {
            return switch (questionType) {
                case "single_choice", "listening" -> {
                    SingleChoiceContent content = objectMapper.convertValue(rawContent, SingleChoiceContent.class);
                    validateContent(content);
                    yield new ContentParsedResult(
                            objectMapper.writeValueAsString(content),
                            content.getOptions().get(0),
                            content.getOptions().get(1),
                            content.getOptions().get(2),
                            content.getOptions().get(3));
                }
                case "writing" -> {
                    WritingContent content = objectMapper.convertValue(rawContent, WritingContent.class);
                    validateContent(content);
                    yield new ContentParsedResult(objectMapper.writeValueAsString(content), null, null, null, null);
                }
                case "translation" -> {
                    TranslationContent content = objectMapper.convertValue(rawContent, TranslationContent.class);
                    validateContent(content);
                    yield new ContentParsedResult(objectMapper.writeValueAsString(content), null, null, null, null);
                }
                default -> {
                    Map<?, ?> content = objectMapper.convertValue(rawContent, Map.class);
                    if (content == null || content.isEmpty()) {
                        throw new BusinessException("content 不能为空对象");
                    }
                    yield new ContentParsedResult(objectMapper.writeValueAsString(content), null, null, null, null);
                }
            };
        } catch (IllegalArgumentException | JsonProcessingException e) {
            throw new BusinessException("content 格式不正确: " + e.getMessage());
        }
    }

    private <T> void validateContent(T contentObj) {
        Set<ConstraintViolation<T>> violations = validator.validate(contentObj);
        if (!violations.isEmpty()) {
            String message = violations.stream().map(ConstraintViolation::getMessage).findFirst().orElse("content 校验失败");
            throw new BusinessException(message);
        }
    }

    private AdminQuestionVO toVO(Question question, Exam exam) {
        AdminQuestionVO vo = new AdminQuestionVO();
        vo.setId(question.getId());
        vo.setExamId(question.getExamId());
        vo.setYear(exam == null ? null : exam.getYear());
        vo.setMonth(exam == null ? null : exam.getMonth());
        vo.setPart(question.getPart());
        vo.setQuestionNo(question.getQuestionNo());
        vo.setType(question.getQuestionType());
        vo.setContent(readContent(question.getContent()));
        vo.setPassage(question.getPassage());
        vo.setCorrectAnswer(question.getCorrectAnswer());
        vo.setScore(question.getScore());
        vo.setAudioUrl(question.getAudioUrl());
        vo.setSortOrder(question.getSortOrder());
        vo.setCreatedAt(question.getCreatedAt());
        return vo;
    }

    private Object readContent(String contentJson) {
        if (!StringUtils.hasText(contentJson)) {
            return null;
        }
        try {
            return objectMapper.readValue(contentJson, Object.class);
        } catch (JsonProcessingException e) {
            return contentJson;
        }
    }

    private record ContentParsedResult(String contentJson, String optionA, String optionB, String optionC,
                                       String optionD) {
    }
}

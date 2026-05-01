package com.cet4.platform.service.impl.admin;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cet4.platform.common.BusinessException;
import com.cet4.platform.dto.admin.AdminQuestionUpsertRequest;
import com.cet4.platform.entity.Exam;
import com.cet4.platform.entity.Question;
import com.cet4.platform.mapper.ExamMapper;
import com.cet4.platform.mapper.QuestionMapper;
import com.cet4.platform.service.admin.AdminQuestionService;
import com.cet4.platform.support.admin.AdminQuestionContentSupport;
import com.cet4.platform.support.admin.AdminQuestionContentSupport.ContentParsedResult;
import com.cet4.platform.support.admin.AdminQuestionViewAssembler;
import com.cet4.platform.vo.admin.AdminQuestionVO;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
@RequiredArgsConstructor
public class AdminQuestionServiceImpl implements AdminQuestionService {

    private final QuestionMapper questionMapper;
    private final ExamMapper examMapper;
    private final AdminQuestionContentSupport contentSupport;
    private final AdminQuestionViewAssembler viewAssembler;

    @Override
    public AdminQuestionVO create(AdminQuestionUpsertRequest request) {
        Exam exam = getExam(request.getExamId());
        Question question = buildEntity(null, request);
        questionMapper.insert(question);
        return viewAssembler.toVO(question, exam);
    }

    @Override
    public AdminQuestionVO update(Long id, AdminQuestionUpsertRequest request) {
        Question existing = getById(id);
        Exam exam = getExam(request.getExamId());
        Question question = buildEntity(id, request);
        question.setCreatedAt(existing.getCreatedAt());
        questionMapper.updateById(question);
        return viewAssembler.toVO(question, exam);
    }

    @Override
    public void delete(Long id) {
        Question existing = getById(id);
        questionMapper.deleteById(existing.getId());
    }

    @Override
    public Map<String, Object> page(Integer current, Integer size, String type, Integer year, Integer month) {
        LambdaQueryWrapper<Question> wrapper = new LambdaQueryWrapper<>();
        wrapper.orderByDesc(Question::getId);
        if (StringUtils.hasText(type)) {
            wrapper.eq(Question::getQuestionType, type);
        }
        if (year != null || month != null) {
            List<Long> examIds = listExamIds(year, month);
            if (examIds.isEmpty()) {
                return emptyPage(current, size);
            }
            wrapper.in(Question::getExamId, examIds);
        }

        IPage<Question> resultPage = questionMapper.selectPage(new Page<>(current, size), wrapper);
        Map<Long, Exam> examsById = listExamsById(resultPage.getRecords());
        List<AdminQuestionVO> records = resultPage.getRecords().stream()
                .map(question -> viewAssembler.toVO(question, examsById.get(question.getExamId())))
                .toList();

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("current", resultPage.getCurrent());
        result.put("size", resultPage.getSize());
        result.put("total", resultPage.getTotal());
        result.put("records", records);
        return result;
    }

    private List<Long> listExamIds(Integer year, Integer month) {
        LambdaQueryWrapper<Exam> wrapper = new LambdaQueryWrapper<>();
        if (year != null) {
            wrapper.eq(Exam::getYear, year);
        }
        if (month != null) {
            wrapper.eq(Exam::getMonth, month);
        }
        return examMapper.selectList(wrapper).stream().map(Exam::getId).toList();
    }

    private Map<Long, Exam> listExamsById(List<Question> questions) {
        List<Long> examIds = questions.stream()
                .map(Question::getExamId)
                .distinct()
                .toList();
        if (examIds.isEmpty()) {
            return Map.of();
        }
        return examMapper.selectBatchIds(examIds).stream()
                .collect(Collectors.toMap(Exam::getId, Function.identity()));
    }

    private Map<String, Object> emptyPage(Integer current, Integer size) {
        Map<String, Object> result = new LinkedHashMap<>();
        result.put("current", current);
        result.put("size", size);
        result.put("total", 0L);
        result.put("records", List.of());
        return result;
    }

    private Question getById(Long id) {
        Question question = questionMapper.selectById(id);
        if (question == null) {
            throw new BusinessException("题目不存在");
        }
        return question;
    }

    private Exam getExam(Long examId) {
        Exam exam = examMapper.selectById(examId);
        if (exam == null) {
            throw new BusinessException("exam 不存在");
        }
        return exam;
    }

    private Question buildEntity(Long id, AdminQuestionUpsertRequest request) {
        String normalizedType = request.getType().trim().toLowerCase(Locale.ROOT);
        ContentParsedResult content = contentSupport.validateAndSerializeContent(normalizedType, request.getContent());

        Question question = new Question();
        question.setId(id);
        question.setExamId(request.getExamId());
        question.setPart(request.getPart());
        question.setQuestionNo(request.getQuestionNo());
        question.setQuestionType(normalizedType);
        question.setContent(content.contentJson());
        question.setPassage(request.getPassage());
        question.setCorrectAnswer(request.getCorrectAnswer());
        question.setScore(request.getScore());
        question.setAudioUrl(request.getAudioUrl());
        question.setSortOrder(request.getSortOrder());
        question.setOptionA(content.optionA());
        question.setOptionB(content.optionB());
        question.setOptionC(content.optionC());
        question.setOptionD(content.optionD());
        question.setDeleted(0);
        return question;
    }
}

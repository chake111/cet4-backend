package com.cet4.platform.support.admin;

import com.cet4.platform.entity.Exam;
import com.cet4.platform.entity.Question;
import com.cet4.platform.vo.admin.AdminQuestionVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@Component
@RequiredArgsConstructor
public class AdminQuestionViewAssembler {

    private final ObjectMapper objectMapper;

    public AdminQuestionVO toVO(Question question, Exam exam) {
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
}

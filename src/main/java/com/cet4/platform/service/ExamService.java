package com.cet4.platform.service;

import com.cet4.platform.vo.ExamVO;
import com.cet4.platform.vo.QuestionVO;

import java.util.List;
import java.util.Map;

public interface ExamService {

    List<ExamVO> listPublishedExams();

    List<QuestionVO> listExamQuestions(Long examId);

    Map<String, Long> startExam(Long examId, String username);
}

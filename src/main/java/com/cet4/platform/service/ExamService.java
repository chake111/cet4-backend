package com.cet4.platform.service;

import com.cet4.platform.dto.SubmitAnswerDTO;
import com.cet4.platform.dto.ExamDraftSaveRequest;
import com.cet4.platform.dto.ExamStartRequest;
import com.cet4.platform.dto.ExamSubmitRequest;
import com.cet4.platform.vo.ExamResultVO;
import com.cet4.platform.vo.ExamVO;
import com.cet4.platform.vo.QuestionVO;

import java.util.List;
import java.util.Map;

public interface ExamService {

    List<ExamVO> listPublishedExams();

    List<QuestionVO> listExamQuestions(Long examId);

    Map<String, Long> startExam(Long examId, String username);

    Map<String, Object> startExamSession(ExamStartRequest request, String username);

    Map<String, Boolean> saveExamDraft(ExamDraftSaveRequest request, String username);

    Map<String, Object> submitExamSession(ExamSubmitRequest request, String username);

    Map<String, Object> submitExamRecord(Long recordId, String username, SubmitAnswerDTO submitAnswerDTO);

    ExamResultVO getExamResult(Long recordId, String username);
}

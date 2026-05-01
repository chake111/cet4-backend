package com.cet4.platform.service.impl;

import com.cet4.platform.dto.ExamDraftSaveRequest;
import com.cet4.platform.dto.ExamStartRequest;
import com.cet4.platform.dto.ExamSubmitRequest;
import com.cet4.platform.dto.SubmitAnswerDTO;
import com.cet4.platform.entity.ExamRecord;
import com.cet4.platform.entity.User;
import com.cet4.platform.service.ExamService;
import com.cet4.platform.support.ExamQuerySupport;
import com.cet4.platform.support.ExamRecordAccessSupport;
import com.cet4.platform.support.ExamResultAssembler;
import com.cet4.platform.support.ExamSessionManager;
import com.cet4.platform.support.ExamSubmissionCoordinator;
import com.cet4.platform.support.ExamUserSupport;
import com.cet4.platform.vo.ExamRecordVO;
import com.cet4.platform.vo.ExamResultVO;
import com.cet4.platform.vo.ExamVO;
import com.cet4.platform.vo.QuestionVO;
import java.util.List;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ExamServiceImpl implements ExamService {

    private final ExamUserSupport examUserSupport;
    private final ExamQuerySupport examQuerySupport;
    private final ExamSessionManager examSessionManager;
    private final ExamSubmissionCoordinator examSubmissionCoordinator;
    private final ExamRecordAccessSupport examRecordAccessSupport;
    private final ExamResultAssembler examResultAssembler;

    @Override
    public List<ExamVO> listPublishedExams() {
        return examQuerySupport.listPublishedExams();
    }

    @Override
    public List<QuestionVO> listExamQuestions(Long examId) {
        return examQuerySupport.listExamQuestions(examId);
    }

    @Override
    public Map<String, Object> startExamSession(ExamStartRequest request, String username) {
        User user = examUserSupport.getUserByUsername(username);
        return examSessionManager.startExamSession(request, user);
    }

    @Override
    public Map<String, Boolean> saveExamDraft(ExamDraftSaveRequest request, String username) {
        User user = examUserSupport.getUserByUsername(username);
        return examSessionManager.saveExamDraft(request, user);
    }

    @Override
    public Map<String, Object> submitExamSession(ExamSubmitRequest request, String username) {
        User user = examUserSupport.getUserByUsername(username);
        return examSubmissionCoordinator.submitExamSession(request, user);
    }

    @Override
    public Map<String, Object> submitExamRecord(Long recordId, String username, SubmitAnswerDTO submitAnswerDTO) {
        User user = examUserSupport.getUserByUsername(username);
        return examSubmissionCoordinator.submitExamRecord(recordId, user, submitAnswerDTO);
    }

    @Override
    public ExamResultVO getExamResult(Long recordId, String username) {
        User user = examUserSupport.getUserByUsername(username);
        ExamRecord examRecord = examRecordAccessSupport.getAndValidateExamRecord(recordId, user.getId());
        return examResultAssembler.assemble(examRecord);
    }

    @Override
    public List<ExamRecordVO> listUserRecords(String username) {
        User user = examUserSupport.getUserByUsername(username);
        return examQuerySupport.listUserRecords(user.getId());
    }
}

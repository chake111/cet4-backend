package com.cet4.platform.controller;

import com.cet4.platform.common.Result;
import com.cet4.platform.dto.SubmitAnswerDTO;
import com.cet4.platform.service.ExamService;
import com.cet4.platform.vo.ExamResultVO;
import com.cet4.platform.vo.ExamVO;
import com.cet4.platform.vo.QuestionVO;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/exam")
@RequiredArgsConstructor
public class ExamController {

    private final ExamService examService;

    @GetMapping
    public Result<List<ExamVO>> listPublishedExams() {
        return Result.success(examService.listPublishedExams());
    }

    @GetMapping("/{id}/questions")
    public Result<List<QuestionVO>> listExamQuestions(@PathVariable("id") Long examId) {
        return Result.success(examService.listExamQuestions(examId));
    }

    @PostMapping("/{id}/start")
    public Result<Map<String, Long>> startExam(@PathVariable("id") Long examId, Authentication authentication) {
        return Result.success(examService.startExam(examId, authentication.getName()));
    }

    @PostMapping("/record/{recordId}/submit")
    public Result<Map<String, Object>> submitExamRecord(@PathVariable Long recordId,
                                                        @RequestBody SubmitAnswerDTO submitAnswerDTO,
                                                        Authentication authentication) {
        return Result.success(examService.submitExamRecord(recordId, authentication.getName(), submitAnswerDTO));
    }

    @GetMapping("/record/{recordId}/result")
    public Result<ExamResultVO> getExamResult(@PathVariable Long recordId, Authentication authentication) {
        return Result.success(examService.getExamResult(recordId, authentication.getName()));
    }
}

package com.cet4.platform.vo;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

@Data
public class ExamResultVO {

    private Long examRecordId;

    private Long examId;

    private LocalDateTime startTime;

    private LocalDateTime submitTime;

    private Integer totalScore;

    private String status;

    private List<AnswerDetailVO> answers;
}

package com.cet4.platform.vo;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Data
public class ExamResultVO {

    private Long recordId;

    private Integer score;

    private Integer total;

    private Integer objectiveScore;

    private Integer subjectiveScore;

    private Integer objectiveCorrect;

    private Integer objectiveTotal;

    private String paperId;

    private LocalDateTime submittedAt;

    private Map<String, Object> answers;

    private List<AnswerDetailVO> answerDetails;
}

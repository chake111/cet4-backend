package com.cet4.platform.vo.admin;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class AdminQuestionVO {
    private Long id;
    private Long examId;
    private Integer year;
    private Integer month;
    private String part;
    private Integer questionNo;
    private String type;
    private Object content;
    private String passage;
    private String correctAnswer;
    private Integer score;
    private String audioUrl;
    private Integer sortOrder;
    private LocalDateTime createdAt;
}

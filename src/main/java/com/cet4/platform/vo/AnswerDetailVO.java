package com.cet4.platform.vo;

import lombok.Data;

@Data
public class AnswerDetailVO {

    private Long questionId;

    private Integer questionNo;

    private String part;

    private String questionType;

    private String content;

    private String userAnswer;

    private String correctAnswer;

    private Boolean correct;

    private Integer score;

    private Integer fullScore;

    private String aiFeedback;
}

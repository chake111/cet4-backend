package com.cet4.platform.vo;

import lombok.Data;

@Data
public class AnswerDetailVO {

    private Long questionId;

    private Integer questionNo;

    private String part;

    private String questionType;

    private String userAnswer;

    private String correctAnswer;

    private Integer isCorrect;

    private Integer score;

    private String aiFeedback;
}

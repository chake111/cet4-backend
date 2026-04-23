package com.cet4.platform.vo;

import lombok.Data;

@Data
public class QuestionVO {

    private Long id;

    private Long examId;

    private String part;

    private Integer questionNo;

    private String questionType;

    private String content;

    private String passage;

    private String optionA;

    private String optionB;

    private String optionC;

    private String optionD;

    private Integer score;

    private String audioUrl;
}

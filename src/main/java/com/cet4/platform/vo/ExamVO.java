package com.cet4.platform.vo;

import lombok.Data;

@Data
public class ExamVO {

    private Long id;

    private String title;

    private Integer year;

    private Integer month;

    private Integer setNo;

    private Integer duration;

    private Integer totalScore;
}

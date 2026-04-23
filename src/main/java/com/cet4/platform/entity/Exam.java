package com.cet4.platform.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@TableName("exam")
public class Exam {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String title;

    private Integer year;

    private Integer month;

    @TableField("set_no")
    private Integer setNo;

    private Integer duration;

    @TableField("total_score")
    private Integer totalScore;

    private Integer status;

    @TableField("created_at")
    private LocalDateTime createdAt;
}

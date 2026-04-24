package com.cet4.platform.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@TableName("question")
public class Question {

    @TableId(type = IdType.AUTO)
    private Long id;

    @TableField("exam_id")
    private Long examId;

    private String part;

    @TableField("question_no")
    private Integer questionNo;

    @TableField("question_type")
    private String questionType;

    private String content;

    private String passage;

    @TableField("option_a")
    private String optionA;

    @TableField("option_b")
    private String optionB;

    @TableField("option_c")
    private String optionC;

    @TableField("option_d")
    private String optionD;

    @TableField("correct_answer")
    private String correctAnswer;

    private Integer score;

    @TableField("audio_url")
    private String audioUrl;

    @TableField("sort_order")
    private Integer sortOrder;

    @TableLogic
    private Integer deleted;

    @TableField("created_at")
    private LocalDateTime createdAt;
}

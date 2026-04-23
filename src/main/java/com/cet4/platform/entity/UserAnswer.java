package com.cet4.platform.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@TableName("user_answer")
public class UserAnswer {

    @TableId(type = IdType.AUTO)
    private Long id;

    @TableField("exam_record_id")
    private Long examRecordId;

    @TableField("user_id")
    private Long userId;

    @TableField("question_id")
    private Long questionId;

    @TableField("user_answer")
    private String userAnswer;

    @TableField("is_correct")
    private Integer isCorrect;

    private Integer score;

    @TableField("ai_score")
    private Integer aiScore;

    @TableField("ai_feedback")
    private String aiFeedback;

    @TableField("created_at")
    private LocalDateTime createdAt;
}

package com.cet4.platform.vo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ExamRecordVO {
    private Long recordId;       // exam_record.id
    private String title;        // exam.title（关联试卷标题）
    private Integer year;        // exam.year
    private Integer month;       // exam.month
    private Integer setNo;       // exam.setNo
    private Integer totalScore;  // exam_record.total_score（用户得分）
    private Integer fullScore;   // exam.total_score（满分）
    private String status;       // exam_record.status: "in_progress" | "submitted"
    private LocalDateTime startTime;    // exam_record.start_time
    private LocalDateTime submitTime;   // exam_record.submit_time
}

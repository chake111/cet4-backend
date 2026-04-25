package com.cet4.platform.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class ExamDraftSaveRequest {

    @NotBlank(message = "paperId 不能为空")
    private String paperId;

    @NotBlank(message = "stage 不能为空")
    private String stage;

    @NotBlank(message = "questionId 不能为空")
    private String questionId;

    private String answer;
}

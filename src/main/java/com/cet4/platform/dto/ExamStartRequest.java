package com.cet4.platform.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class ExamStartRequest {

    @NotBlank(message = "paperId 不能为空")
    private String paperId;
}

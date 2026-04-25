package com.cet4.platform.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.Map;

@Data
public class ExamSubmitRequest {

    @NotBlank(message = "paperId 不能为空")
    private String paperId;

    @NotNull(message = "answers 不能为空")
    private Map<String, String> answers;
}

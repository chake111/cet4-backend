package com.cet4.platform.dto.admin.content;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class WritingContent {

    @NotBlank(message = "content.prompt 不能为空")
    private String prompt;
}

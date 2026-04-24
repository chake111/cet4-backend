package com.cet4.platform.dto.admin.content;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class TranslationContent {

    @NotBlank(message = "content.text 不能为空")
    private String text;
}

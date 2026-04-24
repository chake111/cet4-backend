package com.cet4.platform.dto.admin.content;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;

import java.util.List;

@Data
public class SingleChoiceContent {

    @NotBlank(message = "content.stem 不能为空")
    private String stem;

    @NotNull(message = "content.options 不能为空")
    @Size(min = 4, max = 4, message = "content.options 必须是 4 个选项")
    private List<@NotBlank(message = "content.options 选项不能为空") String> options;
}

package com.cet4.platform.dto.admin;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class AdminQuestionUpsertRequest {

    @NotNull(message = "examId 不能为空")
    private Long examId;

    @NotBlank(message = "part 不能为空")
    private String part;

    @NotNull(message = "questionNo 不能为空")
    @Min(value = 1, message = "questionNo 必须大于 0")
    private Integer questionNo;

    @NotBlank(message = "type 不能为空")
    private String type;

    @NotNull(message = "content 不能为空")
    private Object content;

    private String passage;

    @NotBlank(message = "correctAnswer 不能为空")
    private String correctAnswer;

    @NotNull(message = "score 不能为空")
    @Min(value = 1, message = "score 必须大于 0")
    private Integer score;

    private String audioUrl;

    @NotNull(message = "sortOrder 不能为空")
    @Min(value = 1, message = "sortOrder 必须大于 0")
    private Integer sortOrder;
}

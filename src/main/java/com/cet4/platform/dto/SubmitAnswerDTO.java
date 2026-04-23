package com.cet4.platform.dto;

import lombok.Data;

import java.util.List;

@Data
public class SubmitAnswerDTO {

    private List<AnswerItemDTO> answers;
}

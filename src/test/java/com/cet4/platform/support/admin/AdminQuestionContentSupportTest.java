package com.cet4.platform.support.admin;

import com.cet4.platform.common.BusinessException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.validation.Validation;
import java.util.List;
import java.util.Map;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

class AdminQuestionContentSupportTest {

    private final AdminQuestionContentSupport support = new AdminQuestionContentSupport(
            new ObjectMapper(),
            Validation.buildDefaultValidatorFactory().getValidator());

    @Test
    void parsesSingleChoiceContentAndCopiesOptions() {
        AdminQuestionContentSupport.ContentParsedResult result = support.validateAndSerializeContent(
                "single_choice",
                Map.of("stem", "Choose one", "options", List.of("A", "B", "C", "D")));

        assertEquals("A", result.optionA());
        assertEquals("D", result.optionD());
    }

    @Test
    void rejectsInvalidSingleChoiceContent() {
        assertThrows(BusinessException.class, () -> support.validateAndSerializeContent(
                "single_choice",
                Map.of("stem", "Choose one", "options", List.of("A"))));
    }
}

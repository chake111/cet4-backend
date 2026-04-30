package com.cet4.platform.dto;

import jakarta.validation.Validation;
import jakarta.validation.Validator;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;

class AuthRequestValidationTest {

    private final Validator validator = Validation.buildDefaultValidatorFactory().getValidator();

    @Test
    void loginRequiresUsernameAndPassword() {
        AuthLoginRequest request = new AuthLoginRequest();

        assertFalse(validator.validate(request).isEmpty());
    }

    @Test
    void registerRequiresPasswordWithMinimumLength() {
        AuthRegisterRequest request = new AuthRegisterRequest();
        request.setUsername("alice");
        request.setPassword("123");

        assertFalse(validator.validate(request).isEmpty());
    }
}

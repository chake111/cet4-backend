package com.cet4.platform.common;

import jakarta.servlet.http.HttpServletRequest;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class GlobalExceptionHandlerTest {

    @Test
    void genericExceptionDoesNotExposeInternalMessage() {
        HttpServletRequest request = mock(HttpServletRequest.class);
        when(request.getMethod()).thenReturn("GET");
        when(request.getRequestURI()).thenReturn("/api/test");

        Result<Void> result = new GlobalExceptionHandler()
                .handleException(new IllegalStateException("database password leaked"), request);

        assertEquals(500, result.getCode());
        assertEquals("服务器内部错误", result.getMessage());
        assertEquals("/api/test", result.getPath());
    }
}

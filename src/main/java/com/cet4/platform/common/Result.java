package com.cet4.platform.common;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Result<T> {
    private int code;
    private String message;
    private T data;
    private String path;
    private Long timestamp;

    public static <T> Result<T> success(T data) {
        return new Result<>(200, "success", data, null, null);
    }

    public static <T> Result<T> success(String message, T data) {
        return new Result<>(200, message, data, null, null);
    }

    public static <T> Result<T> fail(int code, String message) {
        return new Result<>(code, message, null, null, null);
    }

    public static <T> Result<T> fail(int code, String message, String path) {
        return new Result<>(code, message, null, path, System.currentTimeMillis());
    }
}

package com.cet4.platform.dto;

import lombok.Data;

@Data
public class AuthLoginRequest {
    private String username;
    private String password;
}

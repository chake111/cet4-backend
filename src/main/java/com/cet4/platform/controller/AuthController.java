package com.cet4.platform.controller;

import com.cet4.platform.common.Result;
import com.cet4.platform.dto.AuthLoginRequest;
import com.cet4.platform.dto.AuthLoginResponse;
import com.cet4.platform.dto.AuthRegisterRequest;
import com.cet4.platform.service.AuthService;
import com.cet4.platform.support.ClientIpResolver;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;
    private final ClientIpResolver clientIpResolver;

    @PostMapping("/register")
    public Result<Void> register(@Valid @RequestBody AuthRegisterRequest request,
                                 HttpServletRequest servletRequest) {
        authService.register(request, clientIpResolver.resolve(servletRequest));
        return Result.success("注册成功", null);
    }

    @PostMapping("/login")
    public Result<AuthLoginResponse> login(@Valid @RequestBody AuthLoginRequest request,
                                           HttpServletRequest servletRequest) {
        return Result.success(authService.login(request, clientIpResolver.resolve(servletRequest)));
    }
}

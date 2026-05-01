package com.cet4.platform.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.cet4.platform.common.BusinessException;
import com.cet4.platform.dto.AuthLoginRequest;
import com.cet4.platform.dto.AuthLoginResponse;
import com.cet4.platform.dto.AuthRegisterRequest;
import com.cet4.platform.entity.User;
import com.cet4.platform.mapper.UserMapper;
import com.cet4.platform.support.AuthRateLimiter;
import com.cet4.platform.utils.JwtUtils;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class AuthServiceTest {

    @Mock
    private UserMapper userMapper;

    @Mock
    private PasswordEncoder passwordEncoder;

    @Mock
    private JwtUtils jwtUtils;

    @Mock
    private AuthRateLimiter authRateLimiter;

    private AuthService authService;

    @BeforeEach
    void setUp() {
        authService = new AuthService(userMapper, passwordEncoder, jwtUtils, authRateLimiter);
    }

    @Test
    void rateLimitedLoginDoesNotQueryDatabase() {
        AuthLoginRequest request = loginRequest();
        when(authRateLimiter.isLoginLocked("alice")).thenReturn(false);
        when(authRateLimiter.allowLogin("127.0.0.1", "alice")).thenReturn(false);

        assertThrows(BusinessException.class, () -> authService.login(request, "127.0.0.1"));

        verify(userMapper, never()).selectOne(any(LambdaQueryWrapper.class));
    }

    @Test
    void wrongPasswordRecordsFailure() {
        AuthLoginRequest request = loginRequest();
        User user = user();
        when(authRateLimiter.isLoginLocked("alice")).thenReturn(false);
        when(authRateLimiter.allowLogin("127.0.0.1", "alice")).thenReturn(true);
        when(userMapper.selectOne(any(LambdaQueryWrapper.class))).thenReturn(user);
        when(passwordEncoder.matches("bad-password", "encoded")).thenReturn(false);

        assertThrows(BusinessException.class, () -> authService.login(request, "127.0.0.1"));

        verify(authRateLimiter).recordLoginFailure("alice");
    }

    @Test
    void successfulLoginClearsFailuresAndReturnsToken() {
        AuthLoginRequest request = loginRequest();
        User user = user();
        when(authRateLimiter.isLoginLocked("alice")).thenReturn(false);
        when(authRateLimiter.allowLogin("127.0.0.1", "alice")).thenReturn(true);
        when(userMapper.selectOne(any(LambdaQueryWrapper.class))).thenReturn(user);
        when(passwordEncoder.matches("bad-password", "encoded")).thenReturn(true);
        when(jwtUtils.generateToken("alice", "student")).thenReturn("jwt-token");

        AuthLoginResponse response = authService.login(request, "127.0.0.1");

        assertEquals("jwt-token", response.getToken());
        verify(authRateLimiter).clearLoginFailures("alice");
    }

    @Test
    void rateLimitedRegisterDoesNotQueryOrWriteDatabase() {
        AuthRegisterRequest request = new AuthRegisterRequest();
        request.setUsername("alice");
        request.setPassword("secret123");
        when(authRateLimiter.allowRegister("127.0.0.1")).thenReturn(false);

        assertThrows(BusinessException.class, () -> authService.register(request, "127.0.0.1"));

        verify(userMapper, never()).selectOne(any(LambdaQueryWrapper.class));
        verify(userMapper, never()).insert(any(User.class));
    }

    private AuthLoginRequest loginRequest() {
        AuthLoginRequest request = new AuthLoginRequest();
        request.setUsername("alice");
        request.setPassword("bad-password");
        return request;
    }

    private User user() {
        User user = new User();
        user.setUsername("alice");
        user.setPassword("encoded");
        user.setRole("student");
        return user;
    }
}

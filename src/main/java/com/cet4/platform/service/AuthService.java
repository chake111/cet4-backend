package com.cet4.platform.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.cet4.platform.common.BusinessException;
import com.cet4.platform.domain.UserRoles;
import com.cet4.platform.dto.AuthLoginRequest;
import com.cet4.platform.dto.AuthLoginResponse;
import com.cet4.platform.dto.AuthRegisterRequest;
import com.cet4.platform.entity.User;
import com.cet4.platform.mapper.UserMapper;
import com.cet4.platform.support.AuthRateLimiter;
import com.cet4.platform.utils.JwtUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@Slf4j
@RequiredArgsConstructor
public class AuthService {

    private final UserMapper userMapper;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtils jwtUtils;
    private final AuthRateLimiter authRateLimiter;

    public void register(AuthRegisterRequest request, String clientIp) {
        if (!authRateLimiter.allowRegister(clientIp)) {
            log.warn("注册限流命中: clientIp={}", clientIp);
            throw new BusinessException("请求过于频繁，请稍后再试");
        }

        User exists = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .eq(User::getUsername, request.getUsername()));
        if (exists != null) {
            throw new BusinessException("用户名已存在");
        }

        User user = new User();
        user.setUsername(request.getUsername());
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setRole(UserRoles.STUDENT);
        user.setDeleted(0);
        user.setCreatedAt(LocalDateTime.now());
        userMapper.insert(user);
    }

    public AuthLoginResponse login(AuthLoginRequest request, String clientIp) {
        String username = request.getUsername();
        if (authRateLimiter.isLoginLocked(username)) {
            log.warn("登录锁定命中: username={}", username);
            throw new BusinessException("登录失败次数过多，请15分钟后再试");
        }
        if (!authRateLimiter.allowLogin(clientIp, username)) {
            log.warn("登录限流命中: clientIp={}, username={}", clientIp, username);
            throw new BusinessException("请求过于频繁，请稍后再试");
        }

        User user = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .eq(User::getUsername, username));
        if (user == null || !passwordEncoder.matches(request.getPassword(), user.getPassword())) {
            authRateLimiter.recordLoginFailure(username);
            log.warn("登录失败: username={}, clientIp={}", username, clientIp);
            throw new BusinessException("用户名或密码错误");
        }
        authRateLimiter.clearLoginFailures(username);
        String role = user.getRole() == null ? UserRoles.STUDENT : user.getRole();
        return new AuthLoginResponse(jwtUtils.generateToken(user.getUsername(), role));
    }
}

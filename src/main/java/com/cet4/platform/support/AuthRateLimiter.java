package com.cet4.platform.support;

import com.cet4.platform.config.AuthRateLimitProperties;
import java.time.Duration;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@RequiredArgsConstructor
public class AuthRateLimiter {

    private static final String LOGIN_IP_KEY_FORMAT = "auth:login:ip:%s";
    private static final String LOGIN_USERNAME_KEY_FORMAT = "auth:login:user:%s";
    private static final String LOGIN_FAILURE_KEY_FORMAT = "auth:login:fail:%s";
    private static final String LOGIN_LOCK_KEY_FORMAT = "auth:login:lock:%s";
    private static final String REGISTER_IP_KEY_FORMAT = "auth:register:ip:%s";

    private final StringRedisTemplate stringRedisTemplate;
    private final AuthRateLimitProperties properties;

    public boolean allowLogin(String clientIp, String username) {
        try {
            return incrementAndCheck(String.format(LOGIN_IP_KEY_FORMAT, clientIp),
                    properties.getLoginIpLimit(), properties.getLoginIpWindow())
                    && incrementAndCheck(String.format(LOGIN_USERNAME_KEY_FORMAT, username),
                    properties.getLoginUsernameLimit(), properties.getLoginUsernameWindow());
        } catch (RuntimeException ex) {
            log.warn("登录限流 Redis 检查失败，允许继续登录。clientIp={}, username={}", clientIp, username, ex);
            return true;
        }
    }

    public boolean allowRegister(String clientIp) {
        try {
            return incrementAndCheck(String.format(REGISTER_IP_KEY_FORMAT, clientIp),
                    properties.getRegisterIpLimit(), properties.getRegisterIpWindow());
        } catch (RuntimeException ex) {
            log.warn("注册限流 Redis 检查失败，允许继续注册。clientIp={}", clientIp, ex);
            return true;
        }
    }

    public boolean isLoginLocked(String username) {
        try {
            return Boolean.TRUE.equals(stringRedisTemplate.hasKey(String.format(LOGIN_LOCK_KEY_FORMAT, username)));
        } catch (RuntimeException ex) {
            log.warn("登录锁定 Redis 检查失败，允许继续登录。username={}", username, ex);
            return false;
        }
    }

    public void recordLoginFailure(String username) {
        try {
            String failureKey = String.format(LOGIN_FAILURE_KEY_FORMAT, username);
            Long failures = ops().increment(failureKey);
            if (failures != null && failures == 1L) {
                stringRedisTemplate.expire(failureKey, properties.getLoginLockWindow());
            }
            if (failures != null && failures >= properties.getLoginFailureLimit()) {
                ops().set(String.format(LOGIN_LOCK_KEY_FORMAT, username), "1", properties.getLoginLockWindow());
            }
        } catch (RuntimeException ex) {
            log.warn("记录登录失败次数失败，忽略本次失败计数。username={}", username, ex);
        }
    }

    public void clearLoginFailures(String username) {
        try {
            stringRedisTemplate.delete(String.format(LOGIN_FAILURE_KEY_FORMAT, username));
            stringRedisTemplate.delete(String.format(LOGIN_LOCK_KEY_FORMAT, username));
        } catch (RuntimeException ex) {
            log.warn("清理登录失败次数失败。username={}", username, ex);
        }
    }

    private boolean incrementAndCheck(String key, int limit, Duration window) {
        Long count = ops().increment(key);
        if (count != null && count == 1L) {
            stringRedisTemplate.expire(key, window);
        }
        return count == null || count <= limit;
    }

    private ValueOperations<String, String> ops() {
        return stringRedisTemplate.opsForValue();
    }
}

package com.cet4.platform.support;

import com.cet4.platform.config.AuthRateLimitProperties;
import java.time.Duration;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class AuthRateLimiterTest {

    private StringRedisTemplate redisTemplate;
    private ValueOperations<String, String> valueOperations;
    private AuthRateLimiter authRateLimiter;

    @BeforeEach
    void setUp() {
        redisTemplate = mock(StringRedisTemplate.class);
        valueOperations = mock(ValueOperations.class);
        when(redisTemplate.opsForValue()).thenReturn(valueOperations);
        authRateLimiter = new AuthRateLimiter(redisTemplate, new AuthRateLimitProperties());
    }

    @Test
    void rejectsLoginWhenIpLimitExceeded() {
        when(valueOperations.increment("auth:login:ip:127.0.0.1")).thenReturn(31L);

        assertFalse(authRateLimiter.allowLogin("127.0.0.1", "alice"));
    }

    @Test
    void rejectsLoginWhenUsernameLimitExceeded() {
        when(valueOperations.increment("auth:login:ip:127.0.0.1")).thenReturn(1L);
        when(valueOperations.increment("auth:login:user:alice")).thenReturn(21L);

        assertFalse(authRateLimiter.allowLogin("127.0.0.1", "alice"));
    }

    @Test
    void locksUsernameAfterTooManyFailures() {
        when(valueOperations.increment("auth:login:fail:alice")).thenReturn(5L);

        authRateLimiter.recordLoginFailure("alice");

        verify(valueOperations).set("auth:login:lock:alice", "1", Duration.ofMinutes(15));
    }

    @Test
    void clearsFailureCounterAndLock() {
        authRateLimiter.clearLoginFailures("alice");

        verify(redisTemplate).delete("auth:login:fail:alice");
        verify(redisTemplate).delete("auth:login:lock:alice");
    }

    @Test
    void allowsLoginWhenRedisFails() {
        when(redisTemplate.opsForValue()).thenThrow(new RuntimeException("redis down"));

        assertTrue(authRateLimiter.allowLogin("127.0.0.1", "alice"));
    }
}

package com.cet4.platform.support;

import com.cet4.platform.config.ExamCacheProperties;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.time.Duration;
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.core.script.DefaultRedisScript;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class ExamCacheStoreTest {

    private StringRedisTemplate redisTemplate;
    private ValueOperations<String, String> valueOperations;
    private ExamCacheStore cacheStore;

    @BeforeEach
    void setUp() {
        redisTemplate = mock(StringRedisTemplate.class);
        valueOperations = mock(ValueOperations.class);
        when(redisTemplate.opsForValue()).thenReturn(valueOperations);

        ExamCacheProperties properties = new ExamCacheProperties();
        properties.setSubmitLockTtl(Duration.ofMinutes(3));
        cacheStore = new ExamCacheStore(redisTemplate, new JsonSupport(new ObjectMapper()), properties);
    }

    @Test
    void returnsTokenWhenSubmitLockAcquired() {
        when(valueOperations.setIfAbsent(eq("exam:submit:lock:1:2"), any(String.class), eq(Duration.ofMinutes(3))))
                .thenReturn(true);

        String token = cacheStore.acquireSubmitLock(1L, 2L);

        assertNotNull(token);
    }

    @Test
    void returnsNullWhenSubmitLockAlreadyExists() {
        when(valueOperations.setIfAbsent(eq("exam:submit:lock:1:2"), any(String.class), eq(Duration.ofMinutes(3))))
                .thenReturn(false);

        assertNull(cacheStore.acquireSubmitLock(1L, 2L));
    }

    @Test
    void releasesOnlyMatchingTokenWithScript() {
        cacheStore.releaseSubmitLock(1L, 2L, "token");

        verify(redisTemplate).execute(any(DefaultRedisScript.class), eq(List.of("exam:submit:lock:1:2")), eq("token"));
    }
}

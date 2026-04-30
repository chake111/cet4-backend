package com.cet4.platform.support;

import com.fasterxml.jackson.core.type.TypeReference;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ExamCacheStore {

    private static final String DRAFT_KEY_FORMAT = "exam:draft:%d:%s";
    private static final String SESSION_KEY_FORMAT = "exam:session:%d";
    private static final Duration SESSION_TTL = Duration.ofMinutes(130);
    private static final String SUBMIT_LOCK_KEY_FORMAT = "exam:submit:lock:%d:%d";
    private static final Duration SUBMIT_LOCK_TTL = Duration.ofSeconds(30);

    private final StringRedisTemplate stringRedisTemplate;
    private final JsonSupport jsonSupport;

    public void startSession(Long userId, String paperId, LocalDateTime startedAt) {
        stringRedisTemplate.opsForValue().set(buildDraftKey(userId, paperId), "{}");
        stringRedisTemplate.opsForValue().set(
                buildSessionKey(userId),
                jsonSupport.toJson(Map.of("paperId", paperId, "startedAt", startedAt.toString())),
                SESSION_TTL);
    }

    public Map<String, String> readDraft(Long userId, String paperId) {
        String raw = stringRedisTemplate.opsForValue().get(buildDraftKey(userId, paperId));
        if (raw == null || raw.isBlank()) {
            return new HashMap<>();
        }
        return jsonSupport.fromJson(raw, new TypeReference<>() {
        });
    }

    public void saveDraft(Long userId, String paperId, Map<String, String> draft) {
        stringRedisTemplate.opsForValue().set(buildDraftKey(userId, paperId), jsonSupport.toJson(draft));
    }

    public LocalDateTime readStartedAt(Long userId, LocalDateTime fallback) {
        String sessionJson = stringRedisTemplate.opsForValue().get(buildSessionKey(userId));
        if (sessionJson == null || sessionJson.isBlank()) {
            return fallback;
        }
        Map<String, String> session = jsonSupport.fromJson(sessionJson, new TypeReference<>() {
        });
        String startedAt = session.get("startedAt");
        return startedAt == null || startedAt.isBlank() ? fallback : LocalDateTime.parse(startedAt);
    }

    public boolean acquireSubmitLock(Long userId, Long examId) {
        Boolean acquired = stringRedisTemplate.opsForValue()
                .setIfAbsent(buildSubmitLockKey(userId, examId), "1", SUBMIT_LOCK_TTL);
        return Boolean.TRUE.equals(acquired);
    }

    public void releaseSubmitLock(Long userId, Long examId) {
        stringRedisTemplate.delete(buildSubmitLockKey(userId, examId));
    }

    public void clearSession(Long userId, String paperId) {
        stringRedisTemplate.delete(buildDraftKey(userId, paperId));
        stringRedisTemplate.delete(buildSessionKey(userId));
    }

    private String buildDraftKey(Long userId, String paperId) {
        return String.format(DRAFT_KEY_FORMAT, userId, paperId);
    }

    private String buildSessionKey(Long userId) {
        return String.format(SESSION_KEY_FORMAT, userId);
    }

    private String buildSubmitLockKey(Long userId, Long examId) {
        return String.format(SUBMIT_LOCK_KEY_FORMAT, userId, examId);
    }
}

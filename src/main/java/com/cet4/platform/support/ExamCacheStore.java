package com.cet4.platform.support;

import com.cet4.platform.config.ExamCacheProperties;
import com.fasterxml.jackson.core.type.TypeReference;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ExamCacheStore {

    private static final String DRAFT_KEY_FORMAT = "exam:draft:%d:%s";
    private static final String SESSION_KEY_FORMAT = "exam:session:%d";
    private static final String SUBMIT_LOCK_KEY_FORMAT = "exam:submit:lock:%d:%d";
    private static final DefaultRedisScript<Long> RELEASE_LOCK_SCRIPT = new DefaultRedisScript<>(
            "if redis.call('get', KEYS[1]) == ARGV[1] then "
                    + "return redis.call('del', KEYS[1]) else return 0 end",
            Long.class);

    private final StringRedisTemplate stringRedisTemplate;
    private final JsonSupport jsonSupport;
    private final ExamCacheProperties properties;

    public void startSession(Long userId, String paperId, LocalDateTime startedAt) {
        stringRedisTemplate.opsForValue().set(buildDraftKey(userId, paperId), "{}");
        stringRedisTemplate.opsForValue().set(
                buildSessionKey(userId),
                jsonSupport.toJson(Map.of("paperId", paperId, "startedAt", startedAt.toString())),
                properties.getSessionTtl());
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

    public String acquireSubmitLock(Long userId, Long examId) {
        String token = UUID.randomUUID().toString();
        Boolean acquired = stringRedisTemplate.opsForValue()
                .setIfAbsent(buildSubmitLockKey(userId, examId), token, properties.getSubmitLockTtl());
        return Boolean.TRUE.equals(acquired) ? token : null;
    }

    public void releaseSubmitLock(Long userId, Long examId, String token) {
        if (token == null || token.isBlank()) {
            return;
        }
        stringRedisTemplate.execute(RELEASE_LOCK_SCRIPT, List.of(buildSubmitLockKey(userId, examId)), token);
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

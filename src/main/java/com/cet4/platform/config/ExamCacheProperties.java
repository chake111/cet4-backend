package com.cet4.platform.config;

import java.time.Duration;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Data
@ConfigurationProperties(prefix = "exam.cache")
public class ExamCacheProperties {

    private Duration sessionTtl = Duration.ofMinutes(130);
    private Duration submitLockTtl = Duration.ofMinutes(3);
}

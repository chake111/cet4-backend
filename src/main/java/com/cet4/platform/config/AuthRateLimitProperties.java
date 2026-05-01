package com.cet4.platform.config;

import java.time.Duration;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Data
@ConfigurationProperties(prefix = "auth.rate-limit")
public class AuthRateLimitProperties {

    private int loginIpLimit = 30;
    private int loginUsernameLimit = 20;
    private int loginFailureLimit = 5;
    private int registerIpLimit = 5;

    private Duration loginIpWindow = Duration.ofMinutes(1);
    private Duration loginUsernameWindow = Duration.ofMinutes(15);
    private Duration loginLockWindow = Duration.ofMinutes(15);
    private Duration registerIpWindow = Duration.ofHours(1);
}

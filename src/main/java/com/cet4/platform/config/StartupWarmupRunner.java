package com.cet4.platform.config;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.Connection;

@Slf4j
@Component
@RequiredArgsConstructor
public class StartupWarmupRunner implements ApplicationRunner {

    private final DataSource dataSource;
    private final StringRedisTemplate stringRedisTemplate;

    @Override
    public void run(ApplicationArguments args) {
        warmupDatabase();
        warmupRedis();
        log.info("启动预热完成");
    }

    private void warmupDatabase() {
        try (Connection conn = dataSource.getConnection()) {
            conn.createStatement().execute("SELECT 1");
            log.info("数据库连接预热成功");
        } catch (Exception e) {
            log.error("数据库连接预热失败", e);
        }
    }

    private void warmupRedis() {
        try {
            stringRedisTemplate.getConnectionFactory().getConnection().ping();
            log.info("Redis连接预热成功");
        } catch (Exception e) {
            log.error("Redis连接预热失败", e);
        }
    }
}

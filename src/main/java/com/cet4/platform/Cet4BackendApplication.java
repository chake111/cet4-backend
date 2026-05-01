package com.cet4.platform;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

@SpringBootApplication
@ConfigurationPropertiesScan
@MapperScan("com.cet4.platform.mapper")
public class Cet4BackendApplication {

    public static void main(String[] args) {
        SpringApplication.run(Cet4BackendApplication.class, args);
    }
}

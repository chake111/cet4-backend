package com.cet4.platform;

import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class BCryptPasswordTest {

    @Test
    public void testEncodePassword() {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encodedPassword = encoder.encode("123456");
        assertTrue(encoder.matches("123456", encodedPassword));
    }
}

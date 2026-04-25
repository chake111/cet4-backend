package com.cet4.platform;

import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptPasswordTest {

    @Test
    public void testEncodePassword() {
        String encodedPassword = new BCryptPasswordEncoder().encode("123456");
        System.out.println(encodedPassword);
    }
}

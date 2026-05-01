package com.cet4.platform.support;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.cet4.platform.common.BusinessException;
import com.cet4.platform.entity.User;
import com.cet4.platform.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ExamUserSupport {

    private final UserMapper userMapper;

    public User getUserByUsername(String username) {
        User user = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .eq(User::getUsername, username)
                .last("limit 1"));

        if (user == null) {
            throw new BusinessException("用户不存在");
        }
        return user;
    }
}

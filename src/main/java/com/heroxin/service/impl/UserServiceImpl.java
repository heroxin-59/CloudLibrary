package com.heroxin.service.impl;

import com.heroxin.daomain.User;
import com.heroxin.mapper.UserMapper;
import com.heroxin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Heroxin
 * @create 2022-05-21-10:34
 * @Description:
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;


    @Override
    @Transactional(isolation = Isolation.DEFAULT,readOnly = false,propagation = Propagation.REQUIRED)
    public User query(User user) {
        return userMapper.query(user);
    }

    @Override
    @Transactional(isolation = Isolation.DEFAULT,readOnly = false,propagation = Propagation.REQUIRED)
    public void insert(User user) {
        userMapper.insert(user);
    }
}

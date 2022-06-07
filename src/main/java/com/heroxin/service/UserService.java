package com.heroxin.service;

import com.heroxin.daomain.User;

/**
 * @author Heroxin
 * @create 2022-05-21-10:33
 * @Description:
 */
public interface UserService {
    User query(User user);

    void insert(User user);
}

package com.weiyuan.biz;

import com.weiyuan.dao.entity.User;

import org.springframework.stereotype.Service;


public interface GlobalBiz {
    void register(User user);
    User login(String username, String password);
    void changPassword(User user);
}

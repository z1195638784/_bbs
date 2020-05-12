package com.weiyuan.biz;

import org.springframework.stereotype.Service;
import com.weiyuan.dao.entity.User;

import java.util.List;


public interface UserBiz {

    User get(String username);
    List<User> getAll();
    void changeStatus(User user);
}

package com.weiyuan.biz.Impl;

import com.weiyuan.biz.UserBiz;
import com.weiyuan.dao.mapper.UserMapper;
import com.weiyuan.dao.entity.User;
import com.weiyuan.biz.UserBiz;
import com.weiyuan.dao.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userBiz")
public class UserBizImpl implements UserBiz {


    @Autowired
    private UserMapper userMapper;



    @Override
    public User get(String username) {
        return userMapper.selectByUsername(username);
    }

    @Override
    public List<User> getAll() {
           return userMapper.selectAll();
    }

    @Override
    public void changeStatus(User user) {
        userMapper.changeStatus(user);
    }

}

package com.weiyuan.biz.Impl;

import com.weiyuan.biz.GlobalBiz;
import com.weiyuan.dao.mapper.UserMapper;
import com.weiyuan.dao.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


@Service("globalBiz")
public class GlobalBizImpl implements GlobalBiz {


    @Autowired
    private UserMapper userMapper;

    @Override
    public void register(User user) {
        user.setAdmin(0);
        user.setUserstatus(0);
        userMapper.insert(user);
    }

    @Override
    public User login(String username,String password) {
       User user =  userMapper.selectByUsername(username);
       if(user!=null&&user.getPassword().equals(password)){
           return user;
       }
       return null;
    }

    @Override
    public void changPassword(User user) {
        userMapper.changePassword(user);
    }
}

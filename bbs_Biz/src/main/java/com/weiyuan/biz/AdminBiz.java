package com.weiyuan.biz;


import com.weiyuan.dao.entity.User;




public interface AdminBiz {
    void changStatus(User user);
    void deleteUser(String username);
    void deletePost(Long Id);
}

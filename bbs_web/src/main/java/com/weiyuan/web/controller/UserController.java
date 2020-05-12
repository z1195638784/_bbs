package com.weiyuan.web.controller;


import com.weiyuan.biz.GlobalBiz;
import com.weiyuan.dao.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private GlobalBiz globalBiz;

    @RequestMapping("/to_change_password")
    public String to_change_password(){
        return "change_password";
    }

    @RequestMapping("/changePassword")
    public String change(HttpSession session, @RequestParam String old, @RequestParam String new1, @RequestParam String new2){
        User user = (User) session.getAttribute("user");
        if(user.getPassword().equals(old)){
            if(new1.equals(new2)){
                user.setPassword(new1);
                globalBiz.changPassword(user);
                return "redirect:post/to_list";
            }
        }
        return "redirect:to_change_password";
    }





}

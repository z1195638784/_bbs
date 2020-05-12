package com.weiyuan.web.controller;

import com.weiyuan.biz.GlobalBiz;
import com.weiyuan.biz.UserBiz;
import com.weiyuan.dao.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class GlobalController {
    @Autowired
    private GlobalBiz globalBiz;

    @Autowired
    private UserBiz userBiz;
    @RequestMapping("/to_login")
    public String to_login(){
        return "login";
    }


    @RequestMapping("/login")
    public String login(HttpSession session, @RequestParam  String username,@RequestParam String password){
        User user = globalBiz.login(username,password);
        if(user!=null){
            if(user.getAdmin()==1){
                session.setAttribute("user",user);
                session.setAttribute("status",user.getUserstatus());
                return "redirect:admin/to_postlist";
            }else{
                session.setAttribute("user",user);
                return "redirect:post/to_list";
            }
        }
        return "redirect:to_login";
    }

    @RequestMapping("/to_register")
    public String to_register(){

        return "register";
    }
    @RequestMapping("/register")
    public String register(HttpSession session,@RequestParam String username,@RequestParam String email,@RequestParam String password,@RequestParam String password_confirm ){
        if(userBiz.get(username)==null){
            if(password.equals(password_confirm)){
                User user =new User();
                user.setUsername(username);
                user.setPassword(password_confirm);
                user.setEmail(email);
                globalBiz.register(user);
                session.setAttribute("user",user);
                return "redirect:/post/to_list";
            }
        }
        return "redirect:/to_register";
    }



    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.setAttribute("user",null);
        return "redirect:post/to_list";
    }
}

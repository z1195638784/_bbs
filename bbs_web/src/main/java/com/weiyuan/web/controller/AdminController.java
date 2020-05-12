package com.weiyuan.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.weiyuan.biz.CommentBiz;
import com.weiyuan.biz.PostBiz;
import com.weiyuan.biz.UserBiz;
import com.weiyuan.dao.entity.Post;
import com.weiyuan.dao.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.print.attribute.Attribute;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController  {
    @Autowired
    private UserBiz userBiz;
    @Autowired
    private PostBiz postBiz;
    @Autowired
    private CommentBiz commentBiz;
    //查看除管理员所有用户状态
@RequestMapping("/to_userlist")
    public String getAllUser(HttpSession session,Map<String,Object> map){
    List<User> userList = userBiz.getAll();
        map.put("userlist",userList);
        List<String> statusList = new ArrayList<String>();
        for(User user :userList){
            int status =user.getUserstatus();
            if(status==0){
                statusList.add("正常");
            }else if(status==1){
                statusList.add("已锁定");
            }else{
                statusList.add("已删除");
            }
        }
        map.put("statusList",statusList);
        return "users";
    }
    //锁定用户
    @RequestMapping("/change_status")
    public String changeStatus(@RequestParam String username){
        User user  = userBiz.get(username);
        int status = user.getUserstatus();
        if(status==0){
            user.setUserstatus(1);
            userBiz.changeStatus(user);
        }else if(status==1){
            user.setUserstatus(0);
            userBiz.changeStatus(user);
        }
    return "redirect:to_userlist";
    }


    @RequestMapping("/delete_user")
    public String deleteUser(@RequestParam String username){
        User user  = userBiz.get(username);
        if(user.getUserstatus()==2){
            user.setUserstatus(0);
        }else {
            user.setUserstatus(2);
        }
        userBiz.changeStatus(user);
        return "redirect:to_userlist";
    }


    //打开所有帖子的详情
    @RequestMapping("to_postlist")
    public String getAllpost(HttpSession session, Map<String,Object> map){
        map.put("posts",postBiz.getAll());
        return "posts";
    }

    //删除帖子
    @RequestMapping("/remove_post")
    public String removePost(@RequestParam Long postId){
            postBiz.delete(postId);
            commentBiz.remove(postId);
            return "redirect:to_postlist";
    }
}

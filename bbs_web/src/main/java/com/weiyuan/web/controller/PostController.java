package com.weiyuan.web.controller;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.weiyuan.biz.CommentBiz;
import com.weiyuan.biz.PostBiz;
import com.weiyuan.dao.entity.Comment;
import com.weiyuan.dao.entity.Post;
import com.weiyuan.dao.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/post")
public class PostController {


    @Autowired
    private PostBiz postBiz;
    @Autowired
    private CommentBiz commentBiz;


    @RequestMapping("/to_list")
    public String list(HttpSession session,Map<String,Object> map){
        map.put("list",postBiz.getAll());
        return "list";
    }

    @RequestMapping("/to_add_post")
    public String to_add_post(){
        return "newpost";
    }

    @RequestMapping("/add_post")
    public String add_post(HttpSession session,@RequestParam String title ,@RequestParam String tag,
    @RequestParam String category,@RequestParam String content){
        User user = (User) session.getAttribute("user");
        Post post =new Post();
        post.setCategory(category);
        post.setContent(content);
        post.setTag(tag);
        post.setTitle(title);
        post.setUsername(user.getUsername());
        post.setCreateTime(new Date());
        postBiz.add(post);
        return "redirect:to_list";
    }



    @RequestMapping("to_post")
    public String to_post(HttpSession session,Map<String,Object> map, Long id){
        session.setAttribute("postId",id);
        map.put("post",postBiz.get(id));
        map.put("commentList",commentBiz.getAllBypostId(id) );
        return "post";
    }

    @RequestMapping("/add_comment")
    public String add_comment(RedirectAttributes attributes,Comment comment){
        commentBiz.insert(comment);
        attributes.addAttribute("id",comment.getPostId());
        return "redirect:to_post";
    }








}

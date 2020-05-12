package com.weiyuan.dao.entity;




import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;
@Getter
@Setter
public class Comment implements Serializable {
    private Long id;

    //回复用户的id
    private Long userId;

    //回复者用户名
    private String username;

    //回复内容
    private String content;
//回复时间
    private Date createTime;

    //对应的帖子id
    private Long postId;

    private static final long serialVersionUID = 1L;


}
package com.weiyuan.dao.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;
@Getter
@Setter
public class Post implements Serializable {
    private Long id;
    //用户名
    private String username;
    //标题
    private String title;
  //分类
    private String category;
   //内容
    private String content;
    //标签
    private String tag;
    //创建时间
    private Date createTime;

    private static final long serialVersionUID = 1L;


}
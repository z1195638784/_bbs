package com.weiyuan.dao.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
@Getter
@Setter
public class User implements Serializable {
    private Long id;

    //用户名
    private String username;

    //密码
    private String password;

    //邮箱
    private String email;

    //用户状态 0 正常 1 锁定 2 删除

    private Integer userstatus;
//管理员
    private Integer admin;

    private static final long serialVersionUID = 1L;


}
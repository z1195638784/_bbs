package com.weiyuan.dao.mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

import com.weiyuan.dao.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
public interface UserMapper {

    int insert(User record);

    List<User> selectAll();
    User selectByUsername(@Param("username") String username);


    int deleteByUsername(@Param("username") String username);

    int updateByUsername(@Param("updated") User updated);

    int changePassword(@Param("updated") User updated);

    int changeStatus(User record);
}
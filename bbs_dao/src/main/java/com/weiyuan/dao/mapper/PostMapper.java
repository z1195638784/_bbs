package com.weiyuan.dao.mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Date;

import com.weiyuan.dao.entity.Post;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
public interface PostMapper {

    void insert(Post record);

    List<Post> selectByAll();

    int deleteById(@Param("id") Long id);

	Post selectById(@Param("id") Long id);


}
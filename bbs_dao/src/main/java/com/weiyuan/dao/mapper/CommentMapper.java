package com.weiyuan.dao.mapper;
import org.apache.ibatis.annotations.Param;


import com.weiyuan.dao.entity.Comment;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface CommentMapper {

    int insert(Comment comment);

    List<Comment> selectAllByPostId(Long postId);

    int removeByPostId(@Param("postId")Long postId);




}
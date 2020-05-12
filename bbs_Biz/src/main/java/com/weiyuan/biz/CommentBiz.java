package com.weiyuan.biz;

import com.weiyuan.dao.entity.Comment;


import java.util.List;


public interface CommentBiz {
    void insert(Comment comment);
    List<Comment> getAllBypostId(Long id);
    void remove(Long postId);

}

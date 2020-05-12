package com.weiyuan.biz.Impl;


import com.weiyuan.biz.CommentBiz;
import com.weiyuan.dao.entity.Comment;
import com.weiyuan.dao.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("commentBiz")
public class CommentBizImpl implements CommentBiz {
@Autowired
    private CommentMapper commentMapper;
    @Override
    public void insert(Comment comment) {
        commentMapper.insert(comment);

    }

    @Override
    public List<Comment> getAllBypostId(Long id) {
        return commentMapper.selectAllByPostId(id);
    }

    @Override
    public void remove(Long postId) {
       commentMapper.removeByPostId(postId);
    }


}

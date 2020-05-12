package com.weiyuan.biz.Impl;

import com.weiyuan.biz.PostBiz;
import com.weiyuan.dao.mapper.PostMapper;
import com.weiyuan.dao.entity.Post;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service("postBiz")
public class PostBizImpl implements PostBiz {

    @Resource
    private PostMapper postMapper;
    @Override
    public void add(Post post) {
        postMapper.insert(post);
    }

    @Override
    public void delete(Long Id) {
        postMapper.deleteById(Id);
    }

    @Override
    public Post get(Long Id) {
        return postMapper.selectById(Id);
    }

    @Override
    public List<Post> getAll() {
        return postMapper.selectByAll();
    }
}

package com.weiyuan.biz;

import com.weiyuan.dao.entity.Post;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

public interface PostBiz {
    void add(Post post);
    void delete(Long Id);
    Post get(Long Id);
    List<Post> getAll();
}

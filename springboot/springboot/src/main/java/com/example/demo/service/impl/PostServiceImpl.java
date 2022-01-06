package com.example.demo.service.impl;

import com.example.demo.entity.Post;
import com.example.demo.mapper.PostMapper;
import com.example.demo.service.PostService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 发帖的表 服务实现类
 * </p>
 *
 * @author
 * @since 2021-12-17
 */
@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements PostService {



}

package com.example.demo.controller;


import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.demo.common.Result;
import com.example.demo.entity.Object;
import com.example.demo.entity.Post;
import com.example.demo.mapper.PostMapper;
import com.example.demo.service.PostService;
import com.example.demo.service.impl.PostServiceImpl;
import io.swagger.models.auth.In;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 发帖的表 前端控制器
 * </p>
 *
 * @author cj
 * @since 2021-12-17
 */

@Controller

@RestController

@RequestMapping("/post")
public class PostController {
    @Resource
    private PostServiceImpl postService;

    @Resource
    private PostMapper postMapper;

    @PostMapping("publishPost")
    public Integer publishPost(Integer user_id , String title, String content, Integer expected_price){
        Integer Post_id=postService.publishPost(user_id,title,content,expected_price);
        if(Post_id<=0)
            return -1;
        return Post_id;
    }

    @GetMapping("viewMyPosts")
    public Result<?> vieMyPosts(Integer user_id){
        List<JSONObject> jsonObjects=postService.viewMyPosts(user_id);
        if(jsonObjects.isEmpty())
            return Result.error("-1", "当前用户没有发布过帖子");
        else
        return Result.success(jsonObjects);
    }

    @GetMapping("viewAllPosts")
    public  Result<?> viewAllPosts(@RequestParam(defaultValue = "1") Integer pageNum,
                                   @RequestParam(defaultValue = "10") Integer pageSize) {
        LambdaQueryWrapper<Post> wrapper = Wrappers.<Post>lambdaQuery();
        Page<Post> postPage = postMapper.selectPage(new Page<>(pageNum, pageSize), wrapper);
        return Result.success(postPage);
    }

    @PostMapping("deleteMypost")
    public Result<?> deleteaMyPost(Integer post_id){
        Integer count=postService.deleteMyPost(post_id);
        if(count<=0)
            return Result.error("-1", "删除帖子失败");
        else
            return Result.success();
    }
}


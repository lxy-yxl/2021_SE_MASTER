package com.example.demo.controller;


import cn.hutool.json.JSONObject;
import com.example.demo.common.Result;
import com.example.demo.service.impl.RemarksServiceImpl;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;

/**
 * <p>
 * 评价表
 前端控制器
 * </p>
 *
 * @author cj
 * @since 2021-12-17
 */
@RestController
@RequestMapping("/remarks")
public class RemarksController {
    @Resource
    RemarksServiceImpl remarksService;

    @GetMapping("getRemarkList")
    public Result<?> getRemarkList(Integer object_id){
        JSONObject remarks = remarksService.getRemarkList(object_id);
        if(Objects.equals(remarks.get("commentNum").toString(), "0")){
            return Result.error("-1", "暂无评论");
        }
        else return Result.success(remarks);
    }

    @PutMapping("giveRemark")
    public Result<?> giveRemark(Integer object_id, Integer user_id, String content, Integer grade, Integer type){
        Integer remark_id = remarksService.giveRemark(object_id, user_id, content, grade, type);
        if(remark_id==-1)
            return Result.error("-1","未找到该订单");
        else if(remark_id==-2)
            return Result.error("-2","订单当前不可评价或已评价");
        else if(remark_id==-3)
            return Result.error("-3","订单不属于当前用户");
        else if(remark_id==-4)
            return Result.error("-4","评价失败");
        else
            return Result.success(remark_id);

    }

}


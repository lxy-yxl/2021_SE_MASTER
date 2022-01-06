package com.example.demo.service.impl;

import cn.hutool.json.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.demo.entity.Order;
import com.example.demo.entity.Remarks;
import com.example.demo.mapper.OrderMapper;
import com.example.demo.mapper.RemarksMapper;
import com.example.demo.service.RemarksService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;


/**
 * <p>
 * 评价表
 服务实现类
 * </p>
 *
 * @author cj
 * @since 2021-12-17
 */
@Service
public class RemarksServiceImpl extends ServiceImpl<RemarksMapper, Remarks> implements RemarksService {
    @Resource
    RemarksMapper remarksMapper;
    @Resource
    OrderMapper orderMapper;

    public JSONObject getRemarkList(Integer object_id){
        JSONObject jsonObject=new JSONObject();

        List<JSONObject> remark_list = remarksMapper.getRemarkList(object_id);
        jsonObject.put("remark_list",remark_list);
        int count = remark_list.size();
        jsonObject.put("commentNum",count);
        return jsonObject;
    }

    public Integer giveRemark(Integer object_id, Integer user_id, String content, Integer grade, Integer type){
        QueryWrapper<Order> wrapper=new QueryWrapper<>();
        wrapper.eq("object_id", object_id);
        wrapper.eq("borrower_id", user_id);
        Order order = orderMapper.selectOne(wrapper);
        if(order==null)
            return -1;
        Integer order_id = order.getOrderId();
        if(!Objects.equals(orderMapper.selectById(order_id).getStatus(), "待评价"))
            return -2;
        if(!Objects.equals(orderMapper.selectById(order_id).getBorrowerId(), user_id))
            return -3;
        Remarks remark=new Remarks();
        remark.setUserId(user_id);
        remark.setObjectId(object_id);
        remark.setTime(LocalDateTime.now());
        remark.setContent(content);
        remark.setGrade(grade);
        remark.setType(type);
        int count = remarksMapper.insert(remark);
        if (count<=0)
            return -4;
        else {
            order = new Order();
            order.setOrderId(order_id);
            order.setStatus("已评价");
            orderMapper.updateById(order);
            return remark.getRemarkId();
        }
    }







}

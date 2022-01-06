package com.example.demo.service.impl;

import cn.hutool.json.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.demo.entity.Order;
import com.example.demo.mapper.OrderMapper;
import com.example.demo.service.OrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author
 * @since 2021-12-17
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {
    @Resource
    ObjectServiceImpl objectService;
    @Resource
    OrderMapper orderMapper;

    public int generateOrder(int object_id, int borrower_id, LocalDateTime lentout_time, LocalDateTime return_time, String campus) {
        int lent_days = (int) Math.ceil((float) Duration.between(lentout_time, return_time).getSeconds() / 3600 / 24);
        if (lent_days < 0) {
            return -1;
        } else {
            Order order = new Order();
            order.setBorrowerId(borrower_id);
            order.setLentoutTime(lentout_time);
            order.setReturnTime(return_time);
            order.setObjectId(object_id);
            order.setStatus("待支付");
            order.setFinishedTime(null);
            order.setCreatedTime(LocalDateTime.now());
            order.setCampus(campus);
            Integer deposit = objectService.getBaseMapper().selectById(object_id).getDeposit();
            Integer rent_daily = objectService.getBaseMapper().selectById(object_id).getRentDaliy();
            order.setRentTotal(rent_daily * lent_days + deposit);
            int count = orderMapper.insert(order);
            if(count<=0)
                return -2;
            else {
                return order.getOrderId();
            }
        }
    }

    public int confirm(int order_id){
        Order order = new Order();
        order.setOrderId(order_id);
        order.setStatus("已完成");
        order.setFinishedTime(LocalDateTime.now());
        int count = orderMapper.updateById(order);
        if(count<=0){
            return -1;
        }
        else
            return 1;
    }

    public int cancelOrder(int order_id){
        Order order = orderMapper.selectById(order_id);
        if (order == null){
            return -1;
        }
        else if(order.getStatus().equals("已支付")){
            return -2;
        }
        else {
            order.setStatus("已取消");
            int count = orderMapper.updateById(order);
            if(count<=0){
                return -3;
            }
            else {
                return 1;
            }
        }
    }

    public List<JSONObject> getOrderList(Integer user_id){

        return orderMapper.getOrderList(user_id);
    }

    public int pay(Integer order_id){
        Order order = orderMapper.selectById(order_id);
        if(order==null)
            return -1;
        else
        {
            order.setStatus("待评价");
            int count = orderMapper.updateById(order);
            if(count<=0)
                return -2;
            else return count;
        }
    }


}

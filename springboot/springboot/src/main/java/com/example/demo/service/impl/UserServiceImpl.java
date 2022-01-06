package com.example.demo.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.demo.common.Result;
import com.example.demo.entity.Object;
import com.example.demo.entity.User;
import com.example.demo.mapper.UserMapper;
import com.example.demo.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author cj
 * @since 2021-12-23
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Resource
    private UserMapper userMapper;

    public Page<User> getAll(IPage<User> iPage) {
        return userMapper.getAll(iPage);
    }

    public int modifyUserInfo(Integer user_id, String nick_name, String password, String avatar, String gender, Integer telephone, String email, String zone){
        User user=new User();
        user.setUserId(user_id);
        if(nick_name!=null)
            user.setNickName(nick_name);
        if (password!=null)
            user.setPassword(password);
        if (avatar!=null)
            user.setAvatar(avatar);
        if (gender!=null)
            user.setGender(gender);
        if (telephone!=null)
            user.setTelephone(telephone);
        if (email!=null)
            user.setEmail(email);
        if (zone!=null)
            user.setZone(zone);
        return userMapper.updateById(user);

    }


}

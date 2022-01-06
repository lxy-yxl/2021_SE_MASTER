package com.example.demo.mapper;

import cn.hutool.json.JSONObject;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.demo.entity.Object;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.entity.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author
 * @since 2021-12-17
 */
public interface ObjectMapper extends BaseMapper<Object> {
    @Select("select * from object where user_id=#{userId}")
    List<Object> selectByUserId(Integer userId);

    JSONObject getObjectDetail(int object_id);

    List<String> getPictureUrl(int object_id);

    Integer getRentCount(int object_id);

    Page<JSONObject> getObjectListByType(String type, Page<JSONObject> ipage);
    Page<JSONObject> viewPendingObject(Page<JSONObject> ipage);

    List<JSONObject> recommend();

    Page<JSONObject> searchObject(String name, Page<JSONObject> ipage);
}

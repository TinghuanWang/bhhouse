package com.wangzhixuan.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.wangzhixuan.model.Phone;

import java.util.List;
import java.util.Map;

/**
 *
 * House 表数据库控制层接口
 *
 */
public interface PhoneMapper extends BaseMapper<Phone> {


    List<Phone> selectPhonePage(Pagination page, Map<String, Object> params);


}
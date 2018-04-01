package com.wangzhixuan.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.wangzhixuan.model.House;
import com.wangzhixuan.model.HouseImgs;
import com.wangzhixuan.model.vo.HouseVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *
 * House 表数据库控制层接口
 *
 */
public interface HouseMapper extends BaseMapper<House> {

    HouseVo selectHouseVoById(@Param("id") Long id);

    List<HouseVo> selectHouseVoPage(Pagination page, Map<String, Object> params);

    List<HouseImgs> selectHotHouses();

}
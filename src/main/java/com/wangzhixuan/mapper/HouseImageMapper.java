package com.wangzhixuan.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.wangzhixuan.model.HouseImgs;
import com.wangzhixuan.model.vo.DictVo;
import com.wangzhixuan.model.vo.HouseImgsVo;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;


/**
 * Dict 表数据库控制层接口
 */
public interface HouseImageMapper extends BaseMapper<HouseImgs> {

    List<HouseImgsVo> getExistImags(@Param("lpId") Long lpId);

    List<HouseImgsVo> selectHotHouses();

    List<HouseImgsVo> selectIndexHotHouses();

    List<HouseImgsVo> selectTuijianHouses();

    List<HouseImgsVo> selectHotHousesByTypeOrArea(HashMap<String,Object> param);

    List<HouseImgsVo> selectHouseImg(HashMap<String,Object> param);

    List<HouseImgsVo> findHouseBySearch(HashMap<String,Object> param);
}
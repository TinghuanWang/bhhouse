package com.wangzhixuan.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.wangzhixuan.model.Dict;
import com.wangzhixuan.model.vo.DictVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 *
 * Dict 表数据库控制层接口
 *
 */
public interface DictMapper extends BaseMapper<Dict> {

    List<DictVo> getDictsByClassId(@Param("vcClass") String vcClass);

    List<DictVo> getHotLpAreas();
}
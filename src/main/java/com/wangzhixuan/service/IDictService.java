package com.wangzhixuan.service;

import com.baomidou.mybatisplus.service.IService;
import com.wangzhixuan.model.Dict;
import com.wangzhixuan.model.vo.DictVo;

import java.util.List;

/**
 *
 * Dict 表数据服务层接口
 *
 */
public interface IDictService extends IService<Dict> {
    List<DictVo> getDictsByClassId(String vcClass);

    List<DictVo> getHotLpAreas();
}
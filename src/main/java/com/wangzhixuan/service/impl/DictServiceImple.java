package com.wangzhixuan.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wangzhixuan.mapper.DictMapper;
import com.wangzhixuan.model.Dict;
import com.wangzhixuan.model.vo.DictVo;
import com.wangzhixuan.service.IDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DictServiceImple extends ServiceImpl<DictMapper, Dict> implements IDictService {


    @Autowired
    private DictMapper dictMapper;

    @Override
    public List<DictVo> getDictsByClassId(String vcClass) {
        return dictMapper.getDictsByClassId(vcClass);
    }

    @Override
    public List<DictVo> getHotLpAreas() {
        return dictMapper.getHotLpAreas();
    }
}

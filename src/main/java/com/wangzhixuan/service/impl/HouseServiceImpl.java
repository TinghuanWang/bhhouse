package com.wangzhixuan.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.mapper.HouseMapper;
import com.wangzhixuan.model.House;
import com.wangzhixuan.model.HouseImgs;
import com.wangzhixuan.model.vo.HouseVo;
import com.wangzhixuan.service.IHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HouseServiceImpl extends ServiceImpl<HouseMapper, House> implements IHouseService {

    @Autowired
    private HouseMapper houseMapper;

    @Override
    public List<House> selectTreeGrid() {
        EntityWrapper<House> wrapper = new EntityWrapper<House>();
        wrapper.orderBy("seq");
        return houseMapper.selectList(wrapper);
    }

    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        try {
            Page<HouseVo> page = new Page<HouseVo>(pageInfo.getNowpage(), pageInfo.getSize());
            String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
            page.setOrderByField(orderField);
            page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
            List<HouseVo> list = houseMapper.selectHouseVoPage(page, pageInfo.getCondition());
            pageInfo.setRows(list);
            pageInfo.setTotal(page.getTotal());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}

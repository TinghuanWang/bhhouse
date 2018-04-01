package com.wangzhixuan.service;

import com.baomidou.mybatisplus.service.IService;
import com.wangzhixuan.commons.result.Tree;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.model.House;
import com.wangzhixuan.model.HouseImgs;
import com.wangzhixuan.model.Organization;
import com.wangzhixuan.model.vo.HouseVo;

import java.util.List;

/**
 *
 * House 表数据服务层接口
 *
 */
public interface IHouseService extends IService<House> {

    List<House> selectTreeGrid();

    void selectDataGrid(PageInfo pageInfo);

}
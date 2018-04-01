package com.wangzhixuan.service;

import com.baomidou.mybatisplus.service.IService;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.model.Phone;


/**
 *
 * House 表数据服务层接口
 *
 */
public interface IPhoneService extends IService<Phone> {

    void selectDataGrid(PageInfo pageInfo);

}
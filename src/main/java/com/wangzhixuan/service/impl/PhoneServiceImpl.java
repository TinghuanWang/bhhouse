package com.wangzhixuan.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.mapper.PhoneMapper;
import com.wangzhixuan.model.Phone;
import com.wangzhixuan.service.IPhoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PhoneServiceImpl extends ServiceImpl<PhoneMapper, Phone> implements IPhoneService {

    @Autowired
    private PhoneMapper phoneMapper;

    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        try {
            Page<Phone> page = new Page<Phone>(pageInfo.getNowpage(), pageInfo.getSize());
            String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
            page.setOrderByField(orderField);
            page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
            List<Phone> list = phoneMapper.selectPhonePage(page, pageInfo.getCondition());
            pageInfo.setRows(list);
            pageInfo.setTotal(page.getTotal());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}

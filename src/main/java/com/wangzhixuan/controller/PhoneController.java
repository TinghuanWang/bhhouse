package com.wangzhixuan.controller;

import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.model.Phone;
import com.wangzhixuan.service.IPhoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;


@Controller
@RequestMapping(value = "phone")
public class PhoneController extends BaseController {

    @Autowired
    IPhoneService iPhoneService;

    /**
     * 管理主页
     *
     * @return
     */
    @GetMapping(value = "/manager")
    public String manager() {
        return "phone/page";
    }

    /**
     * 列表
     *
     * @return
     */
    @RequestMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(Phone phone, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        iPhoneService.selectDataGrid(pageInfo);
        return pageInfo;
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(Long id) {
        iPhoneService.deleteById(id);
        return renderSuccess("删除成功！");
    }

    @RequestMapping("/add")
    @ResponseBody
    public Object add(Phone phone) {
        phone.setSysTime(new Date());
        iPhoneService.insert(phone);
        return renderSuccess("添加成功！");
    }
}

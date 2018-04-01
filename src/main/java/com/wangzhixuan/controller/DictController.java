package com.wangzhixuan.controller;

import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.service.IDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "dict")
public class DictController extends BaseController {

    @Autowired
    IDictService iDictService;

    /**
     * 楼盘管理主页
     *
     * @return
     */
    @PostMapping(value = "/getDictsByClass")
    @ResponseBody
    public Object getDictsByClass(String vcClass) {
        return iDictService.getDictsByClassId(vcClass);
    }

}

package com.wangzhixuan.controller;

import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.utils.PageInfo;
import com.wangzhixuan.commons.utils.StringUtils;
import com.wangzhixuan.model.House;
import com.wangzhixuan.model.vo.HouseVo;
import com.wangzhixuan.service.IHouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "house")
public class HouseController extends BaseController {

    @Autowired
    IHouseService iHouseService;

    /**
     * 楼盘管理主页
     *
     * @return
     */
    @GetMapping(value = "/manager")
    public String manager() {
        return "house/page";
    }

    /**
     * 楼盘展示信息界面
     *
     * @return
     */
    @GetMapping(value = "/pageImages")
    public String infos() {
        return "house/pageImages";
    }

    /**
     * 楼盘列表
     *
     * @return
     */
    @RequestMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(HouseVo houseVo, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        Map<String, Object> condition = new HashMap<String, Object>();

        if (StringUtils.isNotBlank(houseVo.getLpName())) {
            condition.put("lpName", houseVo.getLpName());
        }
        if (StringUtils.isNotBlank(houseVo.getLpType())) {
            condition.put("lpType", houseVo.getLpType());
        }
        if (StringUtils.isNotBlank(houseVo.getLparea())) {
            condition.put("lparea", houseVo.getLparea());
        }
        if (houseVo.getSysTimeStart() != null) {
            condition.put("sysTimeStart", houseVo.getSysTimeStart());
        }
        if (houseVo.getSysTimeEnd() != null) {
            condition.put("sysTimeEnd", houseVo.getSysTimeEnd());
        }
        pageInfo.setCondition(condition);
        iHouseService.selectDataGrid(pageInfo);
        return pageInfo;
    }

    /**
     * 添加楼盘页
     *
     * @return
     */
    @RequestMapping("/addPage")
    public String addPage() {
        return "house/addPage";
    }

    /**
     * 添加楼盘
     *
     * @param house
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public Object add(House house) {
        house.setSysTime(new Date());
        house.setSysPerson(getStaffName());
        iHouseService.insert(house);
        return renderSuccess("添加成功！");
    }

    /**
     * 编辑楼盘页
     *
     * @param model
     * @param id
     * @return
     */
    @GetMapping("/editPage")
    public String editPage(Model model, Long id) {
        House house = iHouseService.selectById(id);
        model.addAttribute("house", house);
        return "house/houseEdit";
    }

    /**
     * 编辑楼盘
     *
     * @param house
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(House house) {
        iHouseService.updateById(house);
        return renderSuccess("编辑成功！");
    }

    /**
     * 删除楼盘
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(Long id) {
        iHouseService.deleteById(id);
        return renderSuccess("删除成功！");
    }
}

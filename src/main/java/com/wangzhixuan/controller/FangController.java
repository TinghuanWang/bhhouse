package com.wangzhixuan.controller;

import com.wangzhixuan.commons.utils.StringUtils;
import com.wangzhixuan.model.Dict;
import com.wangzhixuan.model.House;
import com.wangzhixuan.model.HouseImgs;
import com.wangzhixuan.model.vo.DictVo;
import com.wangzhixuan.model.vo.HouseImgsVo;
import com.wangzhixuan.service.IDictService;
import com.wangzhixuan.service.IHouseService;
import com.wangzhixuan.service.IImageService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class FangController {

    @Autowired
    IImageService iImageService;

    @Autowired
    IHouseService iHouseService;

    @Autowired
    IDictService iDictService;

    /**
     * 网站前端首页
     *
     * @return
     */
    @GetMapping("/fang")
    public String fang(Model model) {

        List<HouseImgsVo> houseImgs = iImageService.selectIndexHotHouses();
        List<HouseImgsVo> hothouse = iImageService.selectHotHouses();
        List<HouseImgsVo> newhothouse = new ArrayList<HouseImgsVo>();
        if(hothouse.size() >0){
            for(HouseImgsVo h:hothouse){
                String infos = h.getLpInfo().trim();
                if(infos.length() >100){
                    infos = infos.substring(0,100)+" ...";
                }
                h.setLpInfo(infos);
                newhothouse.add(h);
            }
        }
        List<HouseImgsVo> tuijianhouse = iImageService.selectTuijianHouses();
        List<HouseImgsVo> newtuijianhouse = new ArrayList<HouseImgsVo>();;
        if(tuijianhouse.size() >0){
            for(HouseImgsVo h:tuijianhouse){
                String infos = h.getLpInfo().trim();
                if(infos.length() >60){
                    infos = infos.substring(0,60)+" ...";
                }
                h.setLpInfo(infos);
                newtuijianhouse.add(h);
            }
        }
        List<DictVo> hotLpareas = iDictService.getHotLpAreas();
        List<DictVo> dictLparea = iDictService.getDictsByClassId("lp_area");
        List<DictVo> dictLptype = iDictService.getDictsByClassId("lp_type");
        model.addAttribute("houseImg", houseImgs);
        model.addAttribute("hothouse", newhothouse);
        model.addAttribute("tuijianhouse", newtuijianhouse);
        model.addAttribute("hotLpareas", hotLpareas);
        model.addAttribute("dictLparea", dictLparea);
        model.addAttribute("dictLptype", dictLptype);
        return "fang/index";
    }

    @GetMapping("/fang/list")
    public String list(Model model, String type,
                       @RequestParam(value = "vals", required = false) String vals,
                       @RequestParam(value = "id", required = false) Integer id) {
        /***
         * type:lparea;列出所有该区域的房源
         * type:lptype;列出所有该类型的房源
         * type:lpnew;列出所有的新房源（推荐）
         * type:lphot;列出所有的热门房源
         * type:search:搜索关键字列出所有房源
         */
        List<DictVo> dictLparea = iDictService.getDictsByClassId("lp_area");
        List<DictVo> dictLptype = iDictService.getDictsByClassId("lp_type");
        model.addAttribute("dictLparea", dictLparea);//所以楼盘区域
        model.addAttribute("dictLptype", dictLptype);//所有楼盘类型
        List<HouseImgsVo> typesHotHouse;
        List<HouseImgsVo> typesHouse;
        String dictName = "";
        if (type.equals("search")) {
            dictName = "搜索房源";
            typesHotHouse = iImageService.selectIndexHotHouses();
            typesHouse = iImageService.findHouseBySearch(vals);
        } else if (type.equals("lpnew")) {
            dictName = "最新房源";
            typesHotHouse = iImageService.selectIndexHotHouses();
            typesHouse = iImageService.selectTuijianHouses();
        } else if (type.equals("lphot")) {
            dictName = "热门房源";
            typesHotHouse = iImageService.selectIndexHotHouses();
            typesHouse = iImageService.selectHotHouses();
        } else {
            typesHotHouse = iImageService.selectIndexHotHouses();
            typesHouse = iImageService.selectHotHousesByTypeOrArea(type, id, null);//某类型或区域中所有的楼盘
            Dict dict = iDictService.selectById(id);
            dictName = dict.getDictName();
        }
        model.addAttribute("dictName", dictName);
        model.addAttribute("typesHotHouse", typesHotHouse);
        model.addAttribute("typesHouse", typesHouse);


        return "fang/list";
    }

    @GetMapping("/fang/detail")
    public String detail(Model model, Long id) {
        List<DictVo> dictLparea = iDictService.getDictsByClassId("lp_area");
        List<DictVo> dictLptype = iDictService.getDictsByClassId("lp_type");
        List<HouseImgsVo> indexImg = iImageService.selectIndexHotHouses();
        List<HouseImgsVo> detailImg = iImageService.selectHouseImg("detail", id);//获取楼盘的详情图片
        List<HouseImgsVo> tuijianhouse = iImageService.selectTuijianHouses();//推荐楼盘
        House house = iHouseService.selectById(id);
        if (house.getLpType() != null) {
            Dict dict = iDictService.selectById(house.getLpType());
            house.setLpType(dict.getDictName());
        }
        if (house.getLparea() != null) {
            Dict dict = iDictService.selectById(house.getLparea());
            house.setLparea(dict.getDictName());
        }
        if (house.getPayState() != null) {
            Dict dict = iDictService.selectById(house.getPayState());
            house.setPayState(dict.getDictName());
        }
        model.addAttribute("house", house);
        model.addAttribute("indexImg", indexImg);
        model.addAttribute("detailImg", detailImg);
        model.addAttribute("dictLparea", dictLparea);
        model.addAttribute("dictLptype", dictLptype);
        model.addAttribute("tuijianhouse", tuijianhouse);
        return "fang/detail";
    }
}

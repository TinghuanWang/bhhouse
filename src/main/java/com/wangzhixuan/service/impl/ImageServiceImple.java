package com.wangzhixuan.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.wangzhixuan.mapper.HouseImageMapper;
import com.wangzhixuan.model.HouseImgs;
import com.wangzhixuan.model.vo.HouseImgsVo;
import com.wangzhixuan.service.IImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;


@Service
public class ImageServiceImple extends ServiceImpl<HouseImageMapper, HouseImgs> implements IImageService {


    @Autowired
    private HouseImageMapper imgMapper;

    @Override
    public List<HouseImgsVo> getExistImags(Long lpId) {
        return  imgMapper.getExistImags(lpId);

    }

    @Override
    public List<HouseImgsVo> selectIndexHotHouses(){
        return imgMapper.selectIndexHotHouses();
    }

    @Override
    public List<HouseImgsVo> selectHotHouses(){
        return imgMapper.selectHotHouses();
    }

    @Override
    public List<HouseImgsVo> selectTuijianHouses(){
        return imgMapper.selectTuijianHouses();
    }

    @Override
    public List<HouseImgsVo> selectHotHousesByTypeOrArea(String typearea, Integer id,String ishot) {
        HashMap<String,Object> param = new HashMap<String,Object>();
        param.put("typearea",typearea);
        param.put("id",id);
        param.put("ishot",ishot);
        return imgMapper.selectHotHousesByTypeOrArea(param);
    }

    @Override
    public List<HouseImgsVo> selectHouseImg(String type, long id) {
        HashMap<String,Object> param = new HashMap<String,Object>();
        param.put("type",type);
        param.put("id",id);
        return imgMapper.selectHouseImg(param);
    }

    @Override
    public List<HouseImgsVo> findHouseBySearch(String vals) {
        HashMap<String,Object> param = new HashMap<String,Object>();
        param.put("vals",vals);
        return imgMapper.findHouseBySearch(param);
    }
}

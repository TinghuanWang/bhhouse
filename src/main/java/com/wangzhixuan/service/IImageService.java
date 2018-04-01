package com.wangzhixuan.service;

import com.baomidou.mybatisplus.service.IService;
import com.wangzhixuan.model.HouseImgs;
import com.wangzhixuan.model.vo.DictVo;
import com.wangzhixuan.model.vo.HouseImgsVo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 *
 * Dict 表数据服务层接口
 *
 */
public interface IImageService extends IService<HouseImgs> {
    List<HouseImgsVo> getExistImags(Long lpId);

    List<HouseImgsVo> selectIndexHotHouses();

    List<HouseImgsVo> selectHotHouses();

    List<HouseImgsVo> selectTuijianHouses();

    List<HouseImgsVo> selectHotHousesByTypeOrArea(String typearea,Integer id,String ishot);

    List<HouseImgsVo> selectHouseImg(String type,long id);

    List<HouseImgsVo> findHouseBySearch(String vals);
}
package com.wangzhixuan.controller;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.wangzhixuan.commons.base.BaseController;
import com.wangzhixuan.commons.utils.PathUtils;
import com.wangzhixuan.model.HouseImgs;
import com.wangzhixuan.model.vo.HouseImgsVo;
import com.wangzhixuan.service.IImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "image")
public class ImageController extends BaseController {

    @Autowired
    IImageService iImageService;

    /**
     * 楼盘图片录入界面
     *
     * @return
     */
    @GetMapping(value = "/getImage/{url}")
    public Object getDictsByClass(@PathVariable("url") String url, Model model, Long lpId) {
        List<HouseImgsVo> list = iImageService.getExistImags(lpId);
        model.addAttribute("img", list);
        model.addAttribute("lpId", lpId);
        if (url.equals("add")) {
            return "house/images";
        } else {
            return "house/lookimages";
        }
    }

    @RequestMapping("/save")
    @ResponseBody
    public Object save(HttpSession session, HttpServletRequest request, @RequestParam(value = "file", required = false) MultipartFile file,
                       HouseImgs houseImgs) {
        int width = 0;
        int height = 0;
        try {
            if (houseImgs.getImgType().equals("0")) {//首页轮转图片
                width = 940;
                height = 380;
            } else if (houseImgs.getImgType().equals("1")) {//热门推荐图片
                width = 290;
                height = 176;
            } else if (houseImgs.getImgType().equals("2")) {//列表图片
                width = 200;
                height = 200;
            } else if (houseImgs.getImgType().equals("3")) {//详情图片
                width = 920;
                height = 380;
            }
            //执行图片存储
            String uploadResult = UploadFile(file, width, height);
            if (uploadResult != null) {
                houseImgs.setImgUrl(uploadResult);
                iImageService.insert(houseImgs);
            }
            return renderSuccess("添加成功！");
        } catch (Exception ex) {
            ex.printStackTrace();
            return renderError("添加失败！");
        }
    }

    /**
     * 楼盘图片浏览界面
     *
     * @return
     */
    @RequestMapping("/getImgsByLpId")
    @ResponseBody
    public Object getImgsByLpId(Long lpId) {
        return  iImageService.getExistImags(lpId);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(String id) {
        iImageService.deleteById(id);
        return renderSuccess("删除成功！");
    }

    /***
     * 上传图片到服务器 并压缩
     *
     * @param myFile  文件
     * @return
     */
    private String UploadFile(MultipartFile myFile, int width, int height) {
        String newPath = null;
        InputStream is = null;
        FileOutputStream fs = null;
        String resultStr = "";
        try {
            /** 临时文件夹*/
            String imgPath = "static" + File.separator + "tempimages" + File.separator;
            String tempPath = PathUtils.getRootPath() + imgPath;
            System.out.println("old-path-" + tempPath);
            String name = myFile.getOriginalFilename();
            File oldFile = new File(tempPath);
            if (!oldFile.exists()) {
                oldFile.mkdirs();
            }
            /** 处理后文件夹*/
            String newImaPath = "static" + File.separator + "images" + File.separator;
            resultStr += "static/images/";
            newPath = PathUtils.getRootPath() + newImaPath;
            System.out.println("new-path-" + newPath);
            File newFile = new File(newPath);
            if (!newFile.exists()) {
                newFile.mkdirs();
            }
            String oldPath;
            String copyPath;

            String fileName = myFile.getOriginalFilename();
            String suffix = fileName.substring(fileName.lastIndexOf('.'));
            String newFileName = new Date().getTime() + suffix;
            resultStr += newFileName;
            /** 先存取源文件*/
            is = myFile.getInputStream();
            fs = new FileOutputStream(tempPath + newFileName);
            //...
            if (myFile.getSize() > 0) {
                byte[] buffer = new byte[1024 * 1024];
                int bytesum = 0;
                int byteread = 0;
                while ((byteread = is.read(buffer)) != -1) {
                    bytesum += byteread;
                    fs.write(buffer, 0, byteread);
                    fs.flush();
                }
                fs.close();
                is.close();
            }
            /** 处理源文件 ，进行压缩再放置到新的文件夹*/
            oldPath = tempPath + newFileName;
            copyPath = newPath + newFileName;
            Boolean ys = zipWidthHeightImageFile(oldPath, copyPath, width, height, 1f);
            if (!ys)
                return null;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
        return resultStr;
    }

    /***
     * 压缩制定大小图片
     *
     * @param oldPath  临时图片路径
     * @param copyPath 压缩图片保存路径
     * @param width    宽度
     * @param height   高度
     * @param quality  高清度
     * @return
     * @throws Exception
     */
    private Boolean zipWidthHeightImageFile(String oldPath, String copyPath, int width, int height,
                                            float quality) {
        Boolean sta = false;
        File oldFile = new File(oldPath);
        File newFile = new File(copyPath);
        if (oldFile == null) {
            return null;
        }
        String newImage = null;
        try {
            /** 对服务器上的临时文件进行处理 */
            Image srcFile = ImageIO.read(oldFile);
            int w = srcFile.getWidth(null);
            System.out.println(w);
            int h = srcFile.getHeight(null);
            System.out.println(h);

            /** 宽,高设定 */
            BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            tag.getGraphics().drawImage(srcFile, 0, 0, width, height, null);
            //String filePrex = oldFile.substring(0, oldFile.indexOf('.'));
            /** 压缩后的文件名 */
            //newImage = filePrex + smallIcon+ oldFile.substring(filePrex.length());

            /** 压缩之后临时存放位置 */
            FileOutputStream out = new FileOutputStream(newFile);

            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
            JPEGEncodeParam jep = JPEGCodec.getDefaultJPEGEncodeParam(tag);
            /** 压缩质量 */
            jep.setQuality(quality, true);
            encoder.encode(tag, jep);
            out.close();
            sta = true;
            /** 把源文件删除**/
            File file = new File(oldPath);
            if (file.exists()) {
                deleteFile(file);
            }
        } catch (Exception e) {
            e.printStackTrace();
            sta = false;
        }
        return sta;
    }

    private void deleteFile(File file) {
        if (file.isDirectory()) {
            File[] files = file.listFiles();
            for (int i = 0; i < files.length; i++) {
                deleteFile(files[i]);
            }
        }
        file.delete();
    }

}

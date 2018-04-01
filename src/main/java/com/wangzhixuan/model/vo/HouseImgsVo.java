package com.wangzhixuan.model.vo;


import java.io.Serializable;

public class HouseImgsVo implements Serializable {
    private String id;
    private String imgType;
    private String imgUrl;
    private String imgInfo;
    private Long lpId;

    private String lpName;
    private String lpPrice;
    private String lpInfo;
    private String lpDizhi;
    private String huxing;


    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImgType() {
        return this.imgType;
    }

    public void setImgType(String imgType) {
        this.imgType = imgType;
    }

    public String getImgUrl() {
        return this.imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getImgInfo() {
        return this.imgInfo;
    }

    public void setImgInfo(String imgInfo) {
        this.imgInfo = imgInfo;
    }

    public Long getLpId() {
        return this.lpId;
    }

    public void setLpId(Long lpId) {
        this.lpId = lpId;
    }

    public String getLpName() {
        return this.lpName;
    }

    public void setLpName(String lpName) {
        this.lpName = lpName;
    }

    public String getLpPrice() {
        return this.lpPrice;
    }

    public void setLpPrice(String lpPrice) {
        this.lpPrice = lpPrice;
    }

    public String getLpInfo() {
        return this.lpInfo;
    }

    public void setLpInfo(String lpInfo) {
        this.lpInfo = lpInfo;
    }

    public String getLpDizhi() {
        return this.lpDizhi;
    }

    public void setLpDizhi(String lpDizhi) {
        this.lpDizhi = lpDizhi;
    }

    public String getHuxing() {
        return this.huxing;
    }

    public void setHuxing(String huxing) {
        this.huxing = huxing;
    }
}

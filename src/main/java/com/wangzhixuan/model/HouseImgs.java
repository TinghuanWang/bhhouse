package com.wangzhixuan.model;


import java.io.Serializable;

public class HouseImgs implements Serializable {
    private Long id;
    private String imgType;
    private String imgUrl;
    private String imgInfo;
    private Long lpId;
    private String lpName;
    private Long lpPrice;
    private String lpInfo;

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
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

    public Long getLpPrice() {
        return this.lpPrice;
    }

    public void setLpPrice(Long lpPrice) {
        this.lpPrice = lpPrice;
    }

    public String getLpInfo() {
        return this.lpInfo;
    }

    public void setLpInfo(String lpInfo) {
        this.lpInfo = lpInfo;
    }
}

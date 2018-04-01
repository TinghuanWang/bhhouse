package com.wangzhixuan.model.vo;


import java.io.Serializable;
import java.util.Date;

public class HouseVo implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;

    /** 楼盘名称 */
    private String lpName;

    /** 楼盘类型 */
    private String lpType;

    /** 楼盘价格*/
    private Integer lpPrice;

    /** 销售状态 */
    private String payState;

    /** 楼盘区域 */
    private String lparea;

    /** 楼盘基础信息 */
    private String lpInfo;

    /** 浏览次数 */
    private Integer looktimes;

    /** 开盘日期 */
    private Date kptime;

    /** 楼盘地址 */
    private String lpDizhi;

    /** 交房日期 */
    private Date jftime;

    /**咨询人员*/
    private String zxUser;
    /**咨询人联系方式*/
    private String zxPhone;

    /**是否是热门*/
    private String isHot;

    /**是否推荐*/
    private String isTuijian;

    /**录入人员*/
    private String sysPerson;

    /***
     * 录入时间
     */
    private Date sysTime;

    private Date sysTimeStart;

    private Date sysTimeEnd;

    /***
     * 户型介绍
     */
    private String huxing;

    private String seq;

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLpName() {
        return this.lpName;
    }

    public void setLpName(String lpName) {
        this.lpName = lpName;
    }

    public String getLpType() {
        return this.lpType;
    }

    public void setLpType(String lpType) {
        this.lpType = lpType;
    }

    public Integer getLpPrice() {
        return this.lpPrice;
    }

    public void setLpPrice(Integer lpPrice) {
        this.lpPrice = lpPrice;
    }

    public String getPayState() {
        return this.payState;
    }

    public void setPayState(String payState) {
        this.payState = payState;
    }

    public String getLparea() {
        return this.lparea;
    }

    public void setLparea(String lparea) {
        this.lparea = lparea;
    }

    public String getLpInfo() {
        return this.lpInfo;
    }

    public void setLpInfo(String lpInfo) {
        this.lpInfo = lpInfo;
    }

    public Integer getLooktimes() {
        return this.looktimes;
    }

    public void setLooktimes(Integer looktimes) {
        this.looktimes = looktimes;
    }

    public Date getKptime() {
        return this.kptime;
    }

    public void setKptime(Date kptime) {
        this.kptime = kptime;
    }

    public String getLpDizhi() {
        return this.lpDizhi;
    }

    public void setLpDizhi(String lpDizhi) {
        this.lpDizhi = lpDizhi;
    }

    public Date getJftime() {
        return this.jftime;
    }

    public void setJftime(Date jftime) {
        this.jftime = jftime;
    }

    public String getZxUser() {
        return this.zxUser;
    }

    public void setZxUser(String zxUser) {
        this.zxUser = zxUser;
    }

    public String getZxPhone() {
        return this.zxPhone;
    }

    public void setZxPhone(String zxPhone) {
        this.zxPhone = zxPhone;
    }

    public String getIsHot() {
        return this.isHot;
    }

    public void setIsHot(String isHot) {
        this.isHot = isHot;
    }

    public String getIsTuijian() {
        return this.isTuijian;
    }

    public void setIsTuijian(String isTuijian) {
        this.isTuijian = isTuijian;
    }

    public String getSysPerson() {
        return this.sysPerson;
    }

    public void setSysPerson(String sysPerson) {
        this.sysPerson = sysPerson;
    }

    public Date getSysTime() {
        return this.sysTime;
    }

    public void setSysTime(Date sysTime) {
        this.sysTime = sysTime;
    }

    public String getHuxing() {
        return this.huxing;
    }

    public void setHuxing(String huxing) {
        this.huxing = huxing;
    }

    public String getSeq() {
        return this.seq;
    }

    public void setSeq(String seq) {
        this.seq = seq;
    }

    public Date getSysTimeStart() {
        return this.sysTimeStart;
    }

    public void setSysTimeStart(Date sysTimeStart) {
        this.sysTimeStart = sysTimeStart;
    }

    public Date getSysTimeEnd() {
        return this.sysTimeEnd;
    }

    public void setSysTimeEnd(Date sysTimeEnd) {
        this.sysTimeEnd = sysTimeEnd;
    }
}

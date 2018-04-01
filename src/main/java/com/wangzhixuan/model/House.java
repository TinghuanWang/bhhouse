package com.wangzhixuan.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.wangzhixuan.commons.utils.JsonUtils;

import java.io.Serializable;
import java.util.Date;

/***
 * 楼盘信息主表
 */
public class House implements Serializable {
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** 主键id */
    @TableId(type = IdType.AUTO)
    private Long id;

    /** 楼盘名称 */
    @TableField(value = "lpname")
    private String lpName;

    /** 楼盘类型 */
    @TableField(value = "lptype")
    private String lpType;

    /** 楼盘价格*/
    @TableField(value = "lpprice")
    private String lpPrice;

    /** 销售状态 */
    @TableField(value = "paystate")
    private String payState;

    /** 楼盘区域 */
    @TableField(value = "lparea")
    private String lparea;

    /** 楼盘基础信息 */
    @TableField(value = "lpinfo")
    private String lpInfo;

    /** 浏览次数 */
    @TableField(value = "looktimes")
    private Integer looktimes;

    /** 开盘日期 */
    @TableField(value = "kptime")
    private Date kptime;

    /** 楼盘地址 */
    @TableField(value = "lpdizhi")
    private String lpDizhi;

    /** 交房日期 */
    @TableField(value = "jftime")
    private Date jftime;

    /**咨询人员*/
    @TableField(value = "zxuser")
    private String zxUser;
    /**咨询人联系方式*/
    @TableField(value = "zxphone")
    private String zxPhone;

    /**是否是热门*/
    @TableField(value = "ishot")
    private String isHot;

    /**是否推荐*/
    @TableField(value = "istuijian")
    private String isTuijian;

    /**录入人员*/
    @TableField(value = "sysperson")
    private String sysPerson;

    /***
     * 录入时间
     */
    @TableField(value = "sys_time")
    private Date sysTime;

    /***
     * 户型介绍
     */
    @TableField(value = "huxing")
    private String huxing;

    private String seq;

    public static long getSerialVersionUID() {
        return House.serialVersionUID;
    }

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

    public String getLpPrice() {
        return this.lpPrice;
    }

    public void setLpPrice(String lpPrice) {
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

    @Override
    public String toString() {
        return JsonUtils.toJson(this);
    }
}

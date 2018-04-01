package com.wangzhixuan.model;


import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

public class Dict implements Serializable {
    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Long id;

    private String dictName;

    private Long classId;

    private String ishot;

    @TableField(value = "vc_class")
    private String vcClass;

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDictName() {
        return this.dictName;
    }

    public void setDictName(String dictName) {
        this.dictName = dictName;
    }

    public Long getClassId() {
        return this.classId;
    }

    public void setClassId(Long classId) {
        this.classId = classId;
    }

    public String getIshot() {
        return this.ishot;
    }

    public void setIshot(String ishot) {
        this.ishot = ishot;
    }

    public String getVcClass() {
        return this.vcClass;
    }

    public void setVcClass(String vcClass) {
        this.vcClass = vcClass;
    }
}

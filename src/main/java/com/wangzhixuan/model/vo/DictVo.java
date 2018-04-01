package com.wangzhixuan.model.vo;


import java.io.Serializable;

public class DictVo implements Serializable {
    private Long id;
    private String dictName;
    private Long classId;
    private String ishot;
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

package com.tyyy.bean;

import java.util.Date;

public class MemFamily {
    private Long id;

    private long memId;//会员号
    
    private String memName;//会员名称

    private String famName;//家属姓名

    private String famGender;//家属性别

    private Integer deleteFlag;
    
    private Date famBirth;
    
    private int memLevel;
    private int c;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public long getMemId() {
		return memId;
	}

	public void setMemId(long memId) {
		this.memId = memId;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getFamName() {
		return famName;
	}

	public void setFamName(String famName) {
		this.famName = famName;
	}

	public String getFamGender() {
		return famGender;
	}

	public void setFamGender(String famGender) {
		this.famGender = famGender;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public Date getFamBirth() {
		return famBirth;
	}

	public void setFamBirth(Date famBirth) {
		this.famBirth = famBirth;
	}

	
	public long getMemLevel() {
		return memLevel;
	}

	public void setMemLevel(int memLevel) {
		this.memLevel = memLevel;
	}

	
	public long getC() {
		return c;
	}

	public void setC(int c) {
		this.c = c;
	}

	@Override
	public String toString() {
		return "MemFamily [id=" + id + ", memId=" + memId + ", memName=" + memName + ", famName=" + famName
				+ ", famGender=" + famGender + ", deleteFlag=" + deleteFlag + ", famBirth=" + famBirth + ", memLevel="
				+ memLevel + ", c=" + c + "]";
	}




	

    
    
}
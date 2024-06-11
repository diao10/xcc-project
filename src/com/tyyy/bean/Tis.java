package com.tyyy.bean;

import java.util.Date;

public class Tis {
    private Long id;

    private String tisName;

    private String tisContent;

    private String createBy;

    private Date createTime;

    private Integer deleteFlag;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTisName() {
		return tisName;
	}

	public void setTisName(String tisName) {
		this.tisName = tisName;
	}

	public String getTisContent() {
		return tisContent;
	}

	public void setTisContent(String tisContent) {
		this.tisContent = tisContent;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	@Override
	public String toString() {
		return "Tis [id=" + id + ", tisName=" + tisName + ", tisContent=" + tisContent + ", createBy=" + createBy
				+ ", createTime=" + createTime + ", deleteFlag=" + deleteFlag + "]";
	}
    

}
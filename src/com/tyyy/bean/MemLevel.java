package com.tyyy.bean;

import java.util.Date;

public class MemLevel {
    private long id;

    private long levelMin;//最小值

    private long levelMax;//最大值

    private String levelName;//等级名称

    private Integer deleteFlag;

    private Date deleteDate;


	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getLevelMin() {
		return levelMin;
	}

	public void setLevelMin(long levelMin) {
		this.levelMin = levelMin;
	}

	public long getLevelMax() {
		return levelMax;
	}

	public void setLevelMax(long levelMax) {
		this.levelMax = levelMax;
	}

	public String getLevelName() {
		return levelName;
	}

	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public Date getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}

	@Override
	public String toString() {
		return "MemLevel [id=" + id + ", levelMin=" + levelMin + ", levelMax=" + levelMax + ", levelName=" + levelName
				+ ", deleteFlag=" + deleteFlag + ", deleteDate=" + deleteDate + "]";
	}

}
package com.tyyy.bean;

import java.util.Date;

public class Building {
    private Long id;

    private int buildingF;
    
    private String buildingV;
    private String theme;
    
   

	private Long themeId;

    private String sender;

    private Long senderId;

    private Integer senderType;

    private Date createDate;
    
   
    
    private int flag;
    
    private int deleteFlag;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getBuildingF() {
		return buildingF;
	}

	public void setBuildingF(int buildingF) {
		this.buildingF = buildingF;
	}

	public String getBuildingV() {
		return buildingV;
	}

	public void setBuildingV(String buildingV) {
		this.buildingV = buildingV;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public Long getThemeId() {
		return themeId;
	}

	public void setThemeId(Long themeId) {
		this.themeId = themeId;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public Long getSenderId() {
		return senderId;
	}

	public void setSenderId(Long senderId) {
		this.senderId = senderId;
	}

	public Integer getSenderType() {
		return senderType;
	}

	public void setSenderType(Integer senderType) {
		this.senderType = senderType;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public int getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(int deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	@Override
	public String toString() {
		return "Building [id=" + id + ", buildingF=" + buildingF + ", buildingV=" + buildingV + ", theme=" + theme
				+ ", themeId=" + themeId + ", sender=" + sender + ", senderId=" + senderId + ", senderType="
				+ senderType + ", createDate=" + createDate + ", flag=" + flag + ", deleteFlag=" + deleteFlag + "]";
	}



	

    
}
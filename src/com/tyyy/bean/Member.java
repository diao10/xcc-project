package com.tyyy.bean;

import java.util.Date;
import java.util.List;

public class Member {
    private Long id;

    private String memId;

    private String referrerId;

    private String memName;

    private String memPwd;

    private String memGender;

    private String memEmail;

    private String memTel;

    private Date memBirth;

    private String memAddress;

    private Date lastLoginTime;

    private Date theLoginTime;

    private Integer memIntegral;

    private Integer memClass;

    private String memClassName;

    private Integer memPoint;

    private Integer memLevel;

    private String memLevelName;

    private Integer signCount;

    private Integer deleteFlag;
    
    private String filed1;				//微信资料

    private String filed2;				//QQ信息

    private String filed3;

    private Date createDate;
    private int amtype;//积分操作类型
    private int integral;//积分变化数值
    private int desc_Type;		//姓名排序类型
	private int date_desc; 	//时间排序类型
	private List<MemClass> MemClassList;
	private List<MemLevel> LevelList;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getReferrerId() {
		return referrerId;
	}
	public void setReferrerId(String referrerId) {
		this.referrerId = referrerId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemTel() {
		return memTel;
	}
	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}
	public Date getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(Date memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemAddress() {
		return memAddress;
	}
	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public Date getTheLoginTime() {
		return theLoginTime;
	}
	public void setTheLoginTime(Date theLoginTime) {
		this.theLoginTime = theLoginTime;
	}
	public Integer getMemIntegral() {
		return memIntegral;
	}
	public void setMemIntegral(Integer memIntegral) {
		this.memIntegral = memIntegral;
	}
	public Integer getMemClass() {
		return memClass;
	}
	public void setMemClass(Integer memClass) {
		this.memClass = memClass;
	}
	public String getMemClassName() {
		return memClassName;
	}
	public void setMemClassName(String memClassName) {
		this.memClassName = memClassName;
	}
	public Integer getMemPoint() {
		return memPoint;
	}
	public void setMemPoint(Integer memPoint) {
		this.memPoint = memPoint;
	}
	public Integer getMemLevel() {
		return memLevel;
	}
	public void setMemLevel(Integer memLevel) {
		this.memLevel = memLevel;
	}
	public String getMemLevelName() {
		return memLevelName;
	}
	public void setMemLevelName(String memLevelName) {
		this.memLevelName = memLevelName;
	}
	public Integer getSignCount() {
		return signCount;
	}
	public void setSignCount(Integer signCount) {
		this.signCount = signCount;
	}
	public Integer getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public String getFiled1() {
		return filed1;
	}
	public void setFiled1(String filed1) {
		this.filed1 = filed1;
	}
	public String getFiled2() {
		return filed2;
	}
	public void setFiled2(String filed2) {
		this.filed2 = filed2;
	}
	public String getFiled3() {
		return filed3;
	}
	public void setFiled3(String filed3) {
		this.filed3 = filed3;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getAmtype() {
		return amtype;
	}
	public void setAmtype(int amtype) {
		this.amtype = amtype;
	}
	public int getIntegral() {
		return integral;
	}
	public void setIntegral(int integral) {
		this.integral = integral;
	}
	public int getDesc_Type() {
		return desc_Type;
	}
	public void setDesc_Type(int desc_Type) {
		this.desc_Type = desc_Type;
	}
	public int getDate_desc() {
		return date_desc;
	}
	public void setDate_desc(int date_desc) {
		this.date_desc = date_desc;
	}
	public List<MemClass> getMemClassList() {
		return MemClassList;
	}
	public void setMemClassList(List<MemClass> memClassList) {
		MemClassList = memClassList;
	}
	public List<MemLevel> getLevelList() {
		return LevelList;
	}
	public void setLevelList(List<MemLevel> levelList) {
		LevelList = levelList;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", memId=" + memId + ", referrerId=" + referrerId + ", memName=" + memName
				+ ", memPwd=" + memPwd + ", memGender=" + memGender + ", memEmail=" + memEmail + ", memTel=" + memTel
				+ ", memBirth=" + memBirth + ", memAddress=" + memAddress + ", lastLoginTime=" + lastLoginTime
				+ ", theLoginTime=" + theLoginTime + ", memIntegral=" + memIntegral + ", memClass=" + memClass
				+ ", memClassName=" + memClassName + ", memPoint=" + memPoint + ", memLevel=" + memLevel
				+ ", memLevelName=" + memLevelName + ", signCount=" + signCount + ", deleteFlag=" + deleteFlag
				+ ", filed1=" + filed1 + ", filed2=" + filed2 + ", filed3=" + filed3 + ", createDate=" + createDate
				+ ", amtype=" + amtype + ", integral=" + integral + ", desc_Type=" + desc_Type + ", date_desc="
				+ date_desc + ", MemClassList=" + MemClassList + ", LevelList=" + LevelList + "]";
	}
	
}
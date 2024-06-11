package com.tyyy.bean;

import java.util.Date;

public class Theme {
    private Long id;

    private String theme;

	@Override
	public String toString() {
		return "Theme [id=" + id + ", theme=" + theme + ", memberId=" + memberId + ", memberName=" + memberName
				+ ", createDate=" + createDate + ", rid=" + rid + ", rname=" + rname + ", flag=" + flag
				+ ", deleteFlag=" + deleteFlag + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public int getEmpFlag() {
		return empFlag;
	}

	public void setEmpFlag(int empFlag) {
		this.empFlag = empFlag;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	private Long memberId;

    private String memberName;

    private Date createDate;
    private int rid;
    private String rname;
    private int flag;
    private int empFlag;
    
    private Integer deleteFlag;


    
}
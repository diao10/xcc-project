package com.tyyy.bean;

import java.util.Date;

/** 
 * @author  wangxingye E-mail: 1910004629@qq.com
 * @date 创建时间：2017年1月17日 下午5:03:49 
 * @version 1.0 
*/
public class TyTheme {
	private Long id;

    private String theme;

	private Long memberId;

    private String memberName;

    private Date createDate;
    
    private int flag;
    
    private int deleteFlag;

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
		return "TyTheme [id=" + id + ", theme=" + theme + ", memberId=" + memberId + ", memberName=" + memberName
				+ ", createDate=" + createDate + ", flag=" + flag + ", deleteFlag=" + deleteFlag + "]";
	}

    
    
}

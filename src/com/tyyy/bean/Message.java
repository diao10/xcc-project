package com.tyyy.bean;

import java.util.Date;

import org.omg.CORBA.portable.Delegate;

public class Message {
    private Long id;//站内信 id

    private String theme;//站内信的内容 

    private Long messMemId;//发信人 的ID

    private String messMemName;//发信人 的姓名

    private Date createDate;//发信时间

    private Long flag;//是否读（ 0.未读，1.已读）
    
    private int deleteFlag;//删除标记(0.未删除1.删除)
    
    private Long accpId;//收信人id
    
    private String accpName;//收信人姓名
    
    private String mess_theme;//站内信主题

  
	public String getMess_theme() {
		return mess_theme;
	}

	public void setMess_theme(String mess_theme) {
		this.mess_theme = mess_theme;
	}

	public int getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(int deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public Long getAccpId() {
		return accpId;
	}

	public void setAccpId(Long accpId) {
		this.accpId = accpId;
	}

	public String getAccpName() {
		return accpName;
	}

	public void setAccpName(String accpName) {
		this.accpName = accpName;
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
        this.theme = theme == null ? null : theme.trim();
    }

    public Long getMessMemId() {
        return messMemId;
    }

    public void setMessMemId(Long messMemId) {
        this.messMemId = messMemId;
    }

    public String getMessMemName() {
        return messMemName;
    }

    public void setMessMemName(String messMemName) {
        this.messMemName = messMemName == null ? null : messMemName.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Long getFlag() {
        return flag;
    }

    public void setFlag(Long flag) {
        this.flag = flag;
    }

	@Override
	public String toString() {
		return "Message [id=" + id + ", theme=" + theme + ", messMemId=" + messMemId + ", messMemName=" + messMemName
				+ ", createDate=" + createDate + ", flag=" + flag + ", deleteFlag=" + deleteFlag + ", accpId=" + accpId
				+ ", accpName=" + accpName + ", mess_theme=" + mess_theme + "]";
	}
    
    
}
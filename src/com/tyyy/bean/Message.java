package com.tyyy.bean;

import java.util.Date;

import org.omg.CORBA.portable.Delegate;

public class Message {
    private Long id;//վ���� id

    private String theme;//վ���ŵ����� 

    private Long messMemId;//������ ��ID

    private String messMemName;//������ ������

    private Date createDate;//����ʱ��

    private Long flag;//�Ƿ���� 0.δ����1.�Ѷ���
    
    private int deleteFlag;//ɾ�����(0.δɾ��1.ɾ��)
    
    private Long accpId;//������id
    
    private String accpName;//����������
    
    private String mess_theme;//վ��������

  
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
package com.tyyy.bean;

import java.util.List;

public class EmpChar {
    private Long cid;
    private String charName;
    private List<Power> powerList;	//角色具有的权限
	public Long getCid() {
		return cid;
	}
	public void setCid(Long cid) {
		this.cid = cid;
	}
	public String getCharName() {
		return charName;
	}
	public void setCharName(String charName) {
		this.charName = charName;
	}
	public List<Power> getPowerList() {
		return powerList;
	}
	public void setPowerList(List<Power> powerList) {
		this.powerList = powerList;
	}
	@Override
	public String toString() {
		return "EmpChar [cid=" + cid + ", charName=" + charName + ", powerList=" + powerList + "]";
	}
    
}
package com.tyyy.bean;
/** 
 * @author  gycx E-mail: gycxmilkyway@163.com
 * @date 创建时间：2017年2月20日 下午1:14:35 
 * @version 1.0 
*/
public class CharToPower {
	private Long id ;
	private Long cid;
	private String charName;
	private Long pid;
	private String powerName;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
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
	public Long getPid() {
		return pid;
	}
	public void setPid(Long pid) {
		this.pid = pid;
	}
	public String getPowerName() {
		return powerName;
	}
	public void setPowerName(String powerName) {
		this.powerName = powerName;
	}
	@Override
	public String toString() {
		return "CharToPower [id=" + id + ", cid=" + cid + ", charName=" + charName + ", pid=" + pid + ", powerName="
				+ powerName + "]";
	}
	
	
	
	
}



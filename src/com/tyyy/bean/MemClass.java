package com.tyyy.bean;
/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date 创建时间：2016年12月29日 上午9:55:07 
 * @version 1.0 
*/

public class MemClass {
    private long id;
    
    private long classMax;

    private long  classMin;

    private String className;
    private int deleteFlag;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getClassMax() {
		return classMax;
	}
	public void setClassMax(long classMax) {
		this.classMax = classMax;
	}
	public long getClassMin() {
		return classMin;
	}
	public void setClassMin(long classMin) {
		this.classMin = classMin;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(int deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	@Override
	public String toString() {
		return "MemClass [id=" + id + ", classMax=" + classMax + ", classMin=" + classMin + ", className=" + className
				+ ", deleteFlag=" + deleteFlag + "]";
	}
    
}
	



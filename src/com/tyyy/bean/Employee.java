package com.tyyy.bean;

import java.util.Date;
import java.util.List;

public class Employee {
	
	private long id;			//主键
	private String emp_Id;		//员工编号
	private String emp_Name;	//员工姓名		
	private long emp_Char;		//角色主键
	private String emp_Gender;	//员工性别
	private String emp_Tel;		//员工电话
	private String emp_Email;	//员工邮箱
	private String emp_Address;	//员工地址
	private String filed1;
	private String filed2;
	private String filed3;
	private int delete_Flag;	//删除标记
	private Date create_Date;	//创建时间
	private String remember;	//记住密码
	private String emp_Password;// 密码
	private int desc_Type;		//姓名排序类型
	private int date_desc; 	//时间排序类型
	private String emp_Admin; //用户名
	private List<EmpChar> charList;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getEmp_Id() {
		return emp_Id;
	}
	public void setEmp_Id(String emp_Id) {
		this.emp_Id = emp_Id;
	}
	public String getEmp_Name() {
		return emp_Name;
	}
	public void setEmp_Name(String emp_Name) {
		this.emp_Name = emp_Name;
	}
	public long getEmp_Char() {
		return emp_Char;
	}
	public void setEmp_Char(long emp_Char) {
		this.emp_Char = emp_Char;
	}
	public String getEmp_Gender() {
		return emp_Gender;
	}
	public void setEmp_Gender(String emp_Gender) {
		this.emp_Gender = emp_Gender;
	}
	public String getEmp_Tel() {
		return emp_Tel;
	}
	public void setEmp_Tel(String emp_Tel) {
		this.emp_Tel = emp_Tel;
	}
	public String getEmp_Email() {
		return emp_Email;
	}
	public void setEmp_Email(String emp_Email) {
		this.emp_Email = emp_Email;
	}
	public String getEmp_Address() {
		return emp_Address;
	}
	public void setEmp_Address(String emp_Address) {
		this.emp_Address = emp_Address;
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
	public int getDelete_Flag() {
		return delete_Flag;
	}
	public void setDelete_Flag(int delete_Flag) {
		this.delete_Flag = delete_Flag;
	}
	public Date getCreate_Date() {
		return create_Date;
	}
	public void setCreate_Date(Date create_Date) {
		this.create_Date = create_Date;
	}
	public String getRemember() {
		return remember;
	}
	public void setRemember(String remember) {
		this.remember = remember;
	}
	public String getEmp_Password() {
		return emp_Password;
	}
	public void setEmp_Password(String emp_Password) {
		this.emp_Password = emp_Password;
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
	public String getEmp_Admin() {
		return emp_Admin;
	}
	public void setEmp_Admin(String emp_Admin) {
		this.emp_Admin = emp_Admin;
	}
	public List<EmpChar> getCharList() {
		return charList;
	}
	public void setCharList(List<EmpChar> charList) {
		this.charList = charList;
	}
	@Override
	public String toString() {
		return "Employee [id=" + id + ", emp_Id=" + emp_Id + ", emp_Name=" + emp_Name + ", emp_Char=" + emp_Char
				+ ", emp_Gender=" + emp_Gender + ", emp_Tel=" + emp_Tel + ", emp_Email=" + emp_Email + ", emp_Address="
				+ emp_Address + ", filed1=" + filed1 + ", filed2=" + filed2 + ", filed3=" + filed3 + ", delete_Flag="
				+ delete_Flag + ", create_Date=" + create_Date + ", remember=" + remember + ", emp_Password="
				+ emp_Password + ", desc_Type=" + desc_Type + ", date_desc=" + date_desc + ", emp_Admin=" + emp_Admin
				+ ", charList=" + charList + "]";
	}
	
}
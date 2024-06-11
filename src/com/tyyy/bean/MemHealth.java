package com.tyyy.bean;

import java.util.Date;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date 创建时间：2016年12月29日 上午9:27:23 
 * @version 1.0 
*/
public class MemHealth {
	private long id;				//主键
	private long memId;		//会员编号
	private String memName;	//会员姓名
	private long fam_Id;
	private String fam_Name;
	private String mem_Type;		//会员类型
	private Date diag_Date;		//诊断时间
	private String diag_Ill;	//诊断疾病
	private String diag_Hos;	//诊断医院
	private String medication;	//用药情况
	private String diag_opinion;//诊断意见
	private String aegrotat_url;	//诊断书地址
	private Date upload_Date;		//上传时间
	private String filed1;
	private String filed2;
	private String filed3;
	private String delete_Flag;	//删除标记
	private int desc_Type;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public long getMemId() {
		return memId;
	}
	public void setMemId(long memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public long getFam_Id() {
		return fam_Id;
	}
	public void setFam_Id(long fam_Id) {
		this.fam_Id = fam_Id;
	}
	public String getFam_Name() {
		return fam_Name;
	}
	public void setFam_Name(String fam_Name) {
		this.fam_Name = fam_Name;
	}
	public String getMem_Type() {
		return mem_Type;
	}
	public void setMem_Type(String mem_Type) {
		this.mem_Type = mem_Type;
	}
	public Date getDiag_Date() {
		return diag_Date;
	}
	public void setDiag_Date(Date diag_Date) {
		this.diag_Date = diag_Date;
	}
	public String getDiag_Ill() {
		return diag_Ill;
	}
	public void setDiag_Ill(String diag_Ill) {
		this.diag_Ill = diag_Ill;
	}
	public String getDiag_Hos() {
		return diag_Hos;
	}
	public void setDiag_Hos(String diag_Hos) {
		this.diag_Hos = diag_Hos;
	}
	public String getMedication() {
		return medication;
	}
	public void setMedication(String medication) {
		this.medication = medication;
	}
	public String getDiag_opinion() {
		return diag_opinion;
	}
	public void setDiag_opinion(String diag_opinion) {
		this.diag_opinion = diag_opinion;
	}
	public String getAegrotat_url() {
		return aegrotat_url;
	}
	public void setAegrotat_url(String aegrotat_url) {
		this.aegrotat_url = aegrotat_url;
	}
	public Date getUpload_Date() {
		return upload_Date;
	}
	public void setUpload_Date(Date upload_Date) {
		this.upload_Date = upload_Date;
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
	public String getDelete_Flag() {
		return delete_Flag;
	}
	public void setDelete_Flag(String delete_Flag) {
		this.delete_Flag = delete_Flag;
	}
	public int getDesc_Type() {
		return desc_Type;
	}
	public void setDesc_Type(int desc_Type) {
		this.desc_Type = desc_Type;
	}
	@Override
	public String toString() {
		return "MemHealth [id=" + id + ", memId=" + memId + ", memName=" + memName + ", fam_Id=" + fam_Id
				+ ", fam_Name=" + fam_Name + ", mem_Type=" + mem_Type + ", diag_Date=" + diag_Date + ", diag_Ill="
				+ diag_Ill + ", diag_Hos=" + diag_Hos + ", medication=" + medication + ", diag_opinion=" + diag_opinion
				+ ", aegrotat_url=" + aegrotat_url + ", upload_Date=" + upload_Date + ", filed1=" + filed1 + ", filed2="
				+ filed2 + ", filed3=" + filed3 + ", delete_Flag=" + delete_Flag + ", desc_Type=" + desc_Type + "]";
	}
	
	
}

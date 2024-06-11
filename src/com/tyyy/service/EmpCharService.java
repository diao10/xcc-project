package com.tyyy.service;

import java.util.List;

import com.tyyy.bean.EmpChar;
import com.tyyy.bean.Power;

/** 
 * @author  gycx E-mail: gycxmilkyway@163.com
 * @date 创建时间：2017年1月11日 下午4:23:40 
 * @version 1.0 
*/
public interface EmpCharService {
	public List<EmpChar> selEmpCharAll();		//查询全部员工角色
	public EmpChar selEmpCharById(long id);		//通过ID查询角色
	public void addEmpChar(EmpChar empChar);	//添加角色
	public void deleteByPrimaryKey(long id);			//删除角色
	public void updateByPrimaryKeySelective(EmpChar empChar);
	public List<EmpChar> selCharToPower();			//查询角色对权限
	
	public void addPowerToChar(String v);			//编辑角色对权限表id为power id
	public List<EmpChar> selEmpChar();
}



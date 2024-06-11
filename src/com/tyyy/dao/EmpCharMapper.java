package com.tyyy.dao;

import java.util.List;

import com.tyyy.bean.EmpChar;
import com.tyyy.bean.Power;

public interface EmpCharMapper {
    int deleteByPrimaryKey(Long id);					//删除
    int insert(EmpChar record);							//添加
    int insertSelective(EmpChar record);				//
    EmpChar selectByPrimaryKey(Long id);				//查询一个
    int updateByPrimaryKeySelective(EmpChar record);	//
    int updateByPrimaryKey(EmpChar record);				//
    public List<EmpChar> selEmpCharAll();				//全部查询
    
    public List selCharToPower();						//查询角色对权限
    
    public void cleanCharToPower(Long id);				//清空角色对权限
    public void addPowerToChar(Long id);				//编辑角色对权限,id为Power id
    public List<EmpChar> selEmpChar();					//不查超级管理员
}
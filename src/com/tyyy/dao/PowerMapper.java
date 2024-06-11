package com.tyyy.dao;

import java.util.List;

import com.tyyy.bean.Power;

public interface PowerMapper {
    int deleteByPrimaryKey(Long id);				//删除权限
    int insert(Power record);						//添加
    int insertSelective(Power record);				//
    Power selectByPrimaryKey(Long id);				//通过ID查找
    public void updatePower(Power power);			//修改
    public List<Power> selPowerAll();				//全查
    public List<Power> selSonPower(Long id);		//查询下级权限
    public void delSonPower(Long id);				//删除下级权限
    public List<Power> selPowerByCharId(Long id);   //通过角色ID查权限		
}
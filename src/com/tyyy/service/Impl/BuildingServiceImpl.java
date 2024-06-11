package com.tyyy.service.Impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.tyyy.bean.Building;
import com.tyyy.bean.Theme;
import com.tyyy.dao.BuildingMapper;
import com.tyyy.service.BuildingService;
import com.tyyy.util.PageBean;

/** 
 * @author  wangxingye E-mail: 1910004629@qq.com
 * @date 创建时间：2017年1月6日 下午4:40:44 
 * @version 1.0 
*/
@Service("buildingService")
@Transactional
public class BuildingServiceImpl implements BuildingService{
	@Autowired
	private BuildingMapper buildingMapper;
	@Override
	public void addBuilding(Building building) {
		buildingMapper.insert(building);
		
	}

	@Override
	public void delBuilding(long id) {
		buildingMapper.deleteByPrimaryKey(id);
		
	}

	public void delTheme(long id) {
		buildingMapper.delThem(id);
		
	}
	@Override
	public PageBean<Building> selBuliding(int page, int row, long id) {
		PageHelper.startPage(page,row);
		List<Building> buildingList = buildingMapper.selBuildingAll(id);
		
		return new PageBean<>(buildingList);
	}

	@Override
	public Building selBuildingById(long id) {
		Building buliding = buildingMapper.selectByPrimaryKey(id);

		return buliding;
	}

	@Override
	public int selCount(Theme t) {
		// TODO Auto-generated method stub
		return buildingMapper.selCount(t);
	}

	@Override
	public int selCountA(long t) {
		// TODO Auto-generated method stub
		return buildingMapper.selCountA(t);
	}

	@Override
	public PageBean<Building> selBulidingA(int page, int rows, Building building) {
		PageHelper.startPage(page,rows);
		List<Building> buildingList = buildingMapper.selBuildingAllA(building);
		
		return new PageBean<>(buildingList);
	}

	@Override
	public void update(Building building) {
		buildingMapper.updateByPrimaryKeySelective(building);
		
	}

	@Override
	public void del(long id) {
		Building b = buildingMapper.selectByPrimaryKey(id);

	

		buildingMapper.delete(id);
		
	}

}

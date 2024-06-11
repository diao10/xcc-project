package com.tyyy.service;

import com.tyyy.bean.Building;
import com.tyyy.bean.Theme;
import com.tyyy.util.PageBean;

/** 
 * @author  wangxingye E-mail: 1910004629@qq.com
 * @date 创建时间：2017年1月6日 下午4:37:36 
 * @version 1.0 
*/
public interface BuildingService {
	public void addBuilding(Building building);
	public void delBuilding(long id);
	public PageBean<Building> selBuliding(int page,int rows,long id);
	public Building selBuildingById(long id);
	public int selCount(Theme t);
	public int selCountA(long t);
	public void update(Building building);
	public void del(long id);
	public PageBean<Building> selBulidingA(int page,int rows,Building building);
	public void delTheme(long id);
}

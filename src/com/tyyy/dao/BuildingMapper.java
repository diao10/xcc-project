package com.tyyy.dao;

import java.util.List;

import com.tyyy.bean.Building;
import com.tyyy.bean.Theme;

public interface BuildingMapper {
    int deleteByPrimaryKey(Long id);
    public void delete(Long id);
    int insert(Building record);
    public int selCount(Theme t);
    public int selCountA(Long themeId);
    int insertSelective(Building record);
    public void delThem(Long id);
    Building selectByPrimaryKey(Long id);
    public List<Building> selBuildingAllA(Building building);
    int updateByPrimaryKeySelective(Building record);
    public List<Building> selBuildingAll(Long id);
    int updateByPrimaryKey(Building record);
}
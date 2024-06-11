package com.tyyy.dao;

import java.util.List;

import com.tyyy.bean.Tis;

public interface TisMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Tis record);

    int insertSelective(Tis record);

    Tis selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Tis record);

    int updateByPrimaryKey(Tis record);
    
    public List<Tis> selTisAll(Tis tis);
    
    public List<Tis> selTisAlld();
}
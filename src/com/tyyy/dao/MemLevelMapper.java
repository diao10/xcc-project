package com.tyyy.dao;

import java.util.List;

import com.tyyy.bean.MemLevel;

public interface MemLevelMapper {
	List<MemLevel> selectAll();
	
	int deleteByPrimaryKey(Integer id);

    public void insert(MemLevel record);

    int insertSelective(MemLevel record);

    MemLevel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MemLevel record);

    int updateByPrimaryKey(MemLevel record);
    public List<MemLevel> selLevel();

    
}
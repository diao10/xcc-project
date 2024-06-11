package com.tyyy.dao;

import java.util.List;

import com.tyyy.bean.Fz;

public interface FzMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Fz record);

    int insertSelective(Fz record);

    Fz selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Fz record);

    int updateByPrimaryKey(Fz record);
    
    public List<Fz> selFzAll();
}
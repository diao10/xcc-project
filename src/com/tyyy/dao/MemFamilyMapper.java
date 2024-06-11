package com.tyyy.dao;

import java.util.List;

import com.tyyy.bean.MemFamily;

public interface MemFamilyMapper {
	List<MemFamily> selMemFamilyAll(long memId);
	
    int deleteByPrimaryKey(Long id);

    public void insert(MemFamily record);

    int insertSelective(MemFamily record);

    MemFamily selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(MemFamily record);

    int updateByPrimaryKey(MemFamily record);
    public List<MemFamily> selFamily(MemFamily memFamily);
    public MemFamily selFamById(long id);
}
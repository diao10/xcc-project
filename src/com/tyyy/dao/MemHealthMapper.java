package com.tyyy.dao;

import java.util.List;

import com.tyyy.bean.MemHealth;

public interface MemHealthMapper {
	public List<MemHealth> selectMemHealthAll(MemHealth memHealth);
	public List<MemHealth> selectMemHealthA(MemHealth memHealth);
	int deleteByPrimaryKey(Long id);
	int deleteHealth(Long fam_Id);
    public void addMemHealth(MemHealth memHealth);
    public void addMemhealth(MemHealth memHealth);

    int insertSelective(MemHealth memHealth);

    MemHealth selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(MemHealth memHealth);

    int updateByPrimaryKey(MemHealth memHealth);
    int updateByPrimarykey(MemHealth memHealth);
    int updateByPrimaryKeyL(MemHealth memHealth);
    List<MemHealth> selByFamId(Long fam_Id);
    public List<MemHealth> selectMemHealth(long memId);
    public List<MemHealth> selectFamHealth(long memId);
    
    //Ìõ¼þ²éÑ¯
    public List<MemHealth> selMemHealthByT();
    public String selFamById(MemHealth memHealth);
    public List<MemHealth> selMemName(String memName);
}
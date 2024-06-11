package com.tyyy.service;

import java.util.List;

import com.tyyy.bean.MemHealth;
import com.tyyy.util.PageBean;

/** 
 * @author  shanlishu E-mail: 584460858@qq.com
 * @date 创建时间：2016年12月28日 上午10:02:08 
 * @version 1.0 
*/
public interface MemHealthService {
	public void delMemHealth(long id);

    public void addMemHealth(MemHealth memHealth);
    public void addMemhealth(MemHealth memHealth);

    public void updateMemHealth(MemHealth memHealth);
    public void updateMemhealth(MemHealth memHealth);

    public MemHealth selMemHealthById(long id);
    
    public PageBean<MemHealth> selMemHealthAll(int page,int rows,MemHealth memHealth);
    public PageBean<MemHealth> selMemHealthA(int page,int rows,MemHealth memHealth);
    public List<MemHealth> selByFamId(long fam_Id);
    public PageBean<MemHealth> selectMemHealth(int page,int rows,long memId);
    public PageBean<MemHealth> selectFamHealth(int page,int rows,long memId);
    //条件查询
    public PageBean<MemHealth> selMemHealthByT(int page,int row,MemHealth memHealth);

    public String selFamById(MemHealth memHealth);
    public List<MemHealth> selMemName(String mem_Name);
}


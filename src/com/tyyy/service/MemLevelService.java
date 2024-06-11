package com.tyyy.service;

import java.util.List;

import com.tyyy.bean.MemLevel;
import com.tyyy.util.PageBean;

/** 
 * @author  zxl E-mail: 1007334373@qq.com
 * @date ����ʱ�䣺2016��12��28�� ����10:02:08 
 * @version 1.0 
*/
public interface MemLevelService {
	public void deleteByPrimaryKey(Integer id) ;
	public void insert(MemLevel memLevel) ;
	public void insertSelective(MemLevel memLevel);
	public MemLevel selectByPrimaryKey(Integer id) ;
	public List<MemLevel> selectMemLevelList();
	public void updateByPrimaryKeySelective(MemLevel memLevel) ;
	public void updateByPrimaryKey(MemLevel memLevel) ;
	public PageBean<MemLevel> selectAll(int page,int row,MemLevel memLevel) ;
}



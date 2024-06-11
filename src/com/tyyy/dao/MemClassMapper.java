package com.tyyy.dao;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.tyyy.bean.MemClass;
import com.tyyy.util.PageBean;

/** 
 * @author  zxl E-mail: 1007334373@qq.com
 * @date 创建时间：2016年12月28日 上午10:02:08 
 * @version 1.0 
*/

import com.tyyy.bean.MemClass;

public interface MemClassMapper {
	  int deleteByPrimaryKey(Integer id);

	    public void insert(MemClass memclass);

	    int insertSelective(MemClass memclass);

	    MemClass selectByPrimaryKey(Integer id);

	   public void updateByPrimaryKeySelective(MemClass memclass);
	   
	    int updateByPrimaryKey(MemClass memclass);
	    public List<MemClass> selMemClassAll();
}



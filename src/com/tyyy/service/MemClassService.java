package com.tyyy.service;

import com.tyyy.bean.MemClass;
import com.tyyy.util.PageBean;

/** 
 * @author  zxl E-mail: 1007334373@qq.com
 * @date 创建时间：2016年12月28日 上午10:02:08 
 * @version 1.0 
*/
public interface MemClassService {
	public PageBean<MemClass> selMemClassAll(int page,int row);
	public void addMemClass(MemClass memclass);
	public void updateMemClass(MemClass memclass);
	public void delMemClass(int id);
	public MemClass selMemClassById(int id);
	
}



package com.tyyy.service;

import com.tyyy.bean.Tis;
import com.tyyy.util.PageBean;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date ����ʱ�䣺2017��2��7�� ����10:06:07 
 * @version 1.0 
*/
public interface TisService {
	public void insert(Tis tis);
	public void deleteByPrimaryKey(long id);
	public void updateByPrimaryKey(Tis tis);
	public PageBean<Tis> selTisAll(int page,int row,Tis tis);
	public Tis selectByPrimaryKey(long id);
	public PageBean<Tis> selTisAlld(int page,int row);
}

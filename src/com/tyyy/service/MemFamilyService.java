package com.tyyy.service;

import java.util.List;

import com.tyyy.bean.MemFamily;
import com.tyyy.util.PageBean;

/** 
 * @author  shanlishu E-mail: 584460858@qq.com
 * @date 创建时间：2016年12月28日 上午10:02:08 
 * @version 1.0 
*/
public interface MemFamilyService {
	public void delMemFamily(long id);

    public void addMemFamily(MemFamily memFamily);

    public void updateMemFamily(MemFamily memFamily);

    public MemFamily selMemFamilyById(long id);
    
    public List<MemFamily> selMemFamilyAll(long memId);
    public PageBean<MemFamily> selFamAll(int page ,int row,MemFamily memFamily);
    public MemFamily selFamById(long id);
}


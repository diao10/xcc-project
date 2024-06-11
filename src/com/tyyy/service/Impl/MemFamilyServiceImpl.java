
package com.tyyy.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.tyyy.bean.MemFamily;
import com.tyyy.dao.MemFamilyMapper;
import com.tyyy.dao.MemHealthMapper;
import com.tyyy.service.MemFamilyService;
import com.tyyy.util.PageBean;

/** 
 * @author  shanlishu E-mail: 584460858@qq.com
 * @date 创建时间：2016年12月28日 上午10:02:08 
 * @version 1.0 
*/
@Service("memFamliy")
@Transactional
public class MemFamilyServiceImpl implements MemFamilyService{
	@Autowired
	private MemFamilyMapper memFamilyMapper;
	@Autowired
	private MemHealthMapper memHealthMapper;
	@Override
	public void delMemFamily(long id) {
		memFamilyMapper.deleteByPrimaryKey(id);
		System.out.println("删除id"+id);
		memHealthMapper.deleteHealth(id);
	}

	@Override
	public void addMemFamily(MemFamily memFamily) {
		memFamilyMapper.insert(memFamily);
	}

	@Override
	public void updateMemFamily(MemFamily memFamily) {
		memFamilyMapper.updateByPrimaryKeySelective(memFamily);
	}

	@Override
	public MemFamily selMemFamilyById(long id) {
		return memFamilyMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<MemFamily> selMemFamilyAll(long memId) {
		List<MemFamily> list = memFamilyMapper.selMemFamilyAll(memId);
		return list;
	}
	@Override
	public PageBean<MemFamily> selFamAll(int page, int row,MemFamily memFamily) {
		PageHelper.startPage(page, row);
		List<MemFamily> famList= memFamilyMapper.selFamily(memFamily);
		return new PageBean<>(famList);
	}

	@Override
	public MemFamily selFamById(long id) {
		return memFamilyMapper.selFamById(id);
	}


}


package com.tyyy.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.tyyy.bean.MemHealth;
import com.tyyy.dao.MemHealthMapper;
import com.tyyy.service.MemHealthService;
import com.tyyy.util.PageBean;

/** 
 * @author  shanlishu E-mail: 584460858@qq.com
 * @date 创建时间：2016年12月28日 上午10:02:08 
 * @version 1.0 
*/
@Service("memHealthService")
@Transactional
public class MemHealthServiceImpl implements MemHealthService{
	@Autowired
	private MemHealthMapper memHealthMapper;

	@Override
	public void delMemHealth(long id) {
		memHealthMapper.deleteByPrimaryKey(id);
		
	}

	@Override
	public void addMemHealth(MemHealth memHealth) {
		System.out.println(memHealth.getUpload_Date());
		memHealthMapper.addMemHealth(memHealth);
	}
	
	@Override
	public void addMemhealth(MemHealth memHealth) {
		memHealthMapper.addMemhealth(memHealth);
	}

	@Override
	public MemHealth selMemHealthById(long id) {
		return memHealthMapper.selectByPrimaryKey(id);
	}

	@Override
	public PageBean<MemHealth> selMemHealthAll(int page, int rows,MemHealth memHealth) {
		PageHelper.startPage(page, rows);
		List<MemHealth> list = memHealthMapper.selectMemHealthAll(memHealth);
		return new PageBean<>(list);
	}
	
	
	@Override
	public PageBean<MemHealth> selMemHealthA(int page, int rows,MemHealth memHealth) {
		PageHelper.startPage(page, rows);
		List<MemHealth> list = memHealthMapper.selectMemHealthA(memHealth);
		return new PageBean<>(list);
	}


	@Override
	public void updateMemHealth(MemHealth memHealth) {
		memHealthMapper.updateByPrimaryKey(memHealth);
	}
	
	@Override
	public void updateMemhealth(MemHealth memHealth) {
		memHealthMapper.updateByPrimarykey(memHealth);
	}

	@Override
	public List<MemHealth> selByFamId(long fam_Id) {
		List<MemHealth> list =memHealthMapper.selByFamId(fam_Id);
		return list; 
		
		
	}

	@Override
	public PageBean<MemHealth> selectMemHealth(int page, int rows,long mem_Id) {
		PageHelper.startPage(page, rows);
		List<MemHealth> list = memHealthMapper.selectMemHealth(mem_Id);
		return new PageBean<>(list);
	}

	@Override
	public PageBean<MemHealth> selectFamHealth(int page, int rows,long mem_Id) {
		PageHelper.startPage(page, rows);
		List<MemHealth> list = memHealthMapper.selectFamHealth(mem_Id);
		return new PageBean<>(list);
	}

	@Override
	public String selFamById(MemHealth memHealth) {
		
		return memHealthMapper.selFamById(memHealth);
	}

	@Override
	public PageBean<MemHealth> selMemHealthByT(int page, int row, MemHealth memHealth) {
		return null;
	}

	@Override
	public List<MemHealth> selMemName(String mem_Name) {
		System.out.println(mem_Name);
		List<MemHealth> list = memHealthMapper.selMemName(mem_Name);
		return list;
	}





}


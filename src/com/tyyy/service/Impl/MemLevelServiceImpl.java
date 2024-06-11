package com.tyyy.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.tyyy.bean.MemLevel;
import com.tyyy.dao.MemLevelMapper;
import com.tyyy.service.MemLevelService;
import com.tyyy.util.PageBean;

/** 
 * @author  zxl E-mail: 1007334373@qq.com
 * @date 创建时间：2016年12月28日 上午10:02:08 
 * @version 1.0 
*/
@Service("memlevelService")
@Transactional
public class MemLevelServiceImpl implements MemLevelService{
	@Autowired
	private MemLevelMapper memlevelMapper;

	@Override
	public void deleteByPrimaryKey(Integer id) {
		memlevelMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void insert(MemLevel memLevel) {
		memlevelMapper.insert(memLevel);
	}

	@Override
	public void insertSelective(MemLevel memLevel) {
		memlevelMapper.insertSelective(memLevel);
	}

	@Override
	public MemLevel selectByPrimaryKey(Integer id) {
		return memlevelMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateByPrimaryKeySelective(MemLevel memLevel) {
		memlevelMapper.updateByPrimaryKeySelective(memLevel);
	}

	@Override
	public void updateByPrimaryKey(MemLevel memLevel) {
		memlevelMapper.updateByPrimaryKey(memLevel);
	}

	@Override
	public PageBean<MemLevel> selectAll(int page, int row, MemLevel memLevel) {
		PageHelper.startPage(page, row);
		List<MemLevel> lv = memlevelMapper.selectAll();
		return new PageBean<>(lv);
	}

	@Override
	public List<MemLevel> selectMemLevelList() {
		return memlevelMapper.selLevel();
	}

	

}



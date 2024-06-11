package com.tyyy.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.tyyy.bean.Tis;
import com.tyyy.dao.TisMapper;
import com.tyyy.service.TisService;
import com.tyyy.util.PageBean;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date 创建时间：2017年2月7日 下午2:01:32 
 * @version 1.0 
*/
@Service("TisService")
public class TisServiceImpl implements TisService{

	@Autowired
	private TisMapper tisMapper;
	@Override
	public void insert(Tis tis) {
		tisMapper.insert(tis);
	}

	@Override
	public void deleteByPrimaryKey(long id) {
		tisMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void updateByPrimaryKey(Tis tis) {
		tisMapper.updateByPrimaryKey(tis);
	}

	@Override
	public PageBean<Tis> selTisAll(int page, int row,Tis tis) {
		PageHelper.startPage(page, row);
		List<Tis> tisList = tisMapper.selTisAll(tis);
		return new PageBean<>(tisList);
	}

	@Override
	public Tis selectByPrimaryKey(long id) {
		return tisMapper.selectByPrimaryKey(id);
	}

	@Override
	public PageBean<Tis> selTisAlld(int page, int row) {
		PageHelper.startPage(page, row);
		List<Tis> tisList = tisMapper.selTisAlld();
		return new PageBean<>(tisList);
	}


}

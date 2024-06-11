package com.tyyy.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.tyyy.bean.MemClass;
import com.tyyy.dao.MemClassMapper;
import com.tyyy.service.MemClassService;
import com.tyyy.util.PageBean;

/** 
 * @author  zxl E-mail: 1007334373@qq.com
 * @date 创建时间：2016年12月28日 上午10:02:08 
 * @version 1.0 
*/
@Service("memclassService")
@Transactional
public class MemClassServiceImpl implements MemClassService{
	@Autowired
	 private MemClassMapper memClassMapper;
	@Override
	public PageBean<MemClass> selMemClassAll(int page, int row) {
		PageHelper.startPage(page, row);
		List<MemClass> memClassList = memClassMapper.selMemClassAll();
		return new PageBean<>(memClassList);
	}

	@Override
	public void addMemClass(MemClass memclass) {
		memClassMapper.insert(memclass);
	}

	@Override
	public void updateMemClass(MemClass memclass) {
		
		
		memClassMapper.updateByPrimaryKeySelective(memclass);
		
	}

	@Override
	public void delMemClass(int id) {
		memClassMapper.deleteByPrimaryKey(id);
	}

	@Override
	public MemClass selMemClassById(int id) {
		return memClassMapper.selectByPrimaryKey(id);
	}

}



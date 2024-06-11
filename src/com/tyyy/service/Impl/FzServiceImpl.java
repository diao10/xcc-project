package com.tyyy.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tyyy.bean.Fz;
import com.tyyy.dao.FzMapper;
import com.tyyy.service.FzService;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date 创建时间：2017年3月1日 上午11:55:46 
 * @version 1.0 
*/
@Service("FzService")
public class FzServiceImpl implements FzService{

	@Autowired
	private FzMapper fzMapper;
	@Override
	public List<Fz> selFzAll() {
		List<Fz> list = fzMapper.selFzAll();
		return list;
	}

	@Override
	public void insert(Fz fz) {
		fzMapper.insert(fz);
		
	}

	@Override
	public void deleteByPrimaryKey(long id) {
		fzMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void updateByPrimaryKey(Fz fz) {
		fzMapper.updateByPrimaryKey(fz);
	}

	@Override
	public Fz selFzAllById(long id) {
		
		return fzMapper.selectByPrimaryKey(id);
	}

}

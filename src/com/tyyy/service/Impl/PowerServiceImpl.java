package com.tyyy.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.tyyy.bean.Power;
import com.tyyy.dao.CharToPowerMapper;
import com.tyyy.dao.PowerMapper;
import com.tyyy.service.PowerService;
import com.tyyy.util.PageBean;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date 创建时间：2017年1月10日 下午6:37:32 
 * @version 1.0 
*/
@Service("powerService")
@Transactional
public class PowerServiceImpl implements PowerService{
	
	@Autowired
	private PowerMapper powerMapper;
	@Autowired
	private CharToPowerMapper ctp;
	@Override
	public List<Power> selPowerAll() {
		List<Power> powerList = powerMapper.selPowerAll();
		return powerList;
	}

	@Override
	public void addPower(Power power) {
		powerMapper.insert(power);
	}
	
	//删除
	@Override
	public void delPower(long id) {
		Power power = powerMapper.selectByPrimaryKey(id);
		Long L = power.getSuperId();
		//判断该权限是否为模块级
		
		if(L==0){
			//删除该模块所有下级权限
			System.out.println("检测到模块级");
			List<Power> sonList = powerMapper.selSonPower(id);
			for (Power power2 : sonList) {
				Long sonPid = power2.getPid();
				//删除关联表中的相关数据
				ctp.delPower(sonPid);
			}
			powerMapper.delSonPower(id);
		}
		powerMapper.deleteByPrimaryKey(id);
		//删除关联表中的相关数据
		ctp.delPower(id);
	}

	@Override
	public void updatePower(Power power) {
		powerMapper.updatePower(power);
	}


	@Override
	public Power selPowerById(Long id) {
		return powerMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Power> selPowerByCharId(long id) {
		return powerMapper.selPowerByCharId(id);
		
	}
	
	
	
}

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
 * @date ����ʱ�䣺2017��1��10�� ����6:37:32 
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
	
	//ɾ��
	@Override
	public void delPower(long id) {
		Power power = powerMapper.selectByPrimaryKey(id);
		Long L = power.getSuperId();
		//�жϸ�Ȩ���Ƿ�Ϊģ�鼶
		
		if(L==0){
			//ɾ����ģ�������¼�Ȩ��
			System.out.println("��⵽ģ�鼶");
			List<Power> sonList = powerMapper.selSonPower(id);
			for (Power power2 : sonList) {
				Long sonPid = power2.getPid();
				//ɾ���������е��������
				ctp.delPower(sonPid);
			}
			powerMapper.delSonPower(id);
		}
		powerMapper.deleteByPrimaryKey(id);
		//ɾ���������е��������
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

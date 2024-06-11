package com.tyyy.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;
import com.tyyy.bean.CharToPower;
import com.tyyy.bean.EmpChar;
import com.tyyy.bean.Power;
import com.tyyy.dao.CharToPowerMapper;
import com.tyyy.dao.EmpCharMapper;
import com.tyyy.dao.PowerMapper;
import com.tyyy.service.EmpCharService;

/** 
 * @author  gycx E-mail: gycxmilkyway@163.com
 * @date ����ʱ�䣺2017��1��11�� ����4:28:32 
 * @version 1.0 
*/
@Service("empCharService")
@Transactional
public class EmpCharServiceImpl implements EmpCharService {
	@Autowired
	private EmpCharMapper empCharMapper;
	@Autowired
	private PowerMapper powerMapper;
	@Autowired
	private CharToPowerMapper charToPower;
	
	/*��ѯȫ����ɫ*/
	@Override
	public List<EmpChar> selEmpCharAll() {
		List<EmpChar> empCharList = empCharMapper.selEmpCharAll();
		return empCharList;
	}
	/*ͨ��ID��ѯ*/
	@Override
	public EmpChar selEmpCharById(long id) {
		return empCharMapper.selectByPrimaryKey(id);
	}
	/*��ӽ�ɫ*/
	@Override
	public void addEmpChar(EmpChar empChar) {
		empCharMapper.insertSelective(empChar);

	}
	/*ɾ����ɫ*/
	@Override
	public void deleteByPrimaryKey(long id) {
		empCharMapper.deleteByPrimaryKey(id);

	}
	@Override

	public void updateByPrimaryKeySelective(EmpChar empChar) {
		empCharMapper.updateByPrimaryKeySelective(empChar);
	}
	
	
	/*��ѯ��ɫ��Ȩ��*/
	@Override
	public List<EmpChar> selCharToPower() {
		List<EmpChar> list = empCharMapper.selCharToPower();
		for (EmpChar empChar : list) {
			System.out.println(empChar);
		}
		return list;
	}
	
	//��ս�ɫ�µ�Ȩ��
	public void cleanCharToPower(Long id){
		empCharMapper.cleanCharToPower(id);
	}
	@Override
	public void addPowerToChar(String v) {
		//���ݲ�����char id,power id
		EmpChar empChar ;
		Power power;
		System.out.println(v);
		//ѭ��ִ�н�������ַ���      ��ѯpower����ȡpowerName����charToPower
		String[] str = v.split(",");
		//��ѯ��ɫ
		long L = Long.parseLong(str[0]);
		empChar = empCharMapper.selectByPrimaryKey(L);
		//��ս�ɫ�µ�Ȩ��
		cleanCharToPower(L);
		for(int i = 1;i<str.length;i++){
			CharToPower ctp = new CharToPower();
			//��ѯȨ��
			long Lp = Long.parseLong(str[i]);
			System.out.println(Lp);
			power = powerMapper.selectByPrimaryKey(Lp);//��ָ��
			ctp.setCid(empChar.getCid());
			ctp.setCharName(empChar.getCharName());
			ctp.setPid(power.getPid());
			ctp.setPowerName(power.getPowerName());
			System.out.println(ctp);
			charToPower.addCharToPower(ctp);
		}
		
		
	}
	@Override
	public List<EmpChar> selEmpChar() {
		List<EmpChar> empCharList1 = empCharMapper.selEmpChar();
		return empCharList1;
	}

}



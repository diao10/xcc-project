package com.tyyy.service;

import java.util.List;

import com.tyyy.bean.EmpChar;
import com.tyyy.bean.Power;

/** 
 * @author  gycx E-mail: gycxmilkyway@163.com
 * @date ����ʱ�䣺2017��1��11�� ����4:23:40 
 * @version 1.0 
*/
public interface EmpCharService {
	public List<EmpChar> selEmpCharAll();		//��ѯȫ��Ա����ɫ
	public EmpChar selEmpCharById(long id);		//ͨ��ID��ѯ��ɫ
	public void addEmpChar(EmpChar empChar);	//��ӽ�ɫ
	public void deleteByPrimaryKey(long id);			//ɾ����ɫ
	public void updateByPrimaryKeySelective(EmpChar empChar);
	public List<EmpChar> selCharToPower();			//��ѯ��ɫ��Ȩ��
	
	public void addPowerToChar(String v);			//�༭��ɫ��Ȩ�ޱ�idΪpower id
	public List<EmpChar> selEmpChar();
}



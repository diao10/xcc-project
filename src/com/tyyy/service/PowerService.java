package com.tyyy.service;

import java.util.List;

import com.tyyy.bean.Power;
import com.tyyy.util.PageBean;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date ����ʱ�䣺2017��1��10�� ����6:33:52 
 * @version 1.0 
*/
public interface PowerService {
	public List<Power> selPowerAll();						//ȫ��
	public Power selPowerById(Long id);						//ͨ��ID��
	public void addPower(Power power);						//���
	public void delPower(long id);							//ɾ��
	public void updatePower(Power power);					//�޸�
	
	public List<Power> selPowerByCharId(long id);			//ͨ����ɫID��ѯȨ��
				
}

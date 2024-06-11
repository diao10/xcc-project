package com.tyyy.dao;

import java.util.List;

import com.tyyy.bean.Sign;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date ����ʱ�䣺2017��1��5�� ����11:05:17 
 * @version 1.0 
*/
public interface SignMapper {
	public void addSign(Sign sign);	
	public void addSign1(long memId);//���ǩ��
	public List<Sign> selSignAll();//��ѯ���û�ȫ��ǩ�����
	public void delSign(String memId);				//ɾ���û�ȫ��ǩ��
	public void updateSign(Sign sign);			//�޸�ǩ��
	public Sign selSignById(long  id);			//ͨ��id��ѯ
	public void upSign(Sign sign);
	public void scSign(Sign sign);
	public List<Sign> selSignByMemId(long memId); 
	public Sign selSign(Sign sign);
}

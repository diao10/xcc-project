package com.tyyy.service;

import java.util.Date;
import java.util.List;

import com.tyyy.bean.Sign;
import com.tyyy.util.PageBean;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date ����ʱ�䣺2017��1��5�� ����11:09:10 
 * @version 1.0 
*/
public interface SignService {
	public void addSign(Sign sign);	
	public void addSign1(long memId);//���ǩ��
	public PageBean<Sign> selSignAll(int page,int row);	//��ѯ���û�ǩ�����
	public void delSign(String memId);					//ɾ���û�ȫ����¼��Ϣ
	public void updateSign(Sign sign);				//�޸�
	public Sign selSignById(long id);				//ͨ��id��ѯ
	public void upSign(Sign sign);
	public void scSign(Sign sign);
	public List<Sign> selSignByMemId(long memId);
	public Sign selSign(Sign sign);
	
}

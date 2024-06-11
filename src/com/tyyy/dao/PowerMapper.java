package com.tyyy.dao;

import java.util.List;

import com.tyyy.bean.Power;

public interface PowerMapper {
    int deleteByPrimaryKey(Long id);				//ɾ��Ȩ��
    int insert(Power record);						//���
    int insertSelective(Power record);				//
    Power selectByPrimaryKey(Long id);				//ͨ��ID����
    public void updatePower(Power power);			//�޸�
    public List<Power> selPowerAll();				//ȫ��
    public List<Power> selSonPower(Long id);		//��ѯ�¼�Ȩ��
    public void delSonPower(Long id);				//ɾ���¼�Ȩ��
    public List<Power> selPowerByCharId(Long id);   //ͨ����ɫID��Ȩ��		
}
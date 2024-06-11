package com.tyyy.dao;

import java.util.List;

import com.tyyy.bean.EmpChar;
import com.tyyy.bean.Power;

public interface EmpCharMapper {
    int deleteByPrimaryKey(Long id);					//ɾ��
    int insert(EmpChar record);							//���
    int insertSelective(EmpChar record);				//
    EmpChar selectByPrimaryKey(Long id);				//��ѯһ��
    int updateByPrimaryKeySelective(EmpChar record);	//
    int updateByPrimaryKey(EmpChar record);				//
    public List<EmpChar> selEmpCharAll();				//ȫ����ѯ
    
    public List selCharToPower();						//��ѯ��ɫ��Ȩ��
    
    public void cleanCharToPower(Long id);				//��ս�ɫ��Ȩ��
    public void addPowerToChar(Long id);				//�༭��ɫ��Ȩ��,idΪPower id
    public List<EmpChar> selEmpChar();					//���鳬������Ա
}
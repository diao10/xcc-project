package com.tyyy.service;
/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date ����ʱ�䣺2017��3��1�� ����11:47:49 
 * @version 1.0 
*/
import java.util.List;

import com.tyyy.bean.Fz;
public interface FzService {
	
	public List<Fz> selFzAll();
	public void insert(Fz fz);
	public void deleteByPrimaryKey(long id);
	public void updateByPrimaryKey(Fz fz);
	public Fz selFzAllById(long id);
}
 
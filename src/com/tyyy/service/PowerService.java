package com.tyyy.service;

import java.util.List;

import com.tyyy.bean.Power;
import com.tyyy.util.PageBean;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date 创建时间：2017年1月10日 下午6:33:52 
 * @version 1.0 
*/
public interface PowerService {
	public List<Power> selPowerAll();						//全查
	public Power selPowerById(Long id);						//通过ID查
	public void addPower(Power power);						//添加
	public void delPower(long id);							//删除
	public void updatePower(Power power);					//修改
	
	public List<Power> selPowerByCharId(long id);			//通过角色ID查询权限
				
}

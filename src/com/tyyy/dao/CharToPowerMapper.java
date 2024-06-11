package com.tyyy.dao;

import com.tyyy.bean.CharToPower;

/** 
 * @author  gycx E-mail: gycxmilkyway@163.com
 * @date 创建时间：2017年2月20日 上午9:28:44 
 * @version 1.0 
*/
public interface CharToPowerMapper {
	public void addCharToPower(CharToPower ctp);
	public void delPower(Long id);					//关联删除
}



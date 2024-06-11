package com.tyyy.dao;

import java.util.List;

import com.tyyy.bean.Sign;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date 创建时间：2017年1月5日 上午11:05:17 
 * @version 1.0 
*/
public interface SignMapper {
	public void addSign(Sign sign);	
	public void addSign1(long memId);//添加签到
	public List<Sign> selSignAll();//查询该用户全部签到情况
	public void delSign(String memId);				//删除用户全部签到
	public void updateSign(Sign sign);			//修改签到
	public Sign selSignById(long  id);			//通过id查询
	public void upSign(Sign sign);
	public void scSign(Sign sign);
	public List<Sign> selSignByMemId(long memId); 
	public Sign selSign(Sign sign);
}

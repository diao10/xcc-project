package com.tyyy.service;

import java.util.Date;
import java.util.List;

import com.tyyy.bean.Sign;
import com.tyyy.util.PageBean;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date 创建时间：2017年1月5日 上午11:09:10 
 * @version 1.0 
*/
public interface SignService {
	public void addSign(Sign sign);	
	public void addSign1(long memId);//添加签到
	public PageBean<Sign> selSignAll(int page,int row);	//查询该用户签到情况
	public void delSign(String memId);					//删除用户全部登录信息
	public void updateSign(Sign sign);				//修改
	public Sign selSignById(long id);				//通过id查询
	public void upSign(Sign sign);
	public void scSign(Sign sign);
	public List<Sign> selSignByMemId(long memId);
	public Sign selSign(Sign sign);
	
}

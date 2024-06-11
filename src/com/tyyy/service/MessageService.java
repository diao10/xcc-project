package com.tyyy.service;

import java.util.List;

import com.tyyy.bean.Member;
import com.tyyy.bean.Message;
import com.tyyy.bean.Theme;
import com.tyyy.util.PageBean;

/** 
 * @author  wangxingye E-mail: 1910004629@qq.com
 * @date 创建时间：2017年1月10日 下午1:35:34 
 * @version 1.0 
*/
public interface MessageService {
	public int selCount(long id);
	public int selCount1(long id);
	public PageBean<Message> selTheme(int page,int rows,long id);
	public PageBean<Message> selTheme1(int page,int rows,long id);
	public Message selMessageById(long id);
	public void read(long id);
	public void read1(long id);
	public PageBean<Message> empSelMessAll(int page,int rows,Message mess);
	public void add(Message mess);
	public void delete(long id);
	public void update(Message mess);
	public void del(long id);
}

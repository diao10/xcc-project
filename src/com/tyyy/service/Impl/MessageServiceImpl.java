package com.tyyy.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.tyyy.bean.Member;
import com.tyyy.bean.Message;
import com.tyyy.dao.MessageMapper;
import com.tyyy.service.MessageService;
import com.tyyy.util.PageBean;

/** 
 * @author  wangxingye E-mail: 1910004629@qq.com
 * @date 创建时间：2017年1月10日 下午1:38:05 
 * @version 1.0 
*/
@Service("messageService")
@Transactional
public class MessageServiceImpl implements MessageService{
	@Autowired
	private MessageMapper messageMapper;
	@Override
	public int selCount(long id) {
		
		return messageMapper.selCount(id);
	}

	@Override
	public PageBean<Message> selTheme(int page, int rows,long id) {
		PageHelper.startPage(page,rows);
		List<Message> messageList = messageMapper.selMessAll(id);
	
		return new PageBean<Message>(messageList);
	}

	@Override
	public Message selMessageById(long id) {
		// TODO Auto-generated method stub
		return messageMapper.selectByPrimaryKey(id);
	}

	@Override
	public void read(long id) {
		
		messageMapper.read(id);
		
	}

	@Override
	public PageBean<Message> empSelMessAll(int page, int rows, Message mess) {
		PageHelper.startPage(page,rows);
		List<Message> messageList= messageMapper.empSelMessAll(mess);
		return new PageBean<>(messageList);
	}

	@Override
	public void add(Message mess) {
		messageMapper.insert(mess);
		
	}

	@Override
	public void delete(long id) {
		messageMapper.delete(id);
		
	}

	@Override
	public void update(Message mess) {
		messageMapper.updateByPrimaryKeySelective(mess);
		
	}

	@Override
	public void del(long id) {
		messageMapper.del(id);
		
	}

	@Override
	public void read1(long id) {
		messageMapper.read1(id);
		
	}

	@Override
	public int selCount1(long id) {
		return messageMapper.selCount1(id);
	}

	@Override
	public PageBean<Message> selTheme1(int page, int rows, long id) {
		PageHelper.startPage(page,rows);
		List<Message> messageList = messageMapper.selMessAll1(id);
	
		return new PageBean<Message>(messageList);
	}

}

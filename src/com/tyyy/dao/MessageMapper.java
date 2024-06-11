package com.tyyy.dao;

import java.util.List;

import com.tyyy.bean.Member;
import com.tyyy.bean.Message;

public interface MessageMapper {
    int deleteByPrimaryKey(Long id);
    public int selCount(Long id);
    public int selCount1(Long id);
    public List<Message> selMessAll(long id);
    public List<Message> selMessAll1(long id);
    public void read(long id);
    int insert(Message record);
    public List<Message> empSelMessAll(Message mess);
    int insertSelective(Message record);
    public void delete(Long id);
    Message selectByPrimaryKey(Long id);
    public void del(Long id);
    int updateByPrimaryKeySelective(Message record);
    public void read1(long id);
    int updateByPrimaryKey(Message record);
	List<Member> selectMemberByEmpId(String empId);
}
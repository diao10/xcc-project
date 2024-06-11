package com.tyyy.service.Impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tyyy.bean.User;
import com.tyyy.dao.UserMapper;
import com.tyyy.service.UserService;

/**
 * Created by 37294 on 2016/7/29.
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;
    public void addUser(User user){
    	userMapper.insert(user);
    }
	@Override
	public void updateUser(User user) {
		userMapper.updateByPrimaryKey(user);
		
	}
	@Override
	public void delUser(long id) {
		userMapper.deleteByPrimaryKey(id);
		
	}
	@Override
	public User findUserById(long id) {
		return userMapper.selectByPrimaryKey(id);
	}
	@Override
	public List<User> findUserAll() {
		return userMapper.selUserAll();
	}
}

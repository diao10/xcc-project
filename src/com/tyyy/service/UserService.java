package com.tyyy.service;

import java.util.List;

import com.tyyy.bean.User;


/**
 * Created by 37294 on 2016/7/29.
 */
public interface UserService {
    public void addUser(User user);
    public void updateUser(User user);
    public void delUser(long id);
    public User findUserById(long id);
    public List<User> findUserAll();
}

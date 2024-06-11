package com.tyyy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tyyy.bean.User;
import com.tyyy.service.UserService;


/**
 * Created by 37294 on 2016/7/29.
 */
@Controller
@RequestMapping(value = "/User")
public class UserController {
	@Autowired
	UserService userService;

    @RequestMapping(value = "/save")
    public ModelAndView addUser(User user){
    	ModelAndView mv = new ModelAndView();
    	if(user.getId()==0){
    		userService.addUser(user);    		
    	}else{
    		userService.updateUser(user);
    	}
    	mv.setViewName("redirect:/User/selUserAll");
        return mv;
    }
    
    @RequestMapping(value = "/findById")
    public ModelAndView findById(User user){
    	ModelAndView mv = new ModelAndView("showUser");
        User newUser = userService.findUserById(user.getId());
        mv.addObject(newUser);
        return mv;
    }
    @RequestMapping(value = "/delUser")
    public ModelAndView delUser(User user){
    	ModelAndView mv = new ModelAndView("redirect:/User/selUserAll");
        userService.delUser(user.getId());
        return mv;
    }
    @RequestMapping(value = "/selUserAll")
    public ModelAndView selUserAll(){
    	ModelAndView mv = new ModelAndView("showUsers");
        List<User> userList = userService.findUserAll();
        mv.addObject(userList);
        return mv;
    }

}

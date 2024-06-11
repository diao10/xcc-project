package com.tyyy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/** 
 * @author  siyong E-mail: ve_master@sina.com
 * @date 创建时间：2017年1月12日 上午9:54:05 
 * @version 1.0 
*/

@Controller
@RequestMapping("/")
public class JspController {
	
	@RequestMapping("/view/{htmlName}.html")
	public ModelAndView go(@PathVariable("htmlName") String htmlName,String msg,String page,String id,String forgetTid){
		ModelAndView mv = new ModelAndView();
		mv.setViewName(htmlName);
		if(msg!=null&&!msg.equals("")){
			mv.addObject("msg", msg);
		}
		if(page!=null&&!page.equals("")){
			mv.addObject("page", page);
		}if(id!=null&&!id.equals("")){
			mv.addObject("id", id);
		}if(forgetTid!=null&&!forgetTid.equals("")){
			mv.addObject("forgetTid", forgetTid);
		}
		mv.addObject("htmlName", htmlName);
		return mv;
	}
}

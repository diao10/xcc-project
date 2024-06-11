package com.tyyy.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tyyy.bean.MemHealth;
import com.tyyy.bean.Sign;
import com.tyyy.service.SignService;
import com.tyyy.util.PageBean;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date 创建时间：2017年1月5日 上午11:14:20 
 * @version 1.0 
*/

@Controller
@RequestMapping("/Sign")
public class SignController{

	@Autowired
	private SignService signService;
	
	//查询所有签到情况
	@RequestMapping("/selSignAll.emp")
	public Object selSignAll( String msgs,@RequestParam(defaultValue="1") int page,@RequestParam(defaultValue="10") int rows){
		ModelAndView mv=new ModelAndView("empSignSelAll");
		PageBean<Sign> pb= signService.selSignAll( page, rows);
		mv.addObject("pb",pb);
		int begin = 0;
		int end = 0;
		int pages = pb.getPages();
		int length = 6;
		if(pages>10){
			begin = page-3;
			if(begin<=0){
				begin = 1;
			}
			end = length+begin;
			if(end>pages){
				end = pages;
				begin = end -length;
			}
		}else if(pages<=10&&pages>6){
			begin = page-3;
			if(begin<=0){
				begin = 1;
			}
			end = length+begin;
			if(end>pages){
				end = pages;
				begin = end -length;
			}
		}else{
			begin = 1;
			end =pages;
		}
		
		mv.addObject("begin", begin);
		mv.addObject("end", end);
		mv.addObject("page",page);
		mv.addObject("pages",pages);
		mv.addObject("Totals", pb.getTotal());
		mv.addObject("msg", msgs);
		return mv;
	}
	//添加
	@RequestMapping("/addSign.emp")
	public ModelAndView addSign(Sign sign){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:selSignAll.emp");
		try {
			signService.addSign(sign);
			msgs="ayes";
		} catch (Exception e) {
			e.printStackTrace();
			msgs="ano";
		}
		mv.addObject("msgs", msgs);
		return mv;
	}

	@RequestMapping("/upSign.emp")
	public ModelAndView upSign(Sign sign){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:selSignAll.emp");
		try {
			signService.upSign(sign);
			msgs="ayes";
		} catch (Exception e) {
			e.printStackTrace();
			msgs="ano";
		}
		mv.addObject("msgs", msgs);
		return mv;
	}
	//删除用户全部登录
	@RequestMapping("/delSign.emp")
	public ModelAndView delSign(String memId){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:/Sign/selSignAll.emp");
		try {
			signService.delSign(memId);
			msgs="dyes";
		} catch (Exception e) {
			e.printStackTrace();
			msgs="dno";
		}
		mv.addObject("msgs", msgs);
		return mv;
	}
	@RequestMapping("/scSign.emp")
	public ModelAndView scSign(Sign sign){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:selSignAll.emp");
		System.out.println(sign);
		try {
			signService.scSign(sign);
			msgs="dyes";
		} catch (Exception e) {
			e.printStackTrace();
			msgs="dno";
		}
		mv.addObject("msgs", msgs);
		return mv;
	}
	@RequestMapping("/updateSign.emp")
	public ModelAndView updateSign(Sign sign){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:selSignAll.emp");
		try {
			signService.updateSign(sign);
			msgs="uyes";
		} catch (Exception e) {
			e.printStackTrace();
			msgs="uno";
		}
		mv.addObject("msgs", msgs);
		return mv;
	}
	@ResponseBody
	@RequestMapping("/selSignById.emp")
	public Map<Object,Object> selSignById(@RequestParam("id") long id){
		Sign sign = signService.selSignById(id);
		Map<Object,Object> map = new HashMap<>();
		map.put("s",sign);
		return map;      
	}
	
	@ResponseBody
	@RequestMapping("/selSignByMemId.emp")
	public Map<Object, Object> selSignByMemId(@RequestParam("memId") long memId){
		List<Sign> list = signService.selSignByMemId(memId);
		Map<Object,Object> map = new HashMap<>();
		map.put("type", memId);
		map.put("times",list);
		return map;
	}
	@ResponseBody
	@RequestMapping("/selSign.emp")
	public Object selSign(Sign sign){
		return signService.selSign(sign);
	}
}

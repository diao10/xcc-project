package com.tyyy.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tyyy.bean.MemLevel;
import com.tyyy.service.MemLevelService;
import com.tyyy.util.PageBean;

/** 
 * @author  zxl E-mail: 1007334373@qq.com
 * @date 创建时间：2016年12月28日 上午10:02:08 
 * @version 1.0 
*/
@Controller
@RequestMapping("/MemLevel")
public class MemLevelController{
	@Autowired
	private MemLevelService memLevelService;
	//全选等级信息
	@RequestMapping("/selMemLevelAll.emp")
	public Object selEmployeAll(@RequestParam(defaultValue="1")int page,@RequestParam(defaultValue="10")int rows,MemLevel memLevel,String msgs){
		ModelAndView mv=new ModelAndView("empLevelSelAll");
		PageBean<MemLevel> pb= memLevelService.selectAll(page,rows,memLevel);
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
	//添加等级信息
	@RequestMapping("/addMemLevel.emp")
	public ModelAndView addMemLevel(MemLevel memLevel){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:selMemLevelAll.emp");
		try {
			memLevelService.insert(memLevel);
			msgs="ayes";
		} catch (Exception e) {
			msgs="ano";
		}
		mv.addObject("msgs", msgs);
		return mv;
	}
	//修改等级信息
	@RequestMapping("/updateMemLevel.emp")
	public ModelAndView updateMemLevel(MemLevel memlevel){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:selMemLevelAll.emp");
		try {
			memLevelService.updateByPrimaryKey(memlevel);
			msgs="uyes";
		} catch (Exception e) {
			msgs="uno";
		}
		mv.addObject("msgs", msgs);
		return mv;
	}
	//删除等级信息
	@RequestMapping("/delMemLevel.emp")
	public ModelAndView delMemLevel(int id){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:selMemLevelAll.emp");
		try {
			memLevelService.deleteByPrimaryKey(id);
			msgs="dyes";
		} catch (Exception e) {
			msgs="dno";
		}
		mv.addObject("msgs", msgs);
		return mv;
	}
	//修改等级信息点击选取
	@ResponseBody
	@RequestMapping("/selMemLvById.emp")
	public  Map<Object,Object> selMemLvById(@RequestParam("id") int id){
		Map<Object,Object> map=new HashMap<>();
		MemLevel lv= memLevelService.selectByPrimaryKey(id);
		map.put("lv", lv);
		return map;
	}
}



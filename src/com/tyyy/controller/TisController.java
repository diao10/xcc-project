package com.tyyy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.tyyy.bean.Employee;
import com.tyyy.bean.Tis;
import com.tyyy.service.TisService;
import com.tyyy.util.PageBean;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date 创建时间：2017年2月7日 下午2:18:35 
 * @version 1.0 
*/
@Controller
@SessionAttributes("employeeSession")
@RequestMapping("/Tis")
public class TisController {
	@Autowired
	private TisService tisService;
	@RequestMapping("/selTis.do")
	public Object selTis(@RequestParam(defaultValue="1")int page,@RequestParam(defaultValue="10")int rows,Tis tis){
		ModelAndView mv=new ModelAndView("memSelTis");
		PageBean<Tis> pb=tisService.selTisAll(page, rows,tis);
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
		mv.addObject("htmlName", "tis");
		return mv;
	}
	@ResponseBody
	@RequestMapping("/selTisMoblie")
	public Map<String, Object> selTisMoblie(@RequestParam(defaultValue="1")int page,@RequestParam(defaultValue="10")int rows,Tis tis){
		Map<String, Object> map = new HashMap<>();
		PageBean<Tis> pb=tisService.selTisAll(page, rows,tis);
		map.put("list", pb.getList());
		return map;
	}
	
	
	@RequestMapping("/selTisById.do")
	public ModelAndView selById(@RequestParam("id")long id){
		System.out.println(id);
		ModelAndView mv=new ModelAndView("memTisAll");
		Tis tis = tisService.selectByPrimaryKey(id);
		Map<Object, Object> map = new HashMap<>();
		mv.addObject("tis",tis);
		mv.addObject("htmlName", "tis");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/selTisByIdMoblie")
	public Map<Object, Object> selTisByIdMoblie(@RequestParam("id")long id){
		Tis tis = tisService.selectByPrimaryKey(id);
		Map<Object, Object> map = new HashMap<>();
		map.put("tis",tis);
		return map;
	}
	
	
	@ResponseBody
	@RequestMapping("/selTisAll.do")
	public Map<String, Object> selTisAllM(@RequestParam(defaultValue="1")int page,@RequestParam(defaultValue="5")int rows){
		Map<String,Object> map = new HashMap<>();
		PageBean<Tis> pb = tisService.selTisAlld(page, rows);
		map.put("news", pb.getList());
		return map;
	}
	
	@RequestMapping("/selTisAll.emp")
	public Object selTisAll(@RequestParam(defaultValue="1")int page,@RequestParam(defaultValue="5")int rows,Tis tis,String msgs){
		System.out.println(msgs);
		ModelAndView mv=new ModelAndView("empTisSelAll");
		PageBean<Tis> pb=tisService.selTisAll(page, rows,tis);
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
	@RequestMapping("/delTis.emp")
	public ModelAndView delTis(long id){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:selTisAll.emp");
		try {
			tisService.deleteByPrimaryKey(id);
			msgs="dyes";
		} catch (Exception e) {
			// TODO: handle exception
			msgs="dno";
		}
		mv.addObject("msgs", msgs);
		return mv;
	}
	@RequestMapping("/addTis.emp")
	public ModelAndView addTis(Tis tis,@ModelAttribute("employeeSession")Employee mem){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:selTisAll.emp");
		try {
			tis.setCreateBy(mem.getEmp_Name());
			System.out.println(mem.getEmp_Name());
			tisService.insert(tis);
			msgs="ayes";
		} catch (Exception e) {
			// TODO: handle exception
			msgs="ano";
		}
		mv.addObject("msgs", msgs);
		return mv;
	}
	@RequestMapping("/updateTis.emp")
	public ModelAndView updateTis(Tis tis){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:selTisAll.emp");
		try {
			tisService.updateByPrimaryKey(tis);
			msgs="uyes";
		} catch (Exception e) {
			// TODO: handle exception
			msgs="uno";
		}
		mv.addObject("msgs", msgs);
		return mv;
	}

	@RequestMapping("/selTisById.emp")
	public ModelAndView selTisById(@RequestParam("id")long id){
		ModelAndView mv = new ModelAndView("empTips");
		Tis tis = tisService.selectByPrimaryKey(id);
		
		mv.addObject("tis",tis);
		return mv;
	}
}

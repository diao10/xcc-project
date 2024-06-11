package com.tyyy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.tyyy.bean.Fz;
import com.tyyy.bean.Tis;
import com.tyyy.service.FzService;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date 创建时间：2017年3月1日 下午12:30:38 
 * @version 1.0 
*/
@Controller
@SessionAttributes("fzMM")
@RequestMapping("/Fz")
public class FzController {
	@Autowired
	private FzService fzService;
	
	@ResponseBody
	@RequestMapping("/FzMiss")
	public Map<String,Object> fzMiss(ModelMap modelMap){
		Map<String, Object> map = new HashMap<>();
		modelMap.put("fzMM", "t");
		map.put("ffz", "ok");
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/selFz.do")
	public Object selFz(){
		List<Fz> fzList = fzService.selFzAll();
		Map<String, Object> aaa = new HashMap<>();
		aaa.put("list", fzList);
		return aaa;
	}
	@ResponseBody
	@RequestMapping("/selFzAllById.emp")
	public Object selFzAllById(@RequestParam("id")long id){
		Map<Object, Object> map = new HashMap<>();
		Fz fz =  fzService.selFzAllById(id);
		System.out.println(id);
		map.put("map", fz);
		return map;
	}
	
	@RequestMapping("/selFzAll.emp")
	public Object selFzAll(){
		ModelAndView mv = new ModelAndView("empFzSellAll");
		Fz fz1 = fzService.selFzAllById(1);
		Fz fz2 = fzService.selFzAllById(2);
		Fz fz3 = fzService.selFzAllById(3);
		mv.addObject("fz1", fz1);
		mv.addObject("fz2", fz2);
		mv.addObject("fz3", fz3);
		return mv;
	}
	
	@RequestMapping("/addFz.emp")
	public ModelAndView addFz(Fz fz){
		ModelAndView mv = new ModelAndView("redirect:selFzAll.emp");
		fzService.insert(fz);
		return mv;
	}
	@RequestMapping("/delFz.emp")
	public ModelAndView delFz(long id){
		ModelAndView mv = new ModelAndView("redirect:selFzAll.emp");
		fzService.deleteByPrimaryKey(id);
		return mv;
	}
	
	@RequestMapping("/updateFz.emp")
	public ModelAndView updateFz(Fz fz){
		ModelAndView mv = new ModelAndView("redirect:selFzAll.emp");
		fzService.updateByPrimaryKey(fz);
		return mv;
	}
	@ResponseBody
	@RequestMapping("/selFzAll.do")
	public List<Fz> selFzAllM(){
		List<Fz> list = fzService.selFzAll();
		return list;
	}
}

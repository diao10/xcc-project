package com.tyyy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tyyy.bean.EmpChar;
import com.tyyy.bean.Power;
import com.tyyy.service.EmpCharService;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date 创建时间：2017年1月12日 上午9:51:18 
 * @version 1.0 
*/
@Controller
@RequestMapping("/empChar")
public class EmpCharController {
	@Autowired
	private EmpCharService empCharService;
	
	
	@RequestMapping("/selEmpCharAll.emp")
	public Object selEmpChar(String msgs){
		ModelAndView mv = new ModelAndView("empChar");
		List<EmpChar> empCharList = empCharService.selEmpCharAll();
		mv.addObject("List", empCharList);
		mv.addObject("msg", msgs);
		return mv;
	}
	
	@RequestMapping("/delEmpChar.emp")
	public ModelAndView delEmpChar(long id){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:selEmpCharAll.emp");
		try{
			empCharService.deleteByPrimaryKey(id);
			msgs="dyes";
		}
		catch(Exception e){
			msgs="dno";
		}
		mv.addObject("msgs",msgs);
		return mv;
	}
	@RequestMapping("/addEmpChar.emp")
	public ModelAndView addEmpChar(EmpChar empChar){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:selEmpCharAll.emp");
		try{
			empCharService.addEmpChar(empChar);
			msgs="ayes";
		}
		catch(Exception e){
			msgs="ano";
		}
		mv.addObject("msgs",msgs);
		return mv;
	}
	@RequestMapping("/updateEmpChar.emp")
	public ModelAndView updateEmpChar(EmpChar empChar){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:selEmpCharAll.emp");
		try{
			empCharService.updateByPrimaryKeySelective(empChar);
			msgs="uyes";
		}
		catch(Exception e){
			msgs="uno";
		}
		mv.addObject("msgs",msgs);
		return mv;
	}
	@ResponseBody
	@RequestMapping("/selEmpCharById.emp")
	public Map<Object,Object> selEmpCharById(@RequestParam("id")long id){
		EmpChar empchar = empCharService.selEmpCharById(id);
		Map<Object,Object> map=new HashMap<>();
		map.put("empchar", empchar);
		return map;
	}
	/*查询角色下的权限*/
	/*@ResponseBody
	@RequestMapping("/selPowerByCharId.emp")
	public Map<String, Object> selPowerByCharId(long id){
		Map<String, Object> map = new HashMap<>();
		List<Power> powerList = empCharService.selPowerByCharId(id);
		map.put("rows", powerList);
		for (Power power : powerList) {
			System.out.println(power);
		}
		return map;
	}*/
	/*查询角色对权限*/
	@ResponseBody
	@RequestMapping("/selCharToPower.emp")
	public Map<String, Object> selCTP(){
		Map<String, Object> map = new HashMap<>();
		List<EmpChar> list = empCharService.selCharToPower();
		map.put("empChar", list);
		return map;
	}
	/*编辑角色对权限表*/
	@ResponseBody
	@RequestMapping("/addPowerToChar.emp")
	public ModelAndView addPowerToChar(String v){
		ModelAndView mv = new ModelAndView("redirect:selEmpCharAll.emp");
		String msg = "";
		try {
			empCharService.addPowerToChar(v);
			msg="OK";
			
		} catch (Exception e) {
			msg="Failed";
		}
		mv.addObject("msg", msg);
		return mv;
	}
}

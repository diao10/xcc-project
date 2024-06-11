package com.tyyy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tyyy.bean.Power;
import com.tyyy.service.PowerService;
import com.tyyy.util.PageBean;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date 创建时间：2017年1月10日 下午6:46:05 
 * @version 1.0 
*/
@Controller
@RequestMapping("/Power")
public class PowerController {
	@Autowired
	private PowerService powerService;
	
	@ResponseBody
	@RequestMapping("/selPowerAll.emp")
	public Map selPowerAll(String msgs){
		List<Power> powerlist = powerService.selPowerAll();
		Map<Object, Object> map = new HashMap<>();
		map.put("list", powerlist);
		map.put("msg", msgs);
		return map;
	}
	
	/*查询角色下的权限*/
	@ResponseBody
	@RequestMapping("/selPowerByCharId.emp")
	public Map<String, Object> selPowerByCharId(long id){
		Map<String, Object> map = new HashMap<>();
		List<Power> powerList = powerService.selPowerByCharId(id);
		map.put("list", powerList);
		for (Power power : powerList) {
			System.out.println(power);
		}
		return map;
	}
	
	
	@RequestMapping("/addPower.emp")
	public ModelAndView addPower(Power power){
		String msg ="";
		if(power.getPowerType()==1){
			power.setSuperId(0L);
		}
		ModelAndView mv = new ModelAndView("/empPower");
		try {
			powerService.addPower(power);
			
			msg = "OK";
		} catch (Exception e) {
			msg = "Failed";
		}
		mv.addObject("msg", msg);
		return mv;
	}
	
	@RequestMapping("/updatePower.emp")
	public Map<Object, Object> updatePower(Power power){
		
		powerService.updatePower(power);
		Map<Object, Object> map = new HashMap<>();
		map.put("msg", "ok");
		return map;
	}
	//删除权限
	@RequestMapping("/delPower.emp")
	public ModelAndView delPower(long id){
		String msg = "";
		ModelAndView mv = new ModelAndView("/empPower");
		try {
			powerService.delPower(id);
			msg = "OK";
		} catch (Exception e) {
			msg = "Failed";
		}
		mv.addObject("msg", msg);
		return mv;
		
	}
}

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

import com.tyyy.bean.MemFamily;
import com.tyyy.service.MemFamilyService;
import com.tyyy.util.IntegerEditor;
import com.tyyy.util.PageBean;

/** 
 * @author  shanlishu E-mail: 584460858@qq.com
 * @date ����ʱ�䣺2016��12��28�� ����10:02:08 
 * @version 1.0 
*/
@Controller
@RequestMapping("/MemFamily")
public class MemFamilyController extends BaseController{
	@Autowired
	private MemFamilyService memFamilyService;
	public void initBinder(org.springframework.web.bind.WebDataBinder binder) {
		binder.registerCustomEditor(int.class, "famName",new IntegerEditor());
	};
	//ȫ�������Ϣ
	@ResponseBody
	@RequestMapping("/selMemFamilyAll.do")
	public Object selMemFamilyAll(@RequestParam("id") long memId){
		System.out.println("1========="+memId);
		List<MemFamily> list = memFamilyService.selMemFamilyAll(memId);
		Map<String,Object> map = new HashMap<>();
		map.put("memFamily", list);
		map.put("htmlName", "mh");
		return map;
	}
	//��Ӽ���
	@RequestMapping("/addMemFamily.do")
	public ModelAndView addMemFamily(MemFamily memFamily){
		ModelAndView mv = new ModelAndView("memSelFamily");
		memFamilyService.addMemFamily(memFamily);
		mv.addObject("htmlName","mh");
		return mv;
	}
	
	//ɾ������
	@RequestMapping("/delMemFamily.do")
	public ModelAndView delMemFamily(@RequestParam("id") long id){
		ModelAndView mv = new ModelAndView("memSelFamily");
		memFamilyService.delMemFamily(id);
		return mv;
	}
	//ȫ�������Ϣ
	@RequestMapping("/selById.do")
	public Map<String,Object> selMemFamilyById(@RequestParam("id") int id){
		Map<String,Object> map = new HashMap<>();
		MemFamily memFamily = memFamilyService.selMemFamilyById(id);
		map.put("memFamily", memFamily);
		return map;
	}
	
	
	//ȫ���ҳ------zxl
	/*@ResponseBody*/
	@RequestMapping("/selMemFamilyAll.emp")
	public ModelAndView selMemFailyAll(String msgs,@RequestParam(defaultValue="1")int page,@RequestParam(defaultValue="10")int rows,MemFamily memFamily){
		ModelAndView mv=new ModelAndView("empFamilySelAll");
		PageBean<MemFamily> pb= memFamilyService.selFamAll(page, rows, memFamily);
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
		mv.addObject("pb",pb);
		mv.addObject("begin", begin);
		mv.addObject("end", end);
		mv.addObject("page",page);
		mv.addObject("pages",pages);
		mv.addObject("Totals", pb.getTotal());
		mv.addObject("famName",memFamily.getFamName());
		mv.addObject("memName",memFamily.getMemName());
		mv.addObject("msg", msgs);
		return mv;
		}	
	//��ӻ�Ա����
	@ResponseBody
	@RequestMapping("/addMemFamily.emp")
	public ModelAndView addMemFam(MemFamily memFamily){
		String msgs="";
		ModelAndView mv=new ModelAndView("redirect:../Member/selMem.emp");
		try {
			memFamilyService.addMemFamily(memFamily);
			msgs="ayes";
		} catch (Exception e) {
			e.printStackTrace();
			msgs="ano";
		}
		mv.addObject("msgs", msgs);
		return mv;
	}
	//�޸Ļ�Ա������Ϣ
	@RequestMapping("/updateMemFamily.emp")
	public ModelAndView updateMemFam(MemFamily memFamily){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:selMemFamilyAll.emp");
		try {
			memFamilyService.updateMemFamily(memFamily);
			msgs="uyes";
		} catch (Exception e) {
			e.printStackTrace();
			msgs="uno";
		}
		mv.addObject("msgs", msgs);
		return mv;
	}
	//ɾ����Ա������Ϣ
	@RequestMapping("/delMemFamily.emp")
	public ModelAndView delMemFam(@RequestParam("id") int id){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:selMemFamilyAll.emp");
		try {
			memFamilyService.delMemFamily(id);
			msgs="dyes";
		} catch (Exception e) {
			e.printStackTrace();
			msgs="dno";
		}
		mv.addObject("msgs", msgs);
		return mv;
	}
	//ѡȡ��Ա
	@ResponseBody
	@RequestMapping("/selById.emp")
	public Map<String,Object> selMemFamById(@RequestParam("id") long id){
		Map<String,Object> map = new HashMap<>();
		MemFamily memFamily = memFamilyService.selMemFamilyById(id);
		map.put("mem", memFamily);
		return map;
	}
	@ResponseBody
	@RequestMapping("/selFamById.emp")
	public Map<Object,Object> selFamById(@RequestParam("id")long id){
		Map<Object,Object> map = new HashMap<>();
		MemFamily memFamily = memFamilyService.selFamById(id);
		map.put("fam",memFamily);
		return map;
	}
}

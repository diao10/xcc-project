package com.tyyy.controller;
/** 
 * @author  zxl E-mail: 1007334373@qq.com
 * @date 创建时间：2016年12月28日 上午10:02:08 
 * @version 1.0 
*/

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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

import com.tyyy.bean.MemClass;
import com.tyyy.bean.MemLevel;
import com.tyyy.bean.Member;
import com.tyyy.bean.Sign;
import com.tyyy.service.MemClassService;
import com.tyyy.service.MemLevelService;
import com.tyyy.service.MemberService;
import com.tyyy.service.SignService;
import com.tyyy.util.PageBean;
@SessionAttributes("memLogin")
@Controller
@RequestMapping("/MemClass")
public class MemClassController{
	@Autowired
	private MemClassService memClassService;
	@Autowired
	private MemLevelService memLevelService;
	@Autowired
	private SignService signService;
	@Autowired
	private MemberService memberService;
	@RequestMapping("/selMemClassAll.do")
	public ModelAndView selMemClassAllF(Sign sign, @ModelAttribute("memLogin")Member mm,@RequestParam(defaultValue="1")int page,@RequestParam(defaultValue="10")int rows,MemLevel memLevel,@RequestParam(defaultValue="0") int a) throws ParseException{
		ModelAndView mv= new ModelAndView("memFunction");
 		PageBean<MemClass> pb = memClassService.selMemClassAll(page, rows);
		PageBean<MemLevel> pb2 = memLevelService.selectAll(page, rows, memLevel);
		mv.addObject("pb",pb);
		mv.addObject("pb2",pb2);
		mv.addObject("Ts", pb.getTotal());
		mv.addObject("htmlName", "mc");
		mv.addObject("a", a);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
		java.util.Date time=null;
		try {
			time= sdf.parse(sdf.format(new Date()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		sign.setMemId(mm.getId());
		sign.setSignTime(time);
		Sign s=signService.selSign(sign);
		if(s==null){
			mv.addObject("signs", 2);
		}else{
			mv.addObject("signs", 1);
		}
		return mv;
	}
	
	@RequestMapping("/selMyMem.do")
	public ModelAndView selMyMem(@ModelAttribute("memLogin")Member mm,@RequestParam(defaultValue="1")int page,@RequestParam(defaultValue="10")int rows) throws ParseException{
		ModelAndView mv= new ModelAndView("memMyMem");
		PageBean<Member> pb3=memberService.selMemberByM(page, rows, mm.getMemId());
		mv.addObject("pb3",pb3);
		mv.addObject("htmlName", "mc");
		int begin = 0;
		int end = 0;
		int pages = pb3.getPages();
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
		mv.addObject("Totals", pb3.getTotal());
		System.out.println(begin+"----"+end+"-----"+page+"----"+pages+"----"+pb3.getTotal());
		return mv;
	}
	@RequestMapping("/addSign1.do")
	public ModelAndView addSign1(long id,@ModelAttribute("memLogin")Member mm){
		ModelAndView mv = new ModelAndView("redirect:selMemClassAll.do");
			signService.addSign1(id);
			int i = mm.getMemPoint();
			mm.setMemPoint(++i);
			mv.addObject("memLogin", mm);
		return mv;
	}
	@RequestMapping("/selMemClassAll.emp")
	public ModelAndView selMemClassAll(@RequestParam(defaultValue="1")int page,@RequestParam(defaultValue="10")int rows,String msgs){
		ModelAndView mv= new ModelAndView("empMemClassSelALL");
		PageBean<MemClass> pb = memClassService.selMemClassAll(page, rows);
		mv.addObject("pb",pb);
		mv.addObject("msg", msgs);
		return mv;
	}
	@RequestMapping("/addMemClass.emp")
	public ModelAndView addMemClass(MemClass memclass){
		String msgs="";
		ModelAndView mv= new ModelAndView("redirect:selMemClassAll.emp");
		try{
			memClassService.addMemClass(memclass);
			msgs="ayes";
		}
		catch(Exception e){
			msgs="ano";
		}
		mv.addObject("msgs",msgs);
		return mv;
	}
	@RequestMapping("/updateMemClass.emp")
	public ModelAndView updateMemClass(MemClass memclass){
		String msgs="";
		ModelAndView mv =new ModelAndView("redirect:selMemClassAll.emp");
		try{
			memClassService.updateMemClass(memclass);
			msgs="uyes";
		}
		catch(Exception e){
			msgs="uno";
		}
		mv.addObject("msgs",msgs);
		return mv;
	}
	@RequestMapping("/delMemClass.emp")
	public ModelAndView delMemClass( @RequestParam("id") int id){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:selMemClassAll.emp");
		try{
			memClassService.delMemClass(id);
			msgs="dyes";
		}
		catch(Exception e){
			msgs="dno";
		}
		mv.addObject("msgs",msgs);
		return mv;
	}
	@ResponseBody
	@RequestMapping("/selMemClassById.emp")
	public Map selMemClassById(  @RequestParam("id") int id){
		System.out.println(id);
		MemClass memC=memClassService.selMemClassById(id);
		Map< Object, Object> map=new HashMap<>();
		map.put("map", memC);
		return map;
	}
}



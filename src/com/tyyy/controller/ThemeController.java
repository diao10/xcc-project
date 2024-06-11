package com.tyyy.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sun.beans.editors.StringEditor;
import com.tyyy.bean.Building;
import com.tyyy.bean.EmpChar;
import com.tyyy.bean.Employee;
import com.tyyy.bean.Member;
import com.tyyy.bean.Theme;
import com.tyyy.bean.TyTheme;
import com.tyyy.service.BuildingService;
import com.tyyy.service.MemberService;
import com.tyyy.service.MessageService;
import com.tyyy.service.ThemeService;
import com.tyyy.util.IntegerEditor;
import com.tyyy.util.PageBean;

/** 
 * @author  wangxingye E-mail: 1910004629@qq.com
 * @date 创建时间：2017年1月6日 下午4:52:48 
 * @version 1.0 
*/
@Controller
@SessionAttributes({"employeeSession","empChar","memLogin"})
@RequestMapping("/theme")
public class ThemeController extends BaseController{
	@Autowired
	private ThemeService themeService;
	@Autowired
	private BuildingService buildingService;
	@Autowired
	private MessageService messa;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/selThemeAll.do")
	public ModelAndView selThemeAll(@RequestParam(defaultValue="1")int page,@RequestParam(defaultValue="10")int rows,Theme theme,@ModelAttribute("memLogin")Member mem){
		theme.setMemberId(mem.getId());
		PageBean<Theme> pb =  themeService.selTheme(page,rows,theme);
		System.out.println(mem.getId());
	    int a = themeService.selCount(mem.getId());
	    int b = messa.selCount(mem.getId());
	    ModelAndView mv= new ModelAndView("memMessage");
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
		mv.addObject("htmlName","doc");
		mv.addObject("type",1);
		mv.addObject("begin", begin);
		mv.addObject("end", end);
		mv.addObject("mess",a);
		mv.addObject("theme",b);
		mv.addObject("pages", pb.getPages());
		mv.addObject("rows", pb.getSize());
		mv.addObject("list", pb.getList());
		mv.addObject("page", page);
	
		return mv;
	
	}
	
	@ResponseBody
	@RequestMapping("/selCount")
	public Map<String,Object> selCount(){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("countg", themeService.selCount2());
		return map;
	}
	@RequestMapping("/doctorSelThemeAll.do")
	public ModelAndView selThemeAll1(@RequestParam(defaultValue="1")int page,@RequestParam(defaultValue="5")int rows,Theme theme,@ModelAttribute("memLogin")Member mem){
	
		PageBean<Theme> pb =  themeService.selTheme1(page,rows,theme);
		
	    int a = themeService.selCount1(mem.getId());
	    int b = messa.selCount(mem.getId());
	    ModelAndView mv= new ModelAndView("memMessageC");
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
		mv.addObject("type",2);
		mv.addObject("begin", begin);
		mv.addObject("end", end);
		mv.addObject("mess",a);
		mv.addObject("theme",b);
		mv.addObject("pages", pb.getPages());
		mv.addObject("rows", pb.getSize());
		mv.addObject("list", pb.getList());
		mv.addObject("page", page);
	
		return mv;
	
	}
	//员工查看主题（全查 可按条件查询）
	@RequestMapping("/selThemeAll.emp")
	public ModelAndView selThemeAllA(@ModelAttribute("empChar")EmpChar empChar,@ModelAttribute("employeeSession")Employee mem,String msgs,@RequestParam(defaultValue="1")int page,@RequestParam(defaultValue="5")int rows,Theme theme){
		List list = new ArrayList<>();
		PageBean<Theme> pb = new PageBean<>(list);
		if(empChar.getCid()==3){
			theme.setRid((int) mem.getId());
			pb =  themeService.selTheme(page,rows,theme);
		}else if(empChar.getCid()==1||empChar.getCid()==2){
			pb =  themeService.selTheme(page,rows,theme);
		}
		
	   
	    ModelAndView mv= new ModelAndView("empMessageSel");
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
		mv.addObject("wuer",theme);
		mv.addObject("begin", begin);
		mv.addObject("end", end);
		mv.addObject("pages", pb.getPages());
		mv.addObject("rows", pb.getSize());
		mv.addObject("list", pb.getList());
		mv.addObject("page", page);
		mv.addObject("type",2);
		mv.addObject("msg", msgs);
		return mv;
	
	}
	@RequestMapping("/delThemes.emp")
	public ModelAndView delTheme(long id){
		String msgs="";
		ModelAndView mv= new ModelAndView("redirect:/theme/selThemeAll.emp");
		try {
			themeService.delTheme(id);
			msgs="dyes";
		} catch (Exception e) {
			// TODO: handle exception
			msgs="dno";
		}
		mv.addObject("msgs", msgs);
		 return mv;
	}
	@RequestMapping("/updateThemes.emp")
	public ModelAndView updateTheme(Theme theme){
		String msgs="";
		ModelAndView mv= new ModelAndView("redirect:/theme/selThemeAll.emp");
		try {
			themeService.update(theme);
			msgs="uyes";
		} catch (Exception e) {
			// TODO: handle exception
			msgs="uno";
		}
		mv.addObject("msgs", msgs);
		 return mv;
	}
	@RequestMapping("/addTheme.do")
	public ModelAndView delTheme(Theme theme,@ModelAttribute("memLogin")Member mem,@RequestParam("buildingV")String buildingV){

		 
		 Member member = memberService.selectByPrimaryKey(mem.getId());
		 int i = member.getMemPoint();
		 if(i>=50){
			 i -= 50;
			 theme.setMemberId(mem.getId());
			 theme.setMemberName(mem.getMemName());
			 long a = themeService.addTheme(theme);
			 Building building = new Building();
			 building.setBuildingF(1);
			 building.setBuildingV(buildingV);
			 member.setMemPoint(i);
			 memberService.updateByPrimaryKeySelective(member);
			 
			 building.setSender(mem.getMemName());
			 building.setSenderId(mem.getId());
			 building.setSenderType(0);
			 building.setThemeId(a);
			 buildingService.addBuilding(building);
			 ModelAndView mv = new ModelAndView("redirect:/building/selBuilding.do?sid="+a);
			 mv.addObject("memLogin", member);
			 return mv;
		 }else{
			 ModelAndView mv = new ModelAndView("redirect:/doctor/selDoctor.do");
			 mv.addObject("message", "false");
			 return mv;
		 }
		 
	}
	@ResponseBody
	@RequestMapping("/addimg.do")
	public String addimg(MultipartFile file,HttpServletRequest requst){
		String s = requst.getSession().getServletContext().getRealPath("/");
		Date date= new Date();
		File newFile = new File(s+"dist\\img\\"+date.getTime()+"_"+file.getOriginalFilename());
		
		try {
				newFile.createNewFile();
				file.transferTo(newFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	
	}
}


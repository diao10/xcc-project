package com.tyyy.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ProcessBuilder.Redirect;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tyyy.bean.Building;
import com.tyyy.bean.Employee;
import com.tyyy.bean.MemDoctor;
import com.tyyy.bean.Member;
import com.tyyy.bean.Theme;
import com.tyyy.service.BuildingService;
import com.tyyy.service.DoctorService;
import com.tyyy.service.ThemeService;
import com.tyyy.util.PageBean;


/** 
 * @author  wangxingye E-mail: 1910004629@qq.com
 * @date 创建时间：2017年1月6日 下午5:18:57 
 * @version 1.0 
*/
@Controller
@SessionAttributes({"employeeSession","memLogin"})
@RequestMapping("/building")
public class BuildingController extends BaseController{
	@Autowired
	private BuildingService buildingService;
	@Autowired
	private ThemeService themeService;
	@Autowired
	private DoctorService doctorService;
	@RequestMapping("/selBuilding.do")
	public ModelAndView selBuilding(
			@RequestParam(defaultValue="1")int page,@RequestParam(defaultValue="5")int rows,
			@RequestParam("sid")long id,@ModelAttribute("memLogin")Member mem){
		ModelAndView mv = new ModelAndView("memMessageContent");
		PageBean<Building> pb = buildingService.selBuliding(page, rows, id);
		Theme theme = themeService.selThemeById(id);
		MemDoctor memDoctor = doctorService.selectByEmpId((long)theme.getRid());
		List<Building> pbList = pb.getList();
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
		mv.addObject("pb", pb);
		mv.addObject("docImg", memDoctor.getImgid());
		mv.addObject("page",page);
		
		mv.addObject("thispage",pb.getPageNum());
		mv.addObject("pages",pages);
		mv.addObject("list",pb.getList());
		mv.addObject("type",1);
		Theme theme1 = themeService.selThemeById(id);
		if(theme1.getFlag() == 1){
			themeService.read(id);
			theme1.setFlag(2);
		}
		int a = buildingService.selCountA(id);
		String mem1 = mem.getMemLevelName();
		mv.addObject("level",mem1);
		mv.addObject("docLevel", memDoctor.getJob());
		mv.addObject("count",a);
		mv.addObject("title",theme1);
		mv.addObject("themeId",id);
		mv.addObject("htmlName","doc");
		return mv;
	}
	@RequestMapping("/doctorSelBuilding.do")
	public ModelAndView selBuilding1(@RequestParam(defaultValue="1")int page,@RequestParam(defaultValue="5")int rows,@RequestParam("id")long id,@ModelAttribute("memLogin")Member mem){
		ModelAndView mv = new ModelAndView("memMessageContent");
		PageBean<Building> pb = buildingService.selBuliding(page, rows, id);
		List<Building> pbList = pb.getList();
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
		mv.addObject("pb", pb);
		
		mv.addObject("page",page);
		
		mv.addObject("thispage",pb.getPageNum());
		mv.addObject("pages",pages);
		mv.addObject("list",pb.getList());
		mv.addObject("type",2);
		themeService.read1(id);
		String mem1 = mem.getMemLevelName();
		int a = buildingService.selCountA(id);
		mv.addObject("level",mem1);
		mv.addObject("count",a);
		mv.addObject("title",themeService.selThemeById(id));
		mv.addObject("themeId",id);
		return mv;
	}
	@RequestMapping("/selBuilding.emp")
	public ModelAndView selBuildinga(String msgs,@RequestParam(defaultValue="1")int page,
			@RequestParam(defaultValue="3")int rows,@RequestParam("id")long id){
		ModelAndView mv = new ModelAndView("empDoctorTheme");
		PageBean<Building> pb = buildingService.selBuliding(page, rows, id);
		List<Building> pbList = pb.getList();
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
		mv.addObject("pb", pb);
		
		mv.addObject("page",page);
		mv.addObject("type",1);
		mv.addObject("thispage",pb.getPageNum());
		mv.addObject("pages",pages);
		mv.addObject("list",pb.getList());
		// 查询数据
		Theme theme = themeService.selThemeById(id);
		if(theme.getEmpFlag() == 1){
			// 设置后台状态已读
			themeService.read1(id);
			// 设置后台状态已读
			theme.setEmpFlag(2);
		}
		int a = buildingService.selCountA(id);
		mv.addObject("count",a);
		mv.addObject("title",theme);
		mv.addObject("themeId",id);
		mv.addObject("msg",msgs);
		return mv;
	}
	@RequestMapping("/selBuilding1.emp")
	public ModelAndView selBuildinga1(@RequestParam(defaultValue="1")int page,@RequestParam(defaultValue="3")int rows,@RequestParam("id")long id){
		ModelAndView mv = new ModelAndView("empBuildingSelAll");
		PageBean<Building> pb = buildingService.selBuliding(page, rows, id);
		List<Building> pbList = pb.getList();
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
		mv.addObject("pb", pb);
		
		mv.addObject("page",page);
		mv.addObject("type",1);
		mv.addObject("thispage",pb.getPageNum());
		mv.addObject("pages",pages);
		mv.addObject("list",pb.getList());
		
		themeService.read1(id);
		int a = buildingService.selCountA(id);
	
		mv.addObject("count",a);
		mv.addObject("title",themeService.selThemeById(id));
		mv.addObject("themeId",id);
	
		return mv;
	}
	@RequestMapping("/selBuildingA.emp")
	public ModelAndView selBuildingAA(@RequestParam(defaultValue="1")int page,String msgs,@RequestParam(defaultValue="5")int rows,Building building){
		ModelAndView mv = new ModelAndView("empBuildingSelAll");
		PageBean<Building> pb = buildingService.selBulidingA(page, rows, building);
		List<Building> pbList = pb.getList();
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
	
		mv.addObject("building",building);
		mv.addObject("begin", begin);
		mv.addObject("end", end);
		mv.addObject("pb", pb);
	
		mv.addObject("page",page);
		
		mv.addObject("thispage",pb.getPageNum());
		mv.addObject("pages",pages);
		mv.addObject("list",pb.getList());
		mv.addObject("msg",msgs);
		return mv;
	}
	@ResponseBody
	@RequestMapping("/delBuilding.do")
	public String delBuilding(long id){
		 buildingService.delBuilding(id);
		return null;
	}
	@RequestMapping("/delBuilding.emp")
	public ModelAndView delBuildingaa(@RequestParam("id") long id){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:/building/selBuildingA.emp");
		try{
			buildingService.delBuilding(id);
			msgs="dyes";
		}
		catch(Exception e){
			msgs="dno";
		}
		mv.addObject("msgs",msgs);
		return mv;
	}
	@RequestMapping("/selBuildingById.emp")
	public ModelAndView delBuildad(@RequestParam("id") long id){
		ModelAndView mv = new ModelAndView("empBuildingSel");
		 Map<String,Building> ui = new HashMap<>();
	
		 mv.addObject("building",buildingService.selBuildingById(id));
 		return mv;
	}
	@RequestMapping("/updateBuilding.emp")
	public ModelAndView delBuildingaas(Building building){

		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:/building/selBuilding1.emp");
       
		try{
			buildingService.update(building);

			msgs="uyes";

		}
		catch(Exception e){
			msgs="uno";
		}

		mv.addObject("id",building.getThemeId());

		mv.addObject("msgs",msgs);


 		return mv;
	}
	@RequestMapping("/addBuilding.do")
	public ModelAndView addBuilding(Building building,@ModelAttribute("memLogin")Member mem){
		Theme t= new Theme();
		t.setId(building.getThemeId());
	
		int a = buildingService.selCount(t);
		Theme theme = themeService.selThemeById(building.getThemeId());
		// 设置前台已读
		theme.setFlag(3);
		// 设置后台未读未回复
		theme.setEmpFlag(1);
		
		themeService.update(theme);
		building.setBuildingF(a+1);
		building.setSender(mem.getMemName());
		building.setSenderId(mem.getId());
		building.setSenderType(0);
		// 未读未回复
	    building.setFlag(3);
		System.out.println(building.getBuildingV());
		buildingService.addBuilding(building);
		PageBean<Building> pb = buildingService.selBuliding(1,5,building.getThemeId());
		ModelAndView mv = new ModelAndView("redirect:/building/selBuilding.do");
		mv.addObject("page",pb.getPages());
		mv.addObject("sid",building.getThemeId());
		mv.addObject("type",1);
		return mv;
	}
	@RequestMapping("/addBuilding1.emp")
	public ModelAndView addBuildinga(Building building,@ModelAttribute("employeeSession")Employee mem){
		Theme t= new Theme();
		t.setId(building.getThemeId());
	
		int a = buildingService.selCount(t);
		Theme theme = themeService.selThemeById(building.getThemeId());
		// 设置前台未读 未回复
		theme.setFlag(1);
		// 设置后台已读 已回复
		theme.setEmpFlag(3);
		
		themeService.update(theme);
		building.setBuildingF(a+1);
		building.setSender(mem.getEmp_Name());
		building.setSenderId(mem.getId());
		building.setSenderType(1);
	    building.setFlag(3);
		
		buildingService.addBuilding(building);
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:/building/selBuilding.emp");
		try{
			PageBean<Building> pb = buildingService.selBuliding(1,5,building.getThemeId());
			mv.addObject("page",pb.getPages());
			msgs="ayes";
		}
		catch(Exception e){
			msgs="ano";
		}
		mv.addObject("msgs",msgs);
		mv.addObject("id",building.getThemeId());
		mv.addObject("type",2);
		return mv;
	}
	
	
}

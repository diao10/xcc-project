package com.tyyy.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
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


import com.tyyy.bean.MemHealth;
import com.tyyy.bean.Member;
import com.tyyy.service.MemHealthService;
import com.tyyy.util.MakeKey;
import com.tyyy.util.PageBean;

/**
 * 会员健康信息 
 * @author  shanlishu E-mail: 584460858@qq.com
 * @date 创建时间：2016年12月28日 上午10:02:08 
 * @version 1.0 
*/
@SessionAttributes("memLogin")
@Controller
@RequestMapping("/MemHealth")
public class MemHealthController extends BaseController{

	/*@Override
	public void setAsText(String text) throws IllegalArgumentException {
		super.setAsText(text);
	}

	@Override
	public String getAsText() {
		return super.getAsText();
	}
	*/
	@Autowired
	private MemHealthService memHealthService;
	//全查健康信息
	@RequestMapping("/selMemHealthAll.do")
	public ModelAndView selMemHealthAll(@RequestParam(defaultValue="1") int page,@RequestParam(defaultValue="10") int rows,MemHealth memHealth,@ModelAttribute("memLogin")Member mm){
		ModelAndView mv = new ModelAndView("memSelAll");
		
		PageBean<MemHealth> pageBean2 = memHealthService.selectMemHealth(page, rows,mm.getId());
		
		int begin2 = 0;
		int end2 = 0;
		int pages2 = pageBean2.getPages();
		int length2 = 6;
		if(pages2>10){
			begin2 = page-3;
			if(begin2<=0){
				begin2 = 1;
			}
			end2 = length2+begin2;
			if(end2>pages2){
				end2 = pages2;
				begin2 = end2 -length2;
			}
		}else if(pages2<=10&&pages2>6){
			begin2 = page-3;
			if(begin2<=0){
				begin2 = 1;
			}
			end2 = length2+begin2;
			if(end2>pages2){
				end2 = pages2;
				begin2 = end2 -length2;
			}
		}else{
			begin2 = 1;
			end2 =pages2;
		}
		
		
		mv.addObject("page",page);
		
		mv.addObject("begin2", begin2);
		mv.addObject("end2", end2);
		
		mv.addObject("thispage2",pageBean2.getPageNum());
		mv.addObject("pages2",pages2);
		
		mv.addObject("pageBean2",pageBean2);
		mv.addObject("htmlName","mh");
		return mv;
	}
	
	@RequestMapping("/selFamHealth.do")
	public ModelAndView selFamHealthAll(@RequestParam(defaultValue="1") int page,@RequestParam(defaultValue="10") int rows,@ModelAttribute("memLogin")Member mm){
		ModelAndView mv = new ModelAndView("memFamHealth");
		PageBean<MemHealth> pageBean3 = memHealthService.selectFamHealth(page, rows,mm.getId());
		int begin3 = 0;
		int end3 = 0;
		int pages3 = pageBean3.getPages();
		int length3 = 6;
		if(pages3>10){
			begin3 = page-3;
			if(begin3<=0){
				begin3 = 1;
			}
			end3 = length3+begin3;
			if(end3>pages3){
				end3 = pages3;
				begin3 = end3 -length3;
			}
		}else if(pages3<=10&&pages3>6){
			begin3 = page-3;
			if(begin3<=0){
				begin3 = 1;
			}
			end3 = length3+begin3;
			if(end3>pages3){
				end3 = pages3;
				begin3 = end3 -length3;
			}
		}else{
			begin3 = 1;
			end3 =pages3;
		}
		mv.addObject("begin3", begin3);
		mv.addObject("end3", end3);
		mv.addObject("pageBean3", pageBean3);
		
		mv.addObject("page3",page);
		
		mv.addObject("thispage3",pageBean3.getPageNum());
		mv.addObject("pages3",pages3);
		mv.addObject("htmlName","mh");
		return mv;
	}
	//添加健康信息
	@RequestMapping("/addMemHealth.do")
	public ModelAndView addMemHealth(MemHealth memHealth,HttpServletRequest request, @RequestParam("fileList[]")MultipartFile[] fileList){
		ModelAndView mv = new ModelAndView("redirect:selMemHealthAll.do");
		if(memHealth.getFam_Id()!=0){
			String fn = memHealthService.selFamById(memHealth);
			memHealth.setMemName(fn);
		}
		/*String s = requst.getSession().getServletContext().getRealPath("/");*/
		StringBuilder fileNames = new StringBuilder();
		for (MultipartFile file : fileList) {
			if(file.getSize()!=0){
				Date date= new Date();
				String s = request.getSession().getServletContext().getRealPath("/dist/uploadImg/");
				File newFile = new File(s+date.getTime()+file.getOriginalFilename()); 
				try {
					newFile.createNewFile();
					file.transferTo(newFile);
				} catch (IOException e) {
					e.printStackTrace();
				}
				fileNames.append("/dist/uploadImg/"+date.getTime()+file.getOriginalFilename() + ";");
			}
		}
		if(fileNames.length() > 0){
			memHealth.setAegrotat_url(fileNames.toString());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			java.util.Date time=null;
			try {
				time= sdf.parse(sdf.format(new Date()));
			} catch (Exception e) {
				e.printStackTrace();
			}
			memHealth.setUpload_Date(time);
		}
		memHealthService.addMemHealth(memHealth);
		return mv;
	}
	
	/*@RequestMapping("/updateMemHealth.do")
	public ModelAndView updateMemHealth(MemHealth memHealth){
		ModelAndView mv = new ModelAndView("redirect:selMemHealthAll.do");
		memHealthService.updateMemHealth(memHealth);
		return mv;
	}*/
	//删除健康信息
	@RequestMapping("/delMemHealth.do")
	public ModelAndView delMemHealth(@RequestParam("id") int id){
		ModelAndView mv = new ModelAndView("redirect:selMemHealthAll.do");
		memHealthService.delMemHealth(id);
		return mv;
	}
	//查看个人健康信息详情
	@ResponseBody
	@RequestMapping("/selById.do")
	public Map<String,Object> selMemHealthById(Model model, HttpServletResponse response,@RequestParam("id") int id){
		Map<String,Object> map = new HashMap<>();
		MemHealth memHealth = memHealthService.selMemHealthById(id);
		System.out.println(memHealth);
		map.put("memHealth", memHealth);
		return map;
	}
	//查看家属个人健康信息
	@ResponseBody
	@RequestMapping("/selByFamId.do")
	public Object selMemHealthByName(@RequestParam(defaultValue="1") int page,@RequestParam(defaultValue="10") int rows,@RequestParam("id") long fam_Id){
		Map<String,Object> map = new HashMap<>();
		List<MemHealth> list = memHealthService.selByFamId(fam_Id);
		map.put("page",page);
		map.put("qw",list);
		map.put("famid",fam_Id);
		return map;      
	}
	
	//查找全部
		@RequestMapping("/selMemHealthAll.emp")
		public Object selMemHealth(String msgs,@RequestParam(defaultValue="1") int page,@RequestParam(defaultValue="10") int rows,MemHealth memHealth){
			ModelAndView mv=new ModelAndView("empHealth");
			System.out.println(memHealth);
			PageBean<MemHealth> pb=memHealthService.selMemHealthAll(page, rows,memHealth);
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
			mv.addObject("fam_name", memHealth.getFam_Name());
			mv.addObject("memName",memHealth.getMemName());
			mv.addObject("diag_hos", memHealth.getDiag_Hos());
			mv.addObject("diag_ill",memHealth.getDiag_Ill());
			mv.addObject("msg", msgs);
			return mv;
		}
		@RequestMapping("/selMemHealthA.emp")
		public Object selMemHealthA(String msgs,@RequestParam(defaultValue="1") int page,@RequestParam(defaultValue="10") int rows,MemHealth memHealth){
			ModelAndView mv=new ModelAndView("empHHHealth");
			PageBean<MemHealth> pb=memHealthService.selMemHealthA(page, rows,memHealth);
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
			mv.addObject("fam_name", memHealth.getFam_Name());
			mv.addObject("memName",memHealth.getMemName());
			mv.addObject("diag_hos", memHealth.getDiag_Hos());
			mv.addObject("diag_ill",memHealth.getDiag_Ill());
			mv.addObject("msg", msgs);
			return mv;
		}
		

		//删除健康信息
		@RequestMapping("/delMemHealth.emp")
		public ModelAndView delMemHealth(long id){
			String msgs="";
			ModelAndView mv=new ModelAndView("redirect:selMemHealthAll.emp");
			try {
				memHealthService.delMemHealth(id);
				msgs="dyes";
			} catch (Exception e) {
				e.printStackTrace();
				msgs="dno";
			}
			mv.addObject("msgs", msgs);
			return mv;
		}
		//添加健康信息
		@RequestMapping("/addMemHealth.emp")
		public ModelAndView addMemHea(MemHealth memHealth,@RequestParam("fileList[]") MultipartFile fileList[],HttpServletRequest requst){
			String msgs="";
			ModelAndView mv=new ModelAndView("redirect:../MemFamily/selMemFamilyAll.emp");
			String s = requst.getSession().getServletContext().getRealPath("/");
			StringBuilder fileNames = new StringBuilder();
			try {
				for (MultipartFile file : fileList) {
					if(file!=null){
						Date date= new Date();
						File newFile = new File(s+date.getTime()+file.getOriginalFilename());
						try {
							newFile.createNewFile();
							file.transferTo(newFile);
						} catch (IOException e) {
							e.printStackTrace();
						}
						fileNames.append("/dist/uploadImg/"+date.getTime()+file.getOriginalFilename() + ";");
					}
				}
				if(fileNames.length() > 0){
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					java.util.Date time=null;
					try {
						time= sdf.parse(sdf.format(new Date()));
					} catch (Exception e) {
						e.printStackTrace();
					}
					memHealth.setUpload_Date(time);
					memHealth.setAegrotat_url(fileNames.toString());
				}
				memHealthService.addMemHealth(memHealth);
				msgs="ayes";
			} catch (Exception e) {
				e.printStackTrace();
				msgs="ano";
			}
			mv.addObject("msgs", msgs);
			return mv;
		}
		@RequestMapping("/addMemhealth.emp")
		public ModelAndView addMemhea(MemHealth memHealth,@RequestParam("fileList[]")MultipartFile fileList[],HttpServletRequest requst){
			String msgs="";
			ModelAndView mv=new ModelAndView("redirect:../Member/selMem.emp");
			String s = requst.getSession().getServletContext().getRealPath("/dist/uploadImg/");
			StringBuilder fileNames = new StringBuilder();
			try {
				for (MultipartFile file : fileList) {
					if(file!=null){
						Date date= new Date();
						File newFile = new File(s+date.getTime()+file.getOriginalFilename());
						try {
							newFile.createNewFile();
							file.transferTo(newFile);
						} catch (IOException e) {
							e.printStackTrace();
						}
						fileNames.append("/dist/uploadImg/"+date.getTime()+file.getOriginalFilename() + ";");
					}
				}
				if(fileNames.length() > 0){
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					java.util.Date time=null;
					try {
						time= sdf.parse(sdf.format(new Date()));
					} catch (Exception e) {
						e.printStackTrace();
					}
					memHealth.setUpload_Date(time);
					memHealth.setAegrotat_url(fileNames.toString());
				}
				memHealthService.addMemhealth(memHealth);
				msgs="ayes";
			} catch (Exception e) {
				e.printStackTrace();
				msgs="ano";
			}
			mv.addObject("msgs", msgs);
			return mv;
		}
		//修改健康信息
		@RequestMapping("/updateMemHealth.emp")
		public ModelAndView updateMemHea(MemHealth memHealth){
			String msgs="";
			ModelAndView mv=new ModelAndView("redirect:selMemHealthAll.emp");
			try {
				memHealthService.updateMemHealth(memHealth);
				msgs="uyes";
			} catch (Exception e) {
				e.printStackTrace();
				msgs="uno";
			}
			mv.addObject("msgs", msgs);
			return mv;
		}
		@RequestMapping("/updateMemhealth.emp")
		public ModelAndView updateMemhea(MemHealth memHealth){
			String msgs="";
			ModelAndView mv=new ModelAndView("redirect:selMemHealthA.emp");
			try {
				memHealthService.updateMemhealth(memHealth);
				msgs="uyes";
			} catch (Exception e) {
				e.printStackTrace();
				msgs="uno";
			}
			mv.addObject("msgs", msgs);
			return mv;
		}
		//修改选取
		@ResponseBody
		@RequestMapping("/selMemHealthById.emp")
		public  Map<Object,Object> selMemHeaById(@RequestParam("id") int id){
			MemHealth memHealth = memHealthService.selMemHealthById(id);
			Map<Object,Object> map=new HashMap<>();
			map.put("hea", memHealth);
			return map;
		}
		//条件查询
		@ResponseBody
		@RequestMapping("/selEmployee.emp")
		public Object selMemHea(@RequestParam(defaultValue="1")int page,@RequestParam(defaultValue="5")int rows,MemHealth memHealth){
			PageBean<MemHealth> pb = memHealthService.selMemHealthByT(page, rows, memHealth);
			Map<String,Object> map = new HashMap<>();
			map.put("total",pb.getTotal());
			map.put("rows",pb.getList());
			return map;
		}
		@ResponseBody
		@RequestMapping("/selMemName.emp")
		public Object selMemName(String mem_Name){
			System.out.println(mem_Name);
			List<MemHealth> list = memHealthService.selMemName(mem_Name);
			Map<Object, Object> map = new HashMap<>();
			map.put("list",list);
			return map;
		}
		@RequestMapping("/save.emp")
		public ModelAndView addUrl(HttpServletRequest request,MultipartFile file,@RequestParam("id") long id){
			String msgs = "";
			ModelAndView mv = new ModelAndView("redirect:selMemHealthAll.emp");
			try{
				MemHealth memHealth = memHealthService.selMemHealthById(id);
				String s = request.getSession().getServletContext().getRealPath("/");
				File newFile = new File(s+memHealth.getAegrotat_url());
				try {
					if(newFile.exists()){
						file.transferTo(newFile);
					}else{
						newFile.createNewFile();
						file.transferTo(newFile);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
				msgs="uyes";
			} catch (Exception e) {
				e.printStackTrace();
				msgs="uno";
				}
			mv.addObject("msgs",msgs);
			return mv;
		}
}


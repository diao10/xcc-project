package com.tyyy.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
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
import com.tyyy.bean.MemDoctor;
import com.tyyy.bean.Member;
import com.tyyy.service.DoctorService;
import com.tyyy.util.PageBean;

@Controller
@SessionAttributes({"employeeSession","memLogin"})
@RequestMapping("/doctor")
public class DoctorController extends BaseController{
	@Autowired
	DoctorService doctorService;
	//后台 医师条件查询
	@RequestMapping("/selDoctor.emp")
	public ModelAndView seleDoctor(String msgs, @RequestParam(defaultValue="1")int page ,@RequestParam(defaultValue="5")int row,MemDoctor doctor){
		PageBean pb =  doctorService.selDoctorAll(page, row, doctor);
		ModelAndView mv = new ModelAndView("empDoctorselAll");
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
		mv.addObject("doctor",doctor);
		mv.addObject("begin", begin);
		mv.addObject("end", end);
		mv.addObject("page", page);
		mv.addObject("pages", pages);
		mv.addObject("rows", pb.getSize());
		mv.addObject("list", pb.getList());
		mv.addObject("thispage", pb.getPageNum());
		mv.addObject("msg", msgs);
		return mv;
	}
	//前台医师全查
	@RequestMapping("/selDoctor.do")
	public ModelAndView seleDoctor1(@RequestParam(defaultValue="1")int page ,@RequestParam(defaultValue="10")int row,MemDoctor doctor){
		PageBean pb =  doctorService.selDoctorAll(page, row, doctor);
		ModelAndView mv = new ModelAndView("memDoctor");
	
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
		mv.addObject("page", page);
		mv.addObject("pages", pages);
		mv.addObject("rows", pb.getSize());
		mv.addObject("list", pb.getList());
		mv.addObject("thispage", pb.getPageNum());
		mv.addObject("htmlName", "doc");
		return mv;
	}
	@ResponseBody
	@RequestMapping("/selDoctorForIndex.do")
	public Map<String,Object> selDoctorForIndex(@RequestParam(defaultValue="1")int page ,@RequestParam(defaultValue="10")int row,MemDoctor doctor){
		PageBean pb =  doctorService.selDoctorAll(page, row, doctor);
		Map<String,Object> map = new HashMap<>();
		map.put("list", pb.getList());
		return map;
	}
	
	//医师添加
	@RequestMapping("/addDoctor.emp")
	public ModelAndView addDoctor(MemDoctor doctor,HttpServletRequest requst,MultipartFile file){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:/doctor/selDoctor.emp");
		try {
			String s = requst.getSession().getServletContext().getRealPath("/");
			
			if(!file.getOriginalFilename().equals("")){
				Date date= new Date();
				File newFile = new File(s+"dist\\uploadImg\\"+date.getTime()+"_"+file.getOriginalFilename());
				try {
					newFile.createNewFile();
					file.transferTo(newFile);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				doctor.setImgid("dist\\uploadImg\\"+date.getTime()+"_"+file.getOriginalFilename());
			}else{
				doctor.setImgid("");
			}
			MemDoctor doc = doctorService.selectByEmpId(doctor.getEmpid());
			if(doc != null){
				doctor.setId(doc.getId());
				doctorService.updateDotor(doctor);
			}else{
				doctorService.addDoctor(doctor);
			}
			msgs="ayes";
		} catch (Exception e) {
			e.printStackTrace();
			msgs="ano";
		}
		mv.addObject("msgs", msgs);
		
		
		return mv;
	}
	//医师跟新
	@RequestMapping("/updateDoctor.emp")
	public ModelAndView updateDoctor(MemDoctor doctor){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:/doctor/selDoctor.emp");
		try {
			doctorService.updateDotor(doctor);
			msgs="uyes";
		} catch (Exception e) {
			// TODO: handle exception
			msgs="uno";
			}
		mv.addObject("msgs", msgs);
		return mv;
	}
	//根据id查找医师
	@ResponseBody
	@RequestMapping("/selDoctorById.emp")
	public Object selMemberById(MemDoctor doctor){
		MemDoctor memDoctor = doctorService.selDoctorById(doctor.getId());
		Map< String, Object> map = new HashMap<>();
		map.put("mem",memDoctor);
		return map;
	}
	//删除医师假删
	@RequestMapping("/delDoctor.emp")
	public ModelAndView delDoctor(@RequestParam("id") long id){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:/doctor/selDoctor.emp");
		try {
			doctorService.delDoctor(id);
			msgs="dyes";
		} catch (Exception e) {
			// TODO: handle exception
			msgs="dno";
			}
		mv.addObject("msgs", msgs);
		return mv;
	}
	//图片查看
	@RequestMapping("/lookImg.do")
	public String lookImg(Model model, HttpServletResponse response,long id){
		MemDoctor doctor = doctorService.selDoctorById(id);
		
			InputStream in;
			try {
				in = new FileInputStream(doctor.getImgid());
				OutputStream os = response.getOutputStream();  //创建输出流
				byte[] b = new byte[1024*5];  
				while( in.read(b)!= -1){ 
					os.write(b);     
				}
				in.close(); 
				os.flush();
				os.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}   //用该文件创建一个输入流
		
		return null;
	}

	@RequestMapping("/save.emp")
	public ModelAndView addImg(HttpServletRequest requst,MultipartFile file,@RequestParam("id") long id){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:/doctor/selDoctor.emp");
		try {
			MemDoctor doctor = doctorService.selDoctorById(id);
			
			String s = requst.getSession().getServletContext().getRealPath("/");
			File newFile = new File(s+doctor.getImgid());
			try {
				if(newFile.exists()){
					file.transferTo(newFile);
				}else{
				newFile.createNewFile();
				file.transferTo(newFile);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			msgs="ayes";
		} catch (Exception e) {
			// TODO: handle exception
			msgs="ano";
			}
		mv.addObject("msgs", msgs);
	
		return mv;
	}
}

package com.tyyy.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
@Controller
@RequestMapping("/img")
public class EmpImgContoller {
	@RequestMapping("/save.emp")
	public ModelAndView addImg(HttpServletRequest requst,MultipartFile file){
		String msgs="";
		String s = requst.getSession().getServletContext().getRealPath("/");
	
		File newFile = new File(s+"dist\\img\\"+"gun1.jpg");
		try {
      
        	newFile.createNewFile();
        	msgs="ayes";
			file.transferTo(newFile);
		} catch (IOException e) {
			e.printStackTrace();
			msgs="ano";
		}
		ModelAndView mv = new ModelAndView("empImg");
		mv.addObject("msg",msgs);
		return mv;
	}
	@RequestMapping("/save1.emp")
	public ModelAndView addImg2(HttpServletRequest requst,MultipartFile file){
		String msgs="";
		String s = requst.getSession().getServletContext().getRealPath("/");
	
		File newFile = new File(s+"dist\\img\\"+"gun2.jpg");
		try {
      
        	newFile.createNewFile();
        	msgs="ayes";
			file.transferTo(newFile);
		} catch (IOException e) {
			e.printStackTrace();
			msgs="ano";
		}
		ModelAndView mv = new ModelAndView("empImg");
		mv.addObject("msg",msgs);
		return mv;
	}
	@RequestMapping("/save2.emp")
	public ModelAndView addImg3(HttpServletRequest requst,MultipartFile file){
		String msgs="";
		String s = requst.getSession().getServletContext().getRealPath("/");
	
		File newFile = new File(s+"dist\\img\\"+"gun3.jpg");
		try {
      
        	newFile.createNewFile();
        	msgs="ayes";
			file.transferTo(newFile);
		} catch (IOException e) {
			e.printStackTrace();
			msgs="ano";
		}
		ModelAndView mv = new ModelAndView("empImg");
		mv.addObject("msg",msgs);
		return mv;
	}
	@RequestMapping("/save3.emp")
	public ModelAndView addImg4(HttpServletRequest requst,MultipartFile file){
		String msgs="";
		String s = requst.getSession().getServletContext().getRealPath("/");
		Date date= new Date();
		File newFile = new File(s+"dist\\img\\"+"jjfa1.jpg");
		
		try {
			newFile.createNewFile();
			file.transferTo(newFile);
			msgs="ayes";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgs="ano";
		}
		ModelAndView mv = new ModelAndView("empImg");
		mv.addObject("msg",msgs);
		return mv;
	}
	@RequestMapping("/save4.emp")
	public ModelAndView addImg14(HttpServletRequest requst,MultipartFile file){
		String msgs="";
		String s = requst.getSession().getServletContext().getRealPath("/");
		Date date= new Date();
		File newFile = new File(s+"dist\\img\\"+"jjfa2.jpg");
		
		try {
			newFile.createNewFile();
			file.transferTo(newFile);
			msgs="ayes";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgs="ano";
		}
		ModelAndView mv = new ModelAndView("empImg");
		mv.addObject("msg",msgs);
		return mv;
	}
	@RequestMapping("/save5.emp")
	public ModelAndView addImg1(HttpServletRequest requst,MultipartFile file){
		String msgs="";
		String s = requst.getSession().getServletContext().getRealPath("/");
		Date date= new Date();
		File newFile = new File(s+"dist\\img\\"+"jjfa3.jpg");
		
		try {
			newFile.createNewFile();
			file.transferTo(newFile);
			msgs="ayes";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgs="ano";
		}
		ModelAndView mv = new ModelAndView("empImg");
		mv.addObject("msg",msgs);
		return mv;
	}
	@RequestMapping("/save6.emp")
	public ModelAndView addImg124(HttpServletRequest requst,MultipartFile file){
		String msgs="";
		String s = requst.getSession().getServletContext().getRealPath("/");
		Date date= new Date();
		File newFile = new File(s+"dist\\img\\"+"qie1.jpg");
		
		try {
			newFile.createNewFile();
			file.transferTo(newFile);
			msgs="ayes";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgs="ano";
		}
		ModelAndView mv = new ModelAndView("empImg");
		mv.addObject("msg",msgs);
		return mv;
	}
	@RequestMapping("/save7.emp")
	public ModelAndView addImg234(HttpServletRequest requst,MultipartFile file){
		String msgs="";
		String s = requst.getSession().getServletContext().getRealPath("/");
		Date date= new Date();
		File newFile = new File(s+"dist\\img\\"+"qie2.jpg");
		
		try {
			newFile.createNewFile();
			file.transferTo(newFile);
			msgs="ayes";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgs="ano";
		}
		ModelAndView mv = new ModelAndView("empImg");
		mv.addObject("msg",msgs);
		return mv;
	}
	@RequestMapping("/save8.emp")
	public ModelAndView addImg2314(HttpServletRequest requst,MultipartFile file){
		String msgs="";
		String s = requst.getSession().getServletContext().getRealPath("/");
		Date date= new Date();
		File newFile = new File(s+"dist\\img\\"+"qie3.jpg");
		
		try {
			newFile.createNewFile();
			file.transferTo(newFile);
			msgs="ayes";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgs="ano";
		}
		ModelAndView mv = new ModelAndView("empImg");
		mv.addObject("msg",msgs);
		return mv;
	}
	@RequestMapping("/save9.emp")
	public ModelAndView addImg214(HttpServletRequest requst,MultipartFile file){
		String msgs="";
		String s = requst.getSession().getServletContext().getRealPath("/");
		Date date= new Date();
		File newFile = new File(s+"dist\\img\\"+"qie4.jpg");
		
		try {
			newFile.createNewFile();
			file.transferTo(newFile);
			msgs="ayes";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgs="ano";
		}
		ModelAndView mv = new ModelAndView("empImg");
		mv.addObject("msg",msgs);
		return mv;
	}
	@RequestMapping("/save10.emp")
	public ModelAndView addImgad214(HttpServletRequest requst,MultipartFile file){
		String msgs="";
		String s = requst.getSession().getServletContext().getRealPath("/");
		Date date= new Date();
		File newFile = new File(s+"dist\\mobile\\image\\"+"1.jpg");
		
		try {
			newFile.createNewFile();
			file.transferTo(newFile);
			msgs="ayes";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgs="ano";
		}
		ModelAndView mv = new ModelAndView("empImg");
		mv.addObject("msg",msgs);
		return mv;
	}
	@RequestMapping("/save11.emp")
	public ModelAndView addImg21ad4(HttpServletRequest requst,MultipartFile file){
		String msgs="";
		String s = requst.getSession().getServletContext().getRealPath("/");
		Date date= new Date();
		File newFile = new File(s+"dist\\mobile\\image\\"+"2.jpg");
		
		try {
			newFile.createNewFile();
			file.transferTo(newFile);
			msgs="ayes";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgs="ano";
		}
		ModelAndView mv = new ModelAndView("empImg");
		mv.addObject("msg",msgs);
		return mv;
	}
	@RequestMapping("/save12.emp")
	public ModelAndView addImg214da(HttpServletRequest requst,MultipartFile file){
		String msgs="";
		String s = requst.getSession().getServletContext().getRealPath("/");
		Date date= new Date();
		File newFile = new File(s+"dist\\mobile\\image\\"+"3.jpg");
		
		try {
			newFile.createNewFile();
			file.transferTo(newFile);
			msgs="ayes";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msgs="ano";
		}
		ModelAndView mv = new ModelAndView("empImg");
		mv.addObject("msg",msgs);
		return mv;
	}
	
}

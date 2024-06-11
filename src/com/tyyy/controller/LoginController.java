package com.tyyy.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.tyyy.bean.EmpChar;
import com.tyyy.bean.Employee;
import com.tyyy.bean.Fz;
import com.tyyy.bean.MemLevel;
import com.tyyy.bean.Member;
import com.tyyy.service.EmpCharService;
import com.tyyy.service.EmployeeService;
import com.tyyy.service.FzService;
import com.tyyy.service.MemberService;
import com.tyyy.service.MessageService;

/** 
 * @author  wuwei E-mail:496384622@qq.com
 * @date 创建时间：2017年1月6日 下午1:55:25 
 * @version 1.0 
*/
@Controller
@SessionAttributes({"employeeSession","memLogin","empChar","messageCount"})
@RequestMapping("/Login")
public class LoginController {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private EmpCharService empCharService;
	@Autowired
	private FzService fz;
	@RequestMapping("/employeeLogin.emp")
	public  ModelAndView employeeLogin(Employee employee,ModelMap map,String remember,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		ModelAndView mv1 = new ModelAndView();
		//System.out.println("登录~~！"+employee);
				Employee empOld = (Employee) request.getAttribute("empOld");
				if(request.getAttribute("employee")!=null){
					employee = empOld;
				}
				Employee selEmp=employeeService.login(employee);
					if(selEmp!=null){
						map.addAttribute("employeeSession", selEmp);
						EmpChar empChar = empCharService.selEmpCharById(selEmp.getEmp_Char());
						map.addAttribute("empChar", empChar);
						
						if(employee.getRemember()!=null&&employee.getRemember().equals("on")){
							Cookie cookie = new Cookie("empName",  URLEncoder.encode(selEmp.getEmp_Admin(), "utf-8"));
							Cookie cookie2 = new Cookie("empPwd", selEmp.getEmp_Password());
							String url = request.getServletContext().getContextPath();
							cookie.setPath(url);
							cookie2.setPath(url);
							cookie.setMaxAge(60*10);
							cookie2.setMaxAge(60*10);
							response.addCookie(cookie);
							response.addCookie(cookie2);
						}
						mv1.setViewName("empHome");
					}else{
						mv1.addObject("msg", "no");
						mv1.setViewName("empLogin");
					}
		return mv1;
	}
	@RequestMapping("/memLogin.do")
	public ModelAndView login(String nameRoEmail,String memPwd,String remember,ModelMap modelMap,HttpServletRequest request,HttpServletResponse response) throws ParseException{
		ModelAndView mv = new ModelAndView("memIndex");
		Member member = memberService.login(nameRoEmail, memPwd);
		List<Fz> fzz= fz.selFzAll();
		if (member!=null) {
			String f1 = member.getFiled1();
			if(f1!=null&&!f1.equals("no")){
				modelMap.addAttribute("memLogin", member);
				modelMap.addAttribute("fz",fzz);
				//cookie设置
				if(remember!=null&&!remember.equals("")&&remember.equals("on")){
					Cookie cookie = new Cookie("memName", nameRoEmail);
					Cookie cookie2 = new Cookie("memPwd", memPwd);
					
					String url = request.getServletContext().getContextPath();
					System.out.println("url---"+url);
					cookie.setPath(url);
					cookie2.setPath(url);
					cookie.setMaxAge(60*10);
					cookie2.setMaxAge(60*10);
					response.addCookie(cookie);
					response.addCookie(cookie2);
				}
				//初始化会员信息
				long memageCount = messageService.selCount(member.getId());
				modelMap.addAttribute("messageCount", memageCount);
				mv.addObject("htmlName", "首页");
				//判断连续签到天数
				if(member.getTheLoginTime()==null){
					member.setMemPoint(0);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
					java.util.Date time=null;
					try {
						time= sdf.parse(sdf.format(new Date()));
					} catch (Exception e) {
						e.printStackTrace();
					}
					member.setTheLoginTime(time);
				}else{
					Date nowDate=new Date();
					SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
					Date  smdate=sdf.parse(sdf.format(member.getTheLoginTime()));  
					Date  bdate=sdf.parse(sdf.format(nowDate));  
					Calendar cal = Calendar.getInstance();    
					cal.setTime(smdate);    
					long time1 = cal.getTimeInMillis();                 
					cal.setTime(bdate);    
					long time2 = cal.getTimeInMillis();         
					long between_days=(time2-time1)/(1000*3600*24);  
					if(between_days==1){
					}else if(between_days>7){
						//根据登录修改点数
						int p=(int) (member.getMemPoint()-10*(Math.floor(between_days/7)));
						if(p>0){
							member.setMemPoint(p);
						}else{
							member.setMemPoint(0);
						}
						member.setSignCount(0);
					}else if(between_days==0){
						member.setSignCount(member.getSignCount());
					}else{
						member.setSignCount(0);
					}
				}
				memberService.updateMemTime(member);
				//根据点数修改职阶
				Member m3=memberService.selLl(member);
				List<MemLevel> list2=m3.getLevelList();
				int lid=(int) list2.get(0).getId();
				String ln=list2.get(0).getLevelName();
				member.setMemLevel(lid);
				member.setMemLevelName(ln);
				memberService.updateClass(member);
			}else{
				mv.addObject("msg", "LoginFailedForJH");
			}
		}else{
			mv.addObject("msg", "LoginFailedForPwd");
			
		}
		return mv;
	}
	
	@RequestMapping("/employeeEsc.emp")
	public  ModelAndView employeeEsc(HttpServletRequest req,Map map){
		ModelAndView mv= new ModelAndView("empLogin");
		req.removeAttribute("employeeSession");
		req.getSession().invalidate();
		map.remove("employeeSession");
		return mv;
	}
	@RequestMapping("/memEsc.do")
	public  ModelAndView memEsc(HttpServletRequest req,Map map){
		ModelAndView mv= new ModelAndView("memIndex");
		req.removeAttribute("memLogin");
		req.getSession().invalidate();
		map.remove("memLogin");
		return mv;
	}
}


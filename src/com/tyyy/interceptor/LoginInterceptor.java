package com.tyyy.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tyyy.bean.Employee;
import com.tyyy.bean.Member;
import com.tyyy.service.MemberService;

/** 
 * @author  siyong E-mail: ve_master@sina.com
 * @date 创建时间：2017年1月12日 上午10:12:41 
 * @version 1.0 
*/
public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	private MemberService memberService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("Login -"+request.getRequestURI());
		Member memberOnline = (Member) request.getSession().getAttribute("memLogin");
		System.out.println("Login - member:---->"+memberOnline);
		Employee employeeOnline = (Employee) request.getSession().getAttribute("employeeSession");
		if(memberOnline==null&&employeeOnline==null){
			//response.sendRedirect(request.getServletContext().getContextPath()+"/view/memLogin.html");
			return true;
		}else if(employeeOnline!=null&&memberOnline==null){
			return true;
		}else if(memberOnline!=null&&employeeOnline==null){
			return false;
		}else{
			return true;
		}
		
	}
	
}

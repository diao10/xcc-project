package com.tyyy.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tyyy.bean.Employee;
import com.tyyy.bean.Member;
import com.tyyy.service.MemberService;
import com.tyyy.util.SpringUtil;

/** 
 * @author  siyong E-mail: ve_master@sina.com
 * @date 创建时间：2017年1月11日 下午6:48:54 
 * @version 1.0 
*/
public class LoginFilter implements Filter{
	
	
	private MemberService memberService = (MemberService) SpringUtil.getApp().getBean("MemberService"); 
	
	private String excluded;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		String url = request.getRequestURI();
		if(url.endsWith(".css")||
			url.endsWith(".js")||
			url.endsWith("login.html")||
			url.endsWith(".woff")||
			url.endsWith(".png")||
			url.endsWith(excluded)){
			arg2.doFilter(arg0, arg1);
		}else{
			Member memberOnline = (Member) request.getSession().getAttribute("memLogin");
			Employee employeeOnline = (Employee) request.getSession().getAttribute("employeeSession");
			if(memberOnline==null){
				String memName = null;
				String memPwd = null;
				boolean cookieS = false;
				Cookie [] cookies = request.getCookies();
				for (Cookie cookie : cookies) {
					if(cookie.getName().equals("memName")){
						memName = cookie.getValue();
					}
					if(cookie.getName().equals("memPwd")){
						memPwd = cookie.getValue();
					}
				}
				if(memName!=null&&memPwd!=null){
					Member member = memberService.login(memName, memPwd);
					if(member!=null){
						cookieS = true;
						request.getSession().setAttribute("memLogin", member);
					}
				}
				//判断cookie登陆是否成功
				if(cookieS){
					arg2.doFilter(arg0, arg1);
				}else{
					response.sendRedirect(request.getServletContext().getContextPath()+"/WEB-INF/jsp/login.jsp");
				}
				
			}else{
				arg2.doFilter(arg0, arg1);
			}
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		excluded = arg0.getInitParameter("excluded");
	}

}

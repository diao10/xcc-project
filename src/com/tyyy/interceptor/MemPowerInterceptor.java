package com.tyyy.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tyyy.bean.Member;
import com.tyyy.service.MemberService;

/** 
 * @author  siyong E-mail: ve_master@sina.com
 * @date 创建时间：2017年1月11日 下午4:37:29 
 * @version 1.0 
*/
public class MemPowerInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	private MemberService memberService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("mem-----"+request.getRequestURI());
		Member memberOnline = (Member) request.getSession().getAttribute("memLogin");
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
				return true;
			}else{
				response.sendRedirect(request.getServletContext().getContextPath()+"/view/memIndex.html?msg=lz");
				return false;
			}
		}else{
			return true;
		}
		
	}
	
}

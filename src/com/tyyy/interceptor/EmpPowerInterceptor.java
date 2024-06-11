package com.tyyy.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tyyy.bean.Employee;
import com.tyyy.bean.Member;
import com.tyyy.service.EmployeeService;
import com.tyyy.service.PowerService;

/** 
 * @author  siyong E-mail: ve_master@sina.com
 * @date 创建时间：2017年1月12日 下午2:47:15 
 * @version 1.0 
*/
public class EmpPowerInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired 
	private PowerService powerService;
	@Autowired
	private EmployeeService employeeService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("emp-----"+request.getRequestURI());
		Employee employeeOnline = (Employee) request.getSession().getAttribute("employeeSession");
		if(employeeOnline==null){
			
			String empName = null;
			String empPwd = null;
			boolean cookieS = false;
			Cookie [] cookies = request.getCookies();
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals("empName")){
					empName = cookie.getValue();
				}
				if(cookie.getName().equals("empPwd")){
					empPwd = cookie.getValue();
				}
			}
			if(empName!=null&&empPwd!=null){
				Employee empLogin = new Employee();
				empLogin.setEmp_Admin(empName);
				empLogin.setEmp_Password(empPwd);
				Employee emp = employeeService.login(empLogin);
				if(emp!=null){
					cookieS = true;
					request.getSession().setAttribute("employeeSession", emp);
				}
			}
			//判断cookie登陆是否成功
			if(cookieS){
				return true;
			}else{
				response.sendRedirect(request.getServletContext().getContextPath()+"/view/empLogin.html");
				return false;
			}
		}else{
			return true;
		}
	}
	
}

package com.tyyy.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/** 
 * @author  siyong E-mail: ve_master@sina.com
 * @date 创建时间：2017年1月11日 下午2:49:16 
 * @version 1.0 
*/
public class PowerFilter implements Filter{
	
	private List<String> urls;
	
	@Override
	public void destroy() {
		System.out.println("权限filter销毁");
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		Pattern pattern = null;
		Matcher matcher = null;
		HttpServletRequest request = (HttpServletRequest) arg0;
		String url = request.getRequestURI();
		boolean b = false;
		System.out.println(url);
		for (String urlEnd : urls) {
			pattern = Pattern.compile("^(.*)+("+urlEnd+"){1}(.*)");
			matcher = pattern.matcher(url);
			b= matcher.matches();
			if(b){
				break;
			}
		}
		//判断例外路径
		if(b){
			//arg2.doFilter(arg0, arg1);
		}else{
			
		}
		arg2.doFilter(arg0, arg1);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		urls = new ArrayList<>();
		Enumeration<String> ss = arg0.getInitParameterNames();
		while (ss.hasMoreElements()) {
			String InitParameterName = (String) ss.nextElement();
			urls.add(arg0.getInitParameter(InitParameterName));
		}
		for (String string : urls) {
			System.out.println(string);
		}
	}
	
	
}

package com.tyyy.filter;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.tyyy.service.MemberService;
import com.tyyy.util.SpringUtil;

public class MemberIntergralFilter implements Filter{

	/** 会员service */
	private MemberService memberService = (MemberService) SpringUtil.getApp().getBean("MemberService");
	
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		
		arg2.doFilter(arg0, arg1);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// 每6个小时执行一次
		Timer timer = new Timer();  
        timer.schedule(new TimerTask() {
			@Override
			public void run() {
				Calendar calendar = Calendar.getInstance();  
				calendar.setTime(new Date(System.currentTimeMillis()));
				int day = calendar.get(Calendar.DAY_OF_MONTH);
				if(day == 1){
					clearMemberIntergral();
				}
			}
		}, 0, 1000 * 60 * 60 * 6);
	}
	
	private void clearMemberIntergral(){
		memberService.clearMemberIntergral();
	}

}

package com.tyyy.listener;


import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.tyyy.bean.Fz;
import com.tyyy.service.FzService;
import com.tyyy.util.SpringUtil;

public class ContextLoaderListener implements HttpSessionListener {
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		HttpSession session = arg0.getSession(); 
		FzService fz = (FzService) SpringUtil.getApp().getBean("FzService");
		List<Fz> fzz= fz.selFzAll();
		if(fzz!=null){
			session.setAttribute("fz", fzz);
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	
	
}

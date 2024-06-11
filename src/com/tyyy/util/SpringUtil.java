package com.tyyy.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class SpringUtil implements ApplicationContextAware{
	
	private static ApplicationContext app;
	
	public static ApplicationContext getApp(){
		return app;
	}
	@Override
	public void setApplicationContext(ApplicationContext app) throws BeansException {
		SpringUtil.app = app;
		
	}
}

package com.tyyy.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

import com.tyyy.util.IntegerEditor;
import com.tyyy.util.LongEditor;


/** 
 * @author  gycx E-mail: gycxmilkyway@163.com
 * @date 创建时间：2016年12月29日 上午11:27:03 
 * @version 1.0 
*/
@ControllerAdvice
public class BaseController {
	@InitBinder
	public void initBinder(WebDataBinder binder){
		binder.registerCustomEditor(long.class, new LongEditor());    
		binder.registerCustomEditor(Long.class, new LongEditor());    
		binder.registerCustomEditor(int.class, new IntegerEditor());
		binder.registerCustomEditor(Integer.class, new IntegerEditor());
		//日期格式
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(Date.class,new CustomDateEditor(dateFormat, true));
		
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class,new CustomDateEditor(dateFormat1, true));
	}
       
}



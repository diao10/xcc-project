package com.tyyy.util;

import org.springframework.beans.propertyeditors.PropertiesEditor;

/** 
 * @author  siyong E-mail: ve_master@sina.com
 * @date 创建时间：2017年1月6日 下午3:28:04 
 * @version 1.0 
*/
public class LongEditor extends PropertiesEditor{
	@Override    
    public void setAsText(String text) throws IllegalArgumentException {    
        if (text == null || text.equals("")) {    
            text = "0";    
        }    
        setValue(Long.parseLong(text));    
    }    
    
    @Override    
    public String getAsText() {    
        return getValue().toString();    
    }    
}

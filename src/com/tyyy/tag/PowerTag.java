package com.tyyy.tag;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.tyyy.bean.EmpChar;
import com.tyyy.bean.Employee;
import com.tyyy.bean.Power;
import com.tyyy.service.EmpCharService;
import com.tyyy.service.PowerService;
import com.tyyy.util.SpringUtil;

/** 
 * @author  siyong E-mail: ve_master@sina.com
 * @date 创建时间：2017年2月16日 下午4:10:30 
 * @version 1.0 
*/
public class PowerTag extends TagSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String authority;
	private String role;
	
	private PowerService powerService = SpringUtil.getApp().getBean(PowerService.class,"powerService");

	@Override
	public int doStartTag() throws JspException {
		HttpSession session = pageContext.getSession();
		EmpChar empChar = (EmpChar) session.getAttribute("empChar");
		if(empChar!=null){
			List<Power> powerList = powerService.selPowerByCharId(empChar.getCid());
			if(authority!=null&&!authority.equals("")){
				for (Power power : powerList) {
					if(power.getPowerName().equals(authority))return EVAL_BODY_INCLUDE;
				}
			}
			if(role!=null&&!role.equals("")){
				if(empChar.getCharName().equals(role))return EVAL_BODY_INCLUDE;
			}
			return SKIP_BODY;
		}else{
			return SKIP_BODY;
		}
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
}

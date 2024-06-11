package com.tyyy.service;

import com.tyyy.bean.Theme;
import com.tyyy.util.PageBean;

/** 
 * @author  wangxingye E-mail: 1910004629@qq.com
 * @date 创建时间：2017年1月6日 下午4:07:35 
 * @version 1.0 
*/
public interface ThemeService {
	public long addTheme(Theme theme);
	public void delTheme(long id);
	public PageBean<Theme> selTheme(int page,int rows,Theme theme);
	
	public PageBean<Theme> selTheme1(int page,int rows,Theme theme);
	public int selCount1(long id);
	public int selCount(long id);
	public int selCount2();
	public Theme selThemeById(long id);
	public void read(long id);
	public void read1(long id);
    public void delete(long id);
    public void update(Theme theme);
    public void del(long id);
}

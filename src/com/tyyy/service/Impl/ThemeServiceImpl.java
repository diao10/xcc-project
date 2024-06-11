package com.tyyy.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.tyyy.bean.Theme;
import com.tyyy.dao.ThemeMapper;
import com.tyyy.service.BuildingService;
import com.tyyy.service.ThemeService;
import com.tyyy.util.PageBean;

/** 
 * @author  wangxingye E-mail: 1910004629@qq.com
 * @date 创建时间：2017年1月6日 下午4:10:14 
 * @version 1.0 
*/
@Service("ThemeService")
public class ThemeServiceImpl implements ThemeService{
	@Autowired
	private ThemeMapper themeMapper;
	@Autowired
	private BuildingService buildingService;
	@Override
	public long addTheme(Theme theme) {
		
		long a = themeMapper.insert(theme);
		theme.getId();
		
		return theme.getId();
		
	}

	@Override
	public void delTheme(long id) {
		themeMapper.deleteByPrimaryKey(id);
		System.out.println(id);
		buildingService.delTheme(id);
	}

	@Override
	public PageBean<Theme> selTheme(int page,int row,Theme theme) {
		PageHelper.startPage(page,row);
		List<Theme> ThemeList = themeMapper.selThemeList(theme);

		return new PageBean<>(ThemeList);
	}
	
	@Override
	public int selCount(long id) {
		int a = themeMapper.selCount(id);
		return a;
	}
	@Override
	public int selCount1(long id) {
		int a = themeMapper.selCount1(id);
		return a;
	}

	@Override
	public Theme selThemeById(long id) {
		return themeMapper.selectByPrimaryKey(id);
	}

	@Override
	public void read(long id) {
		themeMapper.read(id);
		
	}

	@Override
	public void delete(long id) {
		themeMapper.delete(id);
		
	}

	@Override
	public void update(Theme theme) {
		themeMapper.updateByPrimaryKeySelective(theme);
		
	}

	@Override
	public void del(long id) {
		themeMapper.del(id);
		
	}

	@Override
	public void read1(long id) {
		themeMapper.read1(id);
	}

	@Override
	public PageBean<Theme> selTheme1(int page, int rows, Theme theme) {
		PageHelper.startPage(page,rows);
		List<Theme> ThemeList = themeMapper.selThemeList1(theme);

		return new PageBean<>(ThemeList);
	}

	@Override
	public int selCount2() {
		return themeMapper.selCount2();
	}


}

package com.tyyy.dao;

import java.util.List;

import com.tyyy.bean.Theme;

public interface ThemeMapper {
    int deleteByPrimaryKey(Long id);
    public List<Theme> selThemeList(Theme theme);

    public List<Theme> selThemeList1(Theme theme);
    public int selCount1(Long id);
    Long insert(Theme record);
    public int selCount(Long id);
    public int selCount2();
    public void read(long id);
    public void delete(Long id);
    int insertSelective(Theme record);
    public void del(Long id);
    Theme selectByPrimaryKey(Long id);
    public void read1(long id);
    int updateByPrimaryKeySelective(Theme record);

    int updateByPrimaryKey(Theme record);
}
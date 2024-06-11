package com.tyyy.util;

import java.util.List;

import com.github.pagehelper.Page;

/** 
 * @author  gycx E-mail: gycxmilkyway@163.com
 * @date ����ʱ�䣺2016��12��28�� ����5:29:52 
 * @version 1.0 
*/
public class PageBean<T> {
	private List<T> list;
	private long total;
	private int pageNum;
	private int pages;
	private int pageSize;
	private int size;
	public PageBean(List<T> list) {
		if(list instanceof Page){
			Page<T> page = (Page<T>) list;
			this.list = page;
			this.total = page.getTotal();		// ��Ŀ
			this.pageNum = page.getPageNum();	//ҳ��
			this.pages = page.getPages();		//ҳ��
			this.pageSize = page.getPageSize();	
			this.size = page.size();
		}
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
}



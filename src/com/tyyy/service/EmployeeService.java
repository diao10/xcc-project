package com.tyyy.service;

import java.util.List;

import com.tyyy.bean.EmpChar;
import com.tyyy.bean.Employee;
import com.tyyy.util.PageBean;

/** 
 * @author  wuwei E-mail:496384622@qq.com
 * @date 创建时间：2016年12月28日 上午10:02:08 
 * @version 1.0 
*/
public interface EmployeeService {
	public PageBean<Employee> selEmployeeAll(int page,int row,Employee employee);
	public void addEmployee(Employee employee);
	public void delEmployee(long id);
	public void updateEmployee(Employee employee);
	public Employee selEmployeeById(long id);
	public Employee login(Employee employee);
	public int selEmpByEid(String emp_Id);
	public int selAdmin(String admin);
	public List<EmpChar> charList();
}


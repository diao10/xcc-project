package com.tyyy.dao;

import java.util.List;

import com.tyyy.bean.EmpChar;
import com.tyyy.bean.Employee;

/** 
 * @author  wuwei E-mail:496384622@qq.com
 * @date ����ʱ�䣺2016��12��28�� ����10:02:08 
 * @version 1.0 
*/
public interface EmployeeMapper {
	public List<Employee> selEmployeeAll( Employee employee);
	public void addEmployee(Employee employee);
	public void delEmployee(long id);
	public void updateEmployee(Employee employee);
	public Employee selEmployeeById(long id);
	public Employee login(Employee employee);
	public int selEmpByEid(String emp_Id);
	public int selAdmin(String admin);
	public List<EmpChar> charList();
}


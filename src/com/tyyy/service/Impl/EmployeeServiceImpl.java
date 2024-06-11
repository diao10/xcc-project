package com.tyyy.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.tyyy.bean.EmpChar;
import com.tyyy.bean.Employee;
import com.tyyy.dao.EmpCharMapper;
import com.tyyy.dao.EmployeeMapper;
import com.tyyy.service.EmployeeService;
import com.tyyy.util.PageBean;

/** 
 * @author  wuwei E-mail:496384622@qq.com
 * @date 创建时间：2016年12月28日 上午10:02:08 
 * @version 1.0 
*/@Service("employeeService")
@Transactional
public class EmployeeServiceImpl implements EmployeeService{
	@Autowired
	private EmployeeMapper employeeMapper;
	@Autowired
	private EmpCharMapper empCharMapper;


	@Override
	public void addEmployee(Employee employee) {
		employeeMapper.addEmployee(employee);
	}

	@Override
	public void delEmployee(long id) {
		employeeMapper.delEmployee(id);
	}

	@Override
	public void updateEmployee(Employee employee) {
		employeeMapper.updateEmployee(employee);
	}

	@Override
	public Employee selEmployeeById(long id) {
		return employeeMapper.selEmployeeById(id);
	}

	@Override
	public PageBean<Employee> selEmployeeAll(int page, int row,Employee employee) {
		PageHelper.startPage(page, row);
		List<Employee> empList=employeeMapper.selEmployeeAll(employee);
		return new PageBean<>(empList);
	}
	

	@Override
	public Employee login(Employee employee) {
		return employeeMapper.login(employee);
	}

	@Override
	public int selEmpByEid(String emp_Id) {
		return employeeMapper.selEmpByEid(emp_Id);
	}

	@Override
	public int selAdmin(String admin) {
		return employeeMapper.selAdmin(admin);
	}

	@Override
	public List<EmpChar> charList() {
		 List<EmpChar> charList=empCharMapper.selEmpCharAll();
		return charList ;
	}


}


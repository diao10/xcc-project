package com.tyyy.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tyyy.bean.EmpChar;
import com.tyyy.bean.Employee;
import com.tyyy.service.DoctorService;
import com.tyyy.service.EmpCharService;
import com.tyyy.service.EmployeeService;
import com.tyyy.util.MakeKey;
import com.tyyy.util.PageBean;

/** 
 * @author  wuwei E-mail:496384622@qq.com
 * @date 创建时间：2016年12月28日 上午10:02:08 
 * @version 1.0 
*/
@Controller
@RequestMapping("/Employee")
public class EmployeeController extends BaseController {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private EmpCharService empCharService;
	@Autowired
	private DoctorService doctorService;
	//查找全部
	@RequestMapping("/selEmployeeAll.emp")
	public Object selEmployeAll(@RequestParam(defaultValue="1") int page,String msgs,@RequestParam(defaultValue="10") int rows,Employee employee,@RequestParam(defaultValue="1") int desc_Type,@RequestParam(defaultValue="3") int date_desc){
		employee.setDesc_Type(desc_Type);
		employee.setDate_desc(date_desc);
		ModelAndView mv=new ModelAndView("employeeSelAll");
		PageBean<Employee> pb=employeeService.selEmployeeAll(page, rows,employee);
		mv.addObject("pb",pb);
		List<EmpChar> el=empCharService.selEmpChar();
		mv.addObject("el", el);
		int begin = 0;
		int end = 0;
		int pages = pb.getPages();
		int length = 6;
		if(pages>10){
			begin = page-3;
			if(begin<=0){
				begin = 1;
			}
			end = length+begin;
			if(end>pages){
				end = pages;
				begin = end -length;
			}
		}else if(pages<=10&&pages>6){
			begin = page-3;
			if(begin<=0){
				begin = 1;
			}
			end = length+begin;
			if(end>pages){
				end = pages;
				begin = end -length;
			}
		}else{
			begin = 1;
			end =pages;
		}
		System.out.println(page);
		System.out.println("11_____"+pages);
		System.out.println( pb.getTotal());
		mv.addObject("begin", begin);
		mv.addObject("end", end);
		mv.addObject("page",page);
		mv.addObject("pages",pages);
		mv.addObject("Totals", pb.getTotal());
		mv.addObject("emp_Name", employee.getEmp_Name());
		mv.addObject("emp_Tel", employee.getEmp_Tel());
		mv.addObject("emp_Address", employee.getEmp_Address());
		mv.addObject("desc_Type", desc_Type);
		mv.addObject("date_desc", date_desc);
		mv.addObject("msg",msgs);
		return mv;
	}
	@RequestMapping("/selEmployeeAll1.emp")
	public Object selEmployeAll1(@RequestParam(defaultValue="1") int page,String msgs,@RequestParam(defaultValue="10") int rows,Employee employee,@RequestParam(defaultValue="1") int desc_Type,@RequestParam(defaultValue="3") int date_desc){
		employee.setDesc_Type(desc_Type);
		employee.setDate_desc(date_desc);
		ModelAndView mv=new ModelAndView("empDoctorSend");
		PageBean<Employee> pb=employeeService.selEmployeeAll(page, rows,employee);
		mv.addObject("pb",pb);
		int begin = 0;
		int end = 0;
		int pages = pb.getPages();
		int length = 6;
		if(pages>10){
			begin = page-3;
			if(begin<=0){
				begin = 1;
			}
			end = length+begin;
			if(end>pages){
				end = pages;
				begin = end -length;
			}
		}else if(pages<=10&&pages>6){
			begin = page-3;
			if(begin<=0){
				begin = 1;
			}
			end = length+begin;
			if(end>pages){
				end = pages;
				begin = end -length;
			}
		}else{
			begin = 1;
			end =pages;
		}
		System.out.println(page);
		System.out.println("11_____"+pages);
		System.out.println( pb.getTotal());
		mv.addObject("begin", begin);
		mv.addObject("end", end);
		mv.addObject("page",page);
		mv.addObject("pages",pages);
		mv.addObject("Totals", pb.getTotal());
		mv.addObject("emp_Name", employee.getEmp_Name());
		mv.addObject("emp_Tel", employee.getEmp_Tel());
		mv.addObject("emp_Address", employee.getEmp_Address());
		mv.addObject("desc_Type", desc_Type);
		mv.addObject("date_desc", date_desc);
		mv.addObject("msg",msgs);
		return mv;
	}
	//删除
	@RequestMapping("/delEmployee.emp")
	public ModelAndView delEmployee(long id){
		String msgs="";
		ModelAndView mv=new ModelAndView("redirect:selEmployeeAll.emp");
		try{
			Employee employee = employeeService.selEmployeeById(id);
			if(employee.getEmp_Char() == 3){
				doctorService.delDoctor(doctorService.selectByEmpId(id).getId());
			}
			employeeService.delEmployee(id);
			msgs="dyes";
		}
		catch(Exception e){
			msgs="dno";
		}
		mv.addObject("msgs",msgs);
		return mv;
	}
	//添加
	@RequestMapping("/addEmployee.emp")
	public ModelAndView addEmployee(Employee employee){
		String msgs="";
		String key = MakeKey.makeKey();
		employee.setEmp_Id(key);
		ModelAndView mv=new ModelAndView("redirect:selEmployeeAll.emp");
		try{
			employeeService.addEmployee(employee);
			msgs="ayes";
		}
		catch(Exception e){
			msgs="ano";
		}
		mv.addObject("msgs",msgs);
		return mv;
	}
	//修改
	@RequestMapping("/updateEmployee.emp")
	public ModelAndView updateEmployee(Employee employee){
		String msgs="";
		ModelAndView mv=new ModelAndView("redirect:selEmployeeAll.emp");
		try{
			employeeService.updateEmployee(employee);
			msgs="uyes";
		}
		catch(Exception e){
			msgs="uno";
		}
		mv.addObject("msgs",msgs);
		return mv;
	}
	@RequestMapping("/updateEmployeeMySelf.emp")
	public ModelAndView updateEmployeeMySelf(Employee employee,HttpServletRequest request){
		String msgs="";
		ModelAndView mv=new ModelAndView("forward:/Login/employeeLogin.emp");
		try{
			Employee oldEmp = employeeService.selEmployeeById(employee.getId());
			employee.setEmp_Char(oldEmp.getEmp_Char());
			employeeService.updateEmployee(employee);
			Employee newEmp = employeeService.selEmployeeById(employee.getId());
			System.out.println("gggg:"+newEmp);
			request.setAttribute("empOld", newEmp);
			//mv.addObject("employee",newEmp);
			msgs="uyes";
		}
		catch(Exception e){
			msgs="uno";
		}
		mv.addObject("msgs",msgs);
		return mv;
	}
	//通过ID查找
	@ResponseBody
	@RequestMapping("/selEmployeeById.emp")
	public  Map<Object,Object> selEmployeeById(@RequestParam("id") int id){
		Employee emp=employeeService.selEmployeeById(id);
		Map<Object,Object> map=new HashMap<>();
		map.put("emp", emp);
		return map;
	}
	//用户名验证
	@ResponseBody
	@RequestMapping("/admin.emp")
	public String emailT(String admin){
		int i = employeeService.selAdmin(admin);
		String msg = "ok";
		if(i>0){
			msg = "error";
		}
		return msg;
	}
}



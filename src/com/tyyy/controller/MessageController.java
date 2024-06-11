package com.tyyy.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.sun.beans.editors.LongEditor;
import com.sun.beans.editors.StringEditor;
import com.tyyy.bean.Employee;
import com.tyyy.bean.MemLevel;
import com.tyyy.bean.Member;
import com.tyyy.bean.Message;
import com.tyyy.service.MemLevelService;
import com.tyyy.service.MemberService;
import com.tyyy.service.MessageService;
import com.tyyy.service.ThemeService;
import com.tyyy.util.IntegerEditor;
import com.tyyy.util.PageBean;

/** 
 * @author  wangxingye E-mail: 1910004629@qq.com
 * @date 创建时间：2017年1月10日 下午12:04:13 
 * @version 1.0 
*/

@Controller
@SessionAttributes({"employeeSession","memLogin","messageCount"})
@RequestMapping("/message")
public class MessageController extends BaseController{
	@Autowired
	private MessageService messageService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemLevelService memLevelService;
	@Autowired
	private ThemeService themeService;
	@Autowired
	private MemberService mema;
	//会员前台 查 （只能看自己的）
	@RequestMapping("/selMessage.do")
	public ModelAndView selMessage(@RequestParam(defaultValue="1")int page ,@RequestParam(defaultValue="10")int rows,@ModelAttribute("memLogin")Member mem,ModelMap map1){
		
		PageBean pb = messageService.selTheme(page, rows,mem.getId());
		Map<String, Object> map = new HashMap<>();
		List<Message> li=pb.getList();
		System.out.println(li);
		int b = themeService.selCount(mem.getId());
		int a = messageService.selCount(mem.getId());
		ModelAndView mv= new ModelAndView("memMessageB");
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
		mv.addObject("type",1);
		mv.addObject("begin", begin);
		mv.addObject("end", end);
		mv.addObject("mess",a);
		mv.addObject("theme",b);
		mv.addObject("page", page);
		mv.addObject("pages", pages);
		mv.addObject("rows", pb.getSize());
		mv.addObject("list", pb.getList());
		
		mv.addObject("thispage", pb.getPageNum());
		mv.addObject("letter",a);
		map1.addAttribute(a);
	    return mv;
	}
	
	@RequestMapping("/doctorSelMessage.do")
	public ModelAndView selMessage1(@RequestParam(defaultValue="1")int page ,@RequestParam(defaultValue="10")int rows,@ModelAttribute("memLogin")Member mem,ModelMap map1){
		
		PageBean pb = messageService.selTheme1(page, rows,mem.getId());
		Map<String, Object> map = new HashMap<>();
		List<Message> li=pb.getList();
	
		int b = themeService.selCount1(mem.getId());
		int a = messageService.selCount(mem.getId());
		ModelAndView mv= new ModelAndView("memMessageD");
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
		mv.addObject("type",2);
		mv.addObject("begin", begin);
		mv.addObject("end", end);
		mv.addObject("mess",a);
		mv.addObject("theme",b);
		mv.addObject("page", page);
		mv.addObject("pages", pages);
		mv.addObject("rows", pb.getSize());
		mv.addObject("list", pb.getList());
	
		mv.addObject("thispage", pb.getPageNum());
		mv.addObject("letter",a);
		map1.addAttribute(a);
	    return mv;
	}
	//员工查找（全查可条件查询 ）
	@RequestMapping("/selMessage.emp")
	public ModelAndView empSelMessage( String msgs,@RequestParam(defaultValue="1")int page ,@RequestParam(defaultValue="5")int rows,@ModelAttribute("employeeSession")Employee mem,Message mess){
		
		// 超级管理员以及管理员跳过此项检查
		if(mem.getEmp_Char() != 1 && mem.getEmp_Char() != 2){
			mess.setMessMemId(mem.getId());
		}
		PageBean pb = messageService.empSelMessAll(page, rows, mess);
		if(page > pb.getPages()){
			page=1;
		}
		ModelAndView mv= new ModelAndView("empMessage");
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
		
		mv.addObject("mess",mess);
		mv.addObject("begin", begin);
		mv.addObject("end", end);
		mv.addObject("page", page);
		mv.addObject("pages", pages);
		mv.addObject("rows", pb.getSize());
		mv.addObject("list", pb.getList());
		mv.addObject("type",1);
		mv.addObject("thispage", pb.getPageNum());
		mv.addObject("msg", msgs);
		
	    return mv;
	}
	//会员前台按id查找
	@ResponseBody
	@RequestMapping("/selMessageById.do")
	public Object selMessageone(@RequestParam("id")int id ){
		long id1 = id;
		
		messageService.read(id1);
		Message mess = messageService.selMessageById(id1);
		Map<String, Message> map = new HashMap<>();
		map.put("mess", mess);
		return map;
	}
	//员工的按id查找
	@ResponseBody
	@RequestMapping("/selMessageById.emp")
	public Object selMessageoneA(@RequestParam("id")int id ){
		long id1 = id;
		messageService.read1(id1);
		Message mess = messageService.selMessageById(id1);
		Map<String, Object> map = new HashMap<>();
		map.put("map", mess);
		return map;
	}
	
	//查询所有级别
	@ResponseBody
	@RequestMapping("/sendMsgPage.emp")
	public Object sendMsgPage(@ModelAttribute("employeeSession")Employee emp){
		List<MemLevel> levelList =  memLevelService.selectMemLevelList();
		Map<String, Object> map = new HashMap<>();
		map.put("list", levelList);
		return map;
	}
	
	//查询所有级别
	@ResponseBody
	@RequestMapping("/changeMemLvl.emp")
	public Object changeMemLvl(@ModelAttribute("employeeSession")Employee emp, @RequestParam("lid")long lid){
		long min = 0;
		long max = 0;
		List<MemLevel> levelList =  memLevelService.selectMemLevelList();
		for (MemLevel memLevel : levelList) {
			if(memLevel.getId() == lid){
				min = memLevel.getLevelMin();
				max = memLevel.getLevelMax();
				break;
			}
		}
		List<Member> memberList = memberService.selMemberByX(emp.getEmp_Id());
		Iterator<Member> it = memberList.iterator();
		while(it.hasNext()){
			Member member = it.next();
			if(member.getIntegral() >= min && member.getIntegral() <= max){
				continue;
			}
			it.remove();
		}
		Map<String, Object> map = new HashMap<>();
		map.put("list", memberList);
		return map;
	}
	
	
	
	@ResponseBody
	@RequestMapping("/read.do")
	public String readsad(@RequestParam("id")int id ){
		
		long id1 = id;
		messageService.read(id1);
		return "ok";
	}
	@RequestMapping("/update.emp")
	public ModelAndView read1(Message mess){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:/message/selMessage.emp");
		try {
			msgs="uyes";
			messageService.update(mess);
		} catch (Exception e) {
			// TODO: handle exception
			msgs="uno";
		}
		mv.addObject("msgs", msgs);
	    return mv;
	}
	//添加方法
	@RequestMapping("/add.emp")
	public ModelAndView add(Message mess,
			@ModelAttribute("employeeSession")Employee mem, 
			@RequestParam("memId")long memId){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:/message/selMessage.emp");
		try {
			Member member = memberService.selectByPrimaryKey(memId);
			mess.setMessMemId(mem.getId());
			mess.setMessMemName(mem.getEmp_Name());
			mess.setAccpId(memId);
			mess.setAccpName(member.getMemName());
			messageService.add(mess);
			msgs="ayes";
		} catch (Exception e) {
			// TODO: handle exception
			msgs="ano";
		}
		mv.addObject("msgs", msgs);
	    return mv;	
	}
	@RequestMapping("/add.do")
	public ModelAndView addw(Message mess,@ModelAttribute("memLogin")Member mem,@RequestParam("sid")long sid){
		mess.setMessMemId(mem.getId());
		mess.setMessMemName(mem.getMemName());

		Member emp = mema.selectByPrimaryKey(sid);

		mess.setAccpId(emp.getId());
		mess.setAccpName(emp.getMemName());
		
		messageService.add(mess);
		ModelAndView mv = new ModelAndView("redirect:/MemClass/selMemClassAll.do");
	
	    return mv;	
	}
	@RequestMapping("/delMsg.do")
	public ModelAndView delMsg(@RequestParam("id") long id){
		ModelAndView mv = new ModelAndView("memInfo");
		messageService.delete(id);
		return mv;
	}
	
	@RequestMapping("/selMsg.do")
	public ModelAndView selMsg(@RequestParam(defaultValue="1")int page ,@RequestParam(defaultValue="10")int rows,@ModelAttribute("memLogin")Member mem){
		PageBean pb = messageService.selTheme(page, rows,mem.getId());
		int b = themeService.selCount(mem.getId());
		int a = messageService.selCount(mem.getId());
		ModelAndView mv= new ModelAndView("memInfo");
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
		mv.addObject("type",1);
		mv.addObject("begin", begin);
		mv.addObject("end", end);
		mv.addObject("mess",a);
		mv.addObject("theme",b);
		mv.addObject("page", page);
		mv.addObject("pages", pages);
		mv.addObject("rows", pb.getSize());
		mv.addObject("list", pb.getList());
		
		mv.addObject("thispage", pb.getPageNum());
		mv.addObject("letter",a);
		mv.addObject("htmlName", "memInfo");
	    return mv;
	}
	
	@ResponseBody
	@RequestMapping("/add1.emp")
	public String add1(Message mess,@ModelAttribute("employeeSession")Employee mem,@RequestParam("sid")long sid){
		Member emp = mema.selectByPrimaryKey(sid);
		mess.setMessMemId(mem.getId());
		mess.setMessMemName(mem.getEmp_Name());
		
		mess.setAccpId(emp.getId());
		mess.setAccpName(emp.getMemName());
		messageService.add(mess);
	
	
	    return "ok";	
	}
	//删除（员工 权限）
	@RequestMapping("/delete.emp")
	public ModelAndView del(@RequestParam("id")long id){
		String msgs="";
		ModelAndView mv = new ModelAndView("redirect:/message/selMessage.emp");
		try {
			messageService.delete(id);
			msgs="dyes";
		} catch (Exception e) {
			// TODO: handle exception
			msgs="dno";
		}
		mv.addObject("msgs", msgs);
		    return mv;	
		}
	
}

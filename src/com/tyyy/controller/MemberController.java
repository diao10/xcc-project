package com.tyyy.controller;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.internal.lang.annotation.ajcDeclareAnnotation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tyyy.bean.Employee;
import com.tyyy.bean.Fz;
import com.tyyy.bean.MemClass;
import com.tyyy.bean.MemLevel;
import com.tyyy.bean.Member;
import com.tyyy.service.EmployeeService;
import com.tyyy.service.FzService;
import com.tyyy.service.MemberService;
import com.tyyy.service.TisService;
import com.tyyy.util.MailUtil;
import com.tyyy.util.MakeKey;
import com.tyyy.util.PageBean;

import sun.misc.BASE64Encoder;

/** 
 * @author  siyong E-mail: ve_master@sina.com
 * @date 创建时间：2017年1月4日 上午11:22:16 
 * @version 1.0 
*/
@Controller
@SessionAttributes({"employeeSession","empChar","memLogin"})
@RequestMapping("/Member")
public class MemberController extends BaseController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private FzService fzService;
	
	@RequestMapping("/saveTemp.do")
	public ModelAndView saveTemp(Member member,ModelMap map){
		ModelAndView mv = new ModelAndView("memIndex");
		int i = memberService.selReferrer(member.getReferrerId());
		String msg = "ok";
		if(i==0){
			i = employeeService.selEmpByEid(member.getReferrerId());
			if(i==0){
				msg = "error";
			}
		}
		int i2 = memberService.selEmail(member.getMemEmail());
		System.out.println(i+"----"+i2);
		if(msg.equals("error")){
			mv.addObject("msg", "LoginFailedForReferrerId");
		}else if(i2>0){
			mv.addObject("msg", "LoginFailedForEmail");
		}else{
			String key = MakeKey.makeKey();
			member.setMemId(key);
			member.setFiled1("no");
			memberService.insert(member);
			long id = memberService.selMemBerIdByMail(member.getMemEmail());
			try {
				Properties pps = new Properties();
				InputStream in = this.getClass().getClassLoader().getResourceAsStream(
						"mail.properties");
				pps.load(in);
				String fromMail = pps.getProperty("mail.fromMail");
				String user = pps.getProperty("mail.user");
				String pwd = pps.getProperty("mail.pwd");
				String domain = pps.getProperty("mail.domain");
				//<a href='"+domain+"Member/activateMail.do?id="+id+"'>点击激活</a>
				MailUtil.sendMail(fromMail, user, pwd, member.getMemEmail(), "天蕴药业账号激活邮件", ""
						+ "[天蕴私人医生管家]邮箱激活<br><br><br>"
						+ "亲爱的用户：<br><br><br>"
						+ "欢迎你使用邮箱验证功能，感谢您加入天蕴私人医生管家，我们将时刻为您的健康保驾护航！<br><br>"
						+ "请点击以下链接完成验证（链接24小时内有效）：<br><br>"
						+ "<a href='"+domain+"Member/activateMail.do?id="+id+"'>"+domain+"Member/activateMail.do?id="+id+"</a><br><br>"
						+ "如果以上链接不可点击，可以尝试将链接拷贝至浏览器地址栏进入相应页面。<br><br>"
						+ "天蕴私人医生管家平台<br><br>"
						+ "(本邮件由系统自动发送，请勿回复。)");
				mv.addObject("title", "注册成功，快去激活你的健康平台");
				mv.addObject("msg", "一封注册邮件已发送至你的邮箱：<span class='mail' id='remail'>"+member.getMemEmail()+"</span><br>"
					+"点击邮件里的链接确认即可登录，快去查看邮件吧！");
				mv.addObject("mmOK","y");
				
			} catch (Exception e) {
				mv.addObject("title", "注册失败");
				mv.addObject("msg", "请到检查注册邮箱！");
				e.printStackTrace();
			}
			mv.setViewName("msg");
		}
		return mv;
	}
	@ResponseBody
	@RequestMapping("/selMemberById.do")
	public Map< Object, Object> selMemberById(@RequestParam("id") long id){
		Map< Object, Object> memMap1=new HashMap<Object, Object>();
		Member mems	=memberService.selectByPrimaryKey(id);
		memMap1.put("mems", mems);
		return memMap1;
	}
	@RequestMapping("/activateMail.do")
	public ModelAndView activateMail(ModelMap modelMap,long id){
		ModelAndView mv = new ModelAndView("memIndex");
		Member memTemp = memberService.selectByPrimaryKey(id);
		System.out.println(memTemp);
		if(memTemp!=null){
			memTemp.setMemLevel(5);
			memTemp.setMemPoint(0); // 注册时会员点数为0
			memTemp.setMemIntegral(0); // 注册时会员积分为0
			memTemp.setFiled1("yes");
			memberService.updateByPrimaryKey(memTemp);
			Member memLogin = memberService.login(memTemp.getMemEmail(), memTemp.getMemPwd());
			modelMap.addAttribute("memLogin", memLogin);
			Fz fz = fzService.selFzAllById(1);
			long lTemp = Long.parseLong(fz.getCd());
			lTemp++;
			fz.setCd(lTemp+"");
			fzService.updateByPrimaryKey(fz);
			List<Fz> fzz = fzService.selFzAll();
			modelMap.addAttribute("fz", fzz);
		}else{
			mv.setViewName("msg");
			mv.addObject("title", "激活失败~！");
			mv.addObject("msg", "请重新注册~！");
		}
		return mv;
	}
	@RequestMapping("/forgetMail.do")
	public ModelAndView forgetMail(String mail){
		ModelAndView mv = new ModelAndView("forgetPwd");
		mv.addObject("forgetTid", "1");
		if(mail!=null&&!mail.equals("")){
			int i = memberService.selEmail(mail);
			if(i==0){
				mv.addObject("error", "不存在的邮箱");
			}else{
				mv.addObject("forgetTid", "2");
				try {
					Properties pps = new Properties();
					InputStream in = this.getClass().getClassLoader().getResourceAsStream(
							"mail.properties");
					pps.load(in);
					String fromMail = pps.getProperty("mail.fromMail");
					String user = pps.getProperty("mail.user");
					String pwd = pps.getProperty("mail.pwd");
					String domain = pps.getProperty("mail.domain");
					long tempTime = new Date().getTime();
					MailUtil.sendMail(fromMail, user, pwd, mail, "天蕴药业密码找回邮件", ""
							+ "[天蕴私人医生管家]找回密码<br><br><br>"
							+ "亲爱的用户：<br><br><br>"
							+ "欢迎你使用邮箱密码找回功能，感谢您加入天蕴私人医生管家，我们将时刻为您的健康保驾护航！<br><br>"
							+ "请点击重新设置密码（链接24小时内有效）：<br><br>"
							+ "<a href='"+domain+"Member/activateForget.do?forgetTemp="+tempTime+"&fMail="+mail+"'>点击重新设置密码</a><br><br>"
							+ "天蕴私人医生管家平台<br><br>"
							+ "(本邮件由系统自动发送，请勿回复。)");
					mv.addObject("msg", "邮件发送成功，请登录注册邮箱完成密码修改。");
					Member member = memberService.selMemBerByMail(mail);
					member.setFiled2(tempTime+"");
					memberService.updateByPrimaryKey(member);
				} catch (Exception e) {
					mv.addObject("msg", "邮件发送失败，请检查邮箱。");
					e.printStackTrace();
				}
			}
		}else{
			mv.addObject("error", "邮箱不能为空");
		}
		return mv;
	}
	
	@RequestMapping("/activateForget.do")
	public ModelAndView activateForget(String forgetTemp,String fMail,HttpServletRequest request){
		ModelAndView mv = new ModelAndView("forgetPwd");
		Member member = memberService.selMemBerByMail(fMail);
		//String sessionForget = (String) request.getSession().getAttribute("forgetTemp");
		if(member.getFiled2()!=null&&forgetTemp.equals(member.getFiled2())){
			mv.addObject("forgetTid", 3);
			long memId = memberService.selMemBerIdByMail(fMail);
			mv.addObject("id", memId);
		}else{
			mv.addObject("forgetTid", 2);
			mv.addObject("msg", "错误，请重新验证！");
		}
		return mv;
	}
	
	@RequestMapping("/updatePwdByForget.do")
	public ModelAndView updatePwdByForget(Member member){
		ModelAndView mv = new ModelAndView("forgetPwd");
		mv.addObject("forgetTid", 4);
		if(member!=null&&member.getId()!=0){
			memberService.updateByPrimaryKeySelective(member);
			mv.addObject("msg", "恭喜您，修改成功！");
		}else{
			mv.addObject("msg", "错误，请重新验证！");
		}
		return mv;
	}
	
	@RequestMapping("/upload.do")
	public String upload(@RequestParam(value="file")MultipartFile[] files,HttpServletRequest request){
		for (MultipartFile file : files) {
			String filename = file.getOriginalFilename();
			System.out.println(request.getServletContext().getRealPath("/upload"));
			System.out.println(filename);
			File newFile = new File(request.getServletContext().getRealPath("/upload"), filename);
			if(!newFile.exists()){
				newFile.mkdirs();
			}
			try {
				file.transferTo(newFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "memMain";
	}
	@RequestMapping("/download")
	public void download(int id,HttpServletResponse response){
		File file = new File("e:/upload/hj1.jpg");
		//这句代码是必须的（输出的是图片文件）
		response.setContentType("image/jpg");
		//以下代码非必须
		response.setDateHeader("Expires", 0);
		response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
		try {
			FileInputStream fis = new FileInputStream(file);
			DataInputStream dis = new DataInputStream(fis);
			OutputStream out = response.getOutputStream();
			
			byte [] buffer = new byte[1024];
			new BASE64Encoder().encode(buffer); 
			int i = dis.read(buffer);
			while(i!=-1){
				out.write(buffer, 0, i);
				i = dis.read(buffer);
			}
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@ResponseBody
	@RequestMapping("/getInsertingEmpN.emp")
	public Map<String, Object> getInsertingEmpN(String referrerId){
		Map<String, Object> map =memberService.selMemForEmpN(referrerId);
		return map;
	}
	@ResponseBody
	@RequestMapping("/getInsertingEmpC.emp")
	public Map<String, Object> getInsertingEmpC(long memId){
		Map<String, Object> map =memberService.selMemForEmpC(memId);
		return map;
	}
	@ResponseBody
	@RequestMapping("/getInsertingMem.do")
	public Map<String, Object> getInsertingMem(String referrerId,long id){
		Map<String, Object> map = memberService.selMemForMem(referrerId,id);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/emailValidate.do")
	public String emailValidate(String email){
		int i = memberService.selEmail(email);
		String msg = "ok";
		if(i>0){
			msg = "error";
		}
		return msg;
	}
	@ResponseBody
	@RequestMapping("/referrerValidate.do")
	public String referrerValidate(String referrer){
		int i = memberService.selReferrer(referrer);
		String msg = "ok";
		if(i==0){
			int j = employeeService.selEmpByEid(referrer);
			if(j==0){
				msg = "error";
			}
		}
		return msg;
	}
	@RequestMapping("/updateMemberBySelf.do")
	public ModelAndView updateMemberBySelf(Member member,ModelMap modelMap){
		Member oldMember = memberService.selectByPrimaryKey(member.getId());
		oldMember.setMemAddress(member.getMemAddress());
		oldMember.setMemBirth(member.getMemBirth());
		oldMember.setMemGender(member.getMemGender());
		oldMember.setMemName(member.getMemName());
		oldMember.setMemTel(member.getMemTel());
		oldMember.setFiled1(member.getFiled1());
		oldMember.setFiled2(member.getFiled2());
		memberService.updateByPrimaryKeySelective(oldMember);
		modelMap.addAttribute("memLogin", oldMember);
		ModelAndView mv=new ModelAndView("memIndex");
		mv.addObject("msg", "updateOK");
		return mv;
	}
	@RequestMapping("/updatePwdBySelf.do")
	public ModelAndView updatePwdBySelf(long id,String oldPwd,String newPwd1,ModelMap modelMap){
		Member oldMember = memberService.selectByPrimaryKey(id);
		ModelAndView mv=new ModelAndView();
		if(oldMember.getMemPwd().equals(oldPwd)){
			oldMember.setMemPwd(newPwd1);			
			memberService.updateByPrimaryKeySelective(oldMember);
			modelMap.addAttribute("memLogin", oldMember);
			mv.addObject("msg", "pwdOK");
			mv.setViewName("redirect:../view/memIndex.html");
		}else{
			mv.setViewName("memIndex");			
			mv.addObject("msg","pwdError");
		}
		return mv;
	}
	
	@RequestMapping("/selMemberAll.emp")
	public ModelAndView selMemberAll(String msgs,@RequestParam(defaultValue="1") int page,@ModelAttribute("employeeSession")Employee mem,
			@RequestParam(defaultValue="10") int rows,Member member,@RequestParam(defaultValue="1") int desc_Type,@RequestParam(defaultValue="3") int date_desc){
		// 员工登陆切不为超级管理员或管理员
		if(mem != null && mem.getEmp_Char() != 1 && mem.getEmp_Char() != 2){
			member.setReferrerId(mem.getEmp_Id());
		}
		ModelAndView mv=new ModelAndView("empMemberSelAll");
		PageBean<Member> pb=memberService.selMemberAll(page, rows,member);
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
		
		mv.addObject("pb",pb);
		mv.addObject("begin", begin);
		mv.addObject("memName", member.getMemName());
		mv.addObject("memLevelName", member.getMemLevelName());
		mv.addObject("end", end);
		mv.addObject("page",page);
		mv.addObject("pages",pages);
		mv.addObject("Totals", pb.getTotal());
		mv.addObject("desc_Type", desc_Type);
		mv.addObject("date_desc", date_desc);
		mv.addObject("msg", msgs);
		return mv;
	}
	@RequestMapping("/selMem.emp")
	public ModelAndView selMem(String msgs,@RequestParam(defaultValue="1") int page,@RequestParam(defaultValue="10") int rows,Member member){
		ModelAndView mv=new ModelAndView("empHHHealth");
		PageBean<Member> pb=memberService.selMem(page, rows, member);
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
		
		mv.addObject("pb",pb);
		mv.addObject("begin", begin);
		mv.addObject("memName", member.getMemName());
		mv.addObject("end", end);
		mv.addObject("page",page);
		mv.addObject("pages",pages);
		mv.addObject("Totals", pb.getTotal());
		mv.addObject("msg", msgs);
		return mv;
	}
	@RequestMapping("/addMember.emp")
	public ModelAndView addMeber(Member member){
		String msgs="";
		ModelAndView mv=new ModelAndView("redirect:selMemberAll.emp");
		try {
			String key = MakeKey.makeKey();
			member.setMemId(key);
			member.setMemPoint(0);
			member.setMemIntegral(0);
			memberService.insert(member);
			msgs="ayes";
		} catch (Exception e) {
			// TODO: handle exception
			msgs="ano";
			}
		mv.addObject("msgs", msgs);
		return mv;
	}
	@RequestMapping("/delMember.emp")
	public ModelAndView delMember(@RequestParam("id") long id){
		String msgs="";
		ModelAndView mv=new ModelAndView("redirect:selMemberAll.emp");
		try {
			memberService.deleteByPrimaryKey(id);
			msgs="dyes";
		} catch (Exception e) {
			// TODO: handle exception
			msgs="dno";
			}
		mv.addObject("msgs", msgs);
		return mv;
	}
	@ResponseBody
	@RequestMapping("/selMemberById.emp")
	public Map< Object, Object> updateMember(@RequestParam("id") long id){
		Map< Object, Object> memMap=new HashMap<Object, Object>();
		Member mem	= memberService.selectByPrimaryKey(id);
		memMap.put("mem", mem);
		return memMap;
	}
	@RequestMapping("/updateMember.emp")
	public ModelAndView updateMeber(Member member){
		System.out.println(member);
		String msgs="";
		ModelAndView mv=new ModelAndView("redirect:selMemberAll.emp");
		try {
			memberService.updateByPrimaryKey(member);
			//设置积分等级
			Member m2=memberService.selCnByClass(member);
			List<MemClass> list=m2.getMemClassList();
			int cid=(int) list.get(0).getId();
			String ccn=list.get(0).getClassName();
			member.setMemClass(cid);
			member.setMemClassName(ccn);
			System.out.println(cid+"======="+ccn);
			//设置职阶
			Member m3=memberService.selLl(member);
			List<MemLevel> list2=m3.getLevelList();
			int lid=(int) list2.get(0).getId();
			String ln=list2.get(0).getLevelName();
			member.setMemLevel(lid);
			member.setMemLevelName(ln);
			System.out.println(lid+"+++++"+ln);
			System.out.println("1--------"+member);
			memberService.updateClass(member);
			msgs="uyes";
		} catch (Exception e) {
			e.printStackTrace();
			msgs="uno";
		}
		mv.addObject("msgs", msgs);
		return mv;
	}
	//递归加积分
	@RequestMapping("/saveIntegral.emp")
	public ModelAndView saveIntegral(Member member){
		String msgs="";
		ModelAndView mv=new ModelAndView("redirect:selMemberAll.emp");
		try {
			if(member.getAmtype()==1){
				member.setMemIntegral(member.getMemIntegral()+member.getIntegral());
				member.setMemPoint(member.getMemPoint()+member.getIntegral());
				memberService.updateMemIntegral(member);
				
				//设置积分等级
				Member m2=memberService.selCn(member);
				List<MemClass> list=m2.getMemClassList();
				int cid=(int) list.get(0).getId();
				String ccn=list.get(0).getClassName();
				if(cid > member.getMemClass()){
					member.setMemClass(cid);
					member.setMemClassName(ccn);
				}
				//设置职阶
				Member m3=memberService.selLl(member);
				List<MemLevel> list2=m3.getLevelList();
				int lid=(int) list2.get(0).getId();
				String ln=list2.get(0).getLevelName();
				member.setMemLevel(lid);
				member.setMemLevelName(ln);
				// 更新会员等级
				memberService.updateClass(member);
//				memberService.addMemIntegral(member.getReferrerId(),member.getIntegral());
			}else{
					if(member.getMemIntegral()-member.getIntegral()<=0){
						member.setMemIntegral(0);
					}else{
						member.setMemIntegral(member.getMemIntegral()-member.getIntegral());
					}
					if(member.getMemPoint()-member.getIntegral()<=0){
						member.setMemPoint(0);
					}else{
						member.setMemPoint(member.getMemPoint()-member.getIntegral());
					}
					memberService.updateMemIntegral(member);
					
					//设置积分等级
					Member m2=memberService.selCn(member);
					List<MemClass> list=m2.getMemClassList();
					int cid=(int) list.get(0).getId();
					String ccn=list.get(0).getClassName();
					if(cid > member.getMemClass()){
						member.setMemClass(cid);
						member.setMemClassName(ccn);
					}
					//设置职阶
					Member m3=memberService.selLl(member);
					List<MemLevel> list2=m3.getLevelList();
					int lid=(int) list2.get(0).getId();
					String ln=list2.get(0).getLevelName();
					member.setMemLevel(lid);
					member.setMemLevelName(ln);
					memberService.updateClass(member);
			}
			msgs="uyes";
		} catch (Exception e) {
			// TODO: handle exception
			msgs="uno";
			}
		mv.addObject("msgs", msgs);
		return mv;
	}
	//验证码验证
	@ResponseBody
	@RequestMapping("/referrerIdT.emp")
	public String referrerIdT(String referrer){
		System.out.println(referrer);
		int i = memberService.selReferrer(referrer);
		String msg = "ok";
		if(i==0){
			int j = employeeService.selEmpByEid(referrer);
			if(j==0){
				msg = "error";
			}
		}
		return msg;
	}
	//邮箱验证
	@ResponseBody
	@RequestMapping("/emailT.emp")
	public String emailT(String email){
		System.out.println(email);
		int i = memberService.selEmail(email);
		String msg = "ok";
		if(i>0){
			msg = "error";
		}
		return msg;
	}
	//修改邮箱验证
		@ResponseBody
		@RequestMapping("/emailU.emp")
		public String emailU(String email){
			System.out.println(email);
			int i = memberService.selEmail(email);
			String msg = "ok";
			if(i>1){
				msg = "error";
			}
			return msg;
		}
}

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
 * @date ����ʱ�䣺2017��1��4�� ����11:22:16 
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
				//<a href='"+domain+"Member/activateMail.do?id="+id+"'>�������</a>
				MailUtil.sendMail(fromMail, user, pwd, member.getMemEmail(), "����ҩҵ�˺ż����ʼ�", ""
						+ "[����˽��ҽ���ܼ�]���伤��<br><br><br>"
						+ "�װ����û���<br><br><br>"
						+ "��ӭ��ʹ��������֤���ܣ���л����������˽��ҽ���ܼң����ǽ�ʱ��Ϊ���Ľ������ݻ�����<br><br>"
						+ "�����������������֤������24Сʱ����Ч����<br><br>"
						+ "<a href='"+domain+"Member/activateMail.do?id="+id+"'>"+domain+"Member/activateMail.do?id="+id+"</a><br><br>"
						+ "����������Ӳ��ɵ�������Գ��Խ����ӿ������������ַ��������Ӧҳ�档<br><br>"
						+ "����˽��ҽ���ܼ�ƽ̨<br><br>"
						+ "(���ʼ���ϵͳ�Զ����ͣ�����ظ���)");
				mv.addObject("title", "ע��ɹ�����ȥ������Ľ���ƽ̨");
				mv.addObject("msg", "һ��ע���ʼ��ѷ�����������䣺<span class='mail' id='remail'>"+member.getMemEmail()+"</span><br>"
					+"����ʼ��������ȷ�ϼ��ɵ�¼����ȥ�鿴�ʼ��ɣ�");
				mv.addObject("mmOK","y");
				
			} catch (Exception e) {
				mv.addObject("title", "ע��ʧ��");
				mv.addObject("msg", "�뵽���ע�����䣡");
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
			memTemp.setMemPoint(0); // ע��ʱ��Ա����Ϊ0
			memTemp.setMemIntegral(0); // ע��ʱ��Ա����Ϊ0
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
			mv.addObject("title", "����ʧ��~��");
			mv.addObject("msg", "������ע��~��");
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
				mv.addObject("error", "�����ڵ�����");
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
					MailUtil.sendMail(fromMail, user, pwd, mail, "����ҩҵ�����һ��ʼ�", ""
							+ "[����˽��ҽ���ܼ�]�һ�����<br><br><br>"
							+ "�װ����û���<br><br><br>"
							+ "��ӭ��ʹ�����������һع��ܣ���л����������˽��ҽ���ܼң����ǽ�ʱ��Ϊ���Ľ������ݻ�����<br><br>"
							+ "���������������루����24Сʱ����Ч����<br><br>"
							+ "<a href='"+domain+"Member/activateForget.do?forgetTemp="+tempTime+"&fMail="+mail+"'>���������������</a><br><br>"
							+ "����˽��ҽ���ܼ�ƽ̨<br><br>"
							+ "(���ʼ���ϵͳ�Զ����ͣ�����ظ���)");
					mv.addObject("msg", "�ʼ����ͳɹ������¼ע��������������޸ġ�");
					Member member = memberService.selMemBerByMail(mail);
					member.setFiled2(tempTime+"");
					memberService.updateByPrimaryKey(member);
				} catch (Exception e) {
					mv.addObject("msg", "�ʼ�����ʧ�ܣ��������䡣");
					e.printStackTrace();
				}
			}
		}else{
			mv.addObject("error", "���䲻��Ϊ��");
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
			mv.addObject("msg", "������������֤��");
		}
		return mv;
	}
	
	@RequestMapping("/updatePwdByForget.do")
	public ModelAndView updatePwdByForget(Member member){
		ModelAndView mv = new ModelAndView("forgetPwd");
		mv.addObject("forgetTid", 4);
		if(member!=null&&member.getId()!=0){
			memberService.updateByPrimaryKeySelective(member);
			mv.addObject("msg", "��ϲ�����޸ĳɹ���");
		}else{
			mv.addObject("msg", "������������֤��");
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
		//�������Ǳ���ģ��������ͼƬ�ļ���
		response.setContentType("image/jpg");
		//���´���Ǳ���
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
		// Ա����½�в�Ϊ��������Ա�����Ա
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
			//���û��ֵȼ�
			Member m2=memberService.selCnByClass(member);
			List<MemClass> list=m2.getMemClassList();
			int cid=(int) list.get(0).getId();
			String ccn=list.get(0).getClassName();
			member.setMemClass(cid);
			member.setMemClassName(ccn);
			System.out.println(cid+"======="+ccn);
			//����ְ��
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
	//�ݹ�ӻ���
	@RequestMapping("/saveIntegral.emp")
	public ModelAndView saveIntegral(Member member){
		String msgs="";
		ModelAndView mv=new ModelAndView("redirect:selMemberAll.emp");
		try {
			if(member.getAmtype()==1){
				member.setMemIntegral(member.getMemIntegral()+member.getIntegral());
				member.setMemPoint(member.getMemPoint()+member.getIntegral());
				memberService.updateMemIntegral(member);
				
				//���û��ֵȼ�
				Member m2=memberService.selCn(member);
				List<MemClass> list=m2.getMemClassList();
				int cid=(int) list.get(0).getId();
				String ccn=list.get(0).getClassName();
				if(cid > member.getMemClass()){
					member.setMemClass(cid);
					member.setMemClassName(ccn);
				}
				//����ְ��
				Member m3=memberService.selLl(member);
				List<MemLevel> list2=m3.getLevelList();
				int lid=(int) list2.get(0).getId();
				String ln=list2.get(0).getLevelName();
				member.setMemLevel(lid);
				member.setMemLevelName(ln);
				// ���»�Ա�ȼ�
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
					
					//���û��ֵȼ�
					Member m2=memberService.selCn(member);
					List<MemClass> list=m2.getMemClassList();
					int cid=(int) list.get(0).getId();
					String ccn=list.get(0).getClassName();
					if(cid > member.getMemClass()){
						member.setMemClass(cid);
						member.setMemClassName(ccn);
					}
					//����ְ��
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
	//��֤����֤
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
	//������֤
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
	//�޸�������֤
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

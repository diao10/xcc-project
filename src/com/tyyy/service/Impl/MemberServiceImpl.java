package com.tyyy.service.Impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.tyyy.bean.MemClass;
import com.tyyy.bean.MemLevel;
import com.tyyy.bean.Member;
import com.tyyy.bean.Sign;
import com.tyyy.dao.MemberMapper;
import com.tyyy.dao.MessageMapper;
import com.tyyy.dao.SignMapper;
import com.tyyy.service.MemberService;
import com.tyyy.util.PageBean;

/** 
 * @author  siyong E-mail: ve_master@sina.com
 * @date 创建时间：2017年1月4日 上午11:20:46 
 * @version 1.0 
*/
@Service("MemberService")
@Transactional
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private SignMapper signMapper;
	

	@Override
	public int deleteByPrimaryKey(Long id) {

		return memberMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Member record) {
		
		return memberMapper.insert(record);
	}

	@Override
	public int insertSelective(Member record) {

		return memberMapper.insertSelective(record);
	}

	@Override
	public Member selectByPrimaryKey(Long id) {

		return memberMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Member record) {
		
		return memberMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public void updateByPrimaryKey(Member record) {

		memberMapper.updateByPrimaryKey(record);
	}

	@Override
	public int selEmail(String email) {
		
		return memberMapper.selEmail(email);
	}
	
	@Override
	public int selReferrer(String referrer) {

		return memberMapper.selReferrer(referrer);
	}


	@Override
	public Member login(String nameRoEmail, String memPwd) {
		Pattern pattern = Pattern.compile("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+");
		Matcher matcher = pattern.matcher(nameRoEmail);
		//判断是否是邮箱
		boolean b= matcher.matches();
		Member member = new Member();
		member.setMemPwd(memPwd);
		Member memberLogin = null;
		if(b){
			member.setMemEmail(nameRoEmail);
			memberLogin = memberMapper.loginEmail(member);
		}else{
			member.setMemId(nameRoEmail);
			memberLogin = memberMapper.loginMemId(member);
		}
		return memberLogin;
	}

	@Override
	public Member selMemberJunior(String referrerId) {
		
		return memberMapper.selMemberJunior(referrerId);
	}

	@Override
	public PageBean<Member> selMemberAll(int page, int row,Member member) {
		PageHelper.startPage(page, row);
		List<Member> memberList=memberMapper.sellMemberAll( member);
		return new PageBean<>(memberList);
	}
	@Override
	public PageBean<Member> selMem(int page, int row,Member member) {
		PageHelper.startPage(page, row);
		List<Member> memberList=memberMapper.selMem(member);
		return new PageBean<>(memberList);
	}
	//递归加积分
	public  void addMemIntegral(String referrerId,int integral){
		
		//获得member对象
		Member member = memberMapper.selMemberByR(referrerId);
		if(member==null){
			System.out.println("没有会员了！");
		}else{
			//为member对象加分
			member.setMemIntegral(member.getMemIntegral()+integral);
			member.setMemPoint(member.getMemPoint()+integral);
			memberMapper.updateMemIntegral(member);
			
			//设置积分等级
			Member m2=memberMapper.selCn(member);
			List<MemClass> list=m2.getMemClassList();
			int cid=(int) list.get(0).getId();
			String ccn=list.get(0).getClassName();
			member.setMemClass(cid);
			member.setMemClassName(ccn);
			//设置职阶
			Member m3=memberMapper.selLl(member);
			List<MemLevel> list2=m3.getLevelList();
			int lid=(int) list2.get(0).getId();
			String ln=list2.get(0).getLevelName();
			member.setMemLevel(lid);
			member.setMemLevelName(ln);
			memberMapper.updateClass(member);
			//通过member的推荐码获得上线对象
			String rId=member.getReferrerId();
			//通过上线对象的主键进行下一次递归
			addMemIntegral(rId,integral);
		}
	}
	//通过推荐码查找下线
	public List<Member> selMemberByX(String referrerId) {
		return memberMapper.selMemberByX(referrerId);
	}
	
	public Map<String,Object> selMemForEmpN(String referrerId){
		Map<String,Object> map = new HashMap<>();
		map.put("sr", this.selMemSR(referrerId));
		return map;
	}
	public Map<String,Object> selMemForEmpC(long memId){
		Map<String,Object> map = new HashMap<>();
		map.put("qd", this.selMemQD(memId));
		return map;
	}
	public Map<String,Object> selMemForMem(String referrerId,long memId){
		Map<String,Object> map = new HashMap<>();
		map.put("sr", this.selMemSR(referrerId));
		map.put("qd", this.selMemQD(memId));
		return map;
	}
	
	private Map<String,Object> selMemQD(long memId){
		Map<String,Object> map = new HashMap<>();
		List<Sign> signs = signMapper.selSignByMemId(memId);
		List<Date> times = new ArrayList<>();
		for (Sign sign : signs) {
			times.add(sign.getSignTime());
		}
		map.put("type", "1");
		map.put("times", times);
		return map;
	}
	private Map<String,Object> selMemSR(String referrerId){
		Map<String,Object> map = new HashMap<>();
		List<String> names = new ArrayList<>();
		List<Date> birthday = new ArrayList<>();
		List<Long> ids = new ArrayList<>();
		List<Member> members = memberMapper.selMemberByX(referrerId);
		System.out.println(members.size());
		for (Member member : members) {
			ids.add(member.getId());
			names.add(member.getMemName());
			birthday.add(member.getMemBirth());
		}
		System.out.println("names--->"+names);
		System.out.println("ids--->"+ids);
		System.out.println("birthday--->"+birthday);
		map.put("type", "2");
		map.put("names", names);
		map.put("birthday", birthday);
		map.put("ids", ids);
		return map;
	}

	//只修改积分
	@Override
	public void updateMemIntegral(Member member) {
		memberMapper.updateMemIntegral(member);
	}

	@Override
	public void updateClass(Member member) {
			memberMapper.updateClass(member);
	}

	@Override
	public Member selCn(Member member) {
		return memberMapper.selCn(member);
	}
	
	@Override
	public Member selCnByClass(Member member) {
		return memberMapper.selCnByClass(member);
	}

	@Override
	public Member selLl(Member member) {
		return memberMapper.selLl(member);
	}
	
	@Override
	public long selMemBerIdByMail(String mail){
		return memberMapper.selMemBerIdByMail(mail);
	}

	@Override
	public void updateMemTime(Member member) {
		 memberMapper.updateMemTime(member);
	}

	@Override
	public PageBean<Member> selMemberByM(int page, int rows, String mem_Id) {
		PageHelper.startPage(page, rows);
		List<Member> memberListM=memberMapper.selMemberByM(mem_Id);
		return new PageBean<>(memberListM);
	}

	@Override
	public Member selMemBerByMail(String mail) {
		
		return memberMapper.selMemBerByMail(mail);
	}

	@Override
	public void clearMemberIntergral() {
		memberMapper.clearMemberIntergral();
	}

}

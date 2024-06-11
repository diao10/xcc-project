package com.tyyy.dao;

import java.util.List;

import com.tyyy.bean.Member;

public interface MemberMapper {
	
	Member loginEmail(Member record);
	
	Member loginMemId(Member record);
	
    int deleteByPrimaryKey(Long id);

    int insert(Member record);

    int insertSelective(Member record);

    Member selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Member record);

    int updateByPrimaryKey(Member record);
    
    public int selEmail(String email);
    
    public int selReferrer(String referrer);
    //查询上线主键
    //public long selUp(String referrer);
    public Member selMemberJunior(String referrerId);
    public List<Member> sellMemberAll(Member member);
    public Member selMemberByR(String referrerId);
    public List<Member> selMemberByM(String mem_Id);
    public List<Member> selMemberByX(String referrerId);
    public void updateMemIntegral(Member member);
    public void updateClass(Member member);
    public Member selCn(Member member);
    public Member selCnByClass(Member member);
    public Member selLl(Member member);

    public void updateMemTime(Member member);

    public List<Member> selMem(Member member);
    public long selMemBerIdByMail(String mail);
    public Member selMemBerByMail(String mail);
    public void clearMemberIntergral();
}
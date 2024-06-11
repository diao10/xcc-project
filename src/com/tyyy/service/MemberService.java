package com.tyyy.service;

import java.util.List;
import java.util.Map;

import com.tyyy.bean.Member;
import com.tyyy.util.PageBean;

/** 
 * @author  siyong E-mail: ve_master@sina.com
 * @date 创建时间：2017年1月4日 上午11:19:47 
 * @version 1.0 
*/
public interface MemberService {
	
	Member login(String nameRoEmail,String memPwd);
	
	int deleteByPrimaryKey(Long id);

    int insert(Member record);

    int insertSelective(Member record);

    Member selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Member record);

    public void updateByPrimaryKey(Member record);
    
    public int selEmail(String email);
    
    public int selReferrer(String referrer);
    //查询上线主键
    //public long selUp(String referrer);
    public Member selMemberJunior(String referrerId);
    public PageBean<Member> selMemberAll(int page,int row,Member member);
    public PageBean<Member> selMem(int page,int row,Member member);
    public void addMemIntegral(String referrerId,int integral);
    public List<Member> selMemberByX(String referrerId);
    public PageBean<Member> selMemberByM(int page,int rows,String mem_Id);
    public void updateMemIntegral(Member member);
    public void updateClass(Member member);
    
    public Map<String,Object> selMemForEmpN(String referrerId);
    public Map<String,Object> selMemForEmpC(long memId);
    public Map<String,Object> selMemForMem(String referrerId,long memId);
    public Member selCn(Member member);
    public Member selCnByClass(Member member);
    public Member selLl(Member member);
    public long selMemBerIdByMail(String mail);
    public void updateMemTime(Member member);
    public Member selMemBerByMail(String mail);
    public void clearMemberIntergral();
}

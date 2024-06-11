package com.tyyy.service.Impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.tyyy.bean.Member;
import com.tyyy.bean.Sign;
import com.tyyy.dao.MemberMapper;
import com.tyyy.dao.SignMapper;
import com.tyyy.service.SignService;
import com.tyyy.util.PageBean;

/** 
 * @author  zhc E-mail: 664860722@qq.com
 * @date 创建时间：2017年1月5日 上午11:10:35 
 * @version 1.0 
*/
@Service("signService")
@Transactional
public class SignServiceImpl implements SignService{
	
	@Autowired
	private SignMapper signMapper;
	@Autowired
	private MemberMapper memberMapper;
	@Override//添加签到
	public void addSign(Sign sign) {
		signMapper.addSign(sign);
		
	}
	@Override
	public PageBean<Sign> selSignAll(int page,int row) {
		PageHelper.startPage(page, row);
		List<Sign> signList = signMapper.selSignAll();
		return new PageBean<>(signList);
	}
	//删除用户全部登录信息
	@Override
	public void delSign(String memId) {
		signMapper.delSign(memId);
	}
	@Override
	public void updateSign(Sign sign) {
		signMapper.updateSign(sign);
	}
	@Override
	public void upSign(Sign sign) {
		signMapper.upSign(sign);
	}
	@Override
	public void scSign(Sign sign) {
		signMapper.scSign(sign);
	}
	@Override
	public Sign selSignById(long id) {
		return signMapper.selSignById(id);
	}
	@Override
	public List<Sign> selSignByMemId(long memId) {
		List<Sign> list = signMapper.selSignByMemId(memId);
		return list;
	}
	@Override
	public Sign selSign(Sign sign) {
		return signMapper.selSign(sign);
	}
	@Override
	public void addSign1(long memId) {
		//判断是否连续签到,连续签到signcount+1,否则清零
		List<Sign> signlist = signMapper.selSignByMemId(memId);
		// 获取会员信息
		Member member = memberMapper.selectByPrimaryKey(memId);
		if (signlist.size() <= 0) {
			member.setSignCount(1);
		}else{
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			int before = Integer.parseInt(format.format(signlist.get(signlist.size() - 1).getSignTime()));
			int now = Integer.parseInt(format.format(new Date()));
			if (now - before == 1) {
				member.setSignCount(member.getSignCount()+1);
			}else if(now - before > 7){
				member.setSignCount(1);
				member.setMemPoint(member.getMemPoint() - 10);
			}else{
				member.setSignCount(1);
			}
		}
		// 积分+1
		member.setMemPoint(member.getMemPoint()+1);
		// 更新会员信息
		memberMapper.updateByPrimaryKeySelective(member);
		// 更新签到信息
		signMapper.addSign1(memId);
	}
	
}

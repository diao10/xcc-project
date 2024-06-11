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
 * @date ����ʱ�䣺2017��1��5�� ����11:10:35 
 * @version 1.0 
*/
@Service("signService")
@Transactional
public class SignServiceImpl implements SignService{
	
	@Autowired
	private SignMapper signMapper;
	@Autowired
	private MemberMapper memberMapper;
	@Override//���ǩ��
	public void addSign(Sign sign) {
		signMapper.addSign(sign);
		
	}
	@Override
	public PageBean<Sign> selSignAll(int page,int row) {
		PageHelper.startPage(page, row);
		List<Sign> signList = signMapper.selSignAll();
		return new PageBean<>(signList);
	}
	//ɾ���û�ȫ����¼��Ϣ
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
		//�ж��Ƿ�����ǩ��,����ǩ��signcount+1,��������
		List<Sign> signlist = signMapper.selSignByMemId(memId);
		// ��ȡ��Ա��Ϣ
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
		// ����+1
		member.setMemPoint(member.getMemPoint()+1);
		// ���»�Ա��Ϣ
		memberMapper.updateByPrimaryKeySelective(member);
		// ����ǩ����Ϣ
		signMapper.addSign1(memId);
	}
	
}

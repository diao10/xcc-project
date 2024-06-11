package com.tyyy.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;
import com.tyyy.bean.CharToPower;
import com.tyyy.bean.EmpChar;
import com.tyyy.bean.Power;
import com.tyyy.dao.CharToPowerMapper;
import com.tyyy.dao.EmpCharMapper;
import com.tyyy.dao.PowerMapper;
import com.tyyy.service.EmpCharService;

/** 
 * @author  gycx E-mail: gycxmilkyway@163.com
 * @date 创建时间：2017年1月11日 下午4:28:32 
 * @version 1.0 
*/
@Service("empCharService")
@Transactional
public class EmpCharServiceImpl implements EmpCharService {
	@Autowired
	private EmpCharMapper empCharMapper;
	@Autowired
	private PowerMapper powerMapper;
	@Autowired
	private CharToPowerMapper charToPower;
	
	/*查询全部角色*/
	@Override
	public List<EmpChar> selEmpCharAll() {
		List<EmpChar> empCharList = empCharMapper.selEmpCharAll();
		return empCharList;
	}
	/*通过ID查询*/
	@Override
	public EmpChar selEmpCharById(long id) {
		return empCharMapper.selectByPrimaryKey(id);
	}
	/*添加角色*/
	@Override
	public void addEmpChar(EmpChar empChar) {
		empCharMapper.insertSelective(empChar);

	}
	/*删除角色*/
	@Override
	public void deleteByPrimaryKey(long id) {
		empCharMapper.deleteByPrimaryKey(id);

	}
	@Override

	public void updateByPrimaryKeySelective(EmpChar empChar) {
		empCharMapper.updateByPrimaryKeySelective(empChar);
	}
	
	
	/*查询角色对权限*/
	@Override
	public List<EmpChar> selCharToPower() {
		List<EmpChar> list = empCharMapper.selCharToPower();
		for (EmpChar empChar : list) {
			System.out.println(empChar);
		}
		return list;
	}
	
	//清空角色下的权限
	public void cleanCharToPower(Long id){
		empCharMapper.cleanCharToPower(id);
	}
	@Override
	public void addPowerToChar(String v) {
		//传递参数：char id,power id
		EmpChar empChar ;
		Power power;
		System.out.println(v);
		//循环执行解析后的字符串      查询power表，获取powerName插入charToPower
		String[] str = v.split(",");
		//查询角色
		long L = Long.parseLong(str[0]);
		empChar = empCharMapper.selectByPrimaryKey(L);
		//清空角色下的权限
		cleanCharToPower(L);
		for(int i = 1;i<str.length;i++){
			CharToPower ctp = new CharToPower();
			//查询权限
			long Lp = Long.parseLong(str[i]);
			System.out.println(Lp);
			power = powerMapper.selectByPrimaryKey(Lp);//空指针
			ctp.setCid(empChar.getCid());
			ctp.setCharName(empChar.getCharName());
			ctp.setPid(power.getPid());
			ctp.setPowerName(power.getPowerName());
			System.out.println(ctp);
			charToPower.addCharToPower(ctp);
		}
		
		
	}
	@Override
	public List<EmpChar> selEmpChar() {
		List<EmpChar> empCharList1 = empCharMapper.selEmpChar();
		return empCharList1;
	}

}



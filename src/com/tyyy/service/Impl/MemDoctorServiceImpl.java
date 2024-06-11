package com.tyyy.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.tyyy.bean.MemDoctor;
import com.tyyy.dao.MemDoctorMapper;
import com.tyyy.service.DoctorService;
import com.tyyy.util.PageBean;

@Service("doctorService")
@Transactional
public class MemDoctorServiceImpl implements DoctorService{
	@Autowired
	private MemDoctorMapper memDoctorMapper;

	@Override
	public PageBean<MemDoctor> selDoctorAll(int page, int row, MemDoctor docotor) {
		PageHelper.startPage(page, row);
		List<MemDoctor> doctorlist =  memDoctorMapper.selDoctor(docotor);
		return new PageBean<>(doctorlist) ;
	}

	@Override
	public void delDoctor(long id) {
		memDoctorMapper.deleteByPrimaryKey(id);
		
	}

	@Override
	public void addDoctor(MemDoctor doctor) {
		memDoctorMapper.insert(doctor);
		
	}

	@Override
	public void updateDotor(MemDoctor doctor) {
		memDoctorMapper.updateByPrimaryKeySelective(doctor);
		
	}

	@Override
	public MemDoctor selDoctorById(long id) {
		MemDoctor doctor = memDoctorMapper.selectByPrimaryKey(id);
		return doctor;
	}

	@Override
	public MemDoctor selectByEmpId(Long empId) {
		
		return memDoctorMapper.selectByEmpId(empId);
	}

}

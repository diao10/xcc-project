package com.tyyy.service;

import com.tyyy.bean.MemDoctor;
import com.tyyy.util.PageBean;

public interface DoctorService {
	public PageBean<MemDoctor> selDoctorAll(int page,int row,MemDoctor docotor);
	public void delDoctor(long id);
	public void addDoctor(MemDoctor doctor);
	public void updateDotor(MemDoctor doctor);
	public MemDoctor selDoctorById(long id);
	public MemDoctor selectByEmpId(Long empId);
}

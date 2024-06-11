package com.tyyy.dao;


import java.util.List;

import com.tyyy.bean.MemDoctor;

public interface MemDoctorMapper {
    int deleteByPrimaryKey(Long id);

    int insert(MemDoctor record);

    int insertSelective(MemDoctor record);

    MemDoctor selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(MemDoctor record);

    int updateByPrimaryKey(MemDoctor record);
    
    MemDoctor selectByEmpId(Long empId);
    
    public List<MemDoctor> selDoctor(MemDoctor memdoctor);

}
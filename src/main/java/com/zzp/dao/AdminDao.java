package com.zzp.dao;

import org.springframework.stereotype.Repository;

import com.zzp.pojo.Admin;

@Repository
public interface AdminDao {

    public Admin findAdminByName(String username);

}

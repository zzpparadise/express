package com.zzp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzp.pojo.User;

@Repository
public interface ManageHouseholdersDao {
    
    public List<User> getHouseholders();//获取户主信息

}

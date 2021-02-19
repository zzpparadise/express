package com.zzp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzp.pojo.User;

@Repository
public interface ManageHouseholdersDao {
    
    public List<User> getHouseholders();//获取户主信息

    public User selectByUser_id(int user_id);//获取单个户主信息

    public void updateHolder(User user);//修改户主信息

}

package com.zzp.dao;

import javax.validation.Valid;

import org.springframework.stereotype.Repository;

import com.zzp.pojo.User;

@Repository
public interface UserInfoDao {
    //查询个人信息
    public User selectUserInfo(int user_id);
    //修改个人信息
    public void updateUser(@Valid User user);
    //修改密码
    public void updatePassword(int user_id, String user_password);
    public String getPassword(int user_id);
    
}

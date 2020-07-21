package com.zzp.service;

import javax.validation.Valid;

import com.zzp.pojo.User;

public interface UserInfoService {

    public User selectUserInfo(int user_id);

    public void updateUser(@Valid User user);

    public void updatePassword(int user_id, String user_password);

    public String getPassword(int user_id);

}

package com.zzp.service.impl;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzp.dao.UserInfoDao;
import com.zzp.pojo.User;
import com.zzp.service.UserInfoService;
@Service
public class UserInfoServiceImpl implements UserInfoService {
    @Autowired
    UserInfoDao userDao;

    @Override
    public User selectUserInfo(int user_id) {
        return userDao.selectUserInfo(user_id);
    }

    @Override
    public void updateUser(@Valid User user) {
         userDao.updateUser(user);
        
    }

    @Override
    public void updatePassword(int user_id, String user_password) {
        userDao.updatePassword(user_id,user_password);
        
    }

    @Override
    public String getPassword(int user_id) {
        return userDao.getPassword(user_id);
    }

}

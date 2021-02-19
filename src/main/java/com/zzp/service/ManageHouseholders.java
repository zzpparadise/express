package com.zzp.service;

import java.util.List;

import com.zzp.pojo.User;

public interface ManageHouseholders {

    public  List<User> getHouseholders();//获取户主信息列表

    public User getHolder(int user_id);//获取单个户主信息

    public void updateHolder(User user);//修改户主信息

    


}

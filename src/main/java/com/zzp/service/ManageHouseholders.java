package com.zzp.service;

import java.util.List;

import com.zzp.pojo.User;

public interface ManageHouseholders {

    public  List<User> getHouseholders();//获取户主信息列表

    public User getHolder(int user_id);//获取单个户主信息

    public void updateHolder(User user);//修改户主信息

    public void addHouseholder(User householder);//添加户主

    public boolean chechIdNumber(String user_idnumber);//查询身份证号查询用户是否存在

    public void delhouseholders(String[] str_userNames);//删除勾选的用户

    public List<User> input_select(String content);//根据输入框内容查询

    


}

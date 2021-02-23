package com.zzp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzp.pojo.User;

@Repository
public interface ManageHouseholdersDao {
    
    public List<User> getHouseholders();//获取户主信息

    public User selectByUser_id(int user_id);//获取单个户主信息

    public void updateHolder(User user);//修改户主信息

    public void addHouseholder(User householder);//添加户主

    public User selectByIdNumber(String user_idnumber);//查询身份证号是否存在

    public void delhouseholders(String[] delNums);//删除勾选的用户

    public List<User> input_select(String content);//根据输入框内容查询

}

package com.zzp.service;

import java.util.List;

import com.zzp.pojo.Express;
import com.zzp.pojo.User;
import com.zzp.pojo.Water_elec_fee;

public interface UserService {
    //通过名字查询用户(登录)
    public User findUserByName(String username);
    //检查用户名是否存在
    public boolean checkUserName(String user_name);
    //检查电话是否存在
    public boolean checkUserTel(String user_tel);
    //注册用户
    public void insertUser(User user);
    //获取未取快递列表
    public List<Express> getNotTaken(int userId);
    //获取所有快递
    public List<Express> getAllExpress(int user_id);
    //通过用户id和快递公司查询
    public List<Express> selectByCompany(int user_id, String company);
    //通过年份查询
    public List<Express> selectByYear(int user_id,String year);
    //通过年月查询
    public List<Express> selectByYearMonth(int user_id, String year,
            String month);
    //通过年月公司查询
    public List<Express> selectByYearMonthCompany(int user_id, String year,
            String month, String company);
    //通过年份公司查询
    public List<Express> selectByYearCompany(int user_id, String year,
            String company);
    public User findByTel(String user_tel);
    public List<Water_elec_fee> getWater(String user_id);//查询未交费水电信息
    public List<Water_elec_fee> myAllWater(String user_id);//查询所有水电收费信息
    public List<Water_elec_fee> findWater(String user_id, String content);//根据添加查询
    public void pay_water(String user_id, String id);//支付水电费

  

}

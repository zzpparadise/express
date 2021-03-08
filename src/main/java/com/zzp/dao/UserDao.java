package com.zzp.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.zzp.pojo.Express;
import com.zzp.pojo.User;
import com.zzp.pojo.Water_elec_fee;


@Repository
public interface UserDao {
    //通过用户名查找用户
    public User findUserByName(String user_name);
    //通过电话查找用户
    public User findUserByTel(String user_tel);
    //用户注册
    public void insertUser(String user_name, String user_password,
            String user_sex,String user_tel);
    //查询未取的快递
    public List<Express> getNoTaken(int userId);
    //获取所有快递
    public List<Express> getAllexpress(int user_id);
    //通过用户id和快递公司查询
    public List<Express> selectByCompany_uerId(@Param("Express")int user_id, String company);
    //通过年份查询
    public List<Express> selectByYear_uerId(int user_id, String year);
    //通过年月查询
    public List<Express> selectByYearMonth(int user_id, String year,
            String month);
    //通过年月公司查询
    public List<Express> selectByYearMonthCompany(int user_id, String year,
            String month, String company);
    //通过年、公司查询
    public List<Express> selectByYearCompany(int user_id, String year,
            String company);
    public List<Water_elec_fee> getWater(String user_id);//查询未交水电信息
    public List<Water_elec_fee> myAllWater(String user_id);//查询所有水电收费信息
    public List<Water_elec_fee> findWater(String user_id, String content);//根据添加查询
    public void pay_water(String user_id, String id);//支付水电费
    
    
}

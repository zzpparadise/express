package com.zzp.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzp.dao.StatisticsDao;
import com.zzp.dao.UserDao;
import com.zzp.pojo.Express;
import com.zzp.pojo.User;
import com.zzp.pojo.Water_elec_fee;
import com.zzp.service.UserService;

@Service
public class UserServiceImpl implements UserService {
    
    @Autowired
    UserDao userDao;
    @Autowired
    StatisticsDao statDao;
    @Override
    public User findUserByName(String username) {
        
        return userDao.findUserByName(username);
    }
    @Override
    public boolean checkUserName(String user_name) {
        User user=userDao.findUserByName(user_name);
        return user==null?true:false;
    }
    @Override
    public boolean checkUserTel(String user_tel) {
        User user=userDao.findUserByTel(user_tel);
        return user==null?true:false;
    }
    @Override
    public void insertUser(User user) {
        userDao.insertUser(user.getUser_name(),user.getUser_password(),user.getUser_sex(),user.getUser_tel(),user.getHouseholder_name());
       
    }
    @Override
    public List<Express> getNotTaken(int userId) {        
        return userDao.getNoTaken(userId);
    }
    @Override
    public List<Express> getAllExpress(int user_id) {
        
        return userDao.getAllexpress(user_id);
    }
    @Override
    public List<Express> selectByCompany(int user_id, String company) {
        return userDao.selectByCompany_uerId(user_id,company);
    }
    @Override
    public List<Express> selectByYear(int user_id,String year) {        
        return userDao.selectByYear_uerId(user_id,year);
    }
    @Override
    public List<Express> selectByYearMonth(int user_id, String year,
            String month) {
        return userDao.selectByYearMonth(user_id,year,month);
    }
    @Override
    public List<Express> selectByYearMonthCompany(int user_id, String year,
            String month, String company) {
        return userDao.selectByYearMonthCompany(user_id,year,month,company);
    }
    @Override
    public List<Express> selectByYearCompany(int user_id, String year,
            String company) {
        return userDao.selectByYearCompany(user_id,year,company);
    }
    @Override
    public User findByTel(String user_tel) {
        User user=userDao.findUserByTel(user_tel);
        return user;
    }
    @Override
    public List<Water_elec_fee> getWater(String user_id) {
        return userDao.getWater(user_id);
    }
    @Override
    public List<Water_elec_fee> myAllWater(String user_id) {
        return userDao.myAllWater(user_id);
    }
    @Override
    public List<Water_elec_fee> findWater(String user_id, String content) {
        return userDao.findWater(user_id,content);
    }
    @Override
    public void pay_water(String user_id, String id) {
       userDao.pay_water(user_id,id);
    }
    @Override
    public Water_elec_fee tongjiMarch(int user_id, String string) {
        return statDao.tongjiMarch(user_id,string);
    }

}

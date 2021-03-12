package com.zzp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzp.dao.AdminDao;
import com.zzp.pojo.Admin;
import com.zzp.pojo.Unit_Price;
import com.zzp.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminDao ad;
    @Override
    public Admin findAdminByName(String username) {
        return ad.findAdminByName(username);
    }
    @Override
    public Unit_Price getPrice() {
        return ad.getPrice();
    }
    @Override
    public void updatePrice(Unit_Price unit_Price) {
        ad.updatePrice(unit_Price);
    }
    @Override
    public int getMsg1() {
        return ad.getMsg1();
    }
    @Override
    public int getMsg2(String year_month) {
        return ad.getMsg2(year_month);
    }
    @Override
    public int getMsg3() {
        return ad.getMsg3();
    }
    @Override
    public int getMsg4() {
        return ad.getMsg4();
    }
    @Override
    public int getMsg5(String today) {
        return ad.getMsg5(today);
    }
    @Override
    public int getMsg6(String year_month) {
        return ad.getMsg6(year_month);
    }
    @Override
    public int getMsg7(String today) {
        return ad.getMsg7(today);
    }
    @Override
    public int getMsg8(String today) {
        return ad.getMsg8(today);
    }
    
}

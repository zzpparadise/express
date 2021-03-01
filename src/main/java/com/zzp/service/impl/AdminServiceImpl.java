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
    
}

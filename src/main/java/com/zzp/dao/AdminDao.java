package com.zzp.dao;

import org.springframework.stereotype.Repository;

import com.zzp.pojo.Admin;
import com.zzp.pojo.Unit_Price;

@Repository
public interface AdminDao {

    public Admin findAdminByName(String username);//根据名字查询

    public Unit_Price getPrice();//查询水电单价

    public void updatePrice(Unit_Price unit_Price);//修改水电单价

}

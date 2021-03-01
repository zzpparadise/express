package com.zzp.service;

import com.zzp.pojo.Admin;
import com.zzp.pojo.Unit_Price;

public interface AdminService {

    public Admin findAdminByName(String username);//根据名字查询

    public Unit_Price getPrice();//获取水电单价

    public void updatePrice(Unit_Price unit_Price);//修改水电单价

}

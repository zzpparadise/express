package com.zzp.service;

import com.zzp.pojo.Admin;
import com.zzp.pojo.Unit_Price;

public interface AdminService {

    public Admin findAdminByName(String username);//根据名字查询

    public Unit_Price getPrice();//获取水电单价

    public void updatePrice(Unit_Price unit_Price);//修改水电单价

    public int getMsg1();//获取入住用户总数

    public int getMsg2(String year_month);//获取本月账单数

    public int getMsg3();//获取待支付账单数

    public int getMsg4();//获取待领取快递数

    public int getMsg5(String today);//获取今日快递数

    public int getMsg6(String year_month);//获取本月快递数

    public int getMsg7(String today);//获取今日报修数

    public int getMsg8(String today);//获取今日投诉数

}

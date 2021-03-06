package com.zzp.service;

import java.util.List;

import com.zzp.pojo.User;
import com.zzp.pojo.Water_elec_fee;


public interface WaterService {

    List<Water_elec_fee> getWater(String string);

    void addWater(Water_elec_fee water_elec_fee);//添加收费单

    void delExpress(int[] delNums);//删除勾选的水电记录

    List<User> input_select(String user_id, String content);//根据条件查询

    List<User> water_findInput(String content);//根据结算日期查询未收费用户

    List<Water_elec_fee> getWater_elec_Unpaid();//查询未缴费的水电收费单

    List<Water_elec_fee> find_WaterElec_Fee(String content);//根据结算日期或名字查询收费单

    
    
}

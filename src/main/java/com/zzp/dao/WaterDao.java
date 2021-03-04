package com.zzp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzp.pojo.User;
import com.zzp.pojo.Water_elec_fee;

@Repository
public interface WaterDao {

    List<Water_elec_fee> getWater(String string);//获取水电费

    void addWater(Water_elec_fee water_elec_fee);//添加收费单

    void delWater(int[] delNums);//删除勾选的水电记录

    List<User> input_select(String user_id, String content);//根据条件查询
    
}

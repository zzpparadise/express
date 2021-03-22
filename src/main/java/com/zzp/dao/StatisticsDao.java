package com.zzp.dao;

import org.springframework.stereotype.Repository;

import com.zzp.pojo.Water_elec_fee;

@Repository
public interface StatisticsDao {

    Water_elec_fee tongjiMarch(int user_id, String string);//水电统计
    
}

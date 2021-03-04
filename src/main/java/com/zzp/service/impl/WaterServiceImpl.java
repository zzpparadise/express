package com.zzp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzp.dao.WaterDao;
import com.zzp.pojo.User;
import com.zzp.pojo.Water_elec_fee;
import com.zzp.service.WaterService;

@Service
public class WaterServiceImpl implements WaterService {
    @Autowired
    WaterDao wd;
    @Override
    public List<Water_elec_fee> getWater(String string) {
        return wd.getWater(string);
    }
    @Override
    public void addWater(Water_elec_fee water_elec_fee) {
        wd.addWater(water_elec_fee);
        
    }
    @Override
    public void delExpress(int[] delNums) {
        wd.delWater(delNums);
    }
    @Override
    public List<User> input_select(String user_id, String content) {
        return wd.input_select(user_id,content);
    }

}

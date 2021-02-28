package com.zzp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzp.dao.WaterDao;
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

}

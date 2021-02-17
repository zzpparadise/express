package com.zzp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzp.dao.AdminExpressDao;
import com.zzp.pojo.Express;
import com.zzp.service.AdminExpressService;

@Service
public class AdminExpressServiceImpl implements AdminExpressService{
    @Autowired
    AdminExpressDao ad;
    @Override
    public List<Express> getAlls() {
        return ad.getAlls();
    }
    @Override
    public void saveExpress(Express express) {
        ad.addExpress(express);        
    }
    @Override
    public void setFlag(int num) {
        ad.setFlag(num);
        
    }
    @Override
    public void delExpress(int[] delNums) {
        ad.delExpress(delNums);
        
    }
    @Override
    public List<Express> getHouseholders() {
        // TODO Auto-generated method stub
        return null;
    }
    

}

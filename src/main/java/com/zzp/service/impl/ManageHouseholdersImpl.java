package com.zzp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzp.dao.ManageHouseholdersDao;
import com.zzp.pojo.User;
import com.zzp.service.ManageHouseholders;

@Service
public class ManageHouseholdersImpl implements ManageHouseholders{
    @Autowired
    ManageHouseholdersDao md;
    @Override
    public List<User> getHouseholders() {       
        return md.getHouseholders();
    }
    @Override
    public User getHolder(int user_id) {
        
        return md.selectByUser_id(user_id);
    }
    @Override
    public void updateHolder(User user) {
        
        md.updateHolder(user);
    }
    
}

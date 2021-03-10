package com.zzp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzp.dao.Repair_ComplainDao;
import com.zzp.service.Repair_ComplainService;

@Service
public class Repair_ComplainServiceImpl implements Repair_ComplainService{
    @Autowired
    Repair_ComplainDao rc;

    @Override
    public void addComplain_reapir(String user_name, int user_id, int is_master,
            String content, String img_path, String type) {
        rc.addComplain_reapir(user_name,user_id,is_master,
                 content, img_path,type);
        
    }
}

package com.zzp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzp.dao.Repair_ComplainDao;
import com.zzp.pojo.Complain_reapir;
import com.zzp.service.Repair_ComplainService;

@Service
public class Repair_ComplainServiceImpl implements Repair_ComplainService{
    @Autowired
    Repair_ComplainDao rc;

    @Override
    public void addComplain_reapir(String user_name, int user_id, int is_master,
            String content, String img_path, String type,String date) {
        rc.addComplain_reapir(user_name,user_id,is_master,
                 content, img_path,type,date);
        
    }

    @Override
    public List<Complain_reapir> getUser_repair(int user_id) {
        return rc.getUser_repair(user_id);
    }

    @Override
    public List<Complain_reapir> getUser_complain(int user_id) {
        return rc.getUser_compalin(user_id);
    }

    @Override
    public Complain_reapir Check_Complain_reapir_Content(
            String id) {
        return rc.Check_Complain_reapir_Content(id);
    }

    
}

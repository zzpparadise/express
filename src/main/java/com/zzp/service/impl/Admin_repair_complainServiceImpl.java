package com.zzp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzp.dao.Admin_repair_complainDao;
import com.zzp.pojo.Complain_reapir;
import com.zzp.service.Admin_repair_complainService;

@Service
public class Admin_repair_complainServiceImpl implements Admin_repair_complainService{
    @Autowired
    Admin_repair_complainDao arcDao;
    @Override
    public List<Complain_reapir> getRepair_complain() {
        return arcDao.getRepair_complain();
    }
    @Override
    public List<Complain_reapir> admin_find(String content) {
        return arcDao.admin_find(content);
    }
    @Override
    public void admin_shouli(String id) {
       arcDao.admin_shouli(id);
    }
    @Override
    public List<Complain_reapir> admin_has_handle() {
       return arcDao.admin_has_handle();
    }
    @Override
    public List<Complain_reapir> admin_find_has_handle(String content) {
       return arcDao.admin_find_has_handle(content);
    }

}

package com.zzp.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface Repair_ComplainDao {

    void addComplain_reapir(String user_name, int user_id, int is_master,
            String content, String img_path, String type);//添加报修/投诉信息

}

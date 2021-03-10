package com.zzp.service;

public interface Repair_ComplainService {

    void addComplain_reapir(String user_name, int user_id, int is_master,
            String content, String img_path, String type);//添加报修/投诉信息

}

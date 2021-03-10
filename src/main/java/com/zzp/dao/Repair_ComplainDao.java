package com.zzp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzp.pojo.Complain_reapir;

@Repository
public interface Repair_ComplainDao {

    void addComplain_reapir(String user_name, int user_id, int is_master,
            String content, String img_path, String type, String date);//添加报修/投诉信息

    List<Complain_reapir> getUser_repair(int user_id);//用户获取投诉信息

    List<Complain_reapir> getUser_compalin(int user_id);//用户获取投诉信息

    Complain_reapir Check_Complain_reapir_Content(String id);//查看内容

    

}

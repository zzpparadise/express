package com.zzp.service;

import java.util.List;

import com.zzp.pojo.Complain_reapir;

public interface Repair_ComplainService {

    void addComplain_reapir(String user_name, int user_id, int is_master,
            String content, String img_path, String type, String date, String tel);//添加报修/投诉信息

    List<Complain_reapir> getUser_repair(int user_id);//用户获取投诉信息

    List<Complain_reapir> getUser_complain(int user_id);//用户获取报修信息

    Complain_reapir Check_Complain_reapir_Content(String pn);//查看具体内容

    void userDelete_Complain_reapir(String id);//删除报修/投诉信息

    List<Complain_reapir> user_find_shuidian(int user_id, String content);//按日期查询

}

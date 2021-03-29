package com.zzp.service;

import java.util.List;

import com.zzp.pojo.Complain_reapir;

public interface Admin_repair_complainService {

    List<Complain_reapir> getRepair_complain();//查询未处理的报修/投诉信息

    List<Complain_reapir> admin_find(String content);//按条件查询

    void admin_shouli(String id, String reply);// 受理报修、投诉问题

    List<Complain_reapir> admin_has_handle();//管理员查询已受理报修投诉信息

    List<Complain_reapir> admin_find_has_handle(String content);//管理员按条件找已受理报修投诉信息

}

package com.zzp.service;

import java.util.List;

import com.zzp.pojo.Express;

public interface AdminExpressService {

    public List<Express> getAlls();//管理员查询所有未取快递列表

    public void saveExpress(Express express);//新增快递信息

    public void setFlag(int num);//确认收货

    public void delExpress(int[] delNums);//删除快递信息
    
    public List<Express> input_select(String content);//条件查询

}

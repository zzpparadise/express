package com.zzp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzp.pojo.Express;

@Repository
public interface AdminExpressDao {

    public List<Express> getAlls();//获取未取快递信息

    public void addExpress(Express express);//添加快递信息

    public void setFlag(int num);//确认收货

    public void delExpress(int[] delNums);//删除快递
    
}

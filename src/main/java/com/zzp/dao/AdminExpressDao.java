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

    public List<Express> input_select(String content);//根据条件查询快递(未取)

    public List<Express> getOlds();//获取已取取快递信息

    public List<Express> select_express_taken(String content);//根据条件查询快递（已取）
    
}

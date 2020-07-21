package com.zzp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zzp.pojo.Express;

@Repository
public interface AdminExpressDao {

    public List<Express> getAlls();

    public void addExpress(Express express);

    public void setFlag(int num);

    public void delExpress(int[] delNums);
    
}

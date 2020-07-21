package com.zzp.service;

import java.util.List;

import com.zzp.pojo.Express;

public interface AdminExpressService {

    public List<Express> getAlls();

    public void saveExpress(Express express);

    public void setFlag(int num);

    public void delExpress(int[] delNums);

}

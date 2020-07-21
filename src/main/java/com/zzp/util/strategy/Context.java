package com.zzp.util.strategy;

import com.zzp.util.Msg;

public class Context {
    private AbstractStrategy as;
    public Msg multipleSelect(int pn,int user_id,String year,String month,String company) {        
        Msg msg=as.multipleSelect(pn,user_id,year,month,company);
        return msg;
    }
    public void setStrategy(AbstractStrategy as) {
        this.as=as;
    }
}

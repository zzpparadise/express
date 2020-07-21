package com.zzp.util.strategy;

import com.zzp.util.Msg;

public class FailHandleSgy implements AbstractStrategy {

    @Override
    public Msg multipleSelect(int pn,int user_id, String year, String month,
            String company) {
        return Msg.fail();

    }

}

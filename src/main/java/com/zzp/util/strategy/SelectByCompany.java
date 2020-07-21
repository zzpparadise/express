package com.zzp.util.strategy;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzp.pojo.Express;
import com.zzp.service.UserService;
import com.zzp.util.Msg;
@Component
public class SelectByCompany implements AbstractStrategy {
    @Autowired
    UserService userService;
    private static SelectByCompany sbc;
    @PostConstruct
    public void init() {
        sbc=this;
    }
      
    @Override
    public Msg multipleSelect(int pn,int user_id,String year,String month,String company) {
        PageHelper.startPage(pn,5);
        List<Express> express=sbc.userService.selectByCompany(user_id,company);
        if(express!=null && !express.isEmpty()) {
            PageInfo page = new PageInfo(express,5);
            return Msg.success().add("pageInfo",page);
        }
        else
            return Msg.fail();
    }

}

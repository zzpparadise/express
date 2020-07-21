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
public class SelectByYearCompany implements AbstractStrategy {

    @Autowired
    UserService userService;
    private static SelectByYearCompany sbyc;
    @PostConstruct
    public void init() {
        sbyc=this;
    }
      
    @Override
    public Msg multipleSelect(int pn,int user_id,String year,String month,String company) {
        PageHelper.startPage(pn,5);
        List<Express> express=sbyc.userService.selectByYearCompany(user_id,year,company);
        if(express!=null && !express.isEmpty()) {
            PageInfo page = new PageInfo(express,5);
            return Msg.success().add("pageInfo",page);
        }
        else
            return Msg.fail();
    }

}

package com.zzp.util.strategy;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zzp.pojo.User;
import com.zzp.service.UserService;
import com.zzp.util.Msg;

@Component
public class Pay {
    @Autowired
    UserService userService;
    private static Pay pay;
    @PostConstruct
    public void init() {
        pay=this;
    }
 
    public Msg pay_water(String user_id,String id) {
        
       pay.userService.pay_water(user_id,id);
       return Msg.success();
    }
    
}

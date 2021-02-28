package com.zzp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzp.pojo.User;
import com.zzp.pojo.Water_elec_fee;
import com.zzp.service.WaterService;
import com.zzp.util.Msg;



@Controller
@RequestMapping(value="/admin")
public class Water_elecController {
    @Autowired
    WaterService ws;  
    //查询用户用水用电情况
    @RequestMapping("/select_water")
    @ResponseBody
    public Msg getHouseholdersWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn,
            @RequestParam(value="user_id",required=false) String user_id,
             HttpSession session) {
//        Admin admin = (Admin) session.getAttribute("admin");
//        if(admin==null)
//            return Msg.invalid(); 
        //在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);//分页查询
        List<Water_elec_fee> water= ws.getWater(user_id);
        //使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(water,5);
        return Msg.success().add("pageInfo",page);
    }
    
}

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
import com.zzp.pojo.Admin;
import com.zzp.pojo.Express;
import com.zzp.pojo.User;
import com.zzp.service.ManageHouseholders;
import com.zzp.service.UserService;
import com.zzp.util.Msg;

@Controller
@RequestMapping(value="/admin")
public class MangehouseholdersController {
    @Autowired
    ManageHouseholders householders;
    //管理户主信息
    @RequestMapping("/manageUsers")
    @ResponseBody
    public Msg getHouseholdersWithJson(@RequestParam(value="pn",defaultValue="1")
    Integer pn,HttpSession session) {
//        Admin admin = (Admin) session.getAttribute("admin");
//        if(admin==null)
//            return Msg.invalid(); 
        //在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,10);//分页查询
        List<User> users=householders.getHouseholders();
        //使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(users,5);
        return Msg.success().add("pageInfo",page);
    }
    //获取单个户主信息
    @RequestMapping(value="/holder/{user_id}",method=RequestMethod.GET)
    @ResponseBody
    public Msg getHolder(@PathVariable("user_id")int user_id) {
        User holder = householders.getHolder(user_id);
        return Msg.success().add("holder", holder);
    }
    //修改户主信息
    @RequestMapping(value="/updateHolder",method=RequestMethod.PUT)
    @ResponseBody
    public Msg updateHolder(User user,HttpSession session) {
        householders.updateHolder(user);
        return Msg.success();
    }
    
}

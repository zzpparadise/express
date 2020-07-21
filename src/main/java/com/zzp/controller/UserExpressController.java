package com.zzp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzp.pojo.Express;
import com.zzp.pojo.User;
import com.zzp.service.UserService;
import com.zzp.util.Msg;
import com.zzp.util.strategy.AbstractStrategy;
import com.zzp.util.strategy.AlterStrategy;
import com.zzp.util.strategy.Context;

@Controller
@RequestMapping("/user")
public class UserExpressController {
    @Autowired
    UserService userService;
    
  //用户界面
    @RequestMapping(value = "/express")
    
    public String login(){
        
        return "user/user_express";
    }
    //注销登录
    @RequestMapping("/logout")
    public ModelAndView logout(ModelAndView model,HttpSession session) {
        session.removeAttribute("user");
        model.setViewName("user/user_express");
        return model;
    }
    //查询未取的快递
    @RequestMapping(value="/noTaken",method=RequestMethod.GET)
    @ResponseBody
    public Msg getUserNotTaken(@RequestParam(value="pn",defaultValue="1")Integer pn,HttpSession session) {
        User user=(User) session.getAttribute("user");
        if(user==null)
            return Msg.invalid();
        PageHelper.startPage(pn,5);//分页查询
        List<Express> express=userService.getNotTaken(user.getUser_id());
        if(express!=null && !express.isEmpty()) {
            PageInfo page = new PageInfo(express,5);
            return Msg.success().add("pageInfo",page);
        }
        else 
            return Msg.fail().add("noTaken", "暂时没有未取快递！");
    }
    //查询所有快递
    @RequestMapping(value="/allExpress",method=RequestMethod.GET)
    @ResponseBody
    public Msg getUserAllExpress(@RequestParam(value="pn",defaultValue="1")Integer pn,HttpSession session) {
        User user=(User) session.getAttribute("user");
        if(user==null)
            return Msg.invalid();
        PageHelper.startPage(pn,5);//分页查询
        List<Express> express=userService.getAllExpress(user.getUser_id());
        if(express!=null && !express.isEmpty()) {  
            PageInfo page = new PageInfo(express,5);
            return Msg.success().add("pageInfo",page);
        }      
        else 
            return Msg.fail().add("noTaken", "暂时没有快递记录！");
    }
    //按日期、快递公司查询
    @RequestMapping(value="/alterSelect",method=RequestMethod.GET)
    @ResponseBody
    public Msg alterSelect(@RequestParam(value="pn",defaultValue="1")Integer pn,
            @RequestParam(value="year",required=false) String year,
            @RequestParam(value="month",required=false) String month,
            @RequestParam(value="company",required=false) String company,
            HttpSession session) {
            User user=(User) session.getAttribute("user");
            if(user==null)
                return Msg.invalid();
            int user_id=user.getUser_id();
            Context context=new Context();
            AbstractStrategy as=AlterStrategy.alterStrategy(year, month, company);
            context.setStrategy(as);
            Msg msg=context.multipleSelect(pn,user_id, year, month, company);
            return msg;
    }
}

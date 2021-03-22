package com.zzp.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zzp.pojo.User;
import com.zzp.pojo.Water_elec_fee;
import com.zzp.service.UserService;
import com.zzp.util.Msg;

@Controller
@RequestMapping(value = "/user")
public class User_statisticsControlelr {
    @Autowired
    UserService userService;
  //用户投诉报修界面
    @RequestMapping(value = "/user_statistics")
    public ModelAndView user_report(ModelAndView model, HttpSession session) {
        model.setViewName("user/user_Statistics");
        return model;
    }
    //统计水电使用量
    @RequestMapping(value="/shuidiantongji",method=RequestMethod.GET)
    @ResponseBody
    public Msg shuidiantongji(
            @RequestParam(value = "year", required = false) String year,
            HttpSession session) {
        User user=(User) session.getAttribute("user");
        if(user==null)
            return Msg.invalid(); 
       Msg msg = Msg.success();
       //1月
       Water_elec_fee shuidian = userService.tongjiMarch(user.getUser_id(),year+"-01");
       if(shuidian !=null) {
           msg.add("January_shui",shuidian.getWater()).add("Jaunary_dian", shuidian.getElectricity());
       }else {
           msg.add("January_shui",0).add("Jaunary_dian",0);
       }
       //2月
       shuidian = userService.tongjiMarch(user.getUser_id(),year+"-02");
       if(shuidian !=null) {
           msg.add("February_shui",shuidian.getWater()).add("February_dian", shuidian.getElectricity());
       }else {
           msg.add("February_shui",0).add("February_dian",0);
       }
       //3月    
       shuidian = userService.tongjiMarch(user.getUser_id(),year+"-03");
       if(shuidian !=null) {
           msg.add("March_shui",shuidian.getWater()).add("March_dian", shuidian.getElectricity());
       }else {
           msg.add("March_shui",0).add("March_dian",0);
       }
       //4月    
       shuidian = userService.tongjiMarch(user.getUser_id(),year+"-04");
       if(shuidian !=null) {
           msg.add("April_shui",shuidian.getWater()).add("April_dian", shuidian.getElectricity());
       }else {
           msg.add("April_shui",0).add("April_dian",0);
       }
       //5月    
       shuidian = userService.tongjiMarch(user.getUser_id(),year+"-05");
       if(shuidian !=null) {
           msg.add("May_shui",shuidian.getWater()).add("May_dian", shuidian.getElectricity());
       }else {
           msg.add("May_shui",0).add("May_dian",0);
       }
       //6月    
       shuidian = userService.tongjiMarch(user.getUser_id(),year+"-06");
       if(shuidian !=null) {
           msg.add("June_shui",shuidian.getWater()).add("June_dian", shuidian.getElectricity());
       }else {
           msg.add("June_shui",0).add("June_dian",0);
       }
       //7月    
       shuidian = userService.tongjiMarch(user.getUser_id(),year+"-07");
       if(shuidian !=null) {
           msg.add("July_shui",shuidian.getWater()).add("July_dian", shuidian.getElectricity());
       }else {
           msg.add("July_shui",0).add("July_dian",0);
       }
       //8月    
       shuidian = userService.tongjiMarch(user.getUser_id(),year+"-08");
       if(shuidian !=null) {
           msg.add("August_shui",shuidian.getWater()).add("August_dian", shuidian.getElectricity());
       }else {
           msg.add("August_shui",0).add("August_dian",0);
       }
       //9月    
       shuidian = userService.tongjiMarch(user.getUser_id(),year+"-09");
       if(shuidian !=null) {
           msg.add("September_shui",shuidian.getWater()).add("September_dian", shuidian.getElectricity());
       }else {
           msg.add("September_shui",0).add("September_dian",0);
       }
       //10月    
       shuidian = userService.tongjiMarch(user.getUser_id(),year+"-10");
       if(shuidian !=null) {
           msg.add("October_shui",shuidian.getWater()).add("October_dian", shuidian.getElectricity());
       }else {
           msg.add("October_shui",0).add("October_dian",0);
       }
       //11月    
       shuidian = userService.tongjiMarch(user.getUser_id(),year+"-11");
       if(shuidian !=null) {
           msg.add("November_shui",shuidian.getWater()).add("November_dian", shuidian.getElectricity());
       }else {
           msg.add("November_shui",0).add("November_dian",0);
       }
       //12月    
       shuidian = userService.tongjiMarch(user.getUser_id(),year+"-12");
       if(shuidian !=null) {
           msg.add("December_shui",shuidian.getWater()).add("December_dian", shuidian.getElectricity());
       }else {
           msg.add("December_shui",0).add("December_dian",0);
       }
       return msg;
    }
}

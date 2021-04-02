package com.zzp.controller.user;

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
import com.zzp.pojo.Admin;
import com.zzp.pojo.User;
import com.zzp.pojo.Water_elec_fee;
import com.zzp.service.UserService;
import com.zzp.util.Msg;

@Controller
@RequestMapping(value = "/user")
public class User_water_elecController {
    
    @Autowired
    UserService userService;
    //用户水电查询界面
    @RequestMapping(value = "/user_water_elec")
    public ModelAndView user_water_elec(ModelAndView model, HttpSession session) {
        model.setViewName("user/user_water_elec");
        return model;
    }
    // 查询未交费水电信息
    @RequestMapping("/select_water")
    @ResponseBody
    public Msg getWaterElec(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            @RequestParam(value = "user_id", required = false) String user_id,
            HttpSession session) {
        User user=(User) session.getAttribute("user");
        if(user==null)
            return Msg.invalid(); 
        // 在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);// 分页查询
        List<Water_elec_fee> water = userService.getWater(user_id);
        // 使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(water, 5);
        return Msg.success().add("pageInfo", page);
    }
    // 查询所有水电信息
    @RequestMapping("/myAllWater")
    @ResponseBody
    public Msg myAllWater(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            @RequestParam(value = "user_id", required = false) String user_id,
            HttpSession session) {
        User user=(User) session.getAttribute("user");
        if(user==null)
            return Msg.invalid(); 
        // 在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);// 分页查询
        List<Water_elec_fee> water = userService.myAllWater(user_id);
        // 使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(water, 5);
        return Msg.success().add("pageInfo", page);
    }
 // 根据日期查询水电信息
    @RequestMapping("/user_find_water")
    @ResponseBody
    public Msg findWater(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            @RequestParam(value = "user_id", required = false) String user_id,
            @RequestParam(value = "content", required = false) String content,
            HttpSession session) {
        User user=(User) session.getAttribute("user");
        if(user==null)
            return Msg.invalid(); 
        // 在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);// 分页查询
        List<Water_elec_fee> water = userService.findWater(user_id,content);
        // 使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(water, 5);
        return Msg.success().add("pageInfo", page);
    }
    //跳转到支付页面
    @RequestMapping("/return_pay")
    public ModelAndView charge(ModelAndView model,@RequestParam(value="total_fee",required=false) String total_fee,
            @RequestParam(value = "user_id", required = false) String user_id,
            @RequestParam(value = "id", required = false) String id,HttpSession session) {
        session.setAttribute("total_fee",total_fee);
        session.setAttribute("user_id",user_id);
        session.setAttribute("id",id);
        model.setViewName("alipay/index");
        return model;
    }
    // 支付水电费
    @RequestMapping(value="/pay_water",method=RequestMethod.PUT)
    @ResponseBody
    public Msg pay_water(
            @RequestParam(value = "user_id", required = false) String user_id,
            @RequestParam(value = "id", required = false) String id,
            HttpSession session) {
        User user=(User) session.getAttribute("user");
        if(user==null)
            return Msg.invalid(); 
       userService.pay_water(user_id,id);
       return Msg.success();
    }
    
}

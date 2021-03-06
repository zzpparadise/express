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
import com.zzp.pojo.Unit_Price;
import com.zzp.pojo.User;
import com.zzp.pojo.Water_elec_fee;
import com.zzp.service.AdminService;
import com.zzp.service.ManageHouseholders;
import com.zzp.service.WaterService;
import com.zzp.util.GetYearMonth;
import com.zzp.util.Msg;
import com.zzp.util.Retain_2;

@Controller
@RequestMapping(value = "/admin")
public class Water_elecController {
    @Autowired
    WaterService ws;
    @Autowired
    AdminService as;
    @Autowired
    ManageHouseholders householders;
    // 查询用户用水用电情况
    @RequestMapping("/select_water")
    @ResponseBody
    public Msg getHouseholdersWithJson(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            @RequestParam(value = "user_id", required = false) String user_id,
            HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid(); 
        // 在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);// 分页查询
        List<Water_elec_fee> water = ws.getWater(user_id);
        // 使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(water, 5);
        return Msg.success().add("pageInfo", page);
    }

    // 添加水电收费记录
    @RequestMapping(value = "/addWater_elec", method = RequestMethod.POST)
    @ResponseBody
    public Msg Water_elec(
            @RequestParam(value = "user_id", required = false) Integer user_id,
        Water_elec_fee water_elec_fee,
        HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid(); 
        
        //查询水电单价
        Unit_Price price = as.getPrice();
        double water_unit = price.getWater_price();
        double elec_unit = price.getElectricity_price();
        double water_price = Retain_2.retain_2(water_elec_fee.getWater() * water_unit); 
        double elec_price = Retain_2.retain_2(water_elec_fee.getElectricity() * elec_unit);
        double total = Retain_2.retain_2(water_price + elec_price + water_elec_fee.getProperty_fee());
      //获取用户名,楼牌号
        User user = householders.getHolder(user_id);
        String name = user.getHouseholder_name();
        String loupaihao = user.getLoupaihao();
        
        
        water_elec_fee.setWater_cost(water_price);
        water_elec_fee.setElectricity_cost(elec_price);
        water_elec_fee.setUser_id(user_id);
        water_elec_fee.setHouseholder_name(name);
        water_elec_fee.setLoupaihao(loupaihao);
        water_elec_fee.setTotal_fee(total);
        
        ws.addWater(water_elec_fee);
        
        
        return Msg.success();
    }
    //删除勾选的水电记录
    @ResponseBody
    @RequestMapping(value="/water_elecDel/{nums}",method=RequestMethod.DELETE)
    public Msg deleteUsers(@PathVariable("nums")String nums,HttpSession session) {//从路径中取出account，转化成用户account
       Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid();
        String[]str_userNames=nums.split(",");
        int delNums[] = new int[str_userNames.length];
        for(int i=0;i<str_userNames.length;i++) {
            delNums[i]=Integer.parseInt(str_userNames[i]);
        }
        ws.delExpress(delNums);
        
        return Msg.success();
    }
  //根据输入框内容查询水电信息
    @RequestMapping("/water_findInput")
    @ResponseBody
    public Msg input_select(@RequestParam(value="pn",defaultValue="1")
    Integer pn,@RequestParam(value = "user_id", required = false) String user_id,
    @RequestParam(value="content",required=false) String content,
    HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid();
        //在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);//分页查询
        List<User> users=ws.input_select(user_id,content);
        //使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(users,5);
        return Msg.success().add("pageInfo",page);      
    }
    //根据结算日期查询未收费的户主
    @RequestMapping("/select_NoWaterFee")
    @ResponseBody
    public Msg water_findInput(@RequestParam(value="pn",defaultValue="1")
    Integer pn,HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid(); 
        //在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,12);//分页查询
        String content = GetYearMonth.getYearMonth();
        List<User> users=ws.water_findInput(content);
        //使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(users,5);
        return Msg.success().add("pageInfo",page);
    }
 // 查询未缴费收费单
    @RequestMapping("/water_elec_Unpaid")
    @ResponseBody
    public Msg getWater_elec_Unpaid(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid(); 
        // 在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,10);// 分页查询
        List<Water_elec_fee> water = ws.getWater_elec_Unpaid();
        // 使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(water, 5);
        return Msg.success().add("pageInfo", page);
    }
 // 查询用户收费单
    @RequestMapping("/find_WaterElec_Fee")
    @ResponseBody
    public Msg find_WaterElec_Fee(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            @RequestParam(value="content",required=false) String content,
            HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid(); 
        // 在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,10);// 分页查询
        List<Water_elec_fee> water = ws.find_WaterElec_Fee(content);
        // 使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(water, 5);
        return Msg.success().add("pageInfo", page);
    }
}

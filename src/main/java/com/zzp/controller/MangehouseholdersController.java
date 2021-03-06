package com.zzp.controller;


import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzp.pojo.Admin;
import com.zzp.pojo.User;
import com.zzp.service.ManageHouseholders;
import com.zzp.util.Msg;
import com.zzp.util.RandomCode;

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
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid(); 
        //在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,12);//分页查询
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
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid();
        householders.updateHolder(user);
        return Msg.success();
    }
    //添加户主
    @RequestMapping(value="/addHouseholder",method=RequestMethod.POST)
    @ResponseBody
    public Msg addHouseholder(User user,HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid();       
        String pattern = "^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$";
        // 创建 Pattern 对象
        Pattern r = Pattern.compile(pattern); 
        // 现在创建 matcher 对象
        boolean m = r.matcher(user.getUser_idnumber()).matches();
        if(!m) {
            return Msg.fail().add("user_idnumber", "身份证格式错误");
        }
        
        User householder = user;
        boolean chechIdNumber = householders.chechIdNumber(householder.getUser_idnumber());
        if(!chechIdNumber) {
            return Msg.fail().add("idnumber_exist", "该身份证已存在");
        }
        //生成账号和密码
        String user_name = new RandomCode().newAccount();
        String user_password = user.getUser_idnumber().substring(12,18);
        householder.setUser_name(user_name);
        householder.setUser_password(user_password);
        householders.addHouseholder(householder);
        return Msg.success();
    }
  //删除勾选的用户
    @ResponseBody
    @RequestMapping(value="/householderDel/{nums}",method=RequestMethod.DELETE)
    public Msg deleteUsers(@PathVariable("nums")String nums,HttpSession session) {//从路径中取出account，转化成用户account
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid();
        String[]str_userNames=nums.split(",");


        householders.delhouseholders(str_userNames);
        
        return Msg.success();
    }
    //根据输入框内容查询户主
    @RequestMapping("/select")
    @ResponseBody
    public Msg input_select(@RequestParam(value="pn",defaultValue="1")
    Integer pn,@RequestParam(value="content",required=false) String content,
    HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid(); 
        //在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,10);//分页查询
        List<User> users=householders.input_select(content);
        //使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(users,5);
        return Msg.success().add("pageInfo",page);
    }
    //跳转到水电收费页面
    @RequestMapping("/return_charge")
    public ModelAndView charge(ModelAndView model,@RequestParam(value="user_id",required=false) String user_id,HttpSession session) {
        session.setAttribute("user_id",user_id);
        model.setViewName("admin/charge");
        return model;
    }
}

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
import com.zzp.service.AdminExpressService;
import com.zzp.service.UserService;
import com.zzp.util.Msg;
import com.zzp.util.RandomCode;


@Controller
@RequestMapping(value="/admin")
public class AdminExpressController {
    @Autowired
    private AdminExpressService ae;
    @Autowired
    UserService us;
    
    //查询未取快递
    @RequestMapping("/allUser")
    @ResponseBody
    public Msg getUserWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn,HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid();
        //在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);//分页查询
        List<Express> users=ae.getAlls();
        //使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(users,5);
        return Msg.success().add("pageInfo",page);
    }
    //查询未取快递
    @RequestMapping("/getOlds")
    @ResponseBody
    public Msg getOlds(@RequestParam(value="pn",defaultValue="1")Integer pn,HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid();
        //在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,10);//分页查询
        List<Express> users=ae.getOlds();
        //使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(users,5);
        return Msg.success().add("pageInfo",page);
    }
    
    //新增快递
    @RequestMapping(value="/addExpress",method=RequestMethod.POST)
    @ResponseBody
    public Msg saveUser(Express express,HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid();
        //判断用户手机是否注册
        User user=us.findByTel(express.getUser_tel());
        if(user == null) {
            return Msg.fail().add("user_null", "该手机号未注册");
        }
        else {
            express.setUsername(user.getUser_name());
            express.setUser_id(user.getUser_id());
            RandomCode randcode=new RandomCode();
            express.setCode(randcode.randcode());
            ae.saveExpress(express);
            return Msg.success();
        }
    }
  //确认收货
    @ResponseBody
    @RequestMapping(value="/expressConfirm/{num}",method=RequestMethod.PUT)
    public Msg deleteUser(@PathVariable("num")int num,HttpSession session) {//从路径中取出num,转化成快递编号
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid();
        ae.setFlag(num);        
        return Msg.success();
    }
  //删除勾选的快递
    @ResponseBody
    @RequestMapping(value="/expressDel/{nums}",method=RequestMethod.DELETE)
    public Msg deleteUsers(@PathVariable("nums")String nums,HttpSession session) {//从路径中取出account，转化成用户account
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid();
        String[]str_userNames=nums.split(",");
        int delNums[] = new int[str_userNames.length];
        for(int i=0;i<str_userNames.length;i++) {
            delNums[i]=Integer.parseInt(str_userNames[i]);
        }
        ae.delExpress(delNums);
        
        return Msg.success();
    }
    //根据输入框内容查询未取快递
    @RequestMapping("/select_express")
    @ResponseBody
    public Msg input_select(@RequestParam(value="pn",defaultValue="1")
    Integer pn,@RequestParam(value="content",required=false) String content,
    HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid(); 
        //在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);//分页查询
        List<Express> express=ae.input_select(content);
        //使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(express,5);
        return Msg.success().add("pageInfo",page);
    }
  //根据输入框内容查询已取快递
    @RequestMapping("/select_express_taken")
    @ResponseBody
    public Msg select_express_taken(@RequestParam(value="pn",defaultValue="1")
    Integer pn,@RequestParam(value="content",required=false) String content,
    HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid(); 
        //在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,10);//分页查询
        List<Express> express=ae.select_express_taken(content);
        //使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(express,5);
        return Msg.success().add("pageInfo",page);
    }
}

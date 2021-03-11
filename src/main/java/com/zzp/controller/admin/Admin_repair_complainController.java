package com.zzp.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzp.pojo.Admin;
import com.zzp.pojo.Complain_reapir;
import com.zzp.pojo.User;
import com.zzp.service.Admin_repair_complainService;
import com.zzp.util.Msg;

@Controller
@RequestMapping(value = "/admin")
    public class Admin_repair_complainController {
    @Autowired
    Admin_repair_complainService arc;
    
    //管理员查询未受理报修投诉信息
    @RequestMapping(value="/admin_repair_complain",method=RequestMethod.GET)
    @ResponseBody
    public Msg admin_repair_complain(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid(); 
        // 在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 10);// 分页查询
        List<Complain_reapir> complain_reapir = arc.getRepair_complain();
        // 使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(complain_reapir, 5);
        return Msg.success().add("pageInfo", page);
    }
    
  //管理员按条件找未受理报修投诉信息
    @RequestMapping(value="/admin_find",method=RequestMethod.GET)
    @ResponseBody
    public Msg admin_find(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            @RequestParam(value = "content", defaultValue = "false") String content,
            HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid(); 
        // 在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 10);// 分页查询
        List<Complain_reapir> complain_reapir = arc.admin_find(content);
        // 使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(complain_reapir, 5);
        return Msg.success().add("pageInfo", page);
    }
    // 受理报修、投诉问题
    @RequestMapping(value="/admin_shouli",method=RequestMethod.PUT)
    @ResponseBody
    public Msg admin_shouli(@RequestParam(value = "id", required = false) String id,
            HttpSession session) {
      Admin admin = (Admin) session.getAttribute("admin");
      if(admin==null)
          return Msg.invalid();
        arc.admin_shouli(id);
       return Msg.success();
    }
  //管理员查询已受理报修投诉信息
    @RequestMapping(value="/admin_has_handle",method=RequestMethod.GET)
    @ResponseBody
    public Msg admin_has_handle(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid(); 
        // 在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 10);// 分页查询
        List<Complain_reapir> complain_reapir = arc.admin_has_handle();
        // 使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(complain_reapir, 5);
        return Msg.success().add("pageInfo", page);
    }
  //管理员按条件找已受理报修投诉信息
    @RequestMapping(value="/admin_find_has_handle",method=RequestMethod.GET)
    @ResponseBody
    public Msg admin_find_has_handle(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            @RequestParam(value = "content", defaultValue = "false") String content,
            HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null)
            return Msg.invalid(); 
        // 在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 10);// 分页查询
        List<Complain_reapir> complain_reapir = arc.admin_find_has_handle(content);
        // 使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(complain_reapir, 5);
        return Msg.success().add("pageInfo", page);
    }
}

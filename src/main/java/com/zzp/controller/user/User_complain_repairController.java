package com.zzp.controller.user;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzp.pojo.Complain_reapir;
import com.zzp.pojo.User;
import com.zzp.pojo.Water_elec_fee;
import com.zzp.service.Repair_ComplainService;
import com.zzp.util.DownloadPicture;
import com.zzp.util.GetYearMonth;
import com.zzp.util.Msg;

@Controller
@RequestMapping(value = "/user")
public class User_complain_repairController {
    @Autowired
    Repair_ComplainService rc;
    
  //用户投诉报修界面
    @RequestMapping(value = "/user_complain_repair")
    public ModelAndView user_report(ModelAndView model, HttpSession session) {
        model.setViewName("user/user_complain_repair");
        return model;
    }
 // 用户提交报修或投诉信息
    @RequestMapping(value="/addComplain_reapir",method=RequestMethod.POST)
    @ResponseBody
    public Msg addComplain_reapir(
            @RequestParam(value = "file", required = false) MultipartFile file,
            @RequestParam(value = "content", required = false) String content,
            @RequestParam(value = "type", required = false) String type,
            HttpSession session) {
        User user=(User) session.getAttribute("user");
        if(user==null)
            return Msg.invalid();
        String img_path = DownloadPicture.downloadPicture(file);
        if(img_path.equals("fail") || content.equals("")) {
            return Msg.fail();
        }
        if(img_path.equals("file_null")) {
            img_path = "no_picture";
        }
        String user_name = user.getUser_name();
        int user_id = user.getUser_id();
        int is_master = user.getIs_master();
        String tel = user.getUser_tel();
        String date = GetYearMonth.getYearMonthDay();
        rc.addComplain_reapir(user_name,user_id,is_master,content,img_path,type,date,tel);
             
        return Msg.success();
    }
    // 查询报修信息
    @RequestMapping("/user_repair_select")
    @ResponseBody
    public Msg user_repair_select(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            HttpSession session) {
        User user=(User) session.getAttribute("user");
        if(user==null)
            return Msg.invalid(); 
        // 在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);// 分页查询
        List<Complain_reapir> water = rc.getUser_repair(user.getUser_id());
        // 使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(water, 5);
        return Msg.success().add("pageInfo", page);
    }
 // 查询投诉信息
    @RequestMapping("/user_complaint_select")
    @ResponseBody
    public Msg user_complain_select(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            HttpSession session) {
        User user=(User) session.getAttribute("user");
        if(user==null)
            return Msg.invalid(); 
        // 在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);// 分页查询
        List<Complain_reapir> water = rc.getUser_complain(user.getUser_id());
        // 使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(water, 5);
        return Msg.success().add("pageInfo", page);
    }
 // 查询具体内容
    @RequestMapping(value="/userCheck_Complain_reapir",method=RequestMethod.GET)
    @ResponseBody
    public Msg userCheck_Complain_reapir(@RequestParam(value = "id", defaultValue = "false") String id,
            HttpSession session) {
        Complain_reapir cr = rc.Check_Complain_reapir_Content(id);      
        return Msg.success().add("Complain_reapir", cr);
    }
 // 删除报修/投诉信息
    @RequestMapping(value="/userDelete_Complain_reapir",method=RequestMethod.POST)
    @ResponseBody
    public Msg userDelete_Complain_reapir(@RequestParam(value = "id", defaultValue = "false") String id,
            HttpSession session) {
        User user=(User) session.getAttribute("user");
        if(user==null)
            return Msg.invalid();
        System.out.println(id);
        rc.userDelete_Complain_reapir(id);      
        return Msg.success();
    }
 // 按日期查询
    @RequestMapping(value="/user_find_shuidian",method=RequestMethod.GET)
    @ResponseBody
    public Msg user_find_shuidian(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
            @RequestParam(value = "content", defaultValue = "content") String content,
            HttpSession session) {
        User user=(User) session.getAttribute("user");
        if(user==null)
            return Msg.invalid();
        // 在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);// 分页查询
        List<Complain_reapir> cr = rc.user_find_shuidian(user.getUser_id(),content);
        // 使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(cr, 5);
        return Msg.success().add("pageInfo", page);
    }
}

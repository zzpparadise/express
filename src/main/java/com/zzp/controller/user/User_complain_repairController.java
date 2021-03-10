package com.zzp.controller.user;



import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zzp.pojo.User;
import com.zzp.service.Repair_ComplainService;
import com.zzp.util.DownloadPicture;
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
        if(img_path.equals("file_null") || img_path.equals("fail") ) {
            return Msg.fail();
        }
        String user_name = user.getUser_name();
        int user_id = user.getUser_id();
        int is_master = user.getIs_master();
        rc.addComplain_reapir(user_name,user_id,is_master,content,img_path,type);
             
        return Msg.success();
    }
}

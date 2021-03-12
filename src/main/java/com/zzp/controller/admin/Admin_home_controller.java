package com.zzp.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zzp.pojo.Admin;
import com.zzp.pojo.Unit_Price;
import com.zzp.service.AdminService;
import com.zzp.util.GetYearMonth;
import com.zzp.util.Msg;

@Controller
@RequestMapping(value = "/admin")
public class Admin_home_controller {
    @Autowired
    AdminService as;
    // 获取首页要显示的信息
    @RequestMapping(value = "/home_msg", method = RequestMethod.GET)
    @ResponseBody
    public Msg home_msg(HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null)
            return Msg.invalid();
        int msg1 = as.getMsg1();
        String year_month = GetYearMonth.getYearMonth();
        int msg2 = as.getMsg2(year_month);
        int msg3 = as.getMsg3();
        int msg4 = as.getMsg4();
        String today = GetYearMonth.getYearMonthDay2();
        int msg5 = as.getMsg5(today);
        int msg6 = as.getMsg6(year_month);
        int msg7 = as.getMsg7(today);
        int msg8 = as.getMsg8(today);
        return Msg.success()
                .add("msg1",msg1).add("msg2", msg2)
                .add("msg3",msg3).add("msg4", msg4)
                .add("msg5",msg5).add("msg6", msg6)
                .add("msg7",msg7).add("msg8", msg8);
    }
}

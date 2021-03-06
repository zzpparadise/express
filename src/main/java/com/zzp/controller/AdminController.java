package com.zzp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zzp.pojo.Admin;
import com.zzp.pojo.Unit_Price;
import com.zzp.pojo.User;
import com.zzp.service.AdminService;
import com.zzp.util.Msg;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    AdminService as;

    // 管理员登录
    @RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
    @ResponseBody
    public Msg adminLogin(
            @RequestParam(value = "username", required = true) String username,
            @RequestParam(value = "password", required = true) String password,
            @RequestParam(value = "vcode", required = true) String vcode,
            HttpSession session) {
        if (StringUtils.isEmpty(username)) {
            return Msg.fail().add("message", "用户名不能为空!");
        }
        if (StringUtils.isEmpty(password)) {
            return Msg.fail().add("message", "密码不能为空!");
        }
        if (StringUtils.isEmpty(vcode)) {
            return Msg.fail().add("message", "验证码不能为空!");
        }
        // 从session中取出验证码
        String loginCpacha = (String) session.getAttribute("loginCpacha");
        if (!vcode.toUpperCase().equals(loginCpacha.toUpperCase())) {
            return Msg.fail().add("message", "验证码错误");
        }

        Admin admin = as.findAdminByName(username);

        if (admin == null) {
            return Msg.fail().add("message", "用户名不存在!");
        }
        if (!admin.getPassword().equals(password)) {
            return Msg.fail().add("message", "密码输入错误!");
        }
        session.setAttribute("admin", admin);
        return Msg.success();
    }

    // 管理员首页
    @RequestMapping(value = "/adminIndex")
    public ModelAndView adminIndex(ModelAndView model, HttpSession session) {
        model.setViewName("admin/adminIndex");
        return model;
    }

    // 管理员登录页面
    @RequestMapping(value = "/login")
    public ModelAndView adminlogin(ModelAndView model) {
        model.setViewName("admin/adminLogin");
        return model;
    }

    // 退出登录
    @RequestMapping("/logout")
    public ModelAndView logout(ModelAndView model, HttpSession session) {
        session.removeAttribute("admin");
        model.setViewName("admin/adminLogin");
        return model;
    }

    // 内部首页
    @RequestMapping("/home")
    public ModelAndView home(ModelAndView model, HttpSession session) {
        model.setViewName("admin/home");
        return model;
    }

    // 快递（未取）
    @RequestMapping("/news")
    public ModelAndView news(ModelAndView model, HttpSession session) {
        model.setViewName("admin/news");
        return model;
    }
    // 快递中心（已取）
    @RequestMapping("/olds")
    public ModelAndView olds(ModelAndView model, HttpSession session) {
        model.setViewName("admin/olds");
        return model;
    }

    // 用户中心
    @RequestMapping("/householders")
    public ModelAndView users(ModelAndView model, HttpSession session) {
        model.setViewName("admin/householders");
        return model;
    }

    // 水电收费（全部）
    @RequestMapping("/charge_all")
    public ModelAndView charge_all(ModelAndView model, HttpSession session) {
        model.setViewName("admin/charge_all");
        return model;
    }
    // 水电收费
    @RequestMapping("/charge")
    public ModelAndView charge(ModelAndView model, HttpSession session) {
        model.setViewName("admin/charge");
        return model;
    }
    // 获取水电单价
    @RequestMapping(value = "/getPrice", method = RequestMethod.GET)
    @ResponseBody
    public Msg getPrice(HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null)
            return Msg.invalid();
        Unit_Price price = as.getPrice();
        return Msg.success().add("price", price);
    }
    // 修改水电单价
    @RequestMapping(value = "/updatePrice", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updatePrice(Unit_Price unit_Price, HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null)
            return Msg.invalid();               
        as.updatePrice(unit_Price);
        return Msg.success();
    }
    // 水电收费查询界面
    @RequestMapping("/select_all_waterEle")
    public ModelAndView select_all_waterEle(ModelAndView model, HttpSession session) {
        model.setViewName("admin/select_all_waterEle");
        return model;
    }
    // 未受理报修、投诉查询界面
    @RequestMapping("/repair_complain")
    public ModelAndView repair_complain(ModelAndView model, HttpSession session) {
        model.setViewName("admin/repair_complain");
        return model;
    }
    // 已受理报修、投诉查询界面
    @RequestMapping("/has_handle")
    public ModelAndView has_handle(ModelAndView model, HttpSession session) {
        model.setViewName("admin/has_handle");
        return model;
    }
}

package com.zzp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/alipay")
public class AlipayController {
    // 支付首页
    @RequestMapping(value = "/index")
    public ModelAndView index(ModelAndView model, HttpSession session) {
        model.setViewName("alipay/index");
        return model;
    }
    // 支付
    @RequestMapping(value = "/alipay.trade.page.pay")
    public ModelAndView pay(ModelAndView model, HttpSession session) {
        model.setViewName("alipay/alipay.trade.page.pay");
        return model;
    }
    // 同步通知页面
    @RequestMapping(value = "/return_url")
    public ModelAndView return_url(ModelAndView model, HttpSession session) {
        model.setViewName("alipay/return_url");
        return model;
    }
}

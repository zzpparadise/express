package com.zzp.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.zzp.pojo.User;
import com.zzp.service.UserService;
import com.zzp.util.CpachaUtil;
import com.zzp.util.Msg;
import com.zzp.util.RandomCode;



@Controller
@RequestMapping("/index")
public class IndexController {
    @Autowired
    UserService userService;
    
  //登录界面
    @RequestMapping(value = "/login",method=RequestMethod.GET)
    public ModelAndView login(ModelAndView model){
        model.setViewName("index/login");
        return model;
    }
    //登录表单提交
    @RequestMapping(value = "/checkLogin",method=RequestMethod.POST)
    @ResponseBody
    public Msg checkLogin(
            @RequestParam(value="username",required=true) String username,
            @RequestParam(value="password",required=true) String password,
            @RequestParam(value="vcode",required=true) String vcode,
            HttpSession session
            ){       
        if(StringUtils.isEmpty(username)){
            return Msg.fail().add("message", "用户名不能为空!");
        }
        if(StringUtils.isEmpty(password)){
            return Msg.fail().add("message", "密码不能为空!");
        }
        if(StringUtils.isEmpty(vcode)){
            return Msg.fail().add("message", "验证码不能为空!");
        }
        //从session中取出验证码
        String loginCpacha = (String)session.getAttribute("loginCpacha");
        if(!vcode.toUpperCase().equals(loginCpacha.toUpperCase())){
            return Msg.fail().add("message", "验证码错误");
        }
              
        User user=userService.findUserByName(username);
       
        if(user == null) {
            return Msg.fail().add("message", "用户名不存在!");           
        }       
        if(!user.getUser_password().equals(password)) {
            return Msg.fail().add("message", "密码输入错误!");
        }
        
      
        session.setAttribute("user",user);
        return Msg.success();
        
    }
    
      
  //验证码图片
    @RequestMapping(value="/get_cpacha",method=RequestMethod.GET)
    public void getCpacha(HttpServletRequest request,
            @RequestParam(value="vl",defaultValue="4",required=false) Integer vl,
            @RequestParam(value="w",defaultValue="98",required=false) Integer w,
            @RequestParam(value="h",defaultValue="33",required=false) Integer h,
            HttpServletResponse response) throws NoSuchAlgorithmException{
        CpachaUtil cpachaUtil = new CpachaUtil(vl, w, h);
        String generatorVCode = cpachaUtil.generatorVCode();
        request.getSession().setAttribute("loginCpacha", generatorVCode);
        BufferedImage generatorRotateVCodeImage = cpachaUtil.generatorRotateVCodeImage(generatorVCode, true);
        try {
            ImageIO.write(generatorRotateVCodeImage, "gif", response.getOutputStream());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    //注册页面
    @RequestMapping(value = "/register",method=RequestMethod.GET)
    public ModelAndView register(ModelAndView model){
        model.setViewName("index/register");
        return model;
    }
    //用户注册
    @RequestMapping(value="/doRegister",method=RequestMethod.POST)
    @ResponseBody
    public Msg saveUser(@Valid User user,BindingResult result,//JSR303校验
            @RequestParam(value="password")String password,
            HttpSession session){
            if(result.hasErrors()) {
            //校验失败，应该返回失败，显示校验失败的错误信息
            Map<String,Object> map= new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError:errors) {
                System.out.println("错误的字段名："+fieldError.getField());
                System.out.println("错误的信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
                
            }
            return Msg.fail().add("errorFields",map);
        }
        else if(!user.getUser_password().equals(password)) {           
            return Msg.fail().add("password", "确认密码错误");
        }
        
        
        else {
            //判断用户名和手机号是否已存在
            boolean nameCheck=userService.checkUserName(user.getUser_name());           
            if(!nameCheck)
                return Msg.fail().add("nameCheck", "用户名已存在！");
            boolean telCheck=userService.checkUserTel(user.getUser_tel());
            if(!telCheck)
                return Msg.fail().add("telCheck", "手机号已被注册！");
        
        }
        //添加用户
        String account = new RandomCode().newAccount();
        user.setUser_name(account);
        userService.insertUser(user);
        session.setAttribute("user"+user.getUser_id(), user);
        return Msg.success().add("successRegister", "注册成功").add("account",account);
        
    }
    
    
    
    
    
    
    
    
    
    
    
}

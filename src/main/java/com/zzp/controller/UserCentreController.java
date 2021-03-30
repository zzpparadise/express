package com.zzp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.zzp.pojo.User;
import com.zzp.service.UserInfoService;
import com.zzp.service.UserService;
import com.zzp.util.Msg;

@Controller
@RequestMapping("/userCentre")
public class UserCentreController {
    @Autowired
    UserInfoService userService;
    @Autowired
    UserService us;
    //用户个人信息界面
    @RequestMapping(value = "/userInfo",method=RequestMethod.GET)
    public ModelAndView userInfo(ModelAndView model,HttpSession session) {
        model.setViewName("userCentre/userInfo");
        return model;
    }
    //查询个人信息
    @RequestMapping(value = "/getUserInfo",method=RequestMethod.GET)
    @ResponseBody
    public Msg getUserInfo(HttpSession session) {
        User user=(User) session.getAttribute("user");
        if(user==null)
            return Msg.invalid();
        int user_id=user.getUser_id();
        User user_new=userService.selectUserInfo(user_id);
        user_new.setUser_password("");
        return Msg.success().add("myInfo", user_new);
    }
    //修改个人信息
    @RequestMapping(value="/updateInfo",method=RequestMethod.PUT)
    @ResponseBody
    public Msg updateUser(@Valid User user,BindingResult result,  //JSR303校验
            @RequestParam(value="building")String building,
            @RequestParam(value="number1")String number1,
            @RequestParam(value="number2")String number2,
            HttpSession session
            ) {
        if(result.hasErrors()) {
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String,Object> map= new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError:errors) {
                System.out.println("错误的字段名："+fieldError.getField());
                System.out.println("错误的信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }
      //判断手机号是否已存在,更新用户信息
        User user1=(User) session.getAttribute("user");
        //boolean nameCheck=us.checkUserName(user.getUser_name());           
//        if(!nameCheck){
//            if(!user1.getUser_name().equals(user.getUser_name()))           
//                return Msg.fail().add("nameCheck", "用户名已存在！");
//           }
        boolean telCheck=us.checkUserTel(user.getUser_tel());
        if(!telCheck) {
            if(!user1.getUser_tel().equals(user.getUser_tel()))
                return Msg.fail().add("telCheck", "手机号已被注册！");
        }
        if(!"".equals(building) && !"".equals(number1) && !"".equals(number2)) {
            String address=building+number1+"-"+number2;
            user.setUser_address(address);
        }
        user.setUser_id(user1.getUser_id());
        userService.updateUser(user);
        user1.setHouseholder_name(user.getHouseholder_name());
        user1.setUser_tel(user.getUser_tel());
        return Msg.success();
    }
  //修改个人密码
    @RequestMapping(value="/updatePassword",method=RequestMethod.PUT)
    @ResponseBody
    public Msg updateUserPassword(@Valid User user,BindingResult result,//JSR303校验
            @RequestParam(value="currentPassword")String currentPassword,
            @RequestParam(value="user_password")String user_password,
            @RequestParam(value="confirmPassword")String confirmPassword,
            HttpSession session) {
            User user1=(User) session.getAttribute("user");
            //获取当前密码
            String password=userService.getPassword(user1.getUser_id());
            System.out.println(password);
        if(password.equals(currentPassword)){      
        if(result.hasErrors()) {
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String,Object> map= new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError:errors) {
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
                }
            return Msg.fail().add("errorFields", map);
            }
            if(user_password.equals(confirmPassword)) {
                userService.updatePassword(user1.getUser_id(),user_password);
                session.removeAttribute("user");
                return Msg.success();
            }
            else {
                return Msg.fail().add("confirmFail", "密码确认错误!");
            }
           
        }
        
        return Msg.fail().add("passwordFail", "当前密码输入错误！");
    }
    
}

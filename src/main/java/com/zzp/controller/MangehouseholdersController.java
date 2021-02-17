package com.zzp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzp.pojo.Express;
import com.zzp.pojo.User;
import com.zzp.service.ManageHouseholders;
import com.zzp.service.UserService;
import com.zzp.util.Msg;

@Controller
@RequestMapping(value="/admin")
public class MangehouseholdersController {
    @Autowired
    ManageHouseholders householders;
    //管理户主信息
    @RequestMapping("/manageUsers")
    @ResponseBody
    public Msg getHouseholdersWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn) {
      //在查询之前调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,10);//分页查询
        List<User> users=householders.getHouseholders();
        //使用pageinfo包装查询结果,封装了详细的分页信息，传入连续显示的页数
        PageInfo page = new PageInfo(users,5);
        return Msg.success().add("pageInfo",page);
    }
}

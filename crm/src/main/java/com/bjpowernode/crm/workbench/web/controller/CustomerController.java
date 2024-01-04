package com.bjpowernode.crm.workbench.web.controller;

import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.settings.service.UserService;
import com.bjpowernode.crm.workbench.domain.Activity;
import com.bjpowernode.crm.workbench.service.ActivityService;
import com.bjpowernode.crm.workbench.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class CustomerController {
    @Autowired
    private UserService userService;
    @Autowired
    private ActivityService activityService;
//    @Autowired
//    private CustomerService customerService;
    @RequestMapping("/workbench/customer/index.do")
    public String index(HttpServletRequest request){
        //调用service层方法，查询所有的用户
        List<User> userList=userService.queryAllUsers();
        List<Activity> activityList= activityService.queryAllActivityForDetail();
        //把userList保存到request中
        request.setAttribute("userList",userList);
        request.setAttribute("activityList",activityList);
        //请求转发
        return "workbench/customer/index";
    }

}

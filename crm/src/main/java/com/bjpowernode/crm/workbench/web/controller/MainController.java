package com.bjpowernode.crm.workbench.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//要想注解起作用，得需要SpringMVC扫描到
@Controller
public class MainController {

    // 跳转到Index页面
    @RequestMapping("/workbench/main/index.do")
    public String index(){
        return "workbench/main/index";

    }
}

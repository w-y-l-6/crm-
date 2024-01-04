package com.bjpowernode.crm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
@Controller   //加上注解
public class IndexController {
    /*
    理论上，给controller分配url，用/代表应用根目录下的/前面的需省略，用Remapping分配url.
     */
@RequestMapping("/")
    public String index(){
        return "index";
    }

}

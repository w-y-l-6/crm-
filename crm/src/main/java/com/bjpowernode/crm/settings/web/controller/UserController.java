package com.bjpowernode.crm.settings.web.controller;

import com.bjpowernode.crm.commons.contants.Contants;
import com.bjpowernode.crm.commons.domain.ReturnObject;
import com.bjpowernode.crm.commons.utils.DateUtils;
import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.settings.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

//注释完得让mvc扫描到这个包，去mvc文件里面配置
@Controller
public class UserController {
    /*
    为了拿到service对象，需要注入
     */
    @Autowired
    private UserService userService;
    /*
      这里请求就之后，要返回的页面与目标资源目录（login.jsp）保持一致
     */
//    @RequestMapping("/WEB-INF/pages/settings/qx/user/toLogin")

    /*
     "/"代表的是页面请求的根目录，所有的页面都在web-inf故可以省略
     */
    @RequestMapping("/settings/qx/user/toLogin")
    public String toLogin(){
            return "settings/qx/user/login";
    }

    @RequestMapping("/settings/qx/user/Login.do")
    public @ResponseBody Object login(String loginAct, String loginPwd, String isRemPwd, HttpServletRequest request, HttpServletResponse response,HttpSession session){
        //封装参数
        Map<String,Object> map = new HashMap<>();
        map.put("loginAct",loginAct);
        map.put("loginPwd",loginPwd);
        //调用service层方法，查询用户，需要注入。
        User user=userService.queryUserByLoginActAndPwd(map);
        //根据查询结果，生成响应信息
        ReturnObject returnObject = new ReturnObject();

        if(user==null){
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("用户名或密码错误");
        }else {
            DateUtils.formatDateTime(new Date());
            String nowStr = DateUtils.formatDateTime(new Date());
            if (nowStr.compareTo(user.getExpireTime())>0){
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("账号已过期");
                //登陆失败，账号已过期
            }
            else if ("0".equals(user.getLockState())){
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("状态被锁定");
                //登录失败，状态被锁定
            }else if (!user.getAllowIps().contains(request.getRemoteAddr())){
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("IP受限");
                //获取自己，用户的ip地址,方法中添加参数为httpserlvetrequest，
                //不在数据库里面就不合法，发返回true
            }else {
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_SUCCESS);

                //登录成功
                //把user保存到session中
                  session.setAttribute(Contants.SESSION_USER,user);
                  //如果需要记住密码。则往外写cookie
                  if ("true".equals(isRemPwd)){
                      Cookie c1=new Cookie("loginAct",user.getLoginAct());
                      c1.setMaxAge(10*24*60*60);
                      response.addCookie(c1);
                      Cookie c2=new Cookie("loginPwd",user.getLoginPwd());
                      c2.setMaxAge(10*24*60*60);
                      response.addCookie(c2);
                  }
            }
        }
  return returnObject;
    }
    @RequestMapping("/settings/qx/user/logout.do")
    public String logout(HttpServletResponse response,HttpSession session){
        //清空cookie
        Cookie c1=new Cookie("loginAct","1");
        c1.setMaxAge(0);
        response.addCookie(c1);

        Cookie c2=new Cookie("loginPwd","1");
        c2.setMaxAge(0);
        response.addCookie(c2);

        //销毁session
        session.invalidate();

        //重定向
        return "redirect:/";//springmvc会转换成：response.sendRedirect("/crm");，然后执行。
    }

}

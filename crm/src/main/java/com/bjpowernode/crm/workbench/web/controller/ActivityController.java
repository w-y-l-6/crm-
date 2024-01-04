package com.bjpowernode.crm.workbench.web.controller;

import com.bjpowernode.crm.commons.contants.Contants;
import com.bjpowernode.crm.commons.domain.ReturnObject;
import com.bjpowernode.crm.commons.utils.DateUtils;
import com.bjpowernode.crm.commons.utils.UUIDUtils;
import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.settings.service.UserService;
import com.bjpowernode.crm.workbench.domain.Activity;
import com.bjpowernode.crm.workbench.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ActivityController {
    @Autowired
    private UserService userService;
    @Autowired
    private ActivityService activityService;
    @RequestMapping("/workbench/activity/index.do")
    public String index(HttpServletRequest request){
        //调用service层方法，查询所有的用户
        List<User> userList=userService.queryAllUsers();
        //把userList保存到request中
        request.setAttribute("userList",userList);
        //请求转发
        return "workbench/activity/index";

    }
    // 访问json字符串，把返回的数据封装成一个java对象。
      @RequestMapping("/workbench/activity/saveCreateActivity.do")
    //加responsebody来自动生成json字符串
    public @ResponseBody Object saveCreateActivity(Activity activity, HttpSession session){
          //封装类中没有参数，但是数据库用到的参数
        User user=(User)session.getAttribute(Contants.SESSION_USER);
        activity.setId(UUIDUtils.getUUID());
        activity.setCreateTime(DateUtils.formatDateTime(new Date()));
       //创建session，拿到当前用户
        activity.setCreateBy(user.getId());
        ReturnObject returnObject=new ReturnObject();
try {
    //调用service层方法，保存创建市场活动
    int ret = activityService.saveCreatActivity(activity);
    if (ret>0){
        returnObject.setCode(Contants.RETURN_OBJECT_CODE_SUCCESS);

    }else {
        returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);
        returnObject.setMessage("系统忙，请稍后重试....");
    }

}catch (Exception e){
    e.printStackTrace();
    returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);
    returnObject.setMessage("系统忙，请稍后重试....");
}
        return returnObject;
    }

    @RequestMapping("/workbench/activity/queryActivityForPageByCondition.do")
    public @ResponseBody Object queryActivityForPageByCondition(int pageNo,int pageSize,String name,String owner,String startDate,String endDate,String contract_state,String invoice_state,String yewuxinzhi,String shenjitype,String shenjiniandu){
        //封装参数
        Map<String,Object> map=new HashMap<>();
        map.put("beginNo",(pageNo-1)*pageSize);
        map.put("pageSize",pageSize);
        map.put("name",name);
        map.put("owner",owner);
        map.put("startDate",startDate);
        map.put("endDate",endDate);
        map.put("contract_state",contract_state);
        map.put("invoice_state",invoice_state);
        map.put("yewuxinzhi",yewuxinzhi);
        map.put("shenjitype",shenjitype);
        map.put("shenjiniandu",shenjiniandu);
        //调用service层方法，查询数据
        List<Activity> activityList=activityService.queryActivityForPageByCondition(map);
        long totalRows=activityService.queryCountOfActivityByCondition(map);
        //根据查询结果，生成相应信息
        Map<String,Object> retMap=new HashMap<>();
        retMap.put("activityList",activityList);
        retMap.put("totalRows",totalRows);
        return retMap;
    }
    // RequestMapping处理来自客户端的请求，括号内部是请求的名称
    @RequestMapping("/workbench/activity/deleteActivityByIds.do")
    public @ResponseBody Object deleteActivityByIds(String[] id){
        ReturnObject returnObject = new ReturnObject();
        try {
            int ret = activityService.deleteActivityByIds(id);
            if (ret>0){
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_SUCCESS);
            }else {
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统繁忙，请稍后重试");
            }
        }catch (Exception e){
            e.printStackTrace();

        }
        return returnObject;
    }
    @RequestMapping("/workbench/activity/editActivity.do")
    public @ResponseBody Object editActivity(String id){
        Activity activity = activityService.queryActivityById(id);
        return activity;
    }
    @RequestMapping("/workbench/activity/saveEditActivity.do")
    public @ResponseBody Object saveEditActivity(Activity activity,HttpSession session){
        User user=(User)session.getAttribute(Contants.SESSION_USER);
        activity.setEditBy(user.getId());
        activity.setEditTime(DateUtils.formatDateTime(new Date()));
        ReturnObject returnObject = new ReturnObject();
        try {
            int ret = activityService.saveEditActivity(activity);
            if(ret>0){
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_SUCCESS);
            }else{
                returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);
                returnObject.setMessage("系统忙，请稍后重试...");
                returnObject.setMessage("这里出错1");
            }
        }catch (Exception e){
            e.printStackTrace();
            returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);
            returnObject.setMessage("系统忙，请稍后重试...");
            returnObject.setMessage("这里出错2");
        }
        return returnObject;
    }
    @RequestMapping("/workbench/activity/detailActivity.do")
    public String detailActivity(String id, Model model){
        //调用service层方法，查询数据
        Activity activity=activityService.queryActivityForDetailById(id);
        //把数据保存到request中
        model.addAttribute("activity",activity);

        //请求转发
        return "workbench/activity/detail";
    }



}

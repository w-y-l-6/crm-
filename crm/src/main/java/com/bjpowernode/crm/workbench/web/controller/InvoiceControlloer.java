package com.bjpowernode.crm.workbench.web.controller;

import com.bjpowernode.crm.commons.contants.Contants;
import com.bjpowernode.crm.commons.domain.ReturnObject;
import com.bjpowernode.crm.commons.utils.DateUtils;
import com.bjpowernode.crm.commons.utils.UUIDUtils;
import com.bjpowernode.crm.settings.domain.DicValue;
import com.bjpowernode.crm.settings.domain.User;
import com.bjpowernode.crm.settings.service.DicValueService;
import com.bjpowernode.crm.settings.service.UserService;
import com.bjpowernode.crm.workbench.domain.Activity;
import com.bjpowernode.crm.workbench.domain.Clue;
import com.bjpowernode.crm.workbench.domain.Invoice;
import com.bjpowernode.crm.workbench.service.ActivityService;
import com.bjpowernode.crm.workbench.service.ClueService;
import com.bjpowernode.crm.workbench.service.InvoiceService;
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
public class InvoiceControlloer {
    @Autowired
    private UserService userService;

    @Autowired
    private InvoiceService invoiceService;
    @Autowired
    private ActivityService activityService;

    @RequestMapping("/workbench/invoice/index.do")
    public String index(Model model,HttpServletRequest request) {
        //调用service层方法，查询所有的用户
        List<User> userList=userService.queryAllUsers();
        List<Activity> activityList= activityService.queryAllActivityForDetail();
        List<Invoice> invoiceList= invoiceService.queryAllInvoiceForDetail();
        //把userList保存到request中
        request.setAttribute("userList",userList);
        request.setAttribute("activityList",activityList);
        request.setAttribute("invoiceList",invoiceList);
        //请求转发

        return "workbench/invoice/index";

    }
    @RequestMapping("/workbench/invoice/query.do")
    public String query(Model model){
        return "workbench/invoice/query";
    }

    @RequestMapping("/workbench/invoice/saveCreateinvoice.do")
    //加responsebody来自动生成json字符串
    public @ResponseBody Object saveCreateinvoice(Invoice invoice, HttpSession session){
        //封装类中没有参数，但是数据库用到的参数
        User user=(User)session.getAttribute(Contants.SESSION_USER);
        invoice.setId(UUIDUtils.getUUID());
        //创建session，拿到当前用户
        invoice.setOwner(user.getId());
        ReturnObject returnObject=new ReturnObject();
        try {
            //调用service层方法，保存创建市场活动
            int ret = invoiceService.saveCreateinvoice(invoice);
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
    @RequestMapping("/workbench/invoice/queryInvoiceForPageByCondition.do")
    public @ResponseBody Object queryInvoiceForPageByCondition(int pageNo,int pageSize,String organization,String danjuriqi,String owner,String shenpiren,String djbianma,String sqbumen,String contractname,String invoicetype,String name,String custom,String start_date,String end_date,String kaihuhang,String kaihuID,String qyshuihao,String adress,String phone,String context,String baogaoname,Double earn,Double invoicemoney,Double shuilv,Double shuie,Double wushuimoney){
        //封装参数
        Map<String,Object> map=new HashMap<>();
        map.put("beginNo",(pageNo-1)*pageSize);
        map.put("pageSize",pageSize);
        map.put("name",name);
        map.put("owner",owner);
        map.put("organization",organization);
        map.put("invoicetype",invoicetype);
        map.put("danjuriqi",danjuriqi);
        map.put("shenpiren",shenpiren);
        map.put("djbianma",djbianma);
        map.put("sqbumen",sqbumen);
        map.put("contractname",contractname);
        map.put("custom",custom);
        map.put("start_date",start_date);
        map.put("end_date",end_date);
        map.put("kaihuhang",kaihuhang);
        map.put("kaihuID",kaihuID);
        map.put("qyshuihao",qyshuihao);
        map.put("adress",adress);
        map.put("phone",phone);
        map.put("context",context);
        map.put("baogaoname",baogaoname);
        map.put("earn",earn);
        map.put("invoicemoney",invoicemoney);
        map.put("shuilv",shuilv);
        map.put("shuie",shuie);
        map.put("wushuimoney",wushuimoney);
        //调用service层方法，查询数据
        List<Invoice> invoiceList=invoiceService.queryInvoiceForPageByCondition(map);
        long totalRows=invoiceService.queryCountOfInvoiceByCondition(map);
        //根据查询结果，生成相应信息
        Map<String,Object> retMap=new HashMap<>();
        retMap.put("invoiceList",invoiceList);
        retMap.put("totalRows",totalRows);
        return retMap;
    }



}
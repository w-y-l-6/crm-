package com.bjpowernode.crm.commons.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
    //工具方法都是静态的,省的创建对象
     public static String formatDateTime(Date date){
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
         String dataStr=sdf.format(date);
         return dataStr;


     }
}

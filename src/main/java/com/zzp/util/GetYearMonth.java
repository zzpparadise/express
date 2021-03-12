package com.zzp.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class GetYearMonth {
    /**
     *获取年月
     */
    public static String getYearMonth() {
        Calendar now = Calendar.getInstance();
        int year = now.get(Calendar.YEAR);
        int month = now.get(Calendar.MONTH) + 1;
        String year1 = String.valueOf(year);
        String month2 = String.valueOf(month);
        if(month < 10) {
            month2 = "0" + String.valueOf(month);
        }
        String year_month = year1+"-"+month2;
        return year_month;
    }
    /**
    *获取年月日
    */
    public static String getYearMonthDay2() {
        Calendar now = Calendar.getInstance();
        int year = now.get(Calendar.YEAR);
        int month = now.get(Calendar.MONTH)+1;
        int day = now.get(Calendar.DATE);
        System.out.println(day);
        String year1 = String.valueOf(year);
        String month1 = String.valueOf(month);
        String day1 = String.valueOf(day);
        if(month < 10) {
            month1 = "0" + String.valueOf(month);
        }
        if(day < 10) {
            day1 = "0" + String.valueOf(day);
        }
        String date = year1+"-"+month1+"-"+day1;
        return date;
    }
    /**
     *获取年月日时刻
     */
    public static String getYearMonthDay() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String a = df.format(new Date());
        return a;
    }
}

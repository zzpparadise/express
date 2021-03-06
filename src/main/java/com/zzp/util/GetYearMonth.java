package com.zzp.util;

import java.util.Calendar;

public class GetYearMonth {
    public static String getYearMonth() {
        Calendar now = Calendar.getInstance();
        int year = now.get(Calendar.YEAR);
        int month = now.get(Calendar.MONTH) + 1;
        String year1 = String.valueOf(year);
        String month2 = "0" + String.valueOf(month);
        if(month < 10) {
            month2 = "0" + String.valueOf(month);
        }
        String year_month = year1+"-"+month2;
        return year_month;
    }
}

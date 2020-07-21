package com.zzp.util.strategy;

public class AlterStrategy {
    public static AbstractStrategy alterStrategy(String year,
            String month,String company) {
        if("".equals(year)&&"".equals(month)&& !"".equals(company)) {
            return new SelectByCompany();
        }
        if("".equals(company)&& "".equals(month)&& !"".equals(year)) {
            return new SelectByYear();
        }
        if("".equals(company)&& !"".equals(month)&& !"".equals(year)) {
            return new SelectByYearMonth();
        }
        if(!"".equals(company)&& !"".equals(month)&& !"".equals(year)) {
            return new SelectByYearMonthCompany();
        }
        if(!"".equals(company)&& "".equals(month)&& !"".equals(year)) {
            return new SelectByYearCompany();
        }
        else
            return new FailHandleSgy();
            
        
    }
}

package com.zzp.util;

import java.math.BigDecimal;

public class Retain_2 {
    public static double retain_2(double a) {
        BigDecimal bg = new BigDecimal(a);
        double b = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        return b;
    }
}

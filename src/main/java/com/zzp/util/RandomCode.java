package com.zzp.util;

import java.util.Random;

public class RandomCode {
    public String randcode() {
    String str="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    StringBuilder sb=new StringBuilder(6);
    for(int i=0;i<6;i++)
    {
    char ch=str.charAt(new Random().nextInt(str.length()));
    sb.append(ch);
    }
    return sb.toString();
    }
    public String newAccount() {
        String str = "012345689";
        StringBuilder sb = new StringBuilder(10);
        for(int i=0;i<9;i++)
        {
        char ch=str.charAt(new Random().nextInt(str.length()));
        sb.append(ch);
        }
        return sb.toString();
    }
}

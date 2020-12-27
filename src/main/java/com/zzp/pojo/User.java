package com.zzp.pojo;

import javax.validation.constraints.Pattern;

public class User {
    private int user_id;
    //JSR303校验
    @Pattern(regexp="(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,5})"
            ,message="用户名只能是2-5位中文或者3-16位英文和数字的组合")
    private String user_name;
    @Pattern(regexp="^[a-zA-Z0-9_-]{6,16}$",message="密码只能是6-16位英文和数字的组合")
    private String user_password;
    private String user_sex;
    private String user_address;
    @Pattern(regexp="^[1][3,4,5,7,8][0-9]{9}$"
            ,message="手机号码格式错误")
    private String user_tel;
    public int getUser_id() {
        return user_id;
    }
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    public String getUser_name() {
        return user_name;
    }
    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
    public String getUser_password() {
        return user_password;
    }
    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }
    public String getUser_sex() {
        return user_sex;
    }
    public void setUser_sex(String user_sex) {
        this.user_sex = user_sex;
    }
    public String getUser_address() {
        return user_address;
    }
    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }
    public String getUser_tel() {
        return user_tel;
    }
    public void setUser_tel(String user_tel) {
        this.user_tel = user_tel;
    }
    @Override
    public String toString() {
        return "User [user_id=" + user_id + ", user_name=" + user_name
                + ", user_password=" + user_password + ", user_sex=" + user_sex
                + ", user_address=" + user_address + ", user_tel=" + user_tel
                + "]";
    }
    
    
}
    
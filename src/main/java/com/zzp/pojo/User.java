package com.zzp.pojo;

import javax.validation.constraints.Pattern;

public class User {
    private int user_id;
    //JSR303校验
    @Pattern(regexp="(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,5})"
            ,message="账号名只能是2-5位中文或者3-16位英文和数字的组合")
    private String user_name;
    @Pattern(regexp="^[a-zA-Z0-9_-]{6,16}$",message="密码只能是6-16位英文和数字的组合")
    private String user_password;
    private String user_sex;
    private String user_address;
    @Pattern(regexp="^[1][3,4,5,7,8][0-9]{9}$"
            ,message="手机号码格式错误")
    private String user_tel;
    //@Pattern(regexp="^[1-9]\\\\d{5}(18|19|([23]\\\\d))\\\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\\\d{3}[0-9Xx]$",message="身份证格式不正确！")
    private String user_idnumber;
    private String hokou_address;
    //@Pattern(regexp="^(?:\\\\d{1,3}|1000)$"
    //        ,message="面积需输入正整数且不超过1000")
    private String area;
    private String house_type;
    private String live_date;
    private String loupaihao;
    private String householder_name;
    private int is_master;
    
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
    
    
    public String getUser_idnumber() {
        return user_idnumber;
    }
    public void setUser_idnumber(String user_idnumber) {
        this.user_idnumber = user_idnumber;
    }
    public String getHokou_address() {
        return hokou_address;
    }
    public void setHokou_address(String hokou_address) {
        this.hokou_address = hokou_address;
    }
    public String getArea() {
        return area;
    }
    public void setArea(String area) {
        this.area = area;
    }
    public String getHouse_type() {
        return house_type;
    }
    public void setHouse_type(String house_type) {
        this.house_type = house_type;
    }
    public String getLive_date() {
        return live_date;
    }
    public void setLive_date(String live_date) {
        this.live_date = live_date;
    }
    public String getLoupaihao() {
        return loupaihao;
    }
    public void setLoupaihao(String loupaihao) {
        this.loupaihao = loupaihao;
    }
    public String getHouseholder_name() {
        return householder_name;
    }
    public void setHouseholder_name(String householder_name) {
        this.householder_name = householder_name;
    }
    public int getIs_master() {
        return is_master;
    }
    public void setIs_master(int is_master) {
        this.is_master = is_master;
    }
    @Override
    public String toString() {
        return "User [user_id=" + user_id + ", user_name=" + user_name
                + ", user_password=" + user_password + ", user_sex=" + user_sex
                + ", user_address=" + user_address + ", user_tel=" + user_tel
                + "]";
    }
    
    
}
    
package com.zzp.pojo;


public class Complain_reapir {
    private int id;
    private String user_name;//用户账号
    private int user_id;//对应的uesr_id
    private int is_master;//是否户主
    private String content;//报修/投诉内容
    private String img_path;//图片所在路径
    private String type;//类型是报修还是投诉
    private String date;//发表时间
    private String tel;//电话
    private int state;//受理状态
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getUser_name() {
        return user_name;
    }
    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
    public int getUser_id() {
        return user_id;
    }
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    public int getIs_master() {
        return is_master;
    }
    public void setIs_master(int is_master) {
        this.is_master = is_master;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getImg_path() {
        return img_path;
    }
    public void setImg_path(String img_path) {
        this.img_path = img_path;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public String getTel() {
        return tel;
    }
    public void setTel(String tel) {
        this.tel = tel;
    }
    public int getState() {
        return state;
    }
    public void setState(int state) {
        this.state = state;
    }
    
    
}

package com.zzp.pojo;

public class Water_elec_fee {
    private int id;
    private String householder_name;
    private String loupaihao;//楼牌号
    private double water;//用水量
    private double water_cost;//水费
    private double electricity;//用电量
    private double electricity_cost;//电费
    private double property_fee;//物业费
    private double total_fee;//总费用
    private String star_date;//开始日期
    private String end_date;//结算日期
    private int user_id;//用户id
    private int is_pay;//是否已经缴费
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getHouseholder_name() {
        return householder_name;
    }
    public void setHouseholder_name(String householder_name) {
        this.householder_name = householder_name;
    }
    public String getLoupaihao() {
        return loupaihao;
    }
    public void setLoupaihao(String loupaihao) {
        this.loupaihao = loupaihao;
    }
    public double getWater() {
        return water;
    }
    public void setWater(double water) {
        this.water = water;
    }
    public double getWater_cost() {
        return water_cost;
    }
    public void setWater_cost(double water_cost) {
        this.water_cost = water_cost;
    }
    public double getElectricity() {
        return electricity;
    }
    public void setElectricity(double electricity) {
        this.electricity = electricity;
    }
    public double getElectricity_cost() {
        return electricity_cost;
    }
    public void setElectricity_cost(double electricity_cost) {
        this.electricity_cost = electricity_cost;
    }
    public double getProperty_fee() {
        return property_fee;
    }
    public void setProperty_fee(double property_fee) {
        this.property_fee = property_fee;
    }
    public double getTotal_fee() {
        return total_fee;
    }
    public void setTotal_fee(double total_fee) {
        this.total_fee = total_fee;
    }
    public String getStar_date() {
        return star_date;
    }
    public void setStar_date(String star_date) {
        this.star_date = star_date;
    }
    public String getEnd_date() {
        return end_date;
    }
    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }
    public int getUser_id() {
        return user_id;
    }
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    public int getIs_pay() {
        return is_pay;
    }
    public void setIs_pay(int is_pay) {
        this.is_pay = is_pay;
    }
}

package com.huang.server.model;

import com.huang.server.entity.UserEntity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;

/**
 * Created by HUANG on 2019/8/14.
 */
public class UserModel implements Serializable {
    private int id;//机会号
    private String company;//公司名称
    private String name;//联系人
    private String phone;//电话
    private String state;//状态
    private String business;//业务
    private String source;//来源
    private String counselor;//销售顾问
    private String createTime;//创建时间
    private BigDecimal income;//销售金额
    private String service_type;
    private String customer_type;

    public UserModel(UserEntity userEntity) {
        this.id = userEntity.getId();
        this.company = userEntity.getCompany();
        this.name = userEntity.getName();
        this.phone = userEntity.getPhone();
        this.state = userEntity.getState();
        this.business = userEntity.getBusiness();
        this.source = userEntity.getSource();
        this.counselor = userEntity.getCounselor();
        if (userEntity.getCreateTime() != null) {
            this.createTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(userEntity.getCreateTime());
        }
        this.income = userEntity.getIncome();
        this.service_type = userEntity.getService_type();
        this.customer_type = userEntity.getCustomer_type();
    }

    public UserModel() {
    }

    public UserModel(int id, String company, String name, String phone, String state, String business, String source, String counselor, String createTime, BigDecimal income, String service_type, String customer_type) {
        this.id = id;
        this.company = company;
        this.name = name;
        this.phone = phone;
        this.state = state;
        this.business = business;
        this.source = source;
        this.counselor = counselor;
        this.createTime = createTime;
        this.income = income;
        this.service_type = service_type;
        this.customer_type = customer_type;
    }

    public String getService_type() {
        return service_type;
    }

    public void setService_type(String service_type) {
        this.service_type = service_type;
    }

    public String getCustomer_type() {
        return customer_type;
    }

    public void setCustomer_type(String customer_type) {
        this.customer_type = customer_type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getBusiness() {
        return business;
    }

    public void setBusiness(String business) {
        this.business = business;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getCounselor() {
        return counselor;
    }

    public void setCounselor(String counselor) {
        this.counselor = counselor;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public BigDecimal getIncome() {
        return income;
    }

    public void setIncome(BigDecimal income) {
        this.income = income;
    }
}

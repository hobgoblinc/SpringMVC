package com.cenyol.example.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by sjj on 2015/10/24 0024.
 */
@Entity
@Table(name = "customers", schema = "", catalog = "mysql")
public class UserEntity implements Serializable{
    private int id;//机会号
    private String company;//公司名称
    private String name;//联系人
    private String phone;//电话
    private String state;//状态
    private String business;//业务
    private String source;//来源
    private String counselor;//销售顾问
    private Date createTime;//创建时间
    private BigDecimal income;//销售金额
    private String service_type;
    private String customer_type;

    @Column(name = "SERVICE_TYPE")
    public String getService_type() {
        return service_type;
    }

    public void setService_type(String service_type) {
        this.service_type = service_type;
    }

    @Column(name = "CUSTOMER_TYPE")
    public String getCustomer_type() {
        return customer_type;
    }

    public void setCustomer_type(String customer_type) {
        this.customer_type = customer_type;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "PHONE", nullable = true, insertable = true, updatable = true, length = 45)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Column(name = "SOURCE", nullable = true, insertable = true, updatable = true, length = 45)
    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    @Basic
    @Column(name = "COMPANY", nullable = true, insertable = true, updatable = true, length = 45)
    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    @Basic
    @Column(name = "NAME", nullable = true, insertable = true, updatable = true, length = 45)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "COUNSELOR", nullable = true, insertable = true, updatable = true, length = 45)
    public String getCounselor() {
        return counselor;
    }

    public void setCounselor(String counselor) {
        this.counselor = counselor;
    }

    @Column(name = "BUSINESS", nullable = true, insertable = true, updatable = true, length = 45)
    public String getBusiness() {
        return business;
    }

    public void setBusiness(String business) {
        this.business = business;
    }

    @Column(name = "INCOME", nullable = true, insertable = true, updatable = true, precision = 12, scale = 2)
    public BigDecimal getIncome() {
        return income;
    }

    public void setIncome(BigDecimal income) {
        this.income = income;
    }

    @Column(name = "CREATE_TIME")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


    @Column(name = "STATE", nullable = true, insertable = true, updatable = true, length = 45)
    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public UserEntity() {
    }

    public UserEntity(int id, String company, String name, String phone, String state, String business, String source, String counselor, BigDecimal income, String service_type, String customer_type) {
        this.id = id;
        this.company = company;
        this.name = name;
        this.phone = phone;
        this.state = state;
        this.business = business;
        this.source = source;
        this.counselor = counselor;
        this.income = income;
        this.service_type = service_type;
        this.customer_type = customer_type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserEntity that = (UserEntity) o;

        if (id != that.id) return false;
        if (company != null ? !company.equals(that.company) : that.company != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (phone != null ? !phone.equals(that.phone) : that.phone != null) return false;
        if (state != null ? !state.equals(that.state) : that.state != null) return false;
        if (business != null ? !business.equals(that.business) : that.business != null) return false;
        if (source != null ? !source.equals(that.source) : that.source != null) return false;
        if (counselor != null ? !counselor.equals(that.counselor) : that.counselor != null) return false;
        if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;
        if (income != null ? !income.equals(that.income) : that.income != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (company != null ? company.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (state != null ? state.hashCode() : 0);
        result = 31 * result + (business != null ? business.hashCode() : 0);
        result = 31 * result + (source != null ? source.hashCode() : 0);
        result = 31 * result + (counselor != null ? counselor.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (income != null ? income.hashCode() : 0);
        return result;
    }

}

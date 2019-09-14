package com.cenyol.example.model;

import com.cenyol.example.entity.RecordEntity;

import java.io.Serializable;
import java.text.SimpleDateFormat;

/**
 * Created by HUANG at 2019/8/17
 */
public class RecordModel implements Serializable {
    private Integer id;
    private String content;
    private String date;//建立日期
    private UserModel userModel;
    private String nextDate;
    private String giveUpDate;
    private String payDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }

    public String getNextDate() {
        return nextDate;
    }

    public void setNextDate(String nextDate) {
        this.nextDate = nextDate;
    }

    public String getGiveUpDate() {
        return giveUpDate;
    }

    public void setGiveUpDate(String giveUpDate) {
        this.giveUpDate = giveUpDate;
    }

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }

    public RecordModel(RecordEntity recordEntity) {
        this.id = recordEntity.getId();
        this.content = recordEntity.getContent();
        if (recordEntity.getDate() != null) {
            this.date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(recordEntity.getDate());
        }
        if (recordEntity.getNextDate() != null) {
            this.nextDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(recordEntity.getNextDate());
        }
        if (recordEntity.getGiveUpDate() != null) {
            this.giveUpDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(recordEntity.getGiveUpDate());
        }
        if (recordEntity.getPayDate() != null) {
            this.payDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(recordEntity.getPayDate());
        }
        this.userModel = new UserModel(recordEntity.getUserEntity());
    }
}

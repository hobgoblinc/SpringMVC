package com.huang.server.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by HUANG on 2019/8/13.
 */
@Entity
@Table(name = "records")
public class RecordEntity implements Serializable{
    private Integer id;
    private String content;
    private Date date;//建立日期
    private UserEntity userEntity;
    private Date nextDate;
    private Date giveUpDate;
    private Date payDate;

    @Column(name = "NEXT_DATE")
    public Date getNextDate() {
        return nextDate;
    }

    public void setNextDate(Date nextDate) {
        this.nextDate = nextDate;
    }

    @Column(name = "GIVE_UP_DATE")
    public Date getGiveUpDate() {
        return giveUpDate;
    }

    public RecordEntity() {
    }

    public void setGiveUpDate(Date giveUpDate) {
        this.giveUpDate = giveUpDate;
    }

    @Column(name = "PAY_DATE")
    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "CONTENT")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Column(name = "DATE")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "USER_ID")
    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    public RecordEntity(String content, Date date, UserEntity userEntity, Date nextDate, Date giveUpDate, Date payDate) {
        this.content = content;
        this.date = date;
        this.userEntity = userEntity;
        this.nextDate = nextDate;
        this.giveUpDate = giveUpDate;
        this.payDate = payDate;
    }
}

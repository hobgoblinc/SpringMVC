package com.huang.server.entity;

import javax.persistence.Embeddable;

/**
 * Created by HUANG at 2019/8/27
 *
 * 1、无参构造函数
 * 2、重写equals方法
 * 3、重写hashCode方法
 */
@Embeddable
public class UsersRoleId {
    private String userId;
    private String RoleId;

    public UsersRoleId() {
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRoleId() {
        return RoleId;
    }

    public void setRoleId(String roleId) {
        RoleId = roleId;
    }
}

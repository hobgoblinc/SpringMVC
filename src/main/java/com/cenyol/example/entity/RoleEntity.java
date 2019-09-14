package com.cenyol.example.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by HUANG at 2019/8/23
 */
@Entity
@Table(name = "ROLE")
public class RoleEntity {

    @Id
    @GenericGenerator(name="systemUUID",strategy="uuid")
    @GeneratedValue(generator="systemUUID")
    @Column(name = "ID", insertable = true, updatable = true, nullable = false)
    private String id;

    @Column(name = "ROLE_ID")
    private String roleId;

    @Column(name = "NAME")
    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

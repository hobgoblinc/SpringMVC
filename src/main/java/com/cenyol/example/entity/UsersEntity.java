package com.cenyol.example.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.management.relation.Role;
import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by HUANG at 2019/8/23
 */
@Entity
@Table(name = "USERS")
public class UsersEntity implements Serializable {
    @Id
    @GenericGenerator(name="systemUUID",strategy="uuid")
    @GeneratedValue(generator="systemUUID")
    @Column(name = "ID", insertable = true, updatable = true, nullable = false)
    private String id;

    @Column(name = "USER_ID")
    private String userId;

    @Column(name = "NAME")
    private String name;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "USERS_ROLE", joinColumns = {@JoinColumn(name = "USER_ID")}, inverseJoinColumns = {@JoinColumn(name = "ROLE_ID")})
    private List<RoleEntity> roles;

    public List<RoleEntity> getRoles() {
        return roles;
    }

    public void setRoles(List<RoleEntity> roles) {
        this.roles = roles;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

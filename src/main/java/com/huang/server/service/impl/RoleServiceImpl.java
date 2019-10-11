package com.huang.server.service.impl;

import com.huang.server.entity.RoleEntity;
import com.huang.server.repository.RoleRepository;
import com.huang.server.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by HUANG at 2019/8/23
 */
@Service
public class RoleServiceImpl implements RoleService<RoleEntity> {

    @Autowired
    private RoleRepository roleRepository;

    public RoleEntity addRole(RoleEntity roleEntity) {
        String roleId = roleEntity.getRoleId();

        if (roleRepository.findByRoleId(roleId) != null) {
            return null;
        }
        return roleRepository.saveAndFlush(roleEntity);
    }
}

package com.cenyol.example.repository;

import com.cenyol.example.entity.RoleEntity;
import org.springframework.stereotype.Repository;

/**
 * Created by HUANG at 2019/8/23
 */
@Repository
public interface RoleRepository extends BaseRepository<RoleEntity, String> {

    RoleEntity findByRoleId(String role);
}

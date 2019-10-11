package com.huang.server.repository;

import com.huang.server.entity.RoleEntity;
import org.springframework.stereotype.Repository;

/**
 * Created by HUANG at 2019/8/23
 */
@Repository
public interface RoleRepository extends BaseRepository<RoleEntity, String> {

    RoleEntity findByRoleId(String role);
}

package com.cenyol.example.repository;

import com.cenyol.example.entity.UsersEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by HUANG at 2019/8/23
 *
 * 对应UsersEntity实体，USERS表
 */
@Repository
public interface UsersRepository extends BaseRepository<UsersEntity, String> {

    List<UsersEntity> findByUserId(String userId);

}

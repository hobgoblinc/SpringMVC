package com.huang.server.repository;

import com.huang.server.entity.UserEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by HUANG at 2019/9/30
 */
@Repository
public interface ServiceRepository extends BaseRepository<UserEntity, Integer> {

    @Query(nativeQuery = true, value = "select type_id, type_name from tx_service_type")
    List<Object> findAllServiceType();
}

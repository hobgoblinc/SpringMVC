package com.huang.server.repository;

import com.huang.server.entity.RecordEntity;
import org.springframework.stereotype.Repository;

/**
 * Created by HUANG on 2019/8/13.
 */
@Repository
public interface RecordRepository extends BaseRepository<RecordEntity, Integer> {

    RecordEntity findById(Integer id);

}

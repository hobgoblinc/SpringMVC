package com.huang.server.service;

import com.huang.server.entity.RecordEntity;
import com.huang.server.model.PageParam;
import org.springframework.data.domain.Page;

/**
 * Created by HUANG on 2019/8/14.
 */
public interface RecordService<T> {
    T addRecordInfo(T t);

    Page<T> getUserRecord(PageParam pageParam, Class<T> tClass);

    RecordEntity addRecordAndUpdateUserInfo(T t);
}

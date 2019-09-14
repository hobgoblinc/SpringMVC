package com.cenyol.example.service;

import com.cenyol.example.entity.RecordEntity;
import com.cenyol.example.model.PageParam;
import org.springframework.data.domain.Page;

/**
 * Created by HUANG on 2019/8/14.
 */
public interface RecordService<T> {
    T addRecordInfo(T t);

    Page<T> getUserRecord(PageParam pageParam, Class<T> tClass);

    RecordEntity addRecordAndUpdateUserInfo(T t);
}

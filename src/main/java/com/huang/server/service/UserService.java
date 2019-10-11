package com.huang.server.service;

import com.huang.server.entity.RecordEntity;
import com.huang.server.entity.UserEntity;
import com.huang.server.model.PageParam;
import org.springframework.data.domain.Page;

import java.util.Map;

public interface UserService<T> {

    Page<T> getUsersPage(PageParam pageParam, Class<T> clazz);

    Map addUserInfo(UserEntity userEntity, RecordEntity recordEntity) throws Exception;
}

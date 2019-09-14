package com.cenyol.example.service;

import com.cenyol.example.entity.RecordEntity;
import com.cenyol.example.entity.UserEntity;
import com.cenyol.example.model.PageParam;
import org.springframework.data.domain.Page;

import java.util.Map;

public interface UserService<T> {

    Page<T> getUsersPage(PageParam pageParam, Class<T> clazz);

    Map addUserInfo(UserEntity userEntity, RecordEntity recordEntity) throws Exception;
}

package com.cenyol.example.service;

import com.cenyol.example.entity.UserEntity;
import com.cenyol.example.model.PageParam;
import org.springframework.data.domain.Page;

public interface UserService<T> {

    Page<T> getUsersPage(PageParam pageParam, Class<T> clazz);
}

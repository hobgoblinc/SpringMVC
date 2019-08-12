package com.cenyol.example.service;

import com.cenyol.example.entity.UserEntity;
import com.cenyol.example.model.PageParam;
import com.cenyol.example.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by HUANG at 2019/8/11
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    public Page<UserEntity> getUsersPage(PageParam pageParam, final Class clazz) {

        int page = pageParam.getPage();
        int pageSize = pageParam.getPageSize();
        final String property = pageParam.getProperty();

        Pageable pageable = new PageRequest(page, pageSize, Sort.Direction.ASC, property);

        Specification<UserEntity> specification = new Specification<UserEntity>() {
            public Predicate toPredicate(Root<UserEntity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

                List<Predicate> predicates = new ArrayList<Predicate>();
                Field[] fields = clazz.getDeclaredFields();
                return cb.and(predicates.toArray(new Predicate[0]));
            }
        };
        return userRepository.findAll(specification, pageable);
    }
}

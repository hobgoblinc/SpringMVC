package com.huang.server.service.impl;

import com.huang.server.entity.RecordEntity;
import com.huang.server.entity.UserEntity;
import com.huang.server.model.PageParam;
import com.huang.server.repository.UserRepository;
import com.huang.server.service.RecordService;
import com.huang.server.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by HUANG at 2019/8/11
 */
@Service
public class UserServiceImpl implements UserService<UserEntity> {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RecordService recordService;

    public Page<UserEntity> getUsersPage(PageParam pageParam, final Class<UserEntity> clazz) {

        int page = pageParam.getPage();
        int pageSize = pageParam.getPageSize();
        final String property = pageParam.getProperty();
        final HashMap hashMap = (HashMap)pageParam.getObject();

        Pageable pageable = new PageRequest(page, pageSize, Sort.Direction.ASC, property);

        Specification<UserEntity> specification = new Specification<UserEntity>() {
            public Predicate toPredicate(Root<UserEntity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

                List<Predicate> predicates = new ArrayList<Predicate>();
                if (hashMap.get("userId") != null && hashMap.get("userId") != "") {
                    predicates.add(cb.equal(root.get("id").as(Integer.class), Integer.parseInt(hashMap.get("userId").toString())));
                }
                if (hashMap.get("company") != null && hashMap.get("company").toString().trim() != "") {
                    predicates.add(cb.like(root.get("company").as(String.class), "%" + hashMap.get("company") + "%"));
                }
                if (hashMap.get("name") != null && hashMap.get("name").toString().trim() != "") {
                    predicates.add(cb.like(root.get("name").as(String.class), "%" + hashMap.get("name").toString().trim() + "%"));
                }
                if (hashMap.get("phone") != null && hashMap.get("phone").toString().trim() != "") {
                    predicates.add(cb.like(root.<String>get("phone"), "%" + hashMap.get("phone").toString().trim() + "%"));
                }
                if (hashMap.get("state") != null && hashMap.get("state").toString() != "") {
                    predicates.add(cb.equal(root.get("state").as(String.class), hashMap.get("state").toString()));
                }
                if (hashMap.get("business") != null && hashMap.get("business").toString() != "") {
                    predicates.add(cb.equal(root.<String>get("business"), hashMap.get("business").toString()));
                }
                if (hashMap.get("source") != null && hashMap.get("source").toString() != "") {
                    predicates.add(cb.equal(root.<String>get("source"), hashMap.get("source").toString()));
                }
                if (hashMap.get("counselor") != null && hashMap.get("counselor").toString().trim() != "") {
                    predicates.add(cb.like(root.<String>get("counselor"), "%" + hashMap.get("counselor").toString().trim() + "%"));
                }
                if (hashMap.get("service_type") != null && hashMap.get("service_type").toString() != "") {
                    predicates.add(cb.equal(root.<String>get("service_type"), hashMap.get("service_type").toString()));
                }
                if (hashMap.get("customer_type") != null && hashMap.get("customer_type").toString() != "") {
                    predicates.add(cb.equal(root.<String>get("customer_type"), hashMap.get("customer_type").toString()));
                }
                if (hashMap.get("income_start") != null && hashMap.get("income_start").toString() != "") {
                    predicates.add(cb.greaterThanOrEqualTo(root.<BigDecimal>get("income"), new BigDecimal(hashMap.get("income_start").toString())));
                }
                if (hashMap.get("income_end") != null && hashMap.get("income_end").toString() != "") {
                    predicates.add(cb.lessThanOrEqualTo(root.<BigDecimal>get("income"), new BigDecimal(hashMap.get("income_end").toString())));
                }
                if (hashMap.get("start_time") != null && hashMap.get("start_time").toString() != "") {
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    try {
                        predicates.add(cb.greaterThanOrEqualTo(root.get("createTime").as(Date.class), format.parse(hashMap.get("start_time").toString())));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
                if (hashMap.get("end_time") != null && hashMap.get("end_time").toString() != "") {
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    try {
                        predicates.add(cb.lessThanOrEqualTo(root.get("createTime").as(Date.class), format.parse(hashMap.get("end_time").toString())));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
                if (hashMap.get("createTime") != null && hashMap.get("createTime").toString() != "") {
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    try {
                        predicates.add(cb.greaterThanOrEqualTo(root.get("createTime").as(Date.class), format.parse(hashMap.get("createTime").toString() + " 00:00:00")));
                        predicates.add(cb.lessThanOrEqualTo(root.get("createTime").as(Date.class), format.parse(hashMap.get("createTime").toString()+ " 23:59:59")));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
                Field[] fields = clazz.getDeclaredFields();
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };
        return userRepository.findAll(specification, pageable);
    }


    @Transactional
    public Map addUserInfo(UserEntity userEntity, RecordEntity recordEntity) throws Exception{
        UserEntity result = userRepository.saveAndFlush(userEntity);
        recordEntity.setUserEntity(result);
        RecordEntity recordInfo = null;
        if (recordEntity != null) {
            recordInfo = (RecordEntity) recordService.addRecordInfo(recordEntity);
        }
        Map map = new HashMap();
        map.put("userEntity", result);
        map.put("recordEntity", recordInfo);
        return map;
    }
}


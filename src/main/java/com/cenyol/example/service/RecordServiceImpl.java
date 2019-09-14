package com.cenyol.example.service;

import com.cenyol.example.entity.RecordEntity;
import com.cenyol.example.entity.UserEntity;
import com.cenyol.example.model.PageParam;
import com.cenyol.example.repository.RecordRepository;
import com.cenyol.example.repository.UserRepository;
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
import java.util.ArrayList;
import java.util.List;

/**
 * Created by HUANG on 2019/8/14.
 */
@Service
public class RecordServiceImpl implements RecordService<RecordEntity> {

    @Autowired
    private RecordRepository recordRepository;

    @Autowired
    private UserRepository userRepository;

    public RecordEntity addRecordInfo(RecordEntity recordEntity) {
        RecordEntity result = recordRepository.saveAndFlush(recordEntity);
        return result;
    }

    @Transactional
    public RecordEntity addRecordAndUpdateUserInfo(RecordEntity recordEntity) {
        UserEntity userEntity = recordEntity.getUserEntity();
        userRepository.updateUser(
                userEntity.getCompany(),
                userEntity.getName(),
                userEntity.getPhone(),
                userEntity.getId(),
                userEntity.getBusiness(),
                userEntity.getSource(),
                userEntity.getCounselor(),
                userEntity.getIncome(),
                userEntity.getState(),
                userEntity.getService_type(),
                userEntity.getCustomer_type()
        );
        RecordEntity result = addRecordInfo(recordEntity);
        return result;
    }

    public Page<RecordEntity> getUserRecord(PageParam pageParam, Class<RecordEntity> recordEntityClass) {
        int page = pageParam.getPage();
        int pageSize = pageParam.getPageSize();
        final String property = pageParam.getProperty();
        final RecordEntity recordEntity = (RecordEntity) pageParam.getObject();

        Pageable pageable = new PageRequest(page, pageSize, Sort.Direction.ASC, property);
        Specification<RecordEntity> specification = new Specification<RecordEntity>() {
            public Predicate toPredicate(Root<RecordEntity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicates = new ArrayList<Predicate>();
                Field[] fields = RecordEntity.class.getDeclaredFields();
                for (Field f : fields) {
                    f.setAccessible(true);
                    String type = f.getType().toString();
                    if (type.endsWith("String")) {
                        try {
                            if (f.get(recordEntity) != null && f.get(recordEntity) != "") {

                            }
                        } catch (IllegalAccessException e) {
                            e.printStackTrace();
                        }
                    } else if (type.endsWith("Integer")) {//对应id
                        try {
                            if (f.get(recordEntity) != null) {
                                if (((Integer) f.get(recordEntity)).intValue() != 0) {
                                    predicates.add(cb.equal(root.get(f.getName()), ((Integer) f.get(recordEntity)).intValue()));
                                }
                            }
                        } catch (IllegalAccessException e) {
                            e.printStackTrace();
                        }
                    } else if (type.endsWith("Date")) {

                    } else if (type.endsWith("UserEntity")) {
                        try {
                            if (f.get(recordEntity) != null) {
                                Integer id = ((UserEntity) f.get(recordEntity)).getId();
                                predicates.add(cb.equal(root.get("userEntity").as(UserEntity.class), f.get(recordEntity)));
                            }
                        } catch (IllegalAccessException e) {
                            e.printStackTrace();
                        }
                    }
                }
                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };

        return recordRepository.findAll(specification, pageable);
    }

}

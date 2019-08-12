package com.cenyol.example.repository;

import com.cenyol.example.entity.UserEntity;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by sjj on 2015/10/24 0024.
 */
@Repository // 添加注解
public interface UserRepository extends BaseRepository<UserEntity, Integer> {

    @Modifying // 说明该方法是修改操作
    @Transactional // 说明该方法是事务性操作
    // 定义查询
    // @Param注解用于提取参数
    @Query("update UserEntity us set us.company=:qCompany, us.name=:qName, us.phone=:qPhone, us.state=:qState where us.id=:qId")
    public void updateUser(@Param("qCompany") String company,
                           @Param("qName") String name,
                           @Param("qPhone") String phone,
                           @Param("qId") Integer id,
                           @Param("qState") String state);

    UserEntity findById(Integer userId);
}
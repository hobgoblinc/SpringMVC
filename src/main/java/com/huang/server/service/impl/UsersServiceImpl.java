package com.huang.server.service.impl;

import com.huang.server.entity.RoleEntity;
import com.huang.server.entity.UsersEntity;
import com.huang.server.repository.RoleRepository;
import com.huang.server.repository.UsersRepository;
import com.huang.server.service.UsersService;
import org.json.JSONException;
import org.json.JSONObject;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by HUANG at 2019/8/23
 */
@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private RoleRepository roleRepository;

    public Map addUserInfo(JSONObject object) {
        Map map = new HashMap();
        String roleId = "";
        try {
            roleId = object.getString("userId");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        if (usersRepository.findByUserId(roleId).size() > 0) {
            map.put("msg", "exists user");
            map.put("error", true);
            return map;
        }

        UsersEntity user = getEntityReflective(object, new UsersEntity());//create an user object

        try {
            if (object.get("role") != null) {
                String[] roles = object.getString("role").split(",");
                List<RoleEntity> list = new ArrayList();
                for (String r : roles) {
                    RoleEntity role = roleRepository.findByRoleId(r);//找到RoleEntity实体
                    list.add(role);
                }
                if (list.size() > 0) {
                    user.setRoles(list);
                }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        user = usersRepository.saveAndFlush(user);
        map.put("error", false);
        map.put("msg", user);

        return map;
    }

    @Transactional
    public Map queryUsersInfo(Map map) {
        int page = (Integer) map.get("pageNum") - 1;
        int pageSize = (Integer) map.get("pageSize");
        Pageable pageable = new PageRequest(page, pageSize, Sort.Direction.ASC, "id");
        Specification<UsersEntity> specification = new Specification<UsersEntity>() {
            public Predicate toPredicate(Root<UsersEntity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicates = new ArrayList<Predicate>();

                return cb.and(predicates.toArray(new Predicate[predicates.size()]));
            }
        };

        Page<UsersEntity> result = usersRepository.findAll(specification, pageable);
        int pageNum = result.getTotalPages();
        int nowPage = result.getNumber() + 1;
        long totalElement = result.getTotalElements();
        List<UsersEntity> list = result.getContent();
        Map resultMap = new HashMap();
        resultMap.put("pageNum", pageNum);
        resultMap.put("nowPage", nowPage);
        resultMap.put("totalElement", totalElement);
        resultMap.put("list", list);
        return resultMap;
    }

    /**
     * 利用反射取 JSONObject 中的参数给 T 类型的对象设置属性
     *
     * @param object
     * @param o
     * @param <T>
     * @return
     * @throws JSONException
     * @throws IllegalAccessException
     */
    public static <T> T getEntityReflective(JSONObject object, T o) {
        Field[] fields = o.getClass().getDeclaredFields();
        for (Field field : fields) {
            String type = field.getType().toString();
            String name = field.getName();
            try {
                if (object.get(name) != null) {
                    field.setAccessible(true);
                    if (type.endsWith("String")) {
                        field.set(o, object.getString(name));
                    } else if (type.endsWith("Long")) {
                        field.set(o, Long.parseLong(object.getString(name)));
                    } else if (type.endsWith("Integer")) {
                        field.set(o, Integer.parseInt(object.getString(name)));
                    } else if (type.endsWith("BigDecimal")) {
                        field.set(o, new BigDecimal(object.getString(name)));
                    } else if (type.endsWith("Date")) {

                    } else if (type.endsWith("int")) {
                        field.set(o, object.getInt(name));
                    }
                }
            } catch (JSONException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        return o;
    }

//    private static boolean
}

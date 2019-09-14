package com.cenyol.example.controller;

import com.cenyol.example.entity.RecordEntity;
import com.cenyol.example.entity.UserEntity;
import com.cenyol.example.model.PageParam;
import com.cenyol.example.model.RecordModel;
import com.cenyol.example.model.UserModel;
import com.cenyol.example.repository.UserRepository;
import com.cenyol.example.service.RecordService;
import com.cenyol.example.service.UserService;
import com.cenyol.example.service.UserServiceImpl;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by sjj on 2015/10/24 0024.
 */
@Controller
public class MainController {

    @Autowired
    private UserService userService;

    // 自动装配
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RecordService recordService;

    // 首页
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "userManage";
    }

    // 用户管理
    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String users(ModelMap modelMap) {
        // 找到user表里面的所有记录
        List<UserEntity> userEntityList = userRepository.findAll();

        // 将所有的记录传递给返回的jsp页面
        modelMap.addAttribute("userList", userEntityList);

        // 返回pages目录下的userManage.jsp
        return "userManage";
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String indexAll() {
//        PageParam pageParam = new PageParam(page - 1, pageSize, "id");
//        Page<UserEntity> result = userService.getUsersPage(pageParam, UserEntity.class);
//        int pageNum = result.getTotalPages();
//        int nowPage = result.getNumber() + 1;
//        Long total = result.getTotalElements();
//        List<UserEntity> userEntityList = result.getContent();
//        modelMap.addAttribute("userList", userEntityList);
//        modelMap.addAttribute("totalPages", pageNum);
//        modelMap.addAttribute("currentPage", nowPage);
//        modelMap.addAttribute("totalElements", total);
        return "userManage";
    }

    @RequestMapping(value = "/userPages", method = RequestMethod.POST)
    @ResponseBody
    public HashMap users(@RequestBody List<Object> list) {
        HashMap mapbody = (HashMap) list.get(0);
        HashMap mappage = (HashMap) list.get(1);
        int page = (Integer)mappage.get("page");
        int pageSize = (Integer) mappage.get("pageSize");
        HashMap map = new HashMap();
        PageParam pageParam = new PageParam(page - 1, pageSize, "id", mapbody);
        Page<UserEntity> result = userService.getUsersPage(pageParam, UserEntity.class);
        int pageNum = result.getTotalPages();
        int nowPage = result.getNumber() + 1;
        Long total = result.getTotalElements();
        List<UserEntity> userEntityList = result.getContent();
        List<UserModel> userModelList = new ArrayList<UserModel>();
        for (UserEntity u :
                userEntityList) {
            userModelList.add(new UserModel(u));
        }
        map.put("userList", userModelList);
        map.put("totalPages", pageNum);
        map.put("currentPage", nowPage);
        map.put("totalElements", total);
        return map;
    }

    // 添加用户表单页面
    @RequestMapping(value = "/addUser", method = RequestMethod.GET)
    public String addUser() {
        return "addUser";
    }

    // 添加用户处理
    @RequestMapping(value = "/addUserPost", method = RequestMethod.POST)
    @ResponseBody
    public Map addUserPost(@RequestBody List<Object> list, UserEntity userEntity, RecordEntity recordEntity) {
        if (list.size() < 2) {
            return null;
        }
        HashMap map = (HashMap) list.get(0);
        Field[] fields = UserEntity.class.getDeclaredFields();
        tryToSetFieldValue(userEntity, map, fields);

        HashMap map1 = (HashMap) list.get(1);
        Field[] fields1 = RecordEntity.class.getDeclaredFields();
        tryToSetFieldValue(recordEntity, map1, fields1);
        userEntity.setCreateTime(new Date());
        recordEntity.setDate(new Date());
//        RecordEntity recordEntity = (RecordEntity)list.get(1);

        // 向数据库添加一个用户
        //userRepository.save(userEntity);

        // 向数据库添加一个用户，并将内存中缓存区的数据刷新，立即写入数据库，之后才可以进行访问读取
//        userRepository.saveAndFlush(userEntity);
        Map infoMap = null;
        try {
            infoMap = userService.addUserInfo(userEntity, recordEntity);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (infoMap == null) {
            infoMap.put("error", "插入失败，请检查数据格式");
        }

        return infoMap;
    }

    private void tryToSetFieldValue(Object userEntity, HashMap map1, Field[] fields1) {
        for (Field f : fields1) {
            if (map1.get(f.getName()) != null && map1.get(f.getName()) != "") {
                try {
                    f.setAccessible(true);
                    String type = f.getType().toString();
                    if (type.endsWith("String")) {
                        f.set(userEntity, map1.get(f.getName()));
                    } else if (type.endsWith("BigDecimal")) {
                        if (map1.get(f.getName()) != "") {
                            BigDecimal bigDecimal = new BigDecimal((String) map1.get(f.getName()));
                            f.set(userEntity, bigDecimal);
                        }
                    } else if (type.endsWith("Date")) {
                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        Date date = null;
                        try {
                            date = simpleDateFormat.parse((String) map1.get(f.getName()));
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        f.set(userEntity, date);
                    }

                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // 查看用户详细信息
    // @PathVariable可以收集url中的变量，需匹配的变量用{}括起来
    // 例如：访问 localhost:8080/showUser/1 ，将匹配 userId = 1
    @RequestMapping(value = "/userDetail/{userId}", method = RequestMethod.GET)
    @ResponseBody
    public Map showUser(@PathVariable("userId") Integer userId, @RequestParam("page")int page, @RequestParam("pageSize") int pageSize) {
        Map map = new HashMap();
        UserEntity userEntity = new UserEntity();
        userEntity.setId(userId);
        RecordEntity recordEntity = new RecordEntity();
        recordEntity.setUserEntity(userEntity);
        PageParam<RecordEntity> pageParam = new PageParam<RecordEntity>(page - 1, pageSize, "id", recordEntity);
        Page<RecordEntity> result = recordService.getUserRecord(pageParam, recordEntity.getClass());
        int pageNum = result.getTotalPages();
        int nowPage = result.getNumber() + 1;
        Long total = result.getTotalElements();
        int totalPage = result.getTotalPages();
        List<RecordEntity> recordEntities = result.getContent();
        List<RecordModel> lists = new ArrayList<RecordModel>();
        for (RecordEntity r : recordEntities) {
            lists.add(new RecordModel(r));
        }
        map.put("totalPages_record", pageNum);
        map.put("currentPage_record", nowPage);
        map.put("totalElements_record", total);
        map.put("totalPages_record", totalPage);
        map.put("recordLists", lists);
//        UserEntity userEntity = userRepository.findOne(userId);
//        modelMap.addAttribute("user", userEntity);
        return map;
    }

    // 更新用户信息页面
    @RequestMapping(value = "/updateUser/{userId}", method = RequestMethod.GET)
    @ResponseBody
    public Map updateUser(@PathVariable("userId") Integer userId, ModelMap modelMap) {
        UserEntity userEntity = userRepository.findById(userId);
//        UserEntity userEntity = userRepository.findOne(userId);
//        modelMap.addAttribute("user", userEntity);
        HashMap map = new HashMap();
        map.put("user", userEntity);
        return map;
    }

    // 处理用户修改请求
    @RequestMapping(value = "/updateUserPost", method = RequestMethod.POST, consumes = "application/json;charset=utf-8")
    @ResponseBody
    public Map updateUserPost(@RequestBody UserModel userEntity) {
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
        HashMap map = new HashMap();
        map.put("result", "success");
        return map;
    }

    // 删除用户
    @RequestMapping(value = "/deleteUser/{userId}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable("userId") Integer userId) {
        // 删除id为userId的用户
        userRepository.delete(userId);
        // 立即刷新数据库
        userRepository.flush();
        return "redirect:/userPage";
    }

    @RequestMapping(value = "/addRecord", method = RequestMethod.POST)
    @ResponseBody
    public Map addUserRecord(@RequestBody List<Object> list, UserEntity userEntity, RecordEntity recordEntity) {
        Map userInfo = (HashMap<String, String>)list.get(0);
        Map recordInfo = (HashMap) list.get(1);
        int id = Integer.parseInt(userInfo.get("id").toString());
        String comapny = userInfo.get("company").toString();
        String phone = userInfo.get("phone").toString();
        String name = userInfo.get("name").toString();
        String state = userInfo.get("state").toString();
        String business = userInfo.get("business").toString();
        String source = userInfo.get("source").toString();
        String counselor = userInfo.get("counselor").toString();
        String serviceType = userInfo.get("service_type").toString();
        String customType = userInfo.get("customer_type").toString();
        BigDecimal val = userInfo.get("income") != null && userInfo.get("income").toString().trim() != "" ? new BigDecimal(userInfo.get("income").toString().trim()) : new BigDecimal("0");
        userEntity = new UserEntity(id,comapny, name, phone, state, business, source, counselor, val,serviceType, customType);
        String content = recordInfo.get("content").toString();
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date nextDate = null;
        if (recordInfo.get("nextDate") != null && recordInfo.get("nextDate").toString().trim() != "") {
            try {
                nextDate = simpleDateFormat.parse(recordInfo.get("nextDate").toString());
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        Date giveUpDate = null;
        if (recordInfo.get("giveUpDate") != null && recordInfo.get("giveUpDate").toString().trim() != "") {
            try {
                giveUpDate = simpleDateFormat.parse(recordInfo.get("giveUpDate").toString());
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        Date payDate = null;
        if (recordInfo.get("payDate") != null && recordInfo.get("payDate").toString().trim() != "") {
            try {
                payDate = simpleDateFormat.parse(recordInfo.get("payDate").toString());
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        recordEntity = new RecordEntity(content, date, userEntity, nextDate, giveUpDate, payDate);
        HashMap map = new HashMap();
        recordEntity = recordService.addRecordAndUpdateUserInfo(recordEntity);
        map.put("list", recordEntity);
        return map;
    }
}
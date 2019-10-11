package com.huang.server.controller;

import com.huang.server.entity.RecordEntity;
import com.huang.server.entity.UserEntity;
import com.huang.server.model.PageParam;
import com.huang.server.model.RecordModel;
import com.huang.server.model.UserModel;
import com.huang.server.repository.ServiceRepository;
import com.huang.server.repository.UserRepository;
import com.huang.server.service.RecordService;
import com.huang.server.service.UserService;
import com.huang.server.util.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by HUANG at 2019/9/19
 */
@Controller
public class VueAdminWebappController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RecordService recordService;

    @Autowired
    private ServiceRepository serviceRepository;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Map login(@RequestBody Map object) {
        Map map = new HashMap();
        if ("admin".equals(object.get("user"))) {
            map.put("token", "admin-token");
            map.put("user", "admin");

        } else {
            map.put("token", "user-token");
            map.put("user", "user");
        }
        map.put("msg", "登录成功");
        map.put("success", true);
        return CommonUtils.successPage(map);
    }


    @RequestMapping(value = "/getInfo", method = RequestMethod.GET)
    @ResponseBody
    public Map getInfo() {
        Map map = new HashMap();
        map.put("introduce", "this is a introduce");
        map.put("name", "user");
        List list = new ArrayList();
        list.add("Home");
        list.add("Dashbord");
        list.add("Table");
        list.add("BaseTable");
        list.add("ComplexTable");
        list.add("Permission");
        list.add("Roles");
        list.add("Icons");
        list.add("PageUser");
        list.add("Echarts");
        list.add("Sldie-chart");
        list.add("Dynamic-chart");
        list.add("Icons-index");
        map.put("roles", list);
        return CommonUtils.successPage(map);
    }


    @RequestMapping(value = "/getBarData", method = RequestMethod.GET)
    @ResponseBody
    public Map getBarData() {
        Map map = new HashMap();
        List list = new ArrayList();
        list.add(431241);
        list.add(432435);
        list.add(753464);
        list.add(86588);
        list.add(855865);
        list.add(85858);
        list.add(876867);
        list.add(694666);
        list.add(445674);
        list.add(645364);
        list.add(996533);
        list.add(433465);
        map.put("y2017", list);

        List list1 = new ArrayList();
        list1.add(432143);
        list1.add(643262);
        list1.add(567576);
        list1.add(65434);
        list1.add(6546);
        list1.add(76576);
        list1.add(765888);
        list1.add(765544);
        list1.add(89999);
        list1.add(34255);
        list1.add(543645);
        list1.add(626666);
        map.put("y2018", list1);

        List list2 = new ArrayList();
        list2.add(235634);
        list2.add(6546);
        list2.add(654645);
        list2.add(54654);
        list2.add(654654);
        list2.add(654756);
        list2.add(754765);
        list2.add(765765);
        list2.add(865765);
        list2.add(343654);
        list2.add(865765);
        list2.add(654446);
        map.put("y2019", list2);
        return CommonUtils.successPage(map);
    }

    @RequestMapping(value = "/getCardsData", method = RequestMethod.GET)
    @ResponseBody
    public Map getCardsData() {
        Map map = new HashMap();
        map.put("message", 888);
        map.put("order", 666);
        map.put("profit", 1200);
        map.put("vistors", 666666);
        return CommonUtils.successPage(map);
    }

    @RequestMapping(value = "/getLineData", method = RequestMethod.GET)
    @ResponseBody
    public Map getLineData() {
        Map map = new HashMap();
        List list = new ArrayList();
        list.add(78976);
        list.add(54355);
        list.add(65464);
        list.add(65477);
        list.add(32524);
        list.add(98786);
        map.put("inPrice", list);

        List list1 = new ArrayList();
        list1.add(65446);
        list1.add(75465);
        list1.add(34345);
        list1.add(75765);
        list1.add(36547);
        list1.add(88576);
        map.put("outPrice", list1);

        return CommonUtils.successPage(map);
    }

    @RequestMapping(value = "/getTableList", method = RequestMethod.GET)
    @ResponseBody
    public Map getTableList() {
        Map map = new HashMap();
        List list = new ArrayList();
        Map temp = new HashMap();
        temp.put("id", "787867867856786896");
        temp.put("name", "fjdilsajfil");
        temp.put("price", 7897);
        temp.put("quantity", 789);
        temp.put("status", 1);
        list.add(temp);
        map.put("tableList", list);
        return CommonUtils.successPage(map);
    }

    @RequestMapping(value = "/getRoles", method = RequestMethod.GET)
    @ResponseBody
    public Map getRoles() {
        Map map = new HashMap();
        List list = new ArrayList();
        list.add("Home");
        list.add("Dashbord");
        list.add("PageUser");
        list.add("Permission");
        list.add("Table");
        list.add("ComplexTable");
        list.add("Icons-index");
        list.add("Components");
        Map temp = new HashMap();
        temp.put("description", "I am User");
        temp.put("key", "user");
        temp.put("pages", list);
        List list1 = new ArrayList();
        list1.add(temp);
        map.put("allRoles", list1);
        return CommonUtils.successPage(map);
    }

    @RequestMapping(value = "/getPageData2", method = RequestMethod.POST)
    @ResponseBody
    public Map getPageData2(@RequestBody Map map) {
        int page = (Integer)map.get("pageNum");
        int pageSize = (Integer) map.get("pageSize");
        PageParam pageParam = new PageParam(page - 1, pageSize, "id", map);
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

        return CommonUtils.successPage(map);
    }

    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    @ResponseBody
    public Map updateUser(@RequestBody Map map) {
        userRepository.updateUser(
                map.get("company").toString(),
                map.get("name").toString(),
                map.get("phone").toString(),
                (Integer) map.get("id"),
                map.get("business").toString(),
                map.get("source").toString(),
                map.get("counselor").toString(),
                new BigDecimal(map.get("income").toString()),
                map.get("state").toString(),
                map.get("service_type").toString(),
                map.get("customer_type").toString()
        );
        return CommonUtils.successPage(map);
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    @ResponseBody
    public Map addUser(@RequestBody Map map) {
        UserEntity userEntity = new UserEntity();
        RecordEntity recordEntity = new RecordEntity();
        Field[] fields = UserEntity.class.getDeclaredFields();
        tryToSetFieldValue(userEntity, (HashMap) map, fields);
        userEntity.setCreateTime(new Date());

        Map infoMap = null;
        try {
            infoMap = userService.addUserInfo(userEntity, recordEntity);
            infoMap.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            infoMap.put("success", false);
            infoMap.put("error", "插入失败，请检查数据格式");
        }

        return CommonUtils.successPage(infoMap);
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

    @RequestMapping(value = "/userDetail", method = RequestMethod.GET)
    @ResponseBody
    public Map userDetail(@RequestParam("userId") Integer userId, @RequestParam("page")int page, @RequestParam("pageSize") int pageSize) {
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
        return CommonUtils.successPage(map);
    }

    @RequestMapping(value = "/addRecordInfo", method = RequestMethod.POST)
    @ResponseBody
    public Map addRecordInfo(@RequestBody Map map) throws Exception {
        String content = map.get("content").toString();
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date nextDate = null;
        if (map.get("nextDate") != null && map.get("nextDate").toString().trim() != "") {
            try {
                nextDate = simpleDateFormat.parse(map.get("nextDate").toString());
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        Date giveUpDate = null;
        if (map.get("giveUpDate") != null && map.get("giveUpDate").toString().trim() != "") {
            try {
                giveUpDate = simpleDateFormat.parse(map.get("giveUpDate").toString());
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        Date payDate = null;
        if (map.get("payDate") != null && map.get("payDate").toString().trim() != "") {
            try {
                payDate = simpleDateFormat.parse(map.get("payDate").toString());
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        UserEntity userEntity = userRepository.findById(Integer.valueOf(map.get("id").toString()));
        if (userEntity == null) {
            throw new Exception(map.get("id") + "用户不存在");
        }
        RecordEntity recordEntity = new RecordEntity(content, date, userEntity, nextDate, giveUpDate, payDate);
        recordService.addRecordAndUpdateUserInfo(recordEntity);
        return CommonUtils.successPage(null);
    }

    @RequestMapping(value = "/serviceTypeList", method = RequestMethod.GET)
    @ResponseBody
    public Map serviceTypeList() {
        List<Object> list = serviceRepository.findAllServiceType();
        return CommonUtils.successList(list);
    }
}

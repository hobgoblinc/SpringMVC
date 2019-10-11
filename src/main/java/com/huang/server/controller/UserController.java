package com.huang.server.controller;

import com.huang.server.entity.RoleEntity;
import com.huang.server.service.RoleService;
import com.huang.server.service.UsersService;
import com.huang.server.util.CommonUtils;
import com.huang.server.util.TreeUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by HUANG at 2019/8/23
 */
@Controller
public class UserController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private UsersService usersService;

    @RequestMapping("/addRole")
    @ResponseBody
    public Map addRoleInfo(@RequestBody RoleEntity object) {
        Map map = new HashMap();
        roleService.addRole(object);
        map.put("msg", "添加成功");
        return map;
    }

    @RequestMapping(value = "/addUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public Map addUserInfo(@RequestBody Map param) {
        if (!param.containsKey("userId")) {
            return null;
        }
        JSONObject object = new JSONObject(param);
        Map map = new HashMap();
        return usersService.addUserInfo(object);

    }

    @RequestMapping(value = "/queryUsers")
    @ResponseBody
    public Map queryUserInfo(@RequestBody Map param) {

        return usersService.queryUsersInfo(param);
    }

    @RequestMapping(value = "/getTree")
    @ResponseBody
    public List query() {
        return TreeUtils.getList();
    }



    @RequestMapping(value = "/user/info", method = RequestMethod.GET)
    @ResponseBody
    public Map info(@RequestParam Map object) {
        Map map = new HashMap();
        map.put("code", 20000);
        Map temp = new HashMap();
        temp.put("name", "Jack Blame");
        temp.put("roles", "admin-role");
        temp.put("avatar", "avatar");
        temp.put("introduction", "this is a introduction!");
        temp.put("token", "admin-token");
        temp.put("message", "success");
        map.put("data", temp);
        return map;
    }

    @RequestMapping(value = "/user/lineData")
    @ResponseBody
    public Map line(@RequestParam Map param) {
        Map map = new HashMap();
        Object[] data1 = new Object[]{150, 182, 191, 134, 150, 120, 110, 125, 145, 122, 165, 122};
        Object[] data2 = new Object[]{120, 110, 125, 145, 122, 165, 122, 220, 182, 191, 134, 150};
        Object[] data3 = new Object[]{220, 182, 125, 145, 122, 191, 134, 150, 120, 110, 165, 122};
        map.put("data1", data1);
        map.put("data2", data2);
        map.put("data3", data3);
        map.put("message", "success");
        return CommonUtils.successPage(map);

    }

    @RequestMapping(value = "/user/logout")
    @ResponseBody
    public Map logout(HttpServletRequest request) {
        Map map = new HashMap();
        map.put("message", "success");
        return CommonUtils.successPage(map);
    }

}

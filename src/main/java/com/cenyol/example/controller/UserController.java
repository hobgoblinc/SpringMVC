package com.cenyol.example.controller;

import com.cenyol.example.entity.RoleEntity;
import com.cenyol.example.service.RoleService;
import com.cenyol.example.service.UsersService;
import com.cenyol.example.util.TreeUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

}

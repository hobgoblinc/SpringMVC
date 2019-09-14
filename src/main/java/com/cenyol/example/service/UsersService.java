package com.cenyol.example.service;

import org.json.JSONObject;

import java.util.Map;

/**
 * Created by HUANG at 2019/8/23
 */
public interface UsersService {

    Map addUserInfo(JSONObject object);

    Map queryUsersInfo(Map map);

}

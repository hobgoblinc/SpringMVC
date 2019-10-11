package com.huang.server.util;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by HUANG at 2019/9/15
 */
public class CommonUtils {

    /**
     * 返回成功码code: 20000
     *
     * @param object 返回数据，map类型
     * @return
     */
    public static Map successPage(Map object) {
        Map map = new HashMap();
        map.put("code", 0);
        map.put("data", object);
        return map;
    }

    public static Map errorPage(Map object) {
        Map map = new HashMap();
        map.put("code", 1);
        map.put("data", null);
        return map;
    }

    public static Map successList(List list) {
        Map map = new HashMap();
        map.put("code", 1);
        map.put("data", list);
        return map;
    }
}

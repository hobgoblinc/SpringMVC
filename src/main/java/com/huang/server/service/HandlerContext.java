package com.huang.server.service;

import org.springframework.beans.BeanUtils;
import org.springframework.context.ApplicationContext;

import java.util.Map;

/**
 * Created by HUANG at 2019/9/30
 */
public class HandlerContext {

    private Map<String, Class> handlerMap;

    public HandlerContext(Map<String, Class> handlerMap) {
        this.handlerMap = handlerMap;
    }

    public AbstractHandler getInstance(String type) throws IllegalAccessException {
        Class clazz = handlerMap.get(type);
        if (clazz == null) {
            throw new IllegalAccessException("not found handler for type : " + type);
        }
        return null;
    }
}

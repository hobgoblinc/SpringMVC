package com.huang.server.annotation;

import java.lang.annotation.*;

/**
 * Created by HUANG at 2019/10/1
 */
@Documented
@Retention(value = RetentionPolicy.RUNTIME)
@Target(value = ElementType.TYPE)
public @interface Type {
    String value();
}

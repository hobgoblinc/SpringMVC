package com.huang.server.model;

/**
 * Created by HUANG at 2019/8/11
 */
public class PageParam<U> {

    private int page;
    private int pageSize;
    private U object;
    private String property;

    public PageParam(int page, int pageSize, String property, U u) {
        this.page = page;
        this.pageSize = pageSize;
        this.property = property;
        this.object = u;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public U getObject() {
        return object;
    }

    public void setObject(U object) {
        this.object = object;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public int getPage() {
        return page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public String getProperty() {
        return property;
    }
}

package com.cenyol.example.model;

/**
 * Created by HUANG at 2019/8/11
 */
public class PageParam {

    private int page;
    private int pageSize;
    private String property;

    public PageParam(int page, int pageSize, String property) {
        this.page = page;
        this.pageSize = pageSize;
        this.property = property;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
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

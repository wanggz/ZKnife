package com.yudao.zknife.web.model;

import java.util.List;

/**
 * Created by Austin on 2016/8/5.
 */
public class ConfigInfo {

    private String projectname;
    private List<String> configs;

    public String getProjectname() {
        return projectname;
    }

    public void setProjectname(String projectname) {
        this.projectname = projectname;
    }

    public List<String> getConfigs() {
        return configs;
    }

    public void setConfigs(List<String> configs) {
        this.configs = configs;
    }

}

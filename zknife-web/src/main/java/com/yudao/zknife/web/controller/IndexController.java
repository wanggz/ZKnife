package com.yudao.zknife.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.zkclient.ZkClient;
import com.yudao.zknife.web.conf.ConsumerConfig;
import com.yudao.zknife.web.model.ConfigInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Austin on 2016/8/3.
 */
@Controller
public class IndexController {

    private ZkClient zkc;

    @Autowired
    public void setZkc(ZkClient zkc) {
        this.zkc = zkc;
    }

    private static String confPath = ConsumerConfig.ZOOKEEPER_PATH;

    @RequestMapping(value="index.do", method = RequestMethod.GET)
    public ModelAndView index() {

        List<String> projects = zkc.getChildren(confPath);

        List<ConfigInfo> configInfos = new ArrayList<>();
        for (String project : projects) {
            ConfigInfo configInfo = new ConfigInfo();
            configInfo.setProjectname(project);
            configInfo.setConfigs(zkc.getChildren(confPath+"/"+project));
            configInfos.add(configInfo);
        }
        ModelAndView mv = new ModelAndView();
        mv.addObject("configinfos", configInfos);
        mv.setViewName("index");

        return mv;
    }

    public String search(){



        return "";
    }

    @RequestMapping(value="home.do", method = RequestMethod.GET)
    public ModelAndView home(@RequestParam(value = "project", required = true)String project,
                             @RequestParam(value = "config", required = true)String config) {
        List<String> projects = zkc.getChildren(confPath);
        List<ConfigInfo> configInfos = new ArrayList<>();
        ModelAndView mv = new ModelAndView();
        mv.addObject("configinfos", configInfos);
        for (String p : projects) {
            ConfigInfo configInfo = new ConfigInfo();
            configInfo.setProjectname(p);
            configInfo.setConfigs(zkc.getChildren(confPath+"/"+p));
            configInfos.add(configInfo);
            if(p.equals(project)){
                List<String> configs = configInfo.getConfigs();
                for(String c : configs){
                    if(c.equals(config)){
                        String content = new String(zkc.readData(confPath + "/" + p + "/" + c));
                        JSONObject contentJson = JSONObject.parseObject(content);
                        mv.addObject("value",contentJson.toJSONString());
                    }
                }
            }
        }
        mv.setViewName("home");
        return mv;
    }

}

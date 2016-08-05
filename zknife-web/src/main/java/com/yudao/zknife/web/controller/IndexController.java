package com.yudao.zknife.web.controller;

import com.github.zkclient.ZkClient;
import com.yudao.zknife.web.conf.ConsumerConfig;
import com.yudao.zknife.web.model.ConfigInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

        List<ConfigInfo> configInfos = new ArrayList<ConfigInfo>();
        for (String project : projects) {
            ConfigInfo configInfo = new ConfigInfo();
            configInfo.setProjectname(project);
            configInfo.setConfigs(zkc.getChildren(confPath+"/"+project));
            configInfos.add(configInfo);
        }
        ModelAndView mv = new ModelAndView();
//        RemoteConfig remoteConfig = new RemoteConfig();
//        mv.addObject("environment",remoteConfig.environment);
//        mv.addObject("value",remoteConfig.value);
        mv.addObject("configinfos", configInfos);
        //if (update !=null && update.equals("update")) {
        //    mv.setViewName("projectlist");
        //} else {
            mv.setViewName("index");
        //}
        return mv;
    }

    public String search(){



        return "";
    }

}

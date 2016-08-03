package com.yudao.zknife.web.controller;

import com.github.zkclient.ZkClient;
import com.yudao.zknife.web.conf.ConsumerConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    public String index() {

        List<String> projects = zkc.getChildren(confPath);

        System.out.println(projects);


        return "index";
    }

}

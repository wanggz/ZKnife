package com.yudao.zknife.core;

import com.yudao.zknife.config.AppProperties;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;

/**
 * Created by Austin on 2016/7/8.
 */
public class ConfigFactory {

    private static final Logger log = LoggerFactory.getLogger(ConfigFactory.class);

    static HashMap<String, ZPConfig> configMap = new HashMap<>(), appConfigs = new HashMap<>();
    static ZKPManager watcher = new ZKPManager();
    //static AbsConfigCreater remoteCreater = new RemoteCreater(watcher), fileCreater = new FileCreater();

    static {
        init(AppProperties.ZOOKEEPER_PATH);
    }

    public static void init(String appPath) {

    }

}
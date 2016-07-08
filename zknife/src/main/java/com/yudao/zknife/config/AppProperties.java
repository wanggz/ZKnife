/*
 *
 */
package com.yudao.zknife.config;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by Austin on 2016/7/8.
 */
public class AppProperties {

    /**
     *
     */
    public static String ZOOKEEPER_PATH;
    /**
     *
     */
    public static String ZOOKEEPER_ADDRESS;

    static {
        Properties properties = new Properties();
        InputStream in = AppProperties.class.getClassLoader().getResourceAsStream("config.properties");
        try {
            properties.load(in);
            ZOOKEEPER_PATH = properties.getProperty("zookeeper.path").trim();
            ZOOKEEPER_ADDRESS = properties.getProperty("zookeeper.address").trim();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

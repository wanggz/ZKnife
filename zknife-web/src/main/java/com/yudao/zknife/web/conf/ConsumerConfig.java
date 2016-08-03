package com.yudao.zknife.web.conf;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by Austin on 2016/8/3.
 */
public class ConsumerConfig {

    /**
     * 项目在zookeeper集群中的节点路径
     */
    public static String ZOOKEEPER_PATH;

    static {
        Properties properties = new Properties();
        InputStream in = ConsumerConfig.class.getClassLoader().getResourceAsStream("consumer.properties");
        try {
            properties.load(in);
            ZOOKEEPER_PATH = properties.getProperty("zookeeper.path").trim();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}

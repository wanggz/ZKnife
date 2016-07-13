package com.yudao.config;

import com.yudao.zknife.config.AppProperties;
import com.yudao.zknife.core.ConfigFactory;
import com.yudao.zknife.core.ZPConfig;

/**
 * Created by Austin on 2016/7/13.
 */
public class ExampleSettings extends ZPConfig {

    final static String ZKP_PATH = AppProperties.ZOOKEEPER_PATH + "/" + ExampleSettings.class.getName();
    static ExampleSettings configs;

    public synchronized static ExampleSettings Instance() {
        if (configs == null) {
            configs = (ExampleSettings) ConfigFactory.get(ZKP_PATH);
        }
        return configs;
    }

    public ExampleSettings(){
        path=ZKP_PATH;
    }

    @Override
    public void adjust() {

    }

    @Override
    public String toString() {
        return "exampleSettings v="+this.getVersion()+"; path="+this.getPath();
    }

}

package com.yudao.config;

import com.yudao.zknife.config.AppProperties;
import com.yudao.zknife.core.ConfigFactory;
import com.yudao.zknife.core.ZPConfig;

/**
 * 测试远程配置文件的配置类
 *
 * Created by Austin on 2016/7/13.
 */
public class RemoteConfigSettings extends ZPConfig {

    public final static String ZKP_PATH = AppProperties.ZOOKEEPER_PATH + "/" + RemoteConfigSettings.class.getName();
    static RemoteConfigSettings configs;

    public synchronized static RemoteConfigSettings Instance() {
        if (configs == null) {
            configs = (RemoteConfigSettings) ConfigFactory.get(ZKP_PATH);
        }
        return configs;
    }

    public RemoteConfigSettings(){
        path=ZKP_PATH;
    }

    @Override
    public void adjust() {

    }

    @Override
    public String toString() {
        return "remoteConfigSettings v="+this.getVersion()+"; path="+this.getPath();
    }

}

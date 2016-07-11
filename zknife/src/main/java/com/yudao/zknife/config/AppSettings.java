package com.yudao.zknife.config;

import com.yudao.zknife.core.ConfigFactory;
import com.yudao.zknife.core.ZPConfig;

import java.util.HashMap;
import java.util.Map;

/**
 * 默认远程配置文件
 *
 * Created by guangzhi.wang on 2016/7/11.
 */
public class AppSettings extends ZPConfig {

    final static String ZKP_PATH = AppProperties.ZOOKEEPER_PATH +"/" + AppSettings.class.getName();

    static AppSettings settings;

    Map<String,String> map = new HashMap<>();

    public synchronized static AppSettings Instance(){
        if(settings==null){
            settings=(AppSettings) ConfigFactory.get(ZKP_PATH);
        }
        return settings;
    }

    public AppSettings(){
        path=ZKP_PATH;
    }

    public Map<String, String> getMap() {
        return map;
    }

    public void setMap(Map<String, String> map) {
        this.map = map;
    }

    public String get(String key){
        return map.get(key);
    }

    @Override
    public String toString() {
        return "appSettings v="+this.getVersion()+"; path="+this.getPath()+"; "+map.toString();
    }

    @Override
    public void adjust() {

    }
}

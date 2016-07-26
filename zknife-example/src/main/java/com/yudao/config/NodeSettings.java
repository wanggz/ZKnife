package com.yudao.config;

import com.yudao.zknife.config.AppProperties;
import com.yudao.zknife.core.ChildZPConfig;
import com.yudao.zknife.core.ConfigFactory;

import java.util.List;

/**
 * 测试临时子节点使用的配置类
 *
 * Created by Austin on 2016/7/26.
 */
public class NodeSettings extends ChildZPConfig<String> {

    public final static String ZKP_PATH = AppProperties.ZOOKEEPER_PATH + "/" + NodeSettings.class.getName();

    static NodeSettings settings;

    /**
     * 通过构造函数，首次初始化节点信息。
     * @return
     */
    public synchronized static NodeSettings Instance() {
        if (settings == null) {
            settings = (NodeSettings) ConfigFactory.get(ZKP_PATH);
        }
        return settings;
    }

    @Override
    public String parse(String data) {
        return data;
    }

    List<String> roles;

    public List<String> getRoles() {
        return roles;
    }

    public void setRoles(List<String> roles) {
        this.roles = roles;
    }

    @Override
    public void updateNode(List<String> childrenNodes) {

    }
}

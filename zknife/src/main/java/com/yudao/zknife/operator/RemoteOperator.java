package com.yudao.zknife.operator;

import com.yudao.zknife.core.ZKPManager;
import com.yudao.zknife.core.ZPConfig;

/**
 * Created by Austin on 2016/7/11.
 */
public class RemoteOperator extends AbsConfigOperator {

    ZKPManager watcher;

    public RemoteOperator(ZKPManager watcher) {
        this.watcher = watcher;
    }

    /**
     * 从zookeeper中读取节点存储信息
     * @param path
     * @return
     */
    @Override
    public ZPConfig get(String path) {
        String content = watcher.readData(path, true);
        ZPConfig config=this.get(path, content);
        return config;
    }
}

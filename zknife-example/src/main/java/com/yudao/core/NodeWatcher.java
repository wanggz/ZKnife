package com.yudao.core;

import com.yudao.config.NodeSettings;
import com.yudao.zknife.core.IZKPWatcher;
import com.yudao.zknife.core.ZKPManager;

import java.util.List;

/**
 * 添加临时节点
 *
 * Created by Austin on 2016/7/26.
 */
public class NodeWatcher implements IZKPWatcher {

    @Override
    public void watch(String path, ZKPManager watcher) {
        List<String> children = watcher.getChildren(NodeSettings.ZKP_PATH, true);

        boolean isCreated = false;
        for(String child : children) {

        }
        String nodePath = NodeSettings.ZKP_PATH + "/" + getNodeName();
        if (!isCreated) {
            watcher.createZnode(nodePath);
        } else {

        }


    }

    public String getNodeName(){

        return "temp-node-";
    }

}

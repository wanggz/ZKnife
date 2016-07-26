package com.yudao.zknife.core;

import java.util.ArrayList;
import java.util.List;

/**
 * 子节点配置
 * Created by Austin on 2016/7/26.
 */
public abstract class ChildZPConfig<T> extends ZPConfig {

    @Override
    public void adjust() {
        List<String> children = ConfigFactory.getWatcher().getChildren(path, false);
        if(children.size() <= 0)
            return;
        List<T> childrenNodes = new ArrayList<>();
        for(String child : children){
            childrenNodes.add(parse(child));
        }
        updateNode(childrenNodes);
    }

    /**
     *
     * @param data
     * @return
     */
    public abstract T parse(String data);

    /**
     *
     * @param childrenNodes
     */
    public abstract void updateNode( List<T> childrenNodes);
}

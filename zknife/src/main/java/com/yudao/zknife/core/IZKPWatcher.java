package com.yudao.zknife.core;

/**
 * Created by Austin on 2016/7/8.
 */
public interface IZKPWatcher {

    /**
     *
     * @param path
     * @param watcher
     */
    void watch(String path, ZKPManager watcher);

}

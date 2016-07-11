package com.yudao.zknife.core;

import com.yudao.zknife.config.AppProperties;
import com.yudao.zknife.operator.AbsConfigOperator;
import com.yudao.zknife.operator.FileOperator;
import com.yudao.zknife.operator.RemoteOperator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Austin on 2016/7/8.
 */
public class ConfigFactory {

    private static final Logger log = LoggerFactory.getLogger(ConfigFactory.class);

    static HashMap<String, ZPConfig> configMap = new HashMap<>(), appConfigs = new HashMap<>();
    static ZKPManager watcher = new ZKPManager();
    static AbsConfigOperator remoteCreater = new RemoteOperator(watcher), fileCreater = new FileOperator();

    static {
        init(AppProperties.ZOOKEEPER_PATH);
    }

    public static void init(String appPath) {
        watcher.connectionHandler = new IZKPWatcher() {
            @Override
            public void watch(String path, ZKPManager watcher) {
                List<IZKPWatcher> handlers = WatcherPool.getList(WatcherPool.HandleMethod.CONNECT);
                for (IZKPWatcher handler : handlers) {
                    handler.watch(path, watcher);
                }
            }
        };
        watcher.updateHandler = new IZKPWatcher() {
            @Override
            public void watch(String path, ZKPManager watcher) {
                try {
                    List<IZKPWatcher> handlers = WatcherPool.getList(WatcherPool.HandleMethod.UPDATE);
                    for (IZKPWatcher handler : handlers) {
                        handler.watch(path, watcher);
                    }
                    build(path);
                    if (appConfigs.containsKey(path)) {
                        appConfigs.get(path).updateConfig(appConfigs.get(path));
                    }
                    System.out.println("updateHandler:" + path);
                    System.out.println(appConfigs.get(path));

                } catch (Exception ex) {
                    System.out.println(path);
                    System.out.println(ex.getMessage().toString());
                    log.error("Update exception for zookeeper : ", ex);
                }
            }
        };
    }

    public static ZKPManager getWatcher() {
        return watcher;
    }

    public synchronized static void build(String path) {
        ZPConfig rconfig = remoteCreater.get(path);
        ZPConfig fconfig = fileCreater.get(path);

        if (rconfig == null && fconfig == null) {
            System.out.println("没有获得任何配置文件！");
            return;
        }

        if (rconfig == null) {
            fconfig.adjust();
            configMap.put(path, fconfig);
            return;
        }

        if (fconfig == null) {
            rconfig.adjust();
            configMap.put(path, rconfig);
            remoteCreater.save(path, rconfig);
            return;
        }

        if (fconfig.getVersion() > rconfig.getVersion()) {
            fconfig.adjust();
            configMap.put(path, fconfig);
        } else {
            rconfig.adjust();
            configMap.put(path, rconfig);
            remoteCreater.save(path, rconfig);
        }
    }

    public synchronized static ZPConfig get(String path) {
        if (!configMap.containsKey(path)) {
            build(path);
        }
        ZPConfig config = configMap.get(path);
        if (!appConfigs.containsKey(path)) {
            appConfigs.put(path, config);
        }
        return config;
    }

}

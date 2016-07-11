package com.yudao.zknife.core;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;

/**
 * Created by Austin on 2016/7/11.
 */
public class ZKPRouser {
    private static boolean active=false;

    private static Map<String, Boolean> reloadAware = new HashMap<>();

    static class RouseTF implements ThreadFactory {

        public Thread newThread(Runnable r) {
            Thread t = new Thread(r, "RouseScheduledExecutorThread");
            t.setDaemon(true);
            return t;
        }
    }

    final public static ScheduledExecutorService ScheduledService =
            Executors.newSingleThreadScheduledExecutor(new RouseTF());

    public static void submit(Runnable cmd, long periodMilliSeconds){
        ScheduledService.scheduleAtFixedRate(cmd, 10l, periodMilliSeconds, TimeUnit.MILLISECONDS);
    }

    public static void reload(String appPath){
        reloadAware.put(appPath,true);
        if(!active){
            active=true;
            submit(new Runnable() {
                public void run() {
                    for(String key:reloadAware.keySet()){
                        if(reloadAware.get(key)){
                            System.out.println("+++++++++++++++++++++++++++++++++");
                            System.out.println("重新连接zookeeper, 监控节点："+key);
                            ConfigFactory.init(key);
                        }
                    }
                    reloadAware.clear();
                }
            }, 10 * 1000);
        }
    }

}

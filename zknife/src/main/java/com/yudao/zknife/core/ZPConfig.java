package com.yudao.zknife.core;

import com.alibaba.fastjson.JSONObject;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * Created by Austin on 2016/7/8.
 */
public abstract class ZPConfig {

    protected float version = 1.001f;
    protected String path = "";

    public float getVersion() {
        return version;
    }

    public void setVersion(float version) {
        this.version = version;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    /**
     * 扩展自定义逻辑函数
     */
    public abstract void adjust();

    public void update() {
        ZKPManager watcher = ConfigFactory.getWatcher();
        float v = this.getVersion() + 0.001f;
        String result = String.format("%.3f", v);
        v = Float.parseFloat(result);
        this.setVersion(v);
        String data = JSONObject.toJSONString(this);
        watcher.writeData(this.path, data);
    }

    public void updateConfig(ZPConfig current) {
        ZPConfig config = ConfigFactory.get(this.path);
        if (config != null && config.getVersion() > current.getVersion()) {
            Method method1[] = config.getClass().getMethods();
            Method method2[] = current.getClass().getMethods();
            for (Method set : method2) {
                String setMethodName = set.getName();
                if (setMethodName.startsWith("set")) {
                    String getMethodName = "get" + setMethodName.substring(3);
                    Object value;
                    for (Method get : method1) {
                        if (get.getName().equals(getMethodName)) {
                            try {
                                value = get.invoke(config);
                                set.invoke(current, value);
                                System.out.println(value);
                            } catch (IllegalAccessException |
                                    IllegalArgumentException |
                                    InvocationTargetException e) {
                                e.printStackTrace();
                            }
                            break;
                        }
                    }
                }
            }
            adjust();
        }
    }

}

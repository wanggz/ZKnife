package com.yudao.zknife.operator;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.yudao.zknife.core.ZPConfig;
import com.yudao.zknife.utils.FileHelper;

/**
 * 抽象的配置操作器
 *
 * Created by Austin on 2016/7/8.
 */
public abstract class AbsConfigOperator {

    /**
     * 读取配置信息的抽象方法
     * @param path
     * @return
     */
    public abstract ZPConfig get(String path);

    /**
     *
     * @param path
     * @param content
     * @return
     */
    public synchronized ZPConfig get(String path,String content){
        String className = path.substring(path.lastIndexOf("/")+1);
        ZPConfig config=null;
        try {
            Class<?> type = Class.forName(className);
            config = (ZPConfig)JSON.parseObject(content,type);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return config;
    }

    /**
     *
     * @param path
     * @param config
     */
    public synchronized void save(String path,ZPConfig config) {
        String content = JSONObject.toJSONString(config);
        String localPath=covertToLocal(path);
        FileHelper.save(localPath, content);
    }

    /**
     *
     * @param path
     * @return
     */
    public synchronized String covertToLocal(String path){
        String root = this.getClass().getResource("/").getPath();
        String dir=root+"/conf";
        if(!FileHelper.exists(dir))  {
            FileHelper.createDir(dir);
        }
        String fileName=path.substring(path.lastIndexOf("/"))+".json";
        return dir+fileName;
    }

}

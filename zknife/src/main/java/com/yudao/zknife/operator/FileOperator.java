package com.yudao.zknife.operator;

import com.yudao.zknife.core.ZPConfig;
import com.yudao.zknife.utils.FileHelper;

/**
 * 本地文件配置操作器
 *
 * Created by Austin on 2016/7/11.
 */
public class FileOperator extends AbsConfigOperator {

    /**
     * 根据本地路径读取配置
     * @param path
     * @return
     */
    @Override
    public ZPConfig get(String path) {
        String localPath=covertToLocal(path);
        if (!FileHelper.exists(localPath)) {
            return null;
        }
        String content=FileHelper.read(localPath);
        if(content.equals("")){
            return null;
        }
        ZPConfig config=this.get(path, content);
        return config;
    }
}

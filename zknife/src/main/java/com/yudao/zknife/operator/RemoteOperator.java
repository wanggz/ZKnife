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

    @Override
    public ZPConfig get(String path) {
        return null;
    }
}

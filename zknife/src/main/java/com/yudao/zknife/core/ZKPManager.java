package com.yudao.zknife.core;

import com.yudao.zknife.config.AppProperties;
import org.apache.zookeeper.*;
import org.apache.zookeeper.data.Stat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.concurrent.CountDownLatch;

/**
 * Created by Austin on 2016/7/8.
 */
public class ZKPManager implements Watcher {

    private static final Logger log = LoggerFactory.getLogger(ZKPManager.class);

    private ZooKeeper zk = null;
    private CountDownLatch downLoatch = new CountDownLatch(1);
    private static final int sessionTimeout = 10000;
    /* 更新处理器 */
    public IZKPWatcher updateHandler;
    /* 过期处理器 */
    public IZKPWatcher expiredHandler;
    /* 子节点变化处理器 */
    public IZKPWatcher childrenChangedHandler;
    /* 连接处理器 */
    public IZKPWatcher connectionHandler;

    /**
     * 创建Zookeeper连接
     */
    public void createConnection() {
        createConnection(AppProperties.ZOOKEEPER_ADDRESS);
    }

    /**
     * 创建Zookeeper连接
     * @param path
     */
    public void createConnection(String path) {
        this.releaseConnection();
        try {
            zk = new ZooKeeper(path, sessionTimeout, this);
            downLoatch.await();
        } catch (Exception e) {
            log.error("Connection zookeeper exception : ", e);
        }
    }

    /**
     * 释放Zookeeper连接
     */
    public void releaseConnection() {
        try {
            if (zk != null)
                this.zk.close();
        } catch (InterruptedException e) {
            log.error("Close zookeeper exception : ", e);
        }
    }

    public String readData(String path, boolean needWatch) {
        try {
            return new String(this.zk.getData(path, needWatch, null));
        } catch (Exception e) {
            log.error("Read Date exception : ", e);
            return "";
        }
    }

    public Stat writeData(String path, String data) {
        try {
            return this.zk.setData(path, data.getBytes(), -1);
        } catch (KeeperException e) {
            e.printStackTrace();
            log.error("Write Date exception", e);
        } catch (InterruptedException e) {
            e.printStackTrace();
            log.error("Write Date thread exception", e);
        }
        return null;
    }

    /**
     * 返回指定路径的所有子节点名称
     * @param path
     * @param needWatch
     * @return
     */
    public List<String> getChildren(String path, boolean needWatch) {
        try {
            List<String> nodes = this.zk.getChildren(path, needWatch);
            return nodes;
        } catch (Exception e) {
            log.error("Get children exception", e);
            return null;
        }
    }

    @Override
    public void process(WatchedEvent event) {
        Event.KeeperState keeperState = event.getState();
        Event.EventType eventType = event.getType();
        String path = event.getPath();
        if (Event.KeeperState.SyncConnected == keeperState) {
            if (Event.EventType.None == eventType) {
                log.info("connection to zookeeper server success !");
                downLoatch.countDown();
                if (connectionHandler != null) {
                    connectionHandler.watch(path, this);
                }
            } else if (Event.EventType.NodeDataChanged == eventType) {
                if (updateHandler != null) {
                    updateHandler.watch(path, this);
                }
            }
            else if (Event.EventType.NodeChildrenChanged == eventType) {
                if (childrenChangedHandler != null) {
                    childrenChangedHandler.watch(path, this);
                }
            }
        } else if (Event.KeeperState.Disconnected == keeperState) {
            if (expiredHandler != null) {
                expiredHandler.watch(path, this);
            }
        } else if (Event.KeeperState.Expired == keeperState) {
            if (expiredHandler != null) {
                expiredHandler.watch(path, this);
            }
        } else {
            log.info("zookeeper keeperState has problem : " + keeperState);
        }
    }

    /**
     * 创建Zookeeper临时节点
     * @param znode
     */
    public void createZnode(String znode) {
        try {
            znode = this.zk.create(znode, new byte[0], ZooDefs.Ids.OPEN_ACL_UNSAFE, CreateMode.EPHEMERAL_SEQUENTIAL);
            log.info("create node : " + znode);
        } catch (Exception ex) {
            log.error("Create node error : " , ex);
        }
    }
}

package com.yudao.zknife.utils;

import java.io.*;

/**
 * 文件操作帮助类
 *
 * Created by Austin on 2016/7/8.
 */
public class FileHelper {

    /**
     * 按照指定路径保存内容
     * @param path
     * @param content
     */
    public static void save(String path,String content){
        File file = new File(path);
        try {
            if(!file.exists()){
                createDir(file.getParent());
                file.createNewFile();
            }
            PrintWriter writer = new PrintWriter(file,"UTF-8");
            writer.println(content);
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 创建文件夹
     * @param path
     */
    public static void createDir(String path){
        File file = new File(path);
        file.mkdirs();
    }

    /**
     * 判断文件夹是否存在
     * @param path
     * @return
     */
    public static boolean exists(String path){
        File file = new File(path);
        return file.exists();
    }

    /**
     * 读取文件内容
     * @param path
     * @return
     */
    public static String read(String path){
        StringBuffer str = new StringBuffer("");
        FileInputStream fs;
        InputStreamReader isr;
        try {
            fs = new FileInputStream(path);
            isr = new InputStreamReader(fs,"UTF-8");
            BufferedReader br = new BufferedReader(isr);
            String data = "";
            while((data = br.readLine())!=null){
                str.append(data);
            }
            isr.close();
            fs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return str.toString();
    }

}

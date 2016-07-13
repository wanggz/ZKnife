package com.yudao.zknife.config;

import junit.framework.TestCase;

public class AppSettingsTest extends TestCase {

    public static void main(String[] args) {
        AppSettings appSettings = AppSettings.Instance();
        System.out.println(appSettings);
    }


}
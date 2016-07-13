package com.yudao.zknife.config;

import junit.framework.TestCase;

import static org.junit.Assert.*;

public class AppSettingsTest extends TestCase {

    public static void main(String[] args) {
        AppSettings appSettings = AppSettings.Instance();
        System.out.println(appSettings);
    }


}
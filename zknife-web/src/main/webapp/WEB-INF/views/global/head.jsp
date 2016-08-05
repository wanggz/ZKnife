<%--
  Created by IntelliJ IDEA.
  User: parttime.pd
  Date: 13-11-21
  Time: 下午7:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <!--
        Charisma v1.0.0

        Copyright 2012 Muhammad Usman
        Licensed under the Apache License v2.0
        http://www.apache.org/licenses/LICENSE-2.0

        http://usman.it
        http://twitter.com/halalit_usman
    -->
    <meta charset="utf-8">
    <title>监控系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <link id="bs-css" href="<%=basePath %>css/bootstrap-cerulean.css" rel="stylesheet">
    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }
    </style>
    <link href="<%=basePath %>css/bootstrap-responsive.css" rel="stylesheet">
    <link href="<%=basePath %>css/charisma-app.css" rel="stylesheet">
    <link href="<%=basePath %>css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
    <link href='<%=basePath %>css/fullcalendar.css' rel='stylesheet'>
    <link href='<%=basePath %>css/fullcalendar.print.css' rel='stylesheet'  media='print'>
    <link href='<%=basePath %>css/chosen.css' rel='stylesheet'>
    <link href='<%=basePath %>css/uniform.default.css' rel='stylesheet'>
    <link href='<%=basePath %>css/colorbox.css' rel='stylesheet'>
    <link href='<%=basePath %>css/jquery.cleditor.css' rel='stylesheet'>
    <link href='<%=basePath %>css/jquery.noty.css' rel='stylesheet'>
    <link href='<%=basePath %>css/noty_theme_default.css' rel='stylesheet'>
    <link href='<%=basePath %>css/elfinder.min.css' rel='stylesheet'>
    <link href='<%=basePath %>css/elfinder.theme.css' rel='stylesheet'>
    <link href='<%=basePath %>css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='<%=basePath %>css/opa-icons.css' rel='stylesheet'>
    <link href='<%=basePath %>css/uploadify.css' rel='stylesheet'>

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href="<%=basePath %>img/favicon.ico">

</head>
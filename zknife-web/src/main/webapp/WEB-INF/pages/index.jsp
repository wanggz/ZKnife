<%--
  Created by IntelliJ IDEA.
  User: Austin
  Date: 2016/8/4
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>

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
    <link id="bs-css" href="<%=basePath %>/css/bootstrap-cerulean.css" rel="stylesheet">
    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }
    </style>
    <link href="<%=basePath %>/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="<%=basePath %>/css/charisma-app.css" rel="stylesheet">
    <link href="<%=basePath %>/css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
    <link href='<%=basePath %>/css/fullcalendar.css' rel='stylesheet'>
    <link href='<%=basePath %>/css/fullcalendar.print.css' rel='stylesheet'  media='print'>
    <link href='<%=basePath %>/css/chosen.css' rel='stylesheet'>
    <link href='<%=basePath %>/css/uniform.default.css' rel='stylesheet'>
    <link href='<%=basePath %>/css/colorbox.css' rel='stylesheet'>
    <link href='<%=basePath %>/css/jquery.cleditor.css' rel='stylesheet'>
    <link href='<%=basePath %>/css/jquery.noty.css' rel='stylesheet'>
    <link href='<%=basePath %>/css/noty_theme_default.css' rel='stylesheet'>
    <link href='<%=basePath %>/css/elfinder.min.css' rel='stylesheet'>
    <link href='<%=basePath %>/css/elfinder.theme.css' rel='stylesheet'>
    <link href='<%=basePath %>/css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='<%=basePath %>/css/opa-icons.css' rel='stylesheet'>
    <link href='<%=basePath %>/css/uploadify.css' rel='stylesheet'>

    <script src="<%=basePath %>/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="<%=basePath %>/bower_components/jquery-ui/jquery-ui.min.js"></script>
    <script src="<%=basePath %>/bower_components/angular/angular.min.js"></script>
    <script src="<%=basePath %>/bower_components/angular-ui-sortable/sortable.min.js"></script>
    <link href="<%=basePath %>/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <script src="<%=basePath %>/js/directives.js"></script>
    <script src="<%=basePath %>/js/JSONedit.js"></script>
    <link href="<%=basePath %>/css/styles.css" rel="stylesheet" type="text/css" />

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href="<%=basePath %>/img/favicon.ico">

</head>

<body>

<div class="">
    <div class="box span12">
        <div class="box-header well" data-original-title>
            <h2><i class="icon-list"></i> 程序列表:&nbsp;&nbsp;${environment}</h2>
            <div class="box-icon">
                <a href="javascript:void(0)" class="btn btn-round" onclick="return loadpage('<%=basePath%>remoteconfig_addpage.do?type=project','configinfo')"><i class="icon-plus"></i></a>
            </div>
        </div>
        <div id="projectinfo" class="box-content">
            <jsp:include page="projectlist.jsp"></jsp:include>
        </div>
    </div>
</div>
<div id="configinfo" class="" ng-app="JSONedit">
    <div id="mainView" ng-controller="MainViewCtrl">
        <h2>JSONedit</h2>

        <div class="jsonView">
            <json child="jsonData" default-collapsed="false" type="object"></json>
        </div>

        <hr>
        <div>
            <textarea id="jsonTextarea" ng-model="jsonString"></textarea>
            <span class="red" ng-if="!wellFormed">JSON not well-formed!</span>
        </div>
    </div>
</div>


<!-- external javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<!-- jQuery -->
<script src="<%=basePath %>/js/jquery-1.7.2.min.js"></script>
<!-- jQuery UI -->
<script src="<%=basePath %>/js/jquery-ui-1.8.21.custom.min.js"></script>
<!-- transition / effect library -->
<script src="<%=basePath %>/js/bootstrap-transition.js"></script>
<!-- alert enhancer library -->
<script src="<%=basePath %>/js/bootstrap-alert.js"></script>
<!-- modal / dialog library -->
<script src="<%=basePath %>/js/bootstrap-modal.js"></script>
<!-- custom dropdown library -->
<script src="<%=basePath %>/js/bootstrap-dropdown.js"></script>
<!-- scrolspy library -->
<script src="<%=basePath %>/js/bootstrap-scrollspy.js"></script>
<!-- library for creating tabs -->
<script src="<%=basePath %>/js/bootstrap-tab.js"></script>
<!-- library for advanced tooltip -->
<script src="<%=basePath %>/js/bootstrap-tooltip.js"></script>
<!-- popover effect library -->
<script src="<%=basePath %>/js/bootstrap-popover.js"></script>
<!-- button enhancer library -->
<script src="<%=basePath %>/js/bootstrap-button.js"></script>
<!-- accordion library (optional, not used in demo) -->
<script src="<%=basePath %>/js/bootstrap-collapse.js"></script>
<!-- carousel slideshow library (optional, not used in demo) -->
<script src="<%=basePath %>/js/bootstrap-carousel.js"></script>
<!-- autocomplete library -->
<script src="<%=basePath %>/js/bootstrap-typeahead.js"></script>
<!-- tour library -->
<script src="<%=basePath %>/js/bootstrap-tour.js"></script>
<!-- library for cookie management -->
<script src="<%=basePath %>/js/jquery.cookie.js"></script>
<!-- calander plugin -->
<script src='<%=basePath %>/js/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script src='<%=basePath %>/js/jquery.dataTables.min.js'></script>

<!-- chart libraries start -->
<script src="<%=basePath %>/js/excanvas.js"></script>
<script src="<%=basePath %>/js/jquery.flot.min.js"></script>
<script src="<%=basePath %>/js/jquery.flot.pie.min.js"></script>
<script src="<%=basePath %>/js/jquery.flot.stack.js"></script>
<script src="<%=basePath %>/js/jquery.flot.resize.min.js"></script>
<!-- chart libraries end -->

<!-- select or dropdown enhancer -->
<script src="<%=basePath %>/js/jquery.chosen.min.js"></script>
<!-- checkbox, radio, and file input styler -->
<script src="<%=basePath %>/js/jquery.uniform.min.js"></script>
<!-- plugin for gallery image view -->
<script src="<%=basePath %>/js/jquery.colorbox.min.js"></script>
<!-- rich text editor library -->
<script src="<%=basePath %>/js/jquery.cleditor.min.js"></script>
<!-- notification plugin -->
<script src="<%=basePath %>/js/jquery.noty.js"></script>
<!-- file manager library -->
<script src="<%=basePath %>/js/jquery.elfinder.min.js"></script>
<!-- star rating plugin -->
<script src="<%=basePath %>/js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="<%=basePath %>/js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="<%=basePath %>/js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="<%=basePath %>/js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="<%=basePath %>/js/jquery.history.js"></script>
<!-- application script for Charisma demo -->
<script src="<%=basePath %>/js/charisma.js"></script>

<script src="<%=basePath %>/js/monitor.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/c.js"></script>
</body>

</html>

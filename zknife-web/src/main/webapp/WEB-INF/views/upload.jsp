<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<!DOCTYPE html>
<html lang="zh-CN">
<jsp:include page="global/head.jsp"></jsp:include>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script src="<%=basePath %>js/jquery-1.9.1.js"></script>
    <script src="<%=basePath %>js/jquery-ui.js"></script>
    <%--<link href="<%=basePath %>css/bootstrap.min.css" rel="stylesheet">--%>
    <script src="<%=basePath %>js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/jquery.datetimepicker.css"/>
</head>
<body onload="getSelected()">
<jsp:include page="global/navbar.jsp"></jsp:include>
<br><br><br>
<!-- topbar ends -->
<div class="container-fluid">
    <div class="row-fluid">
        <jsp:include page="global/lift_menu.jsp"></jsp:include>
        <div id="content" class="span10">
            <!-- content starts -->

            <div>
                <ul class="breadcrumb" id="title-001">
                    <li>
                        <a href="<%=basePath%>index.do">Home</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="<%=basePath%>dictionary.do">词库管理</a>
                    </li>
                </ul>
            </div>
            <div class="row-fluid sortable">
                <div class="box span12">
                    <div class="box-header well" data-original-title>
                        <h2>词库管理</h2>

                        <div class="box-icon">
                            <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                            <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
                        </div>
                    </div>

                    <div class="box-content" id="dictionaryMessage">
                        <form action="dicuploadfile.do" id="datauoload" name="datauoload" method="POST" enctype="multipart/form-data">
                            <table class="fc-border-separate">
                                <tbody class="center">
                                    <tr>
                                        <div class="input-group input-group" style="margin-left: 30px;">
                                            <a class="btn btn-info" href="download.do?basic=download" id="download" data-toggle="modal" style="width:130px;">
                                                本地下载基础词库
                                            </a>
                                        </div>
                                    </tr>
                                    <br/>
                                    <tr>
                                        <div class="input-group input-group" style="margin-left: 30px;">
                                            <a class="btn btn-info" href="download.do?company=download" data-toggle="modal" style="width:130px;">
                                                本地下载公司词库
                                            </a>
                                        </div>
                                    </tr>
                                    <br/>
                                    <tr>
                                        <div class="input-group input-group" style="margin-left: 30px;">
                                            <span class="input-group-addon">基础词汇：</span>
                                            <input type="file" id="filebasic" name="filebasic" class="form-control"
                                                   style="width:200px;" placeholder="基础词汇">
                                        </div>
                                    </tr>
                                    <br>
                                    <tr>
                                        <div class="input-group input-group" style="margin-left: 30px;">
                                            <span class="input-group-addon">公司词汇：</span>
                                            <input type="file" id="filecompany" name="filecompany" class="form-control"
                                                   style="width:200px;" placeholder="公司词汇">
                                        </div>
                                    </tr>
                                    <br>
                                    <tr>
                                        <div class="input-group input-group" style="margin-left: 30px;">
                                            <input type="submit" name="iploadsubmit" id="iploadsubmit" style="width:80px;"
                                                   value="上传文件"/>
                                        </div>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<%=basePath %>js/jquery.js"></script>
<script src="<%=basePath %>js/monitor.js"></script>
</body>
</html>





<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<form id="codeformat_form" action="<%=basePath%>remoteconfig.do" method="POST">
    <link href="<%=basePath%>css/s.css" type="text/css" rel="stylesheet">
    <h3>添加项目节点</h3>
    <div class="topBar">
        <div class="title">项目名：</div>
        <input id="projectproject" name="projectname" class="input-xlarge focused" type="text">
    </div>

    <br>
    <button type="button" class="btn btn-primary" onclick="return addnode('project', 'project')">添加</button>
</form>


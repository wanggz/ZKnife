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
                        <a href="<%=basePath%>redismessage.do">redis服务器消息</a>
                    </li>
                </ul>
            </div>
            <div class="row-fluid sortable">
                <div class="box span12">
                    <div class="box-header well" data-original-title>
                        <h2>redis服务器管理</h2>

                        <div class="box-icon">
                            <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                            <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
                        </div>
                    </div>
                    <form method="get" id="RedisProjectForm" name="RedisProjectForm" action="redismessage.do"
                          enctype="multipart/form-data">
                        <div class="box-content" id="LineMessage">
                            <table>
                                <tr>
                                    <td><a class="btn btn-primary"
                                           href="<%=basePath%>redismessage.do?project=allprojcet">back</a></td>
                                    <td style=" <c:if test="${!proje.equals('allproject')}">display: none</c:if>">
                                        选择要操作的项目：
                                    </td>
                                    <td style=" <c:if test="${!proje.equals('allproject')}">display: none</c:if>">
                                        <select id="project" name="project">
                                            <c:forEach items="${project}" var="projectService" varStatus="i">
                                                <option id=${projectService}
                                                        <c:if test="${projectService.equals(proje)}">
                                                                selected
                                                </c:if>
                                                        > ${projectService} </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                            </table>

                            <!--选择需要加载的页面-->
                            <c:if test="${proje.equals('applyline')}">
                                <jsp:include page="redismessagelist.jsp"></jsp:include>
                            </c:if>
                            <c:if test="${proje.equals('sou')}">
                                <jsp:include page="redismessagestring.jsp"></jsp:include>
                            </c:if>
                            <c:if test="${proje.equals('recom')}">
                                <jsp:include page="redismessagestring.jsp"></jsp:include>
                            </c:if>
                            <c:if test="${proje.equals('applyIds')}">
                                <jsp:include page="applyidslist.jsp"></jsp:include>
                            </c:if>
                            <c:if test="${proje.equals('hotword')}">
                                <jsp:include page="hotword.jsp"></jsp:include>
                            </c:if>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/monitor.js"></script>
</body>
</html>

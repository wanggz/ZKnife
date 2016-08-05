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
                        <form method="GET" id="optdiction" name="optdiction" action="dictionary.do"
                              enctype="multipart/form-data">
                            <input type="hidden" id="page" name="page" value="${current}">
                            <table class="fc-border-separate">
                                <tbody class="center">
                                <tr>
                                    <td>
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-addon">内容：</span>
                                            <input type="text" id="keyword" name="keyword" class="form-control"
                                                   style="width:90px;" placeholder="内容" value="${keyword}">
                                        </div>
                                    </td>

                                    <td>
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-addon" style="margin-left: 15px;">类别：</span>
                                            <select id="cate" name="cate" class="form-control" style="width:90px;">
                                                <option id="0" value="0"> 全部 </option>
                                                <c:forEach items="${cates}" var="cate" varStatus="i">
                                                    <option value="${cate.cateId}" id="${cate.cateId}"
                                                            <c:if test="${cate.cateId == catename}">
                                                                    selected
                                                            </c:if>
                                                        >${cate.cateName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </td>

                                    <td>
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-addon" style="margin-left: 15px;">词性：</span>
                                            <select id="part" name="part" class="form-control" style="width:90px;">
                                                <option id="0" value="0"> 全部 </option>
                                                <c:forEach items="${parts}" var="part" varStatus="i">
                                                    <option id="${part.partId}" value="${part.partId}"
                                                            <c:if test="${part.partId == partname}">
                                                                    selected
                                                            </c:if>
                                                        >${part.partName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </td>

                                    <td>
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-addon" style="margin-left: 15px;">来源：</span>
                                            <select id="from" name="from" class="form-control" style="width:90px;">
                                                <option id="0" value="0"> 全部 </option>
                                                <c:forEach items="${froms}" var="from" varStatus="i">
                                                    <option id="${from.fromId}" value="${from.fromId}"
                                                            <c:if test="${from.fromId == fromname}">
                                                                    selected
                                                            </c:if>
                                                        >${from.fromName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-addon" style="margin-left: 15px;">状态：</span>
                                            <select id="status" name="status" class="form-control" style="width:90px;">
                                                <option id="0" value="0">全部</option>
                                                <c:forEach items="${inSearches}" var="status" varStatus="i">
                                                    <option id="${status.insearchId}" value="${status.insearchId}"
                                                            <c:if test="${status.insearchId == inseach}">
                                                                    selected
                                                            </c:if>
                                                            >${status.insearchName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </td>
                                    <%--<td>--%>
                                        <%--<div class="input-group input-group-sm">--%>
                                            <%--<span class="input-group-addon" style="margin-left: 15px;">下线原因：</span>--%>
                                            <%--<input type="text" id="deletereason" name="deletereason"--%>
                                                   <%--class="form-control" style="width:90px;" placeholder="下线原因" value="${deletereason}">--%>
                                        <%--</div>--%>
                                    <%--</td>--%>
                                    <td>
                                        <input id="selectdic" name="selectdic" type="button"
                                              class="btn btn-primary btn-sm" style="margin-left: 15px;" value="查询"></td>
                                    </td>

                                    <td>
                                        <input id="adddic" name="adddic" type="button" class="btn btn-success btn-sm"
                                               style="margin-left: 15px;" value="添加">
                                    </td>
                                    <td>
                                        <input name="adddic" type="button" class="btn btn-info btn-sm"
                                               style="margin-left: 15px;" value="上线">
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table class="fc-border-separate">
                                <tbody class="center">
                                <tr>
                                    <td>
                                        <span class="input-group-addon">入库时间：</span>
                                        <%--<input type="text" value="" id="indbtimestart" name="indbtimestart" style="width:110px;"/>--%>
                                        <%--<input type="text" value="2014/03/15 05:06" id="datetimepicker1"/><br><br>--%>
                                        <input type="text" name="indbtimestart" value="${queryTime.indbtimestart}" id="indbtimestart"style="width:110px;" />
                                        <input type="text" name="indbtimeend" value="${queryTime.indbtimeend}" id="indbtimeend" style="margin-left:5px; width:110px;" />
                                    </td>
                                    <td>
                                        <span class="input-group-addon" style="margin-left:15px;">上线时间：</span>
                                        <input type="text" name="uplinetimestart" value="${queryTime.uplinetimestart}" id="uplinetimestart"style="width:110px;" />
                                        <input type="text" name="uplinetimeend" value="${queryTime.uplinetimeend}" id="uplinetimeend" style="margin-left:5px; width:110px;" />
                                    </td>
                                    <%--<td>--%>
                                        <%--<span class="input-group-addon" style="margin-left: 15px;">下线时间：</span>--%>
                                        <%--<input type="text" name="dowmntimestart" value="${queryTime.dowmntimestart}" id="dowmntimestart"style="width:110px;" />--%>
                                        <%--<input type="text" name="dowmntimeend" value="${queryTime.dowmntimeend}" id="dowmntimeend" style="margin-left:5px; width:110px;" />--%>
                                    <%--</td>--%>
                                </tr>
                                </tbody>
                            </table>
                        </form>
                        <table class="table table-condensed" id="table-001">
                            <tr class="center">
                                <th>||</th>
                                <th>
                                    总计${count}条
                                </th>
                            </tr>
                            <tr class="center">
                                <th>||</th>
                                <th>词内容</th>
                                <th style="width:75px;">词类别</th>
                                <th style="width:75px;">词性</th>
                                <th style="width:75px;">来源</th>
                                <th style="width:150px">入库时间</th>
                                <th style="width:60px;">是否上线</th>
                                <th style="width:150px">上线时间</th>
                                <%--<th style="width:150px">下线时间</th>--%>
                                <%--<th>下线原因</th>--%>
                                <th>操作</th>
                            </tr>
                            <tbody class="table table-hover">
                                <c:forEach items="${WordSearchDTO}" var="wordSearch" varStatus="status">
                                    <tr class="center">
                                        <td id="${wordSearch.wordId}">||</td>
                                        <td style="width:100px;">${wordSearch.content}</td>
                                        <td style="width:75px;">${wordSearch.cate.cateName}</td>
                                        <td style="width:75px;">${wordSearch.part.partName}</td>
                                        <td style="width:75px;">${wordSearch.from.fromName}</td>
                                        <td style="width:150px">${wordSearch.inDbTime}</td>
                                        <td style="width:60px;">${wordSearch.inSearch.insearchName}</td>
                                        <td style="width:150px">${wordSearch.inSearchTime}</td>
                                        <%--<td style="width:150px">${wordSearch.offSearchTime}</td>--%>
                                        <%--<td>${wordSearch.offReason}</td>--%>
                                        <td><input type="button" id="deleteOne" name="deleteOne" class="btn btn-info btn-sm" value="删除"onclick="sendIdForDelete(${wordSearch.wordId})"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="pagination pagination-centered">
    <ul>
        <c:choose>
            <c:when test="${current==1 }"><li class="disabled"><a href="#">Prev</a></li></c:when>
            <c:otherwise><li><a href="dictionarypage.do?dictionary.do?page=${current-1 }&keyword=${keyword}&cate=${catename}&part=${partname}&from=${fromname}&status=${inseach}&deletereason=${deletereason}&indbtimestart=${queryTime.indbtimestart}&indbtimeend=${queryTime.indbtimeend}&uplinetimestart=${queryTime.uplinetimestart}&uplinetimeend=${queryTime.uplinetimeend}&dowmntimestart=${queryTime.dowmntimestart}&dowmntimeend=${queryTime.dowmntimeend}" >Prev</a></li></c:otherwise>
        </c:choose>
        <c:forEach items="${num }" var="n">
            <c:choose>
                <c:when test="${n==current }">
                    <li class="active">
                        <a href="dictionarypage.do?dictionary.do?page=${n}&keyword=${keyword}&cate=${catename}&part=${partname}&from=${fromname}&status=${inseach}&deletereason=${deletereason}&indbtimestart=${queryTime.indbtimestart}&indbtimeend=${queryTime.indbtimeend}&uplinetimestart=${queryTime.uplinetimestart}&uplinetimeend=${queryTime.uplinetimeend}&dowmntimestart=${queryTime.dowmntimestart}&dowmntimeend=${queryTime.dowmntimeend}" >${n }</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li><a href="dictionarypage.do?dictionary.do?page=${n}&keyword=${keyword}&cate=${catename}&part=${partname}&from=${fromname}&status=${inseach}&deletereason=${deletereason}&indbtimestart=${queryTime.indbtimestart}&indbtimeend=${queryTime.indbtimeend}&uplinetimestart=${queryTime.uplinetimestart}&uplinetimeend=${queryTime.uplinetimeend}&dowmntimestart=${queryTime.dowmntimestart}&dowmntimeend=${queryTime.dowmntimeend}" >${n }</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${current==total || total==0 }"><li class="disabled"><a href="#">Next</a></li></c:when>
            <c:otherwise><li><a href="dictionary.do?dictionary.do?page=${current+1}&keyword=${keyword}&cate=${catename}&part=${partname}&from=${fromname}&status=${inseach}&deletereason=${deletereason}&indbtimestart=${queryTime.indbtimestart}&indbtimeend=${queryTime.indbtimeend}&uplinetimestart=${queryTime.uplinetimestart}&uplinetimeend=${queryTime.uplinetimeend}&dowmntimestart=${queryTime.dowmntimestart}&dowmntimeend=${queryTime.dowmntimeend}" >Next</a></li></c:otherwise>
        </c:choose>
    </ul>
</div>
<script src="<%=basePath %>js/jquery.js"></script>
<script src="<%=basePath %>js/jquery.datetimepicker.js"></script>
<script src="<%=basePath %>js/monitor.js"></script>
</body>
</html>

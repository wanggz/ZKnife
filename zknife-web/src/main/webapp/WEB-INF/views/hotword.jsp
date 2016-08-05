<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<table>
    <form method="get" id="redisListForm" name="redisListForm" action="redismessage.do"
          enctype="multipart/form-data" accept-charset="utf-8">
        <tr>
            <td>redis服务器：</td>
            <td>
                <select id="service" name="service" class="form-control" style="width: 160px">
                    <c:forEach items="${redisService}" var="service" varStatus="i">
                        <option value=${service}
                                <c:if test="${service.equals(serv)}">
                                        selected
                        </c:if>
                                > ${service} </option>
                    </c:forEach>
                </select>
            </td>
            <td>操作类型：</td>
            <td>
                <select id="operate" name="operate" style="width: 100px">
                    <c:forEach items="${operate}" var="ope" varStatus="i">
                        <option value=${ope}
                                <c:if test="${ope.equals(oper)}">
                                        selected
                        </c:if>
                                >${ope}</option>
                    </c:forEach>
                </select>
            </td>
            <td>查询：</td>
            <td>
                <select id="type" name="type" style="width: 100px">
                    <c:forEach items="${type}" var="typeInfo" varStatus="i">
                        <option value=${typeInfo}
                                <c:if test="${typeInfo.equals(typer)}">
                                        selected
                        </c:if>
                                >${typeInfo}</option>
                    </c:forEach>
                </select>
            </td>
            <td>
                key
            </td>
            <td>
                <input type="text" id="key" name="key" value="${key}">
            </td>
            <td>
                <input class="btn btn-primary" type="submit" value="search">
            </td>
            <td>
                <%--<input class="btn btn-danger" type="button" value="重置key" id="delete"--%>
                <%--name="delete" onclick="deleteRedisByKey()">--%>
            </td>

        </tr>
    </form>
</table>
<table class="table table-condensed" id="table-001">
    <tr>
        <td>${count}${success}${error}</td>
    </tr>
    <tr>
        <textarea style="width: 1050px; height: 80px;" rows="4" name="redisMessageBody" id="redisMessageBody"
                  class="span12">${redisvalue}</textarea>
    </tr>
    <tr>
        <td>
            <input class="btn btn-primary" type="button" value="save to redis" name="saveToRedis"
                   id="saveToRedis" onclick="saveToRedisFun()">
        </td>
        <td>
            <input class="btn btn-primary" type="button" value="save AND to solr" name="saveToRedisAndSolr"
                   id="saveToRedisAndSolr" onclick="saveAndToSolrFun()">
        </td>
        <td>
            <input class="btn btn-primary" type="button" value="solr to redis" name="solrToRedis"
                   id="solrToRedis" onclick="solrToRedisFun()">
        </td>
        <td>
            <input class="btn btn-primary" type="button" value="redis to solr" name="redisToSolr"
                   id="redisToSolr" onclick="redisToSolrFun()">
        </td>
    </tr>
</table>
<script src="<%=basePath %>/js/monitor.js"></script>
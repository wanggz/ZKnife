<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table>
    <form method="get" id="RedisStringForm" name="RedisStringForm" action="redismessage.do"
          enctype="multipart/form-data">
        <tr>
            <td>redis服务器：</td>
            <td>
                <select id="service" name="service" class="form-control">
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
                <select id="operate" name="operate">
                    <c:forEach items="${operate}" var="ope" varStatus="i">
                        <option value=${ope}
                                <c:if test="${ope.equals(oper)}">
                                        selected
                        </c:if>
                                >${ope}</option>
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
                <input class="btn btn-primary" type="submit" value="search"/>
            </td>
            <td>
                <input class="btn btn-danger" type="button" value="delete" id="delete"
                       name="delete" onclick="deleteRedisByKey()">
            </td>
        </tr>
    </form>
</table>
<table class="table table-condensed" id="table-001">
    <tr>
        <td>${count}${success}${error}</td>
    </tr>
    <tr>
        <td>${string}</td>
    </tr>
</table>
</div>
<script src="js/monitor.js"></script>

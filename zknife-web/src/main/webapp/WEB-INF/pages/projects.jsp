<%--
  Created by IntelliJ IDEA.
  User: Austin
  Date: 2016/8/11
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${configinfos}" var="configinfo" varStatus="i">
    <li>
        <a href="#"><i class="fa fa-edit fa-fw"></i> | ${configinfo.projectname}<span class="fa arrow"/></a>

        <ul class="nav nav-second-level">
            <c:forEach items="${configinfo.configs}" var="config" varStatus="j">
                <li>
                    <a href="home.do?project=${configinfo.projectname}&config=${config}">${config}</a>
                </li>
            </c:forEach>
            <li><a href="#">Add new config</a></li>
        </ul>
    </li>
</c:forEach>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="accordion" id="accordion-829115">
    <c:forEach items="${configinfos}" var="configinfo" varStatus="i">

        <div class="accordion-group">
            <div class="accordion-heading">
                <a class="accordion-toggle" data-parent="#accordion-829115" data-toggle="collapse" href="#accordion-element-${i.index}">${configinfo.projectname}</a>
            </div>
            <c:choose>
                <c:when test="${i.index == 0}">
                    <div class="accordion-body in collapse" id="accordion-element-${i.index}">
                        <div class="accordion-inner">
                            <ul class="nav nav-list">
                                <li class="nav-header">配置列表</li>
                                <c:forEach items="${configinfo.configs}" var="config" varStatus="j">
                                    <li id="li${i.index}${j.index}"><a href="javascript:void (0)" onclick="loadconfig('<%=basePath%>remoteconfig_get.do?project=${configinfo.projectname}&configname=${config}','li${i.index}${j.index}')">${config}</a></li>
                                </c:forEach>
                                <li class="divider"></li>
                                <li>
                                    <a class="btn btn-small" href="#" onclick="return loadpage('<%=basePath%>remoteconfig_addpage.do?type=config&project=${configinfo.projectname}','configinfo')">
                                        <i class="icon-plus"></i>添加配置
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="accordion-body collapse" id="accordion-element-${i.index}">
                        <div class="accordion-inner">
                            <ul class="nav nav-list">
                                <li class="nav-header">配置列表</li>
                                <c:forEach items="${configinfo.configs}" var="config" varStatus="j">
                                    <li id="li${i.index}${j.index}"><a href="javascript:void (0)" onclick="return loadconfig('<%=basePath%>remoteconfig_get.do?project=${configinfo.projectname}&configname=${config}','li${i.index}${j.index}')">${config}</a></li>
                                </c:forEach>
                                <li class="divider"></li>
                                <li>
                                    <a class="btn btn-small" href="#" onclick="return loadpage('<%=basePath%>remoteconfig_addpage.do?type=config&project=${configinfo.projectname}','configinfo')">
                                        <i class="icon-plus"></i>添加配置
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </c:forEach>
</div>
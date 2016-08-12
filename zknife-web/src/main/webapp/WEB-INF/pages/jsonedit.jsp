<%--
  Created by IntelliJ IDEA.
  User: Austin
  Date: 2016/8/11
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="mainView" ng-controller="MainViewCtrl" ng-app="JSONedit">
    <div class="jsonView">
        <json child="jsonData" default-collapsed="false" type="object"></json>
    </div>

    <hr>
    <div>
        <textarea id="jsonTextarea" ng-model="jsonString"></textarea>
        <span class="red" ng-if="!wellFormed">JSON not well-formed!</span>
    </div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<form id="codeformat_form">
    <link href="<%=basePath%>css/s.css" type="text/css" rel="stylesheet">
    <h3>${project}下添加配置节点</h3>
    <div class="topBar">
        <div class="title">配置名称：</div>
        <input id="configconfig" class="input-xlarge focused" type="text" name="configname">
        <input id="projectconfig" type="hidden" value="${project}">
        <div class="title">配置信息(json)：</div>
        <textarea name="jsonconfig" rows="4" id="RawJson" style="resize:none;" class="span12"></textarea>
    </div>
    <div class="operateTB form-inline">
        <label for="TabSize">缩进量：</label>
        <select id="TabSize" onchange="TabSizeChanged()" class="span2">
            <option value="1">1</option>
            <option value="2" selected="true">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
        </select>
        <label for="QuoteKeys" class="checkbox">
            <input type="checkbox" id="QuoteKeys" onclick="QuoteKeysClicked()" checked="true">引号
        </label>
        <span id="CollapsibleViewHolder">
            <label for="CollapsibleView"  class="checkbox">
                <input type="checkbox" id="CollapsibleView" onclick="CollapsibleViewClicked()" checked="true">显示控制
            </label>
        </span>
        <span id="CollapsibleViewDetail" style="visibility: visible;margin-right:10px; ">
            <a href="javascript:void(0);" onclick="ExpandAllClicked()">展开</a>
            <a href="javascript:void(0);" onclick="CollapseAllClicked()">叠起</a>
            <a href="javascript:void(0);" onclick="CollapseLevel(3)">2级</a>
            <a href="javascript:void(0);" onclick="CollapseLevel(4)">3级</a>
            <a href="javascript:void(0);" onclick="CollapseLevel(5)">4级</a>
            <a href="javascript:void(0);" onclick="CollapseLevel(6)">5级</a>
            <a href="javascript:void(0);" onclick="CollapseLevel(7)">6级</a>
            <a href="javascript:void(0);" onclick="CollapseLevel(8)">7级</a>
            <a href="javascript:void(0);" onclick="CollapseLevel(9)">8级</a>
        </span>
        <input class="btn btn-small btn-primary" data-loading-text="正在格式化json..." id="format"  type="button" onclick="Process()" value="格式化"/>
    </div>
    <div class="bottomBar">
        <div class="title">格式化JSON：</div>
        <div id="Canvas" class="Canvas well resizable" style="height:200px;overflow:auto;margin-bottom:0px;"></div>
    </div>
    <br>
    <button type="button" class="btn btn-primary" onclick="return addnode('config','config')">添加</button>
</form>


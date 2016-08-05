<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<style type="text/css">

    code {
        background-color: #f5f5f5;
    }

    #jsoneditor {
        width: auto;
        height: 600px;
    }
</style>

<form id="codeformat_form" action="<%=basePath%>remoteconfig.do" method="POST">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/jsoneditor.min.css">

    <h3>${project} / ${configname}</h3>

    <script type="text/javascript" >
        var container, options, json, editor;

        container = document.getElementById('jsoneditor');

        options = {
            mode: 'code',
            modes: ['code', 'form', 'text', 'tree', 'view'], // allowed modes
            error: function (err) {
                alert(err.toString());
            }
        };

        editor = new JSONEditor(container, options, ${config});
        function postjson() {

            var json = editor.get();
            json = JSON.stringify(json, null, 2);

            var configname = $("#confignameRawJson").val();
            var project = $("#projectRawJson").val();
            $.ajax({
                type:'POST',
                url:'remoteconfig.do',
                data:{
                    json:json,
                    project:project,
                    configname:configname
                },
                cache:false,
                success:function(data) {
                    if (data == "error")
                        alert(data);
                    else {
                        data = $.parseJSON(data);
                        editor.set(data);
                        alert("success")
                    }
                },
                error:function() {
                    alert("服务器异常！");
                }
            });
        }
    </script>

    <div id="jsoneditor"></div>

    <input type="hidden" id="confignameRawJson" value="${configname}">
    <input type="hidden" id="projectRawJson" value="${project}">
    <br>
    <button type="button" class="btn btn-info" onclick="return postjson()"><i class="icon-edit icon-white"></i>修改</button>&nbsp;&nbsp;&nbsp;&nbsp;
    <a class="btn btn-danger" href="#delModal" data-toggle="modal"><i class="icon-trash icon-white"></i>删除</a>
<!--
    <link href="<%=basePath%>css/s.css" type="text/css" rel="stylesheet">

    <div class="topBar">
        <div class="title">配置信息(json)：</div>
        <textarea name="json" rows="4" id="RawJson" style="resize:none;" class="span12">${config}</textarea>
    </div>
    <div class="operateTB form-inline">
        <label for="TabSize">缩进量：</label>
        <label for="QuoteKeys" class="checkbox">
            <input type="checkbox" id="QuoteKeys" onclick="QuoteKeysClicked()" checked="true">引号
        </label>
        <span id="CollapsibleViewHolder">
            <label for="CollapsibleView"  class="checkbox">
                <input type="checkbox" id="CollapsibleView" onclick="CollapsibleViewClicked()" checked="true">显示控制
            </label>
        </span>
        <input class="btn btn-small btn-primary" data-loading-text="正在格式化json..." id="format"  type="button" onclick="Process()" value="格式化"/>
    </div>
    <div class="bottomBar">
        <div class="title">格式化JSON：</div>
        <div id="Canvas" class="Canvas well resizable" style="height:200px;overflow:auto;margin-bottom:0px;"></div>
    </div>


-->

</form>
<div class="modal hide fade" id="delModal">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h3>提示</h3>
    </div>
    <div class="modal-body">
        <p>确定要删除吗？</p>
    </div>
    <div class="modal-footer">
        <input type="hidden" id="delcorename" name="corename">
        <input type="hidden" id="delsolraddress" name="solraddress">
        <a href="#" class="btn" data-dismiss="modal">Close</a>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="return delnode('RawJson')">Delete Ok</button>
    </div>
</div>

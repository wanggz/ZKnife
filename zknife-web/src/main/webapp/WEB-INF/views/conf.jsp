<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<jsp:include page="global/head.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath %>js/jsoneditor.js"></script>
<!-- ace editor -->
<script type="text/javascript" src="<%=basePath %>js/ace.js"></script>
<!-- json lint -->
<script type="text/javascript" src="<%=basePath %>js/jsonlint.js"></script>
<!-- jQuery -->
<script src="<%=basePath %>js/jquery-1.7.2.min.js"></script>
<!-- jQuery UI -->
<script src="<%=basePath %>js/jquery-ui-1.8.21.custom.min.js"></script>
<!-- transition / effect library -->
<script src="<%=basePath %>js/bootstrap-transition.js"></script>
<!-- alert enhancer library -->
<script src="<%=basePath %>js/bootstrap-alert.js"></script>
<!-- modal / dialog library -->
<script src="<%=basePath %>js/bootstrap-modal.js"></script>
<!-- custom dropdown library -->
<script src="<%=basePath %>js/bootstrap-dropdown.js"></script>
<!-- scrolspy library -->
<script src="<%=basePath %>js/bootstrap-scrollspy.js"></script>
<!-- library for creating tabs -->
<script src="<%=basePath %>js/bootstrap-tab.js"></script>
<!-- library for advanced tooltip -->
<script src="<%=basePath %>js/bootstrap-tooltip.js"></script>
<!-- popover effect library -->
<script src="<%=basePath %>js/bootstrap-popover.js"></script>
<!-- button enhancer library -->
<script src="<%=basePath %>js/bootstrap-button.js"></script>
<!-- accordion library (optional, not used in demo) -->
<script src="<%=basePath %>js/bootstrap-collapse.js"></script>
<!-- carousel slideshow library (optional, not used in demo) -->
<script src="<%=basePath %>js/bootstrap-carousel.js"></script>
<!-- autocomplete library -->
<script src="<%=basePath %>js/bootstrap-typeahead.js"></script>
<!-- tour library -->
<script src="<%=basePath %>js/bootstrap-tour.js"></script>
<!-- library for cookie management -->
<script src="<%=basePath %>js/jquery.cookie.js"></script>
<!-- calander plugin -->
<script src='<%=basePath %>js/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script src='<%=basePath %>js/jquery.dataTables.min.js'></script>
<!-- chart libraries start -->
<script src="<%=basePath %>js/excanvas.js"></script>
<script src="<%=basePath %>js/jquery.flot.min.js"></script>
<script src="<%=basePath %>js/jquery.flot.pie.min.js"></script>
<script src="<%=basePath %>js/jquery.flot.stack.js"></script>
<script src="<%=basePath %>js/jquery.flot.resize.min.js"></script>
<!-- chart libraries end -->
<!-- select or dropdown enhancer -->
<script src="<%=basePath %>js/jquery.chosen.min.js"></script>
<!-- checkbox, radio, and file input styler -->
<script src="<%=basePath %>js/jquery.uniform.min.js"></script>
<!-- plugin for gallery image view -->
<script src="<%=basePath %>js/jquery.colorbox.min.js"></script>
<!-- rich text editor library -->
<script src="<%=basePath %>js/jquery.cleditor.min.js"></script>
<!-- notification plugin -->
<script src="<%=basePath %>js/jquery.noty.js"></script>
<!-- file manager library -->
<script src="<%=basePath %>js/jquery.elfinder.min.js"></script>
<!-- star rating plugin -->
<script src="<%=basePath %>js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="<%=basePath %>js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="<%=basePath %>js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="<%=basePath %>js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="<%=basePath %>js/jquery.history.js"></script>

<!-- application script for Charisma demo -->
<script src="<%=basePath %>js/charisma.js"></script>
<script src="<%=basePath %>js/monitor.js"></script>
<script src="<%=basePath%>js/c.js"></script>
<script src="<%=basePath%>js/zepto.min.js"></script>
<script src="<%=basePath%>js/sencha-touch.js"></script>
<script src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
<script src="<%=basePath%>js/jquery.colorbox-min.js"></script>
<script src="<%=basePath%>js/jquery.cookies.2.2.0.min.js"></script>
<script src="<%=basePath%>js/jquery.cookie-1.3.js"></script>
<script src="<%=basePath%>js/jQueryRotate.2.2.js"></script>
<script src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<script src="<%=basePath%>js/bootstrap-datetimepicker.js"></script>
<script src="<%=basePath%>js/bootstrap-datetimepicker.zh-CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/jsoneditor.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/conf.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/button.css">
<script type="text/javascript">

    $(function () {
        $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
        $('.tree li.parent_li > span').on('click', function (e) {
            var children = $(this).parent('li.parent_li').find(' > ul > li');
            if (children.is(":visible")) {
                children.hide('fast');
                $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
            } else {
                var str = $(this).attr('id');
                var position = str.substring(0,str.indexOf(","));
                var serviceName = str.substring(str.indexOf(",")+1,str.length);
                getAjax(position,serviceName);
                children.show('fast');
                $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
            }
            e.stopPropagation();
        });
    });

    try{
        HTMLElement.prototype.__defineGetter__
        (
                "innerText",
                function ()
                {
                    var anyString = "";
                    var childS = this.childNodes;
                    for(var i=0; i<childS.length; i++)
                    {
                        if(childS[i].nodeType==1)
                            anyString += childS[i].tagName=="BR" ? '"n' : childS[i].innerText;
                        else if(childS[i].nodeType==3)
                            anyString += childS[i].nodeValue;
                    }
                    return anyString;
                }
        );
    }
    catch(e){}
    function send(id){
        var date1 = new Date();
        ids = "ip"+id;
        var ip=document.getElementById(ids).innerText;
        $.ajax({
            type:'get',
            url:'confAjax.do?ip='+ip,
            cache:false,
            success:function(data) {
                var date2 = new Date();
                if(data == 1){
                    data = "ok";
                    document.getElementById(id).style.color = "green";
                    alert("ok\ntime:" + (date2.getTime() - date1.getTime()) +"ms\n"+ip);
                } else {
                    data = "error";
                    document.getElementById(id).style.color = "red";
                    alert("error\ntime:" + (date2.getTime() - date1.getTime()) +"ms\n"+ip);
                }
                document.getElementById(id).innerHTML = data;
            },
            error:function() {
                alert("服务器异常！");
            }
        });
    }
    function showAll(){
        var conf =${conf};
        for(var i =0;i<conf.length;i++){
            var projectName = conf[i].projectName;
            var serviceValue = conf[i].serviceValue;
            for(var j =0;j<serviceValue.length;j++){
                var serviceName = serviceValue[j].serviceName;
                getAjax(projectName,serviceName);
            }
        }
    }
    function getAjax(position,serviceName){
        $.ajax({
            type:'get',
            url:'serviceName.do?positionName='+position+'&serviceName='+serviceName,
            cache:false,
            success:function(data) {
                var json = eval(data);
                $.each(json,function(num,project){
                    var serviceValue = json[num].serviceValue;
                    $.each(serviceValue,function(serviceValueNum,service){
                        var value = serviceValue[serviceValueNum].value;
                        $.each(value,function(valueNum ,status){
                            var statu = "";
                            if(value[valueNum].status == 1){
                                statu = "ok";
                                document.getElementById("status"+value[valueNum].ip).style.color = "green";
                            } else {
                                statu = "error";
                                document.getElementById("status"+value[valueNum].ip).style.color = "red";
                                alert("error")
                            }
                            document.getElementById("status"+value[valueNum].ip).innerHTML = statu;
                            document.getElementById("ipstatus"+value[valueNum].ip).href = value[valueNum].url;
                        })
                    })
                })
            },
            error:function() {
                alert("服务器异常！");
            }
        })
    }
</script>
<body onload="showAll()">
<jsp:include page="global/navbar.jsp"></jsp:include>
<br><br><br>
<!-- topbar ends -->
<div class="container-fluid">
    <div class="row-fluid">
        <jsp:include page="global/lift_menu.jsp"></jsp:include>

        <div id="content" class="span10">
            <!-- content starts -->

            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="index.do">Home</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="conf.do">服务器监控管理</a>
                    </li>
                </ul>
            </div>

            <div class="row-fluid sortable">
                <div class="box span12">
                    <div class="box-header well" data-original-title>
                        <h2><i class="icon-list"></i> 服务器监控</h2>
                        <div class="box-icon">
                            <a href="#" class="btn btn-setting btn-round btn-default"><i class="icon-folder-open"></i></a>
                            <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                            <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
                        </div>
                    </div>
                    <div class="box-content">
                        <div class="tree well">
                            <ul>
                                <c:forEach items="${conf}" var="projectObject" varStatus="i">
                                    <li>
                                        <span><i class="icon-tasks" style="margin-right: 20px;"></i>${projectObject.projectName}</span>
                                        <ul>
                                            <c:forEach items="${projectObject.serviceValue}" var="serviceValue" varStatus="j">
                                                <li>
                                                    <span id=${projectObject.projectName},${serviceValue.serviceName} title="Collapse this branch"><i class="icon-minus-sign" style="margin-right: 20px;"></i>${serviceValue.serviceName}&nbsp;&nbsp;${serviceValue.domainName}</span>
                                                    <ul>
                                                        <li style="display: list-item;">
                                                        <span >
                                                            <c:forEach items="${serviceValue.value}" var="date" varStatus="k">
                                                                <i class="icon-asterisk" style="margin-right: 20px;"></i>
                                                                <a href="${date.url}" id="ipstatus${date.ip}" style="margin-right: 40px;">${date.ip}</a>
                                                                <a style="color: red; margin-right: 20px; cursor:pointer;" id="status${date.ip}" onclick = send('status${date.ip}')>error</a>
                                                                <br>
                                                            </c:forEach>
                                                        </span>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content ends -->
        </div>
</div><!--/fluid-row-->
<jsp:include page="global/foot.jsp"></jsp:include>
</div><!--/.fluid-container-->
<!-- external javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>
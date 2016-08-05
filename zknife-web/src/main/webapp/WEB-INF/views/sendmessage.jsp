<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html>
<html lang="zh-CN">
<jsp:include page="global/head.jsp"></jsp:include>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/jquery-ui.js"></script>
</head>
<body>
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
                        <a href="<%=basePath%>sendmessage.do">发送消息</a>
                    </li>
                </ul>
                <div class="row-fluid sortable">
                    <div class="box span12">
                        <div class="box-header well" data-original-title>
                            <h2>Exception Log</h2>
                            <div class="box-icon">
                                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
                            </div>
                        </div>
                        <div class="box-content" id="sendMessage">
                            <form  method="POST" id="sendmessageForm" name="sendmessageForm" action="sendmessage.do"
                                   enctype="multipart/form-data">
                                <table class="table table-striped" id="table-001">
                                    <tr>
                                        <td >
                                            请选择消息类型：
                                            <select name="operateType" id="operateType">
                                                <option value="0">apply</option>
                                                <option value="1">tag</option>
                                                <option value="2">directory</option>
                                                <option value="3">recommend</option>
                                                <option value="4">action</option>
                                                <option value="5">job</option>
                                                <option value="6">status</option>
                                                <option value="7">positionwrite</option>
                                                <option value="8">positionrefresh</option>
                                                <option value="9">resumewrite</option>
                                                <option value="10">talent</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <textarea style="width: 701px; height: 121px;" rows="4" name="messageBody" id="messageBody" class="span12"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            请选择消息文件：<input size="20" type="file" name="messageFile" id="messageFile"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input class="btn btn-primary" type="submit" value="发送" onclick="return sendmessageSubmit();"/>
                                        </td>
                                    </tr>
                                    <tbody id="sendResult" style="display: ${viewModel=="POST"?"normal":"none"}">
                                    <tr>
                                        <td>
                                            处理结果:成功${successCount}条,失败${failCount}条,以下是处理失败的消息
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <textarea style="width: 701px; height: 121px;" rows="4" name="failMessageBody" class="span12">${failMessage}</textarea>
                                        </td>
                                    </tr>
                                    </tbody>
                                    </table>
                                </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="global/foot.jsp"></jsp:include>
</div>
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
<script type="text/javascript" src="<%=basePath%>js/c.js"></script>
</body>
</html>

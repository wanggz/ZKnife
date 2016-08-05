<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%--
  Created by IntelliJ IDEA.
  User: honglin.zhang
  Date: 2015/10/20
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>应聘核信息统计</title>
</head>

<jsp:include page="global/head.jsp"></jsp:include>

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
                <ul class="breadcrumb">
                    <li>
                        <a href="<%=basePath%>index.do">Home</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="<%=basePath%>index.do">应聘核信息统计</a>
                    </li>
                </ul>
            </div>
            <div>
                <form method="get" action="applyCore.do">
                    <input type="hidden" id="applycoreoperateType" name="applycoreoperateType" value=""><br>
                    请输入核大于等于的应聘量<input type="text" style="width:100px;height:30px;"
                                         id="lowerApplyCount" name="lowerApplyCount" value="${lowerApplyCount}">
                    <input class="btn btn-primary" type="submit" value="导出核信息" onclick="setApplyCoreOperateType(1);">
                    <br><br><br>
                    solr核名称<br>
                    <input type="text" id="coreName" name="coreName" style="width:400px;height:30px;" value="${coreName}">
                    <br>
                    <br>
                    以逗号分隔的一组公司id,如 12007036,1200707,1200708
                    <br>
                    <textarea name="companyIds" style="width: 400px; height: 150px;">${companyIds}</textarea>
                    <br>
                    <input class="btn btn-primary" type="submit" value="更新公司核路由记录" onclick="setApplyCoreOperateType(2);">
                    <br>
                    执行结果
                    <br>
                    <textarea name="message" style="width: 400px; height: 150px;">${message}</textarea>
                </form>
            </div>
            <!-- content ends -->
    </div><!--/fluid-row-->
    <jsp:include page="global/foot.jsp"></jsp:include>

</div><!--/.fluid-container-->
</div>
<!-- external javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

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
<script src="<%=basePath %>js/companyroute.js"></script>
<script type="text/javascript" src="<%=basePath%>js/c.js"></script>
</body>
</html>

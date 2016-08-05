<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

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
                        <a href="<%=basePath%>linemessage.do">排队消息</a>
                    </li>
                </ul>
                <div class="row-fluid sortable">
                    <div class="box span12">
                        <div class="box-header well" data-original-title>
                            <h2>LineMessage</h2>

                            <div class="box-icon">
                                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
                            </div>
                        </div>
                        <div class="box-content" id="LineMessage">
                            <form method="POST" id="LinemessageForm" name="LinemessageForm" action="linemessage.do"
                                  enctype="multipart/form-data">
                                <table class="table table-condensed" id="table-001">
                                    <tr>
                                        <td colspan="2">
                                            <textarea id = "idInfo" name="idInfo" style="width: 701px;
                                            height: 121px;" rows="4" placeholder="请输入公司id和职位id,中间用,隔开 多条数据用换行隔开"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px">
                                            请选择消息文件：
                                        </td>
                                        <td>
                                            <input style="width: 200px" size="20" type="file" name="file" id="file"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <input class="btn btn-primary" type="submit" value="send" onclick=""/>

                                            <a class="btn btn-danger" href="#sendAllLineMessage" data-toggle="modal" style="margin-left: 10px;" onclick="return sendAllLineMessage()">
                                                sendAll
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            ${applyInfo}
                                            ${error}
                                            ${success}
                                            ${errorList}
                                            ${info}
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--重置全部的排队消息-->
    <div class="modal hide fade" id="sendAllLineMessage">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h3>提示</h3>
        </div>
        <div class="modal-body">
            <p>确定要重置排队消息吗？请慎重！</p>
        </div>
        <div class="modal-footer">
            <form method="post" action="sendAllLineMessage.do">
                <fieldset>
                    <table>
                        <td style="width: 150px">
                            请输入职位的刷新时间：
                        </td>
                        <td>
                            <input type="text" name="date" id="date" value="" placeholder="151015"/>
                        </td>
                    </table>
                    <a href="#" class="btn" data-dismiss="modal">Close</a>
                    <a href="<%=basePath%>resetLine.do" class="btn" data-dismiss="modal-a">查看状态</a>
                    <button type="submit" class="btn btn-danger">send</button>
                </fieldset>
            </form>
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

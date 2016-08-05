<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
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
						<a href="<%=basePath%>index.do">rdsearch用户屏蔽</a>
					</li>
				</ul>
			</div>
            <!-- content ends -->
            <div class="row-fluid sortable">
                <div class="box span12">
                    <div class="box-header well" data-original-title>
                        <h2><i class="icon-list"></i> 屏蔽用户列表</h2>
                        <div class="box-icon">
                            <a href="#addModal" data-toggle="modal" class="btn btn-setting btn-round"><i class="icon-plus"></i></a>
                            <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                            <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
                        </div>
                    </div>
                    <div class="box-content">
                        <br>
                        <table class="table table-striped">
                            <thead>

                            <tr>
                                <th>UserId</th>
                                <th>CompanyId</th>
                                <th>time</th>
                                <th>取消屏蔽</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var="nowDate" value="<%=System.currentTimeMillis()%>"></c:set>
                            <c:forEach items="${list}" var="item" varStatus="i">
                                <tr>
                                    <td class="center" id="UserId${i.index}">${item.UserId}</td>
                                    <td class="center" id="CompanyId${i.index}">${item.CompanyId}</td>
                                    <td class="center" id="time${i.index}">${item.ptime}</td>
                                    <c:choose>
                                        <c:when test="${item.operator=='1'}">
                                            <td id="p_${item.UserId}"><a style="cursor:pointer;" onclick=del('${item.UserId}')>取消</a></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>无</td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

            </div><!--/#content.span10-->

		</div><!--/fluid-row-->
		<jsp:include page="global/foot.jsp"></jsp:include>

	</div><!--/.fluid-container-->

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

	<script src="<%=basePath %>js/monitor.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/c.js"></script>
    <script type="application/javascript">
        function del(id){
            alert(id);
            $.ajax({
                type:'get',
                url:'rddel.do?id='+id,
                cache:false,
                success:function(data) {
                    if(data){
                        document.getElementById('p_'+id).innerHTML = "无";
                        alert("ok");
                    } else {
                        alert("error");
                    }
                },
                error:function() {
                    alert("服务器异常！");
                }
            });
        }
    </script>
</body>
</html>
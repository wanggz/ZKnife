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
						<a href="#">transfer管理</a>
					</li>
				</ul>
			</div>
            <div class="row-fluid sortable">

                <div class="box span12">

                    <div class="box-header well">
                        <h2><i class="icon-th"></i> transfer列表</h2>
                        <div class="box-icon">
                            <a href="#addModal" data-toggle="modal" class="btn btn-setting btn-round"><i class="icon-plus"></i></a>
                            <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                            <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
                        </div>
                    </div>

                    <div class="box-content">

                        <table class="table table-striped table-bordered bootstrap-datatable datatable">
                            <thead>
                            <tr>
                                <th>JobId</th>
                                <th>JobName</th>
                                <th>Status</th>
                                <th>fromCore</th>
                                <th>toCore</th>
                                <th>TransferTime</th>
                                <th>UseTime</th>
                                <th>SyncThread</th>
                                <th>SyncCompany</th>
                                <th>TransferRows</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${transfers}" var="transfer" varStatus="i">
                                <tr>
                                    <td class="center" id="JobId${i.index}">${transfer.jobId}</td>
                                    <td class="center" id="JobName${i.index}">${transfer.jobName}</td>
                                    <td class="center" id="Status${i.index}">${transfer.status}</td>
                                    <td class="center" id="fromCore${i.index}">${transfer.fromCore}</td>
                                    <td class="center" id="toCore${i.index}">${transfer.toCore}</td>
                                    <td class="center" id="TransferTime${i.index}">${transfer.transferTime}</td>
                                    <td class="center" id="UseTime${i.index}">${transfer.useTime}</td>
                                    <td class="center" id="SyncThread${i.index}">${transfer.syncThread}</td>
                                    <td class="center" id="SyncCompany${i.index}">${transfer.syncCompany}</td>
                                    <td class="center" id="TransferRows${i.index}">${transfer.transferRows}</td>
                                    <td class="center">
                                            <%--<a class="btn btn-success" href="#">--%>
                                            <%--<i class="icon-zoom-in icon-white"></i>--%>
                                            <%--View--%>
                                            <%--</a>--%>
                                        <a class="btn btn-info" href="#modModal" data-toggle="modal" onclick="return transferedit(${i.index})">
                                            <i class="icon-edit icon-white"></i>
                                            Edit
                                        </a>
                                        <a class="btn btn-danger" href="#delModal" data-toggle="modal" onclick="return transferdel(${transfer.jobId})">
                                            <i class="icon-trash icon-white"></i>
                                            Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>


                </div><!--/span-->

            </div>

                <div class="modal hide fade" id="addModal">
                    <form class="form-horizontal" method="post" action="transfer_add.do">
                        <fieldset>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">×</button>
                                <h3>添加</h3>
                            </div>
                            <div class="modal-body">
                                <div class="box-content">

                                    <legend>请输入transfer信息</legend>
                                    <div class="control-group">
                                        <label class="control-label" for="JobName">JobName</label>
                                        <div class="controls">
                                            <input type="text" id="JobName" name="JobName">
                                            <span class="help-inline"> <span style="color: #ff0000">*</span>JobName</span>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="fromCore">fromCore</label>
                                        <div class="controls">
                                            <input type="text" id="fromCore" name="fromCore">
                                            <span class="help-inline"> <span style="color: #ff0000">*</span>fromCore</span>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="toCore">toCore</label>
                                        <div class="controls">
                                            <input type="text" id="toCore" name="toCore">
                                            <span class="help-inline"> <span style="color: #ff0000">*</span>toCore</span>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="TransferTime">TransferTime</label>
                                        <div class="controls">
                                            <div id="datetimepicker1" class="input-append date">
                                                <input data-format="yyyy-MM-dd HH:mm:ss" type="text" id="TransferTime" name="TransferTime" />
                                                <span class="add-on">
                                                  <i data-time-icon="icon-time" data-date-icon="icon-calendar">
                                                  </i>
                                                </span>
                                            </div>
                                            <span class="help-inline"> <span style="color: #ff0000">*</span>TransferTime:yyyy-MM-dd HH:mm:ss</span>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="SyncThread">SyncThread</label>
                                        <div class="controls">
                                            <input type="text" id="SyncThread" name="SyncThread">
                                            <span class="help-inline"> <span style="color: #ff0000">*</span>SyncThread</span>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="SyncCompany">SyncCompany</label>
                                        <div class="controls">
                                            <input type="text" id="SyncCompany" name="SyncCompany">
                                            <span class="help-inline"> <span style="color: #ff0000">*</span>SyncCompany</span>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="TransferRows">TransferRows</label>
                                        <div class="controls">
                                            <input type="text" id="TransferRows" name="TransferRows">
                                            <span class="help-inline"> <span style="color: #ff0000">*</span>TransferRows</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a href="#" class="btn" data-dismiss="modal">Close</a>
                                <button class="btn btn-primary" type="submit">Save changes</button>
                            </div>
                        </fieldset>
                    </form>
                </div>

                <div class="modal hide fade" id="modModal">
                    <form class="form-horizontal" method="post" action="transfer_mod.do">
                        <fieldset>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">×</button>
                                <h3>修改</h3>
                            </div>
                            <div class="modal-body">
                                <div class="box-content">

                                    <legend>请编辑transfer信息</legend>
                                    <div class="control-group">
                                        <label class="control-label" for="editJobName">JobName</label>
                                        <div class="controls">
                                            <input type="text" id="editJobName" name="JobName">
                                            <input type="hidden" id="editJobId" name="JobId">
                                            <span class="help-inline"> <span style="color: #ff0000">*</span>JobName</span>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="editfromCore">fromCore</label>
                                        <div class="controls">
                                            <input type="text" id="editfromCore" name="fromCore">
                                            <span class="help-inline"> <span style="color: #ff0000">*</span>fromCore</span>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="edittoCore">toCore</label>
                                        <div class="controls">
                                            <input type="text" id="edittoCore" name="toCore">
                                            <span class="help-inline"> <span style="color: #ff0000">*</span>toCore</span>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="editTransferTime">TransferTime</label>
                                        <div class="controls">
                                            <div id="editdatetimepicker1" class="input-append date">
                                                <input data-format="yyyy-MM-dd HH:mm:ss" type="text" id="editTransferTime" name="TransferTime" />
                                                <span class="add-on">
                                                  <i data-time-icon="icon-time" data-date-icon="icon-calendar">
                                                  </i>
                                                </span>
                                            </div>
                                            <span class="help-inline"> <span style="color: #ff0000">*</span>TransferTime:yyyy-MM-dd HH:mm:ss</span>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="editSyncThread">SyncThread</label>
                                        <div class="controls">
                                            <input type="text" id="editSyncThread" name="SyncThread">
                                            <span class="help-inline"> <span style="color: #ff0000">*</span>SyncThread</span>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="editSyncCompany">SyncCompany</label>
                                        <div class="controls">
                                            <input type="text" id="editSyncCompany" name="SyncCompany">
                                            <span class="help-inline"> <span style="color: #ff0000">*</span>SyncCompany</span>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="editTransferRows">TransferRows</label>
                                        <div class="controls">
                                            <input type="text" id="editTransferRows" name="TransferRows">
                                            <span class="help-inline"> <span style="color: #ff0000">*</span>TransferRows</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a href="#" class="btn" data-dismiss="modal">Close</a>
                                <button class="btn btn-primary" type="submit">Update</button>
                            </div>
                        </fieldset>
                    </form>
                </div>

                <div class="modal hide fade" id="delModal">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h3>提示</h3>
                    </div>
                    <div class="modal-body">
                        <p>确定要删除吗？</p>
                    </div>
                    <div class="modal-footer">
                        <form method="post" action="transfer_del.do">
                            <fieldset>
                                <input type="hidden" id="delJobId" name="JobId">
                                <a href="#" class="btn" data-dismiss="modal">Close</a>
                                <button type="submit" class="btn btn-primary">Delete Ok</button>
                            </fieldset>
                        </form>
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
    <!--
    <script type="text/javascript"
            src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js">
    </script>
    <script type="text/javascript"
            src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/js/bootstrap.min.js">
    </script>
    <script type="text/javascript"
            src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
    </script>
    <script type="text/javascript"
            src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
    </script>
    -->
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
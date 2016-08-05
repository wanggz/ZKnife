<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()	+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>系统登陆</title>
<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="view">
			<h3 style="background-color: rgb(238, 238, 238); border: 1px solid rgb(204, 204, 204); padding: 5px 10px;">请登陆&nbsp;</h3>

			<form class="form-horizontal">
				<p>&nbsp;</p>

				<div class="control-group">
					<label class="control-label" contenteditable="true"
						for="inputEmail">账户</label>

					<div class="controls">
						<input id="inputEmail" placeholder="Username" type="text">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" contenteditable="true"
						for="inputPassword">密码</label>

					<div class="controls">
						<input id="inputPassword" placeholder="Password" type="password">
					</div>
				</div>

				<div class="control-group">
					<div class="controls">
						<label class="checkbox" contenteditable="true"><input
							type="checkbox"> Remember me </label>
						<button class="btn" contenteditable="true" type="submit">登陆</button>
					</div>
				</div>
			</form>

			<hr>
			<hr>
			<p>&nbsp;</p>
		</div>
	</div>
</div>

<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.js"></script>
</body>
</html>
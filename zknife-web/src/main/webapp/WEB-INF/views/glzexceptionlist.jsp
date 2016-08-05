<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<form  method="GET" id="exception_form" name="exception_form" action="glzexception.do">
	<table class="table table-striped" id="table-001">
	  <thead>
	  	  <tr class="span10">
	  	  	  Time: <input onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" class="Wdate" type="text" id="start_time" style="width:120px" name="startTime" value="${startTime} ">
	  	  	  - <input onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" class="Wdate" type="text" id="end_time" style="width:120px" name="endTime" value="${endTime}">
              &nbsp;&nbsp;
	  	  	  Description:<input type="text" id="description" style="width:150px" name="description" value='${description }'>
	  	  	  &nbsp;&nbsp;
              Exception:<input type="text" id="exception" style="width:150px" name="exception" value='${exception }'>
              &nbsp;
	  	  	  <input class="btn btn-primary" type="submit" value="search"
                     onclick="return searchGlzException('exception_form')"/>
              &nbsp;&nbsp;
              <!--
              <input class="btn btn-primary" type="button" value="export"
                     onclick="javascript: return exportException('exception_form')"/>
              &nbsp;
              <a class="btn btn-primary" href="#sendModal" data-toggle="modal">
                  发送消息
              </a>
              &nbsp;
              <input type="hidden" id="send_message" name="send_message" value="0"/>
              <input type="hidden" name="exportPage" value="${current}"/>
	  	  	  <a class="btn btn-danger" href="#delModal" data-toggle="modal" style="margin-left: 10px;" onclick="javascript: return exceptiondel()">
                 Delete
              </a>
              -->
	  	  </tr>
	  	  <tr>
	  	      <th colspan="5">
	  	  		总计 ${count} 条
	  	  	  </th>
	  	  </tr>
		  <tr>
			  <th class="span2">Time</th>                                     
			  <th class="span1">Description</th>
			  <th class="span2">Param</th>
			  <th class="span6">Exception</th>     
		  </tr>
	  </thead>   
	  <tbody>
	  <c:forEach items="${exceptions }" var="exception">
	  	<tr>
	  		<td class="span2">${exception.time }</td>
	  		<td class="span1">${exception.description }</td>
	  		<td class="span2">
	  			<textarea rows="4" cols="" class="span12">${exception.param }</textarea>
	  		</td>
	  		<td class="span6">
	  			<textarea rows="4" cols="" class="span12">${exception.exception }</textarea>
	  		</td>
	  	</tr>
	  </c:forEach>
		  </tbody>
	 </table>  
 </form>
 <div class="pagination pagination-centered">
  <ul>
  	<c:choose>
  		<c:when test="${current==1 }"><li class="disabled"><a href="#">Prev</a></li></c:when>
  		<c:otherwise><li><a href="glzexception.do?page=${current-1 }&description=${descripiton}&startTime=${startTime}&endTime=${endTime}&exception=${exception}" >Prev</a></li></c:otherwise>
  	</c:choose>
	  <c:forEach items="${num }" var="n">
	  	<c:choose>
	  		<c:when test="${n==current }">
	  			<li class="active">
				  <a href="glzexception.do?page=${n }&description=${description}&startTime=${startTime}&endTime=${endTime}&exception=${exception}" >${n }</a>
				</li>
	  		</c:when>
	  		<c:otherwise>
	  			<li><a href="glzexception.do?page=${n }&description=${description}&startTime=${startTime}&endTime=${endTime}&exception=${exception}" >${n }</a></li>
	  		</c:otherwise>
	  	</c:choose>
	  </c:forEach>
	<c:choose>
		<c:when test="${current==total || total==0 }"><li class="disabled"><a href="#">Next</a></li></c:when>
		<c:otherwise><li><a href="glzexception.do?page=${current+1 }&description=${descripiton}&startTime=${startTime}&endTime=${endTime}&exception=${exception}" >Next</a></li></c:otherwise>
	</c:choose>
  </ul>
</div>
 <div class="modal hide fade" id="delModal">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h3>提示</h3>
    </div>
    <div class="modal-body">
        <p>确定要删除所有异常吗？</p>
    </div>
    <div class="modal-footer">
        <form method="post" action="exception_del.do">
            <fieldset>
                <input type="hidden" id="deleteExceptions">
                <input type="hidden" id="starttime" style="width:100px" name="startTime" value="${startTime} ">
                <input type="hidden" id="endtime" style="width:100px" name="endTime" value="${endTime}">
                <input type="hidden" style="width:150px" name="description" value="${description }">
                <a href="#" class="btn" data-dismiss="modal">Close</a>
                <button type="submit" class="btn btn-danger">Delete</button>
            </fieldset>
        </form>
    </div>
</div>
 <div class="modal hide fade" id="sendModal">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h3>发送消息</h3>
    </div>
    <div class="modal-body">
        <p>确定要发送指定条件的应聘消息吗?</p>
    </div>
    <div class="modal-footer">
         <fieldset>
                <a href="#" class="btn" data-dismiss="modal">取消</a>
                <input class="btn btn-primary" type="submit" value="确定"
                    onclick="return sendException('exception_form')"/>
         </fieldset>
    </div>
</div>

<div class="modal hide fade" id="jsonModel">

</div>
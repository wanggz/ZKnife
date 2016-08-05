<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<form  method="GET" id="exception_form" name="exception_form" action="message.do">
    <table class="table table-striped">
        <thead>
        <tr class="span6">
            日期 :<input type="date" name="date" value="${date}" style="width:120px"/>
                 <input  type="time" name="startTime" value="${startTime}" style="width:80px"/>
                 <input  type="time" name="endTime" value="${endTime}" style="width:80px"/>
                 &nbsp;&nbsp;
            topic :<select name="topic" style="width:120px">
                       <option value="*" <c:if test="${'*' eq topic}">selected</c:if> >*</option>
                       <option value="apply" <c:if test="${'apply' eq topic}">selected</c:if> >apply</option>
                       <option value="directory" <c:if test="${'directory' eq topic}">selected</c:if> >directory</option>
                       <option value="action" <c:if test="${'action' eq topic}">selected</c:if> >action</option>
                       <option value="recommend" <c:if test="${'recommend' eq topic}">selected</c:if> >recommend</option>
                       <option value="tag" <c:if test="${'tag' eq topic}">selected</c:if> >tag</option>
                       <option value="job" <c:if test="${'job' eq topic}">selected</c:if> >job</option>
                       <option value="status" <c:if test="${'status' eq topic}">selected</c:if> >status</option>
                   </select>
                   &nbsp;&nbsp;
            message : <input type="text" name="message" value='${message}' style="width:150px"/>
            &nbsp;&nbsp;
            <input type="checkbox" name="morePage" ${morePage=="1"?"checked":""} />是否翻页

            <input class="btn btn-primary" type="submit" value="search" />

            <a class="btn btn-info" href="#postMessage" data-toggle="modal" style="margin-left: 30px;" onclick="return postMessage()">
                <i class="icon-refresh icon-white"></i>
                Post 消息
            </a>

        </tr>
        <tr>
            <th colspan="5">
                总计 ${count} 条
            </th>
        </tr>
        <tr>
            <th>Topic</th>
            <th>GroupName</th>
            <th>BackupTime</th>
            <th>Message</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${messages}" var="message" varStatus="i">
            <tr>
                <td class="center" id="topic${i.index}">${message.topic}</td>
                <td class="center" id="groupName${i.index}">${message.groupName}</td>
                <td class="center" id="backupTime${i.index}">${message.backupTime}</td>
                <td class="center" id="message${i.index}">${message.message}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>
<div class="pagination pagination-centered" style="display: ${morePage=="1"?"block":"none"}">
    <ul>
        <c:choose>
            <c:when test="${current==1}"><li class="disabled"><a href="#">Prev</a></li></c:when>
            <c:otherwise><li><a href="message.do?page=${current-1}&date=${date}&startTime=${startTime}&endTime=${endTime}&topic=${topic}&morePage=${morePage}&message=${message}">Prev</a></li></c:otherwise>
        </c:choose>
        <c:forEach items="${num }" var="n">
            <c:choose>
                <c:when test="${n==current}">
                    <li class="active">
                        <a href="message.do?page=${n}&date=${date}&startTime=${startTime}&endTime=${endTime}&topic=${topic}&morePage=${morePage}&message=${message}" >${n }</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li><a href="message.do?page=${n}&date=${date}&startTime=${startTime}&endTime=${endTime}&topic=${topic}&morePage=${morePage}&message=${message}" >${n }</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${current==total || total==0}"><li class="disabled"><a href="#">Next</a></li></c:when>
            <c:otherwise><li><a href="message.do?page=${current+1}&date=${date}&startTime=${startTime}&endTime=${endTime}&topic=${topic}&morePage=${morePage}&message=${message}">Next</a></li></c:otherwise>
        </c:choose>
    </ul>
</div>

<div class="modal hide fade" id="postMessage">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h3>提示</h3>
    </div>
    <div class="modal-body">
        <p>确定要重新发送所有信息么？</p>
        <p>共有${count} 条消息发送。</p>
        <p>消息队列域名：${messageHost}</p>
    </div>
    <div class="modal-footer">
        <form method="post" action="message_post.do">
            <fieldset>
                <input type="hidden" id="date" name="date" value="${date} ">
                <input type="hidden" id="startTime" name="startTime" value="${startTime} ">
                <input type="hidden" id="endTime"  name="endTime" value="${endTime}">
                <input type="hidden" id="topic" name="topic" value="${topic }">
                <input type="hidden" id="message" name="message" value='${message }'>
                <a href="#" class="btn" data-dismiss="modal">Close</a>
                <button type="submit" class="btn btn-danger">Yes</button>
            </fieldset>
        </form>
    </div>
</div>
<script type="text/javascript">
    function myfun()
    {
        var list = '${faildId}';
        if(list == 'ok'){
            alert("消息重发成功");
            document.getElementById('exception_form').submit();
        }else if(list.length > 0){
            alert("消息发送失败列表:" + list);
            document.getElementById('exception_form').submit();
        }
    }
    window.onload=myfun;
</script>
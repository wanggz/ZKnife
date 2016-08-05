<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<form  method="GET" name="exception_form" action="searchenterprise.do">
	<table class="table table-striped">
	    <thead>
	    <tr class="span6">
            CompanyId :<input type="text" name="companyid" value="${companyid }">
            SolrAddress :<input type="text" name="solrAddress" value="${solrAddress }">
            CoreName :<input type="text" name="coreName" value="${coreName }">
            <input class="btn btn-primary" type="submit" value="搜索" />
		</tr>
	    <tr>
	        <th>CompanyId</th>
	        <th>SolrAddress</th>
	        <th>CoreName</th>
	        <th>CompanyStat</th>
	        <th>CreateTime</th>
            <th>SolrCount</th>
	    </tr>
	    </thead>
	    <tbody>
	    <c:forEach items="${searchenterprises}" var="searchenterprise" varStatus="i">
	        <tr>
	            <td class="center" id="companyid${i.index}">${searchenterprise.companyId}</td>
	            <td class="center" id="solraddress${i.index}">${searchenterprise.solrAddress}</td>
	            <td class="center" id="corename${i.index}">${searchenterprise.coreName}</td>
	            <td class="center" id="companystat${i.index}">${searchenterprise.companyStat}</td>
	            <td class="center" id="createtime${i.index}">${searchenterprise.createTime}</td>
                <td class="center" id="solrCount${i.index}">${searchenterprise.solrCount}</td>
	        </tr>
	    </c:forEach>
	    </tbody>
	</table>
</form>
<div class="pagination pagination-centered">
    <ul>
        <c:choose>
            <c:when test="${current==1 }"><li class="disabled"><a href="#">Prev</a></li></c:when>
            <c:otherwise><li><a href="searchenterprise.do?page=${current-1 }&companyid=${companyid}&solrAddress=${solrAddress}&coreName=${coreName}">Prev</a></li></c:otherwise>
        </c:choose>
        <c:forEach items="${num }" var="n">
            <c:choose>
                <c:when test="${n==current }">
                    <li class="active">
                        <a href="searchenterprise.do?page=${n }&companyid=${companyid}&solrAddress=${solrAddress}&coreName=${coreName}" >${n }</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li><a href="searchenterprise.do?page=${n }&companyid=${companyid}&solrAddress=${solrAddress}&coreName=${coreName}" >${n }</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${current==total || total==0}"><li class="disabled"><a href="#">Next</a></li></c:when>
            <c:otherwise><li><a href="searchenterprise.do?page=${current+1  }&companyid=${companyid}&solrAddress=${solrAddress}&coreName=${coreName}">Next</a></li></c:otherwise>
        </c:choose>
    </ul>
</div>
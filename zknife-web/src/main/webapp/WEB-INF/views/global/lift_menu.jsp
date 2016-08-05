<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- left menu starts -->
<div class="span2 main-menu-span">
    <div class="well nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">
            <li class="nav-header hidden-tablet ">Main</li>
            <!--<li><a class="ajax-link" href="index.do"><i class="icon-home"></i><span class="hidden-tablet"> Dashboard</span></a></li>-->
            <!--<li><a class="ajax-link" href="searchcore.do"><i class="icon-eye-open"></i><span class="hidden-tablet"> 核管理</span></a></li>-->
            <!--<li><a class="ajax-link" href="searchengine.do"><i class="icon-edit"></i><span class="hidden-tablet"> 引擎管理</span></a></li>-->
            <li><a class="ajax-link" href="searchenterprise.do"><i class="icon-list-alt"></i><span class="hidden-tablet"> 企业管理</span></a></li>
            <li><a class="ajax-link" href="searchserver.do"><i class="icon-calendar"></i><span class="hidden-tablet"> 服务器管理</span></a></li>
            <!--<li><a href="transfer.do"><i class="icon-lock"></i><span class="hidden-tablet"> Transfer管理</span></a></li>-->
            <!--<li><a class="ajax-link" href="kafka.do"><i class="icon-font"></i><span class="hidden-tablet"> Kafka状态</span></a></li>-->
            <li><a class="ajax-link" href="remoteconfig.do"><i class="icon-picture"></i><span class="hidden-tablet"> 属性配置</span></a></li>
            <li><a class="ajax-link" href="exception.do"><i class="icon-warning-sign"></i><span class="hidden-tablet"> 异常日志</span></a></li>
            <!--<li><a class="ajax-link" href="glzexception.do"><i class="icon-warning-sign"></i><span class="hidden-tablet"> 橄榄枝异常日志</span></a></li>-->
            <li><a class="ajax-link" href="message.do"><i class="icon-align-justify"></i><span class="hidden-tablet"> 消息日志</span></a></li>
            <li><a class="ajax-link" href="glzmessage.do"><i class="icon-align-justify"></i><span class="hidden-tablet"> 橄榄枝消息日志</span></a></li>
            <li><a class="ajax-link" href="conf.do"><i class="icon-user"></i><span class="hidden-tablet"> 服务器监控</span></a></li>
            <li><a class="ajax-link" href="sendmessage.do"><i class="icon-align-justify"></i><span class="hidden-tablet"> 发送消息</span></a></li>
            <li><a class="ajax-link" href="linemessage.do"><i class="icon-align-justify"></i><span class="hidden-tablet"> 重置排队消息</span></a></li>
            <li><a class="ajax-link" href="redismessage.do"><i class="icon-align-justify"></i><span class="hidden-tablet"> redis管理</span></a></li>
            <li><a class="ajax-link" href="rdpermit.do"><i class="icon-align-justify"></i><span class="hidden-tablet"> rdsearch用户屏蔽</span></a></li>
            <!--<li><a class="ajax-link" href="mqmonitor.do"><i class="icon-align-justify"></i><span class="hidden-tablet"> 消息队列</span></a></li>-->
            <%--<li><a class="ajax-link" href="dictionary.do"><i class="icon-align-justify"></i><span class="hidden-tablet"> 词库管理</span></a></li>--%>
            <li><a class="ajax-link" href="companyRouteRedis.do"><i class="icon-align-justify"></i><span class="hidden-tablet"> 公司路由管理</span></a></li>
            <%--<li><a class="ajax-link" href="applyCore.do"><i class="icon-align-justify"></i><span class="hidden-tablet">公司核记录更新</span></a></li>--%>
        </ul>
    </div><!--/.well -->
</div><!--/span-->
<!-- left menu ends -->
<noscript>
    <div class="alert alert-block span10">
        <h4 class="alert-heading">Warning!</h4>
        <p>You need to have <a href="" target="_blank">JavaScript</a> enabled to use this site.</p>
    </div>
</noscript>

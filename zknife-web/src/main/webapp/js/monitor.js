/**
 * Created with IntelliJ IDEA.
 * User: parttime.pd
 * Date: 13-11-28
 * Time: 上午11:06
 * To change this template use File | Settings | File Templates.
 */
//SearchCore
function coreedit(id) {
    $("#editcorename").val($("#corename" + id).text());
    $("#editsolraddress").val($("#solraddress" + id).text());
    $("#editoperationcount").val($("#operationcount" + id).text());
    $("#editcreatetime").val($("#createtime" + id).text());
    return null
}
function coredel(id) {
    $("#delcorename").val($("#corename" + id).text());
    $("#delsolraddress").val($("#solraddress" + id).text())
}
//engine
function engineedit(id) {
    $("#editengineid").val($("#engineid" + id).text());
    $("#editengineid2").val($("#engineid" + id).text());
    $("#editenginename").val($("#enginename" + id).text());
    $("#editcreatetime").val($("#createtime" + id).text())
}
function enginedel(id) {
    $("#delengineid").val(id)
}
//enterprise
function enterpriseedit(id) {
    $("#editcompanyid").val($("#companyid" + id).text());
    $("#editsolraddress").val($("#solraddress" + id).text());
    $("#editcorename").val($("#corename" + id).text());
    $("#editcompanystat").val($("#companystat" + id).text());
    $("#editcompanynumber").val($("#companynumber" + id).text());
    $("#editcreatetime").val($("#createtime" + id).text())
}
function enterprisedel(id) {
    $("#delcompanyid").val(id);
}
//server
function serveredit(id) {
    $("#editsolrAddress").val($("#solrAddress" + id).text());
    $("#editsolrAddress2").val($("#solrAddress" + id).text());
    $("#editlastCount").val($("#lastCount" + id).text());
    $("#edithistoryCount").val($("#historyCount" + id).text());
    $("#editenterpriseCount").val($("#enterpriseCount" + id).text());
    $("#editserviceStat").val($("#serviceStat" + id).text());
    $("#editcreateTime").val($("#createTime" + id).text())
}
function serverdel(id) {
    $("#delsolrAddress").val(id);
}
//transfer
function transferedit(id) {
    $("#editJobId").val($("#JobId" + id).text());
    $("#editJobName").val($("#JobName" + id).text());
    $("#editfromCore").val($("#fromCore" + id).text());
    $("#edittoCore").val($("#toCore" + id).text());
    $("#editTransferTime").val($("#TransferTime" + id).text());
    $("#editSyncThread").val($("#SyncThread" + id).text());
    $("#editSyncCompany").val($("#SyncCompany" + id).text());
    $("#editTransferRows").val($("#TransferRows" + id).text())
}
function transferdel(id) {
    $("#delJobId").val(id);
}


//remoteconfig
$("#selectSetting").change(function () {
    var val = $(this).val();
    var url = 'remoteconfig.do?update=update&setting=' + val;
    loadpage(url, 'projectinfo')
});
function loadconfig(url, id) {
    $("ul.nav-list>li[id^=li]").attr("class", "");
    $("#" + id).attr("class", "active");
    $("#configinfo").load(url, function (responseTxt, statusTxt, xhr) {

    });
    return false;
}
function loadpage(url, id) {
    $("#" + id).load(url, function (responseTxt, statusTxt, xhr) {
    });
    return false;
}
/*
 function postjson(id) {

 // create the editor
 //var container = document.getElementById('jsoneditor');
 //var editor = new JSONEditor(container);

 var json = editor.get();
 alert(JSON.stringify(json, null, 2));

 //var json = $("#"+id).val()


 var configname = $("#configname"+id).val()
 var project = $("#project"+id).val()
 $.ajax({
 type:'POST',
 url:'remoteconfig.do',
 data:{
 json:json,
 project:project,
 configname:configname
 },
 cache:false,
 success:function(data) {
 if (data == "error")
 alert(data)
 else {
 $("#"+id).val(data)
 alert("success")
 }
 },
 error:function() {
 alert("服务器异常！");
 }
 });

 }
 */
function delnode(id) {
    var configname = $("#configname" + id).val();
    var project = $("#project" + id).val();
    $.ajax({
        type: 'POST',
        url: 'remoteconfig_del.do',
        data: {
            project: project,
            configname: configname
        },
        cache: false,
        success: function (data) {
            alert(data);
            if (data == "success") {
                $("#configinfo").empty();
                loadpage('remoteconfig.do?update=update', 'projectinfo')
            }
        },
        error: function () {
            alert("服务器异常！");
        }
    });
}
function addnode(id, type) {
    var projectname = $("#project" + id).val();
    var configname = $("#config" + id).val();
    var json = $("#RawJson").val();
    $.ajax({
        type: 'POST',
        url: 'remoteconfig_addnode.do',
        data: {
            json: json,
            projectname: projectname,
            configname: configname,
            type: type
        },
        cache: false,
        success: function (data) {
            if (data == "error")
                alert(data);
            else {
                $("#RawJson").val(data);
                loadpage('remoteconfig.do?update=update', 'projectinfo');
                alert("success")
            }
        },
        error: function () {
            alert("服务器异常！");
        }
    });
}
function exceptiondel() {
    $("#deleteExceptions");
}

function postMessage() {
    $("#postMessage");
}

function showJson(value) {
    $("#jsonModel").val(value)
}

function searchException(form) {
    $("#" + form).attr("action", "exception.do");
}
function searchGlzException(form) {
    $("#" + form).attr("action", "glzexception.do");
}

function exportException(form) {
    $("#" + form).attr("action", "export_log.do");
    $("#send_message").attr("value", "0");
    $("#" + form).submit();
}
function sendException(form) {
    $("#" + form).attr("action", "export_log.do");
    $("#send_message").val("1");
    $("#" + form).submit();
}
function sendmessageSubmit() {
    var messageBody = $("#messageBody").val();
    var messageFile = $("#messageFile").val();
    if ((messageBody == null || messageBody == "") && (messageFile == null || messageFile == "")) {
        alert("请输入要发送的消息或选择消息文件");
        $("#messageBody").focus();
        return false;
    } else {
        return true;
    }
}

function sendAllLineMessage() {
    $("#sendAllLineMessage");
}

function sendIdForDelete(id) {
    var dicID = id;
    if (confirm("确认要删除这条词吗？")) {
        $.ajax({
            type: 'GET',
            url: 'dictionaryajax.do',
            data: {deleteid: dicID},
            cache: false,
            success: function (data) {
                if (0 < data) {
                    alert("删除成功");
                    window.location.reload();
                }
            },
            error: function () {
                alert("服务器异常");
            }
        })
    }
}

$("#stop").click(function stopThead() {
    var stop = "stop";
    if (confirm("确定要终止线程？")) {
        $.ajax({
            type: 'POST',
            url: 'resetLine.do',
            data: {
                stop: stop
            },
            cache: false,
            success: function (data) {
                if (data == "ok") {
                    alert("程序终止")
                } else {
                    alert("终止失败")
                }
            },
            error: function () {
                alert("服务器异常！");
            }
        })
    }
});
$("#project").change(function projectChange() {
    $("#RedisProjectForm").submit();
});
//词库项目select
$("#selectdic").click(function selectdicFromDB() {
    var cate = $("#cate").find("option:selected").attr("id");
    var part = $("#part").find("option:selected").attr("id");
    var from = $("#from").find("option:selected").attr("id");
    $("#optdiction").submit();
});

$("#iploadsubmit").click(function submitUpload() {
    $("#datauoload").submit();
});

$("#download").click();
$("#adddic").click(function () {
    alert("添加词库");

    $.ajax({
        type: 'POST',
        url: 'optdiction.do',
        data: {
            operateType: 2
        },
        cache: false,
        success: function (data) {
            alert(data);
        },
        error: function () {
            alert("服务器异常！");
        }
    })
});

$("#deleteDic").click(function () {
    alert("删除词库")
    $.ajax({
        type: 'POST',
        url: 'optdiction.do',
        data: {
            operateType: 3
        },
        cache: false,
        success: function (data) {
            alert(data);
        },
        error: function () {
            alert("服务器异常！");
        }
    })
});
$("#sureButton").click(function postObject() {
    alert("给hidden赋值");
    alert("saveDictionToDB.submit");
});

function deleteRedisByKey() {
    var key = $("#key").val();
    var service = $("#service").val();
    if (key == "") {
        alert("请输入要删除的key值")
    } else {
        if (confirm("确定要删除" + key + "的值吗？")) {
            $.ajax({
                type: "get",
                url: "deleteRedisByKey.do",
                data: "service=" + service + "&key=" + key,
                cache: false,
                success: function (result) {
                    if (result == 0) {
                        alert("删除成功")
                    } else {
                        alert("删除失败")
                    }
                },
                error: function () {
                    alert("服务器异常");
                }
            })
        }
    }
}
$('#datetimepicker_mask').datetimepicker({
    mask: '9999/19/39 29:59'
});
//$('#datetimepicker').datetimepicker();
$('#indbtimestart').datetimepicker({value: '', step: 10});
$('#indbtimeend').datetimepicker({value: '', step: 10});
$('#uplinetimestart').datetimepicker({value: '', step: 10});
$('#uplinetimeend').datetimepicker({value: '', step: 10});
$('#dowmntimestart').datetimepicker({value: '', step: 10});
$('#dowmntimeend').datetimepicker({value: '', step: 10});
$('#datetimepicker1').datetimepicker({
    datepicker: false,
    format: 'H:i',
    step: 5
});
$('#datetimepicker2').datetimepicker({
    yearOffset: 222,
    lang: 'ch',
    timepicker: false,
    format: 'd/m/Y',
    formatDate: 'Y/m/d',
    minDate: '-1970/01/02', // yesterday is minimum date
    maxDate: '+1970/01/02' // and tommorow is maximum date calendar
});
$('#datetimepicker3').datetimepicker({
    inline: true
});
$('#datetimepicker4').datetimepicker();
$('#open').click(function () {
    $('#datetimepicker4').datetimepicker('show');
});
$('#close').click(function () {
    $('#datetimepicker4').datetimepicker('hide');
});
$('#reset').click(function () {
    $('#datetimepicker4').datetimepicker('reset');
});
$('#datetimepicker5').datetimepicker({
    datepicker: false,
    allowTimes: ['12:00', '13:00', '15:00', '17:00', '17:05', '17:20', '19:00', '20:00']
});
$('#datetimepicker6').datetimepicker();
$('#destroy').click(function () {
    if ($('#datetimepicker6').data('xdsoft_datetimepicker')) {
        $('#datetimepicker6').datetimepicker('destroy');
        this.value = 'create';
    } else {
        $('#datetimepicker6').datetimepicker();
        this.value = 'destroy';
    }
});
var logic = function (currentDateTime) {
    if (currentDateTime.getDay() == 6) {
        this.setOptions({
            minTime: '11:00'
        });
    } else
        this.setOptions({
            minTime: '8:00'
        });
};
$('#datetimepicker7').datetimepicker({
    onChangeDateTime: logic,
    onShow: logic
});
$('#datetimepicker8').datetimepicker({
    onGenerate: function (ct) {
        $(this).find('.xdsoft_date')
            .toggleClass('xdsoft_disabled');
    },
    minDate: '-1970/01/2',
    maxDate: '+1970/01/2',
    timepicker: false
});
$('#datetimepicker9').datetimepicker({
    onGenerate: function (ct) {
        $(this).find('.xdsoft_date.xdsoft_weekend')
            .addClass('xdsoft_disabled');
    },
    weekends: ['01.01.2014', '02.01.2014', '03.01.2014', '04.01.2014', '05.01.2014', '06.01.2014'],
    timepicker: false
});
function saveToRedisFun(){
    var value = document.getElementById("redisMessageBody").value;
    if("" == value || undefined == value){
        alert("内容不为空");
        return;
    }
    if(confirm("确定要保存该条消息么？")){
        $.ajax({
            type:'POST',
            url:'saveRedis.do',
            data:{
                operate:1,
                value:value
            },
            cache:false,
            success:function(data){
                alert(data);
            },
            error:function(){
                alert("服务器异常！");
            }
        })
    }
}
function saveAndToSolrFun(){
    var value = document.getElementById("redisMessageBody").value;
    if("" == value || undefined == value){
        alert("内容不为空");
        return;
    }
    if(confirm("确定要保存并发往solr中么？")){
        $.ajax({
            type:'POST',
            url:'saveRedis.do',
            data:{
                operate:2,
                value:value
            },
            cache:false,
            success:function(data){
                alert(data);
            },
            error:function(){
                alert("服务器异常！");
            }
        })
    }
}
function solrToRedisFun(){
    if(confirm("确定要将solr中数据全部发送到redis中么？")){
        $.ajax({
            type:'POST',
            url:'saveRedis.do',
            data:{
                operate:3
            },
            cache:false,
            success:function(data){
                alert(data);
            },
            error:function(){
                alert("服务器异常！");
            }
        })
    }
}
function redisToSolrFun(){
    if(confirm("确定要将redis中数据全部写入solr中么？")){
        $.ajax({
            type:'POST',
            url:'saveRedis.do',
            data:{
                operate:4
            },
            cache:false,
            success:function(data){
                alert(data);
            },
            error:function(){
                alert("服务器异常！");
            }
        })
    }
}

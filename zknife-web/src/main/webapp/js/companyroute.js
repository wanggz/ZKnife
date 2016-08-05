/**
 * Created by honglin.zhang on 2015/10/22.
 */
/**
 * 设置操作类型
 * @param operateType 操作类型
 * @param isCheckLevelValue 是否校验层级关系值
 */
function setOperateType(operateType){
    //alert("操作类型为:"+operateType);
    $("#operateType").val(operateType);
}
function checkLevelValue(){
    var levelValue = $("#levelValue").val();
    if(levelValue.indexOf("-")<=0){
        alert("层级格式错误,请重新输入");
        $("#levelValue").val("");
        $("#levelValue").focus();
        return false;
    }
    return true;
}

function setApplyCoreOperateType(operateType){
    //alert("操作类型为:"+operateType);
    $("#applycoreoperateType").val(operateType);
}

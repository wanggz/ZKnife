<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="./css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>

<body>
<div class="container">
    <form action="datetimepicker.do" class="form-horizontal"  role="form">
        <fieldset>
            <legend>Test</legend>
       
			<div class="form-group">
                <label for="dtp_input2" class="col-md-2 control-label">Date Picking</label>
                <div class="input-group date form_date col-md-5" data-date="" data-date-format="" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input class="form_datetime" size="16" type="text" id="datetimepicker">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				<input type="hidden" id="dtp_input2" value="" /><br/>
            </div>
			
        </fieldset>
    </form>
</div>

<script type="text/javascript" src="./js/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="./js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript">
    $("#datetimepicker").datetimepicker({format: "yyyy-mm-dd hh:ii"});
</script>

</body>
</html>

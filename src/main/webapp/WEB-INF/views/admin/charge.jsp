<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
<title></title>
<link
	href="${pageContext.request.contextPath }/js/bstable/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/js/bstable/css/bootstrap-table.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/table.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/news.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/date/js/laydate.js"></script>

<link href="${pageContext.request.contextPath }/css/city-picker.css" rel="stylesheet" type="text/css" />

<script src="${pageContext.request.contextPath }/js/city-picker.data.js"></script>
<script src="${pageContext.request.contextPath }/js/city-picker.js"></script>
<script src="${pageContext.request.contextPath }/js/main.js"></script>


<style>
.table th {
	text-align: center;
}
</style>
</head>
<body
	style="background-color: #ecf0f5; font-family: 微软雅黑; color: #475059; min-width: 1000px; overflow: auto">
	<div>
	<div class="notice_check">
    
        <div class="l_left">
            <input type="text" class="find_input" id="find_input">

        </div>
        <button class="check_btn" id="select">查询</button>


        <div class="notice_nav r_right">
            <a class="btn btn-default" id="user_add_btn"><span class="glyphicon glyphicon-plus"></span>新增</a>
            <a class="btn btn-default" id="householder_del"><span class="glyphicon glyphicon-remove"></span>删除</a>
           	
        </div>       
    </div> 
    </div>
	<div class="docs-methods">
		<form class="form-inline ">
			<!-- <div id="distpicker"> city-picker-dropdown-->
				<div class="form-group">
					<div style="position: relative;"> 
						<input id="city-picker3" class="form-control" readonly type="text"
							value="广东省/汕头市/潮南区" data-toggle="city-picker">
					</div> 
				</div>
				<div class="form-group">
					<button class="btn btn-warning" id="reset" type="button">重置</button>
					<button class="btn btn-danger" id="destroy" type="button">确定</button>
				</div>
			<!-- </div> -->
		</form>
	</div> 

</body>

<script type="text/javascript">
//查询
$("#select").click(function(){
	var city_picker3 = $("#city-picker3").val();
	alert(city_picker3);
});



</script>


</html>
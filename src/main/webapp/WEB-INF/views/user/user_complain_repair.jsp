<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户报修/投诉</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>

</head>
<body
	style="background-image:url(${pageContext.request.contextPath }/img/lufei_aisi.jpg);
		background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
	<!-- 添加修改密码模态框-->
	<div class="modal fade" id="userRepairOrComplainModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">报修或投诉</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">报修/投诉:</label>
							<div class="col-sm-9">
								<textarea class="form-control" rows="3" name="content"
									id="content"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">上传图片</label>
							<div class="col-sm-9">
								<input type="file" accept="image/*" id="img_file" name="img_file">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">类型</label>
							<div class="col-md-3 ">
								<label class="radio-inline"> <input type="radio"
									name="type" id="type_repair" value="报修" checked> 报修
								</label> <label class="radio-inline"> <input type="radio"
									name="type" id="type_complain" value="投诉"> 投诉
								</label>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						id="save_btn">提交</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 导航条 -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#" style="color: green;">用户报修/投诉</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a role="button" id="user_repair">报修信息<span
							class="sr-only">(current)</span></a></li>
					<li><a role="button" id="user_complaint">投诉信息</a></li>
					<li><a role="button" id="repair_or_complain">报修或投诉</a></li>
				</ul>
				<form id="selectForm" class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" id="user_find_water" class="form-control"
							placeholder="输入日期查询">
					</div>
					<button type="button" id="user_find_btn" class="btn btn-default">查询</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${ sessionScope.user != null }">
						<li><a href="#">${ sessionScope.user.user_name }</a></li>
					</c:if>
					<c:if test="${ sessionScope.user==null }">
						<li><a href="../index/login">你好，请登录</a></li>
					</c:if>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">菜单 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="../userCentre/userInfo">个人中心</a></li>
							<li><a href="express">我的快递</a></li>
							<li><a href="user_water_elec">水电查询</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="logout">退出登录</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- 用户报修/投诉信息 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="water_elec">
					<thead>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6" id="page_info_area"></div>
			<div class="col-md-6" id="page_nav_area"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
	//点击 报修或投诉按钮出现模态框
	$("#repair_or_complain").click(function() {
		$("#userRepairOrComplainModal").modal({
			backdrop : "static"
		});
	});
	//保存
	$("#save_btn").click(function() {
        var formdata=new FormData();
        var content = $("#content").val();
        var type = $("input[name='type']:checked").val();
        formdata.append("file",$("#img_file").get(0).files[0]);
        formdata.append("content",content);
        formdata.append("type",type);
		 $.ajax({
			url:"addComplain_reapir",
			type:"POST",
			data:formdata,
			cache: false,  
	        processData: false,  
	        contentType: false,
			success:function(result){
				
			}
		});
	});
</script>
</html>
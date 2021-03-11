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
	<!-- 添加发布报修/投诉模态框-->
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
									id="content" placeholder="添加描述，不得超过500字"></textarea>
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
	<!-- 查看内容模态框-->
	<div class="modal fade bs-example-modal-lg" id="checkContentModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  		<div class="modal-dialog modal-lg" role="document">
    		<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">报修或投诉</h4>
				</div>
				<div class="modal-body">
					<div class="row">
  						<div id="content_check" class="col-md-6" style="font-size:20px;color:blue"></div>
  						<div class="col-md-6"><img id="user_img" alt="-------无图片-------"  height="250" width="400"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
					<li><a role="button" id="user_repair">报修查询<span
							class="sr-only">(current)</span></a></li>
					<li><a role="button" id="user_complaint">投诉查询</a></li>
					<li><a role="button" id="repair_or_complain">报修或投诉</a></li>
				</ul>
				<form id="selectForm" class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" id="find_shuidian_input" class="form-control"
							placeholder="输入日期查询">
					</div>
					<button type="button" id="user_find_shuidian" class="btn btn-default">查询</button>
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
			<div class="col-md-8">
				<table class="table table-hover" id="repair_complain">
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
var currentPage;//当前页
var pages;//总页数
//定义全局路径变量
var urlPath = "";
//跳转到指定的页码号
function to_page(url, pn) {
	var user_find_shuidian = $("#find_shuidian_input").val();
	$.ajax({
		url : url,
		data : {
			'pn' : pn,
			'content' : user_find_shuidian
		},
		type : "GET",
		success : function(result) {
			if (result.code == 100) {
				//解析并显示用户数据
				build_user_table(result);
				//解析显示分页信息
				build_page_info(result)
				//解析显示分页条
				build_page_nav(result);
				currentPage = result.extend.pageInfo.pageNum;
				pages = result.extend.pageInfo.pages;
			} if(result.code==300){
				alert(result.msg);
				window.location.href="../index/login";
			}
		}
	});
}

function build_user_table(result) {
	//清空table表格
	$("#repair_complain tbody").empty();
	$("#repair_complain thead").empty();
	if (result.extend.pageInfo.total == 0) {
		$("<tr></tr>").append("<th>暂无报修/投诉记录！</th>").appendTo(
				"#repair_complain thead");
		return;
	}

	$("<tr></tr>").append("<th>编号</th>").append(
			"<th>用户</th>").append("<th>发布时间</th>")
			.append("<th>类型</th>").append("<th>受理状态</th>").appendTo(
					"#repair_complain thead");

	var repair_complain = result.extend.pageInfo.list;
	$.each(
			repair_complain,
					function(index, item) {
						var id = $("<td></td>").append(item.id);
						var user_name = $("<td></td>").append(
								item.user_name);
						var date = $("<td></td>").append(
								item.date);
						var type = $("<td></td>").append(
								item.type);
						if(item.type == "报修"){
							type.attr("style","color:#6633cc");
						}
						else{
							type.attr("style","color:red");
						}
						var state = $("<td></td>").append(item.state);
						if (item.state == 0) {
							state = $("<td>待处理</td>").attr("style",
									"color:#871F78");
						} else {
							state = $("<td>已受理</td>").attr("style",
									"color:blue");
						}
						
						
						var check = $("<button></button>").addClass(
							"btn btn-primary btn-sm check_btn").append("查看");
							//为按钮添加一个自定义的属性，来表示当前用户的account
						check.attr("id",item.id);
						var del = $("<button></button>").addClass(
						"btn btn-danger btn-sm del_btn").append("删除");
						del.attr("id",item.id);
						
						var btnTd = $("<td></td>").append(check).append("  ").append(del);

						$("<tr></tr>").append(id)
								.append(user_name).append(date)
								.append(type).append(state).append(btnTd).appendTo(
										"#repair_complain tbody");
					});
}
//解析显示分页信息
function build_page_info(result) {
	$("#page_info_area").empty();
	$("#page_info_area").append(
			"当前第" + result.extend.pageInfo.pageNum + "页，总共"
					+ result.extend.pageInfo.pages + "页,总共"
					+ result.extend.pageInfo.total + "条记录");
}
//解析显示分页条
function build_page_nav(result) {
	$("#page_nav_area").empty();
	var ul = $("<ul></ul>").addClass("pagination");
	//构建元素
	var firstPageLi = $("<li></li>").append(
			$("<a></a>").append("首页").attr("href", "#"));
	var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
	if (result.extend.pageInfo.hasPreviousPage == false) {
		firstPageLi.addClass("disabled");
		prePageLi.addClass("disabled");
	} else {
		firstPageLi.click(function() {
			to_page(urlPath, 1);
		});
		prePageLi.click(function() {
			to_page(urlPath, result.extend.pageInfo.pageNum - 1);
		});
	}
	//为元素添加翻页事件

	var nextLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
	var lastPageLi = $("<li></li>").append(
			$("<a></a>").append("尾页").attr("href", "#"));
	if (result.extend.pageInfo.hasNextPage == false) {
		nextLi.addClass("disabled");
		lastPageLi.addClass("disabled");
	} else {
		nextLi.click(function() {
			to_page(urlPath, result.extend.pageInfo.pageNum + 1);
		});
		lastPageLi.click(function() {
			to_page(urlPath, result.extend.pageInfo.pages);
		});
	}

	//添加首页和前一页的提示
	ul.append(firstPageLi).append(prePageLi);

	$.each(result.extend.pageInfo.navigatepageNums, function(index, item) {

		var numLi = $("<li></li>").append($("<a></a>").append(item));
		if (result.extend.pageInfo.pageNum == item) {
			numLi.addClass("active");
		}
		numLi.click(function() {
			to_page(urlPath, item);
		});
		ul.append(numLi);
	});
	//添加下一页和末页的提示
	ul.append(nextLi).append(lastPageLi);
	//把ul加入到nav中
	var navEle = $("<nav></nav>").append(ul);
	navEle.appendTo("#page_nav_area");
}


	//点击 报修或投诉按钮出现模态框
	$("#repair_or_complain").click(function() {
		$("#userRepairOrComplainModal form")[0].reset();
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
				if(result.code == 200){
					alert("内容不能为空！");
					return;
				}
				
				alert(result.msg);
				$("#userRepairOrComplainModal").modal("hide");
				if(type == "报修"){
					to_page("user_repair_select",1);
				}else if(type == "投诉"){
					to_page("user_complaint_select",1);
				}
			}
		});
	});
	//查看报修
	$("#user_repair").click(function() {
		urlPath="user_repair_select";
		to_page(urlPath, 1);
	});
	//查看投诉
	$("#user_complaint").click(function() {
		urlPath="user_complaint_select";
		to_page(urlPath, 1);
	});
	//查看内容
	$(document).on("click",".check_btn",function(){
		var id = $(this).attr("id");
		 $.ajax({
				url:"userCheck_Complain_reapir",
				data : {
					'id' : id
				},
				type:"GET",
				success:function(result){
					//内容
					$("#content_check").text(result.extend.Complain_reapir.content);
					//图片
					if(result.extend.Complain_reapir.img_path == "no_picture"){
						$("#user_img").removeAttr("src");
					}else{
					var img = "/img/"+result.extend.Complain_reapir.img_path
					$("#user_img").attr("src",img);
					}
					$("#checkContentModal").modal({
						backdrop : "static"
					});
				}
			});
	});
	//删除记录
	$(document).on("click",".del_btn",function(){
		var bianhao = $(this).attr("id");
		if(confirm("确认删除编号为【"+bianhao+"】的记录吗？")){	
		 $.ajax({
				url:"userDelete_Complain_reapir",
				data : {
					_method:"DELETE", // 将请求转变为DELETE请求(delete携带data处理)
					'id' : bianhao
				},
				type:"POST",
				success:function(result){
					if(result.code==300){
						alert(result.msg);
						window.location.href="../index/login";
					}
					if(result.code==100){
						alert("删除成功！");
						to_page(urlPath,currentPage);
					}
				}
			});
		}
	});
	//按条件查找
	$("#user_find_shuidian").click(function() {
		 urlPath = "user_find_shuidian";
		to_page(urlPath, 1);
	});
</script>
</html>
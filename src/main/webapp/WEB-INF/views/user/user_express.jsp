<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的快递</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>

</head>
<body style="background-image:url(${pageContext.request.contextPath }/img/lufei_aisi.jpg);
		background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
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
				<a class="navbar-brand" href="#" style="color: green;margin-top:10px">我的快递</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<form id="selectForm" class="navbar-form navbar-left">
				<ul class="nav navbar-nav">
					<li><a role="button" id="myExpress">我的待取快递 <span
							class="sr-only">(current)</span></a></li>
					<li><a role="button" id="allExpress">所有快递</a></li>
					<li><select name="year" class="btn btn-default " >
							<option value=""></option>
							<option value="2018">2018年</option>
							<option value="2019">2019年</option>
							<option value="2020">2020年</option>
							<option value="2021">2021年</option>
							<option value="2022">2022年</option>

					</select></li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li><select name="month" id="sel" class="btn btn-default ">
							<option value=""></option>
							<option value="01">1月</option>
							<option value="02">2月</option>
							<option value="03">3月</option>
							<option value="04">4月</option>
							<option value="05">5月</option>
							<option value="06">6月</option>
							<option value="07">7月</option>
							<option value="08">8月</option>
							<option value="09">9月</option>
							<option value="10">10月</option>
							<option value="11">11月</option>
							<option value="12">12月</option>
					</select></li>
				</ul>
				
					<div class="form-group">
						&nbsp;&nbsp;&nbsp;<input type="text" name="company" class="form-control" placeholder="快递公司" list = "data-list">
					<datalist id = "data-list">
        						<option>顺丰速运</option>
        						<option>韵达快递</option>
        						<option>圆通速递</option>
        						<option>申通快递</option>
        						<option>京东快递</option>
        						<option>中国邮政</option>
        						<option>百世快递</option>
        						<option>中通快递</option>
    							</datalist>
					</div>
					<button type="button"  class="btn btn-default" id="select_btn">查找</button>
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
							<li><a href="user_water_elec">水电查询</a></li>
							<li><a href="user_complain_repair">报修/投诉</a></li>
							<li><a href="user_statistics">统计</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="logout">退出登录</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 用户快递信息 -->
	<div class="container" >	
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover" id="user_Express">
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
	<script type="text/javascript">
	
	//定义全局路径变量
	var urlPath="";
	//跳转到指定的页码号(包含未取的，所有的请求)
	function to_page(url,pn){
		$.ajax({
			url:url,
			data:"pn="+pn,
			type:"GET",
			success:function(result){
				if(result.code==100){
				//解析并显示用户数据
				build_user_table(result);
				//解析显示分页信息
				build_page_info(result);
				//解析显示分页条
				build_page_nav(result);
				urlPath=url;
				}
				else if(result.code==300){
					alert(result.msg);
					window.location.href="../index/login";
				}
				else{
					alert(result.extend.noTaken);
				}
			}
		});
	}
	//按条件查询
	function condi_to_page(url,pn){
		$.ajax({
			url:url,
			data:$("#selectForm").serialize()+'&'+$.param({"pn":pn}),
			type:"GET",
			success:function(result){
				if(result.code==100){
					build_user_table(result);
					//解析显示分页信息
					build_page_info(result);
					//解析显示分页条
					build_page_nav_condition(result);
					urlPath=url;
				}
				else if(result.code==300){
					alert(result.msg);
					window.location.href="../index/login";
				}
				else{
					alert("查询为空！");
				}
			}
		});
		
	}	
		//查看未取快递
		$("#myExpress").click(function(){
			to_page("noTaken",1);
		});
		//查看所有快递
		$("#allExpress").click(function(){
			to_page("allExpress",1);
		});
		//按日期、快递公司查询
		$("#select_btn").click(function(){
			condi_to_page("alterSelect",1)
		});
		//构建快递列表
		function build_user_table(result){
			$("#user_Express tbody").empty();
			$("#user_Express thead").empty();
			if (result.extend.pageInfo.total == 0) {
				$("<tr></tr>").append("<th>暂无快递记录！</th>").appendTo(
						"#user_Express thead");
				return;
			}
			$("<tr></tr>").append("<th>快递编号</th>").append("<th>收货人</th>").append("<th>电话</th>")
			.append("<th>快递公司</th>").append("<th>快递柜</th>").append("<th>编号</th>")
			.append("<th>到达日期</th>").append("<th>取货码</th>").append("<th>取货状态</th>").appendTo("#user_Express thead");	
			var express = result.extend.pageInfo.list;
			$.each(express, function(index, item) {				
				var expressId = $("<td></td>").append(item.id);
				var userName = $("<td></td>").append(item.username);
				var userTel = $("<td></td>").append(item.user_tel);
				var company = $("<td></td>").append(item.express_company);
				var case_name = $("<td></td>").append(item.case_name).attr("style","color:blue");
				var case_num = $("<td></td>").append(item.case_num).attr("style","color:blue");
				var arrive = $("<td></td>").append(item.arrive);
				var code = $("<td></td>").append(item.code).attr("style","color:green");
				if(item.flag==1){
					var flag = $("<td>未取</td>").attr("style","color:red");
				}
				else{
					var flag = $("<td>已取</td>").attr("style","color:green");
				}
				$("<tr></tr>").append(expressId).append(userName)
						.append(userTel).append(company).append(case_name)
						.append(case_num).append(arrive).append(code).append(flag)
						.appendTo("#user_Express tbody");
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
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				firstPageLi.click(function() {
					to_page(urlPath,1);
				});
				prePageLi.click(function() {
					to_page(urlPath,result.extend.pageInfo.pageNum - 1);
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
					to_page(urlPath,result.extend.pageInfo.pageNum + 1);
				});
				lastPageLi.click(function() {
					to_page(urlPath,result.extend.pageInfo.pages);
				});
			}

			//添加首页和前一页的提示
			ul.append(firstPageLi).append(prePageLi);			
			//设置点击效果
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {

				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(urlPath,item);
				});
				ul.append(numLi);
			});
			//添加下一页和末页的提示
			ul.append(nextLi).append(lastPageLi);
			//把ul加入到nav中
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		//分页条(按条件查询)
		function build_page_nav_condition(result){
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			//构建元素
			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				firstPageLi.click(function() {
					condi_to_page(urlPath,1);
				});
				prePageLi.click(function() {
					condi_to_page(urlPath,result.extend.pageInfo.pageNum - 1);
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
					condi_to_page(urlPath,result.extend.pageInfo.pageNum + 1);
				});
				lastPageLi.click(function() {
					condi_to_page(urlPath,result.extend.pageInfo.pages);
				});
			}

			//添加首页和前一页的提示
			ul.append(firstPageLi).append(prePageLi);			
			//设置点击效果
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {

				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					condi_to_page(urlPath,item);
				});
				ul.append(numLi);
			});
			//添加下一页和末页的提示
			ul.append(nextLi).append(lastPageLi);
			//把ul加入到nav中
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		
	</script>
</body>
</html>
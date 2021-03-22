<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户水电查询</title>
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
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#" style="color: green; ">水电查询</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a role="button" id="select_water">待缴费单<span class="sr-only">(current)</span></a></li>
        <li><a role="button" id="myAllWater">全部收费单</a></li>
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" id ="user_find_water" class="form-control" placeholder="输入日期查询">
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
							<li><a href="user_complain_repair">报修/投诉</a></li>
							<li><a href="user_statistics">统计</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="logout">退出登录</a></li>
						</ul></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
	<!-- 用户水电收费信息 -->
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
	//页面加载完成以后，直接去发送一个ajax请求，要到分页数据
	var currentPage;//当前页
	var pages;//总页数
	var lastPage;//最后一页
	//定义全局路径变量
	var urlPath = "";
	var user_id = ${sessionScope.user.user_id};
	$(function() {
		urlPath = "select_water";
		//去首页
		to_page(urlPath, 1);
	})
	//跳转到指定的页码号
	function to_page(url, pn) {
		var find_input = $("#user_find_water").val();
		$.ajax({
			url : url,
			data : {
				'user_id' : user_id,
				'pn' : pn,
				'content' : find_input
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
		$("#water_elec tbody").empty();
		$("#water_elec thead").empty();
		if (result.extend.pageInfo.total == 0) {
			$("<tr></tr>").append("<th>暂无待交水电收费记录！</th>").appendTo(
					"#water_elec thead");
			return;
		}

		$("<tr></tr>").append("<th>编号</th>").append(
				"<th>用户名</th>").append("<th>楼牌号</th>")
				.append("<th>用水量(t)</th>").append("<th>水费(元)</th>").append(
						"<th>用电量(kW·h)</th>").append("<th>电费(元)</th>").append(
						"<th>物业费(元)</th>").append("<th>总计(元)</th>").append(
						"<th>开始日期</th>").append("<th>结算日期</th>").append(
						"<th>缴费情况</th>").appendTo(
						"#water_elec thead");

		var water_elec = result.extend.pageInfo.list;
		$.each(
						water_elec,
						function(index, item) {
							var id = $("<td></td>").append(item.id);
							var householder_name = $("<td></td>").append(
									item.householder_name);
							var loupaihao = $("<td></td>").append(
									item.loupaihao);
							var water = $("<td></td>").attr("style",
									"background-color:yellow").append(
									item.water);
							var water_cost = $("<td></td>").attr("style",
									"background-color:pink").append(
									item.water_cost);
							var electricity = $("<td></td>").attr("style",
									"background-color:yellow").append(
									item.electricity);
							var electricity_cost = $("<td></td>").attr("style",
									"background-color:pink").append(
									item.electricity_cost);
							var property_fee = $("<td></td>").attr("style",
									"background-color:#87CEFA").append(
									item.property_fee);
							var total_fee = $("<td></td>").attr("style",
									"background-color:#FA8072").append(
									item.total_fee);
							var star_date = $("<td></td>").append(
									item.star_date);
							var end_date = $("<td></td>").append(item.end_date);
							if (item.is_pay == 1) {
								var is_pay = $("<td>已缴费</td>").attr("style",
										"color:green");
								var pay_btn = $("<td></td>");
							} else {
								var is_pay = $("<td>未缴费</td>").attr("style",
										"color:red");
								var pay_btn = $("<button></button>").addClass(
								"btn btn-primary btn-sm pay_btn").append("支付");
								//为按钮添加一个自定义的属性，来表示当前用户的account
								pay_btn.attr("btn_user_id",item.id);
							}
							
							
							/* var editBtn = $("<button></button>").addClass(
									"btn btn-primary btn-sm edit_btn").append(
									"编辑");
							var btnTd = $("<td></td>").append(editBtn); */

							$("<tr></tr>").append(id)
									.append(householder_name).append(loupaihao)
									.append(water).append(water_cost).append(
											electricity).append(
											electricity_cost).append(
											property_fee).append(total_fee)
									.append(star_date).append(end_date).append(
											is_pay).append(pay_btn).appendTo(
											"#water_elec tbody");
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
	//查询未支付
	$("#select_water").click(function() {
		urlPath = "select_water";
		to_page(urlPath, 1);
	});
	//查询所有
	$("#myAllWater").click(function() {
		urlPath = "myAllWater";
		to_page(urlPath, 1);
	});
	//按条件查找
	$("#user_find_btn").click(function() {
		urlPath = "user_find_water";
		to_page(urlPath, 1);
	});
	//“支付”按钮点击
	$(document).on("click", ".pay_btn", function() {
		id = $(this).attr("btn_user_id");
		$.ajax({
			url : "pay_water",
			data:{'user_id' : user_id,
				  'id' : id
				},
			type : "PUT",
			success : function(result) {
				if (result.code == 100) {
					alert("支付成功");
					to_page(urlPath, currentPage);
				}
				if(result.code==300){
					alert(result.msg);
					window.location.href="../index/login";
				}
			}
		});
	});
</script>
</html>
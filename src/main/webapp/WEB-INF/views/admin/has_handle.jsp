<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<style>
.table th {
	text-align: center;
}
</style>
</head>
<body
	style="background-color: #ecf0f5; font-family: 微软雅黑; color: #475059; min-width: 1000px; overflow: auto">

	<!-- 查看内容模态框-->
	<div class="modal fade bs-example-modal-lg" id="checkContentModal"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
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
					<div class = "row">
						<div id="content_check" class="col-md-6"
							style="font-size: 20px; color: blue"></div>
						<div class="col-md-6">
							<img id="user_img" alt="-------无图片-------" height="250"
								width="400">
						</div>
					</div>
					<div class="row">
						<label for="inputEmail3" class="col-sm-2 control-label">处理结果：</label>
						<div id="check_reply" class="col-md-10"
							style="font-size: 20px; color: green"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div>
		<h4>已受理报修/投诉问题</h4>

		<div class="notice_check">

			<div class="l_left">
				<input type="text" class="find_input" id="find_input" placeholder="输入文本查询">
			</div>
			<button class="check_btn" id="select">查询</button>
		</div>
	</div>
	<!-- 用户报修/投诉信息 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover table-striped" id="repair_complain">
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
	$(function() {
		urlPath = "admin_has_handle";
		//去首页
		to_page(urlPath, 1);
	})
	//跳转到指定的页码号
	function to_page(url, pn) {
		var admin_find_input = $("#find_input").val();
		$.ajax({
			url : url,
			data : {
				'pn' : pn,
				'content' : admin_find_input
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
				}
				if (result.code == 300) {
					alert(result.msg);
				}
			}
		});
	}

	function build_user_table(result) {
		//清空table表格
		$("#repair_complain tbody").empty();
		$("#repair_complain thead").empty();
		if (result.extend.pageInfo.total == 0) {
			$("<tr></tr>").append("<th>暂无待报修/投诉记录！</th>").appendTo(
					"#repair_complain thead");
			return;
		}

		$("<tr></tr>").append("<th>编号</th>").append("<th>用户</th>")
		.append("<th>电话</th>").append("<th>发布时间</th>")
		.append("<th>类型</th>").append("<th>受理状态</th>").append("<th></th>").appendTo(
				"#repair_complain thead");

		var repair_complain = result.extend.pageInfo.list;
		$.each(repair_complain, function(index, item) {
			var id = $("<td></td>").append(item.id);
			var user_name = $("<td></td>").append(item.user_name);
			var tel = $("<td></td>").append(item.tel);
			var date = $("<td></td>").append(item.date);
			var type = $("<td></td>").append(item.type);
			if (item.type == "报修") {
				type.attr("style", "color:#6633cc");
			} else {
				type.attr("style", "color:red");
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
					"btn btn-primary btn-sm admin_check_btn").append("查看");
			//为按钮添加一个自定义的属性，来表示当前用户的account
			check.attr("id", item.id);
			var shouli = $("<td></td>");
			if (item.state == 0) {
				shouli = $("<button></button>").addClass(
				"btn btn-success btn-sm shouli").append("受理");
				shouli.attr("id", item.id);
			}
			
			
			var btnTd = $("<td></td>").append(check).append("    ").append(shouli);

			$("<tr></tr>").append(id).append(user_name).append(tel).append(date)
			.append(type).append(state).append(btnTd).appendTo("#repair_complain tbody");
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

	//查看内容
	$(document)
			.on(
					"click",
					".admin_check_btn",
					function() {
						var id = $(this).attr("id");
						$
								.ajax({
									url : "../user/userCheck_Complain_reapir",
									data : {
										'id' : id
									},
									type : "GET",
									success : function(result) {
										//内容
										$("#content_check")
												.text(
														result.extend.Complain_reapir.content);
										//处理结果
										$("#check_reply")
												.text(
														result.extend.Complain_reapir.reply);
										//图片
										if (result.extend.Complain_reapir.img_path == "no_picture") {
											$("#user_img").removeAttr("src");
										} else {
											var img = "/img/"
													+ result.extend.Complain_reapir.img_path
											$("#user_img").attr("src", img);
										}
										$("#checkContentModal").modal({
											backdrop : "static"
										});
									}
								});
					});
	//按条件查找
	$("#select").click(function() {
		urlPath = "admin_find_has_handle";
		to_page(urlPath, 1);
	});

</script>
</html>
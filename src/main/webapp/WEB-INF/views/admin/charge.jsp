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

</head>
<body
	style="background-color: #ecf0f5; font-family: 微软雅黑; color: #475059; min-width: 1000px; overflow: auto">

	<!-- 新增水电收费的模态款 -->
	<div class="modal fade " id="priceAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog " role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">新增收费单</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">开始日期</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" name="star_date"
									id="star_date">
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">结算日期</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" name="end_date"
									id="end_date">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">用水量(吨)</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" name="water" id="water">
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">用电量(度)</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" name="electricity"
									id="electricity">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">物业费</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" name="property_fee"
									id="property_fee">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="price_update_btn">修改</button>
				</div>
			</div>
		</div>
	</div>

	<div class="notice_check">

		<div class="l_left">
			<input type="text" class="find_input" id="find_input">

		</div>
		<button class="check_btn" id="select">查询</button>


		<div class="notice_nav r_right">
			<a class="btn btn-default" id="water_add_btn"><span
				class="glyphicon glyphicon-plus"></span>新增</a> <a
				class="btn btn-default" id="water_del"><span
				class="glyphicon glyphicon-remove"></span>删除</a>

		</div>
	</div>
	<!-- 用户水电收费信息 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover table-striped" id="water_elec">
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
	var flag;//条件查询或全部查询标志
	//定义全局路径变量
	var urlPath = "";
	var user_id = ${sessionScope.user_id};
	$(function() {
		urlPath = "select_water";
		//去首页
		to_page(urlPath, 1);
	})
	//跳转到指定的页码号
	function to_page(url, pn) {
		$.ajax({
			url : url,
			data : {
				'user_id' : user_id,
				'pn' : pn
			},
			type : "GET",
			success : function(result) {
				if (result.code == 100) {
					//解析并显示用户数据
					build_user_table(result);
					//解析显示分页信息
					build_page_info(result);
					//解析显示分页条
					build_page_nav(result, flag);
					currentPage = result.extend.pageInfo.pageNum;
					pages = result.extend.pageInfo.pages;
				} else {
					alert(result.msg);
				}
			}
		});
	}

	function build_user_table(result) {
		if (result.extend.pageInfo.total == 0) {
			$("<tr></tr>").append("<th>该用户暂无水电收费记录！</th>").appendTo(
					"#water_elec thead");
			return;
		}
		//清空table表格
		$("#water_elec tbody").empty();
		$("#water_elec thead").empty();
		$("<tr></tr>").append("<th></th>").append("<th>编号</th>").append(
				"<th>用户名</th>").append("<th>楼牌号</th>")
				.append("<th>用水量(t)</th>").append("<th>水费(元)</th>").append(
						"<th>用电量(kW·h)</th>").append("<th>电费(元)</th>").append(
						"<th>物业费(元)</th>").append("<th>总计(元)</th>").append(
						"<th>开始日期</th>").append("<th>结算日期</th>").append(
						"<th>缴费情况</th>").append("<th></th>").appendTo(
						"#water_elec thead");

		var water_elec = result.extend.pageInfo.list;
		$
				.each(
						water_elec,
						function(index, item) {
							var checkBoxTd = $("<td></td>")
									.append(
											"<input type='checkbox' class='check_item'/>");
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
							} else {
								var is_pay = $("<td>未缴费</td>").attr("style",
										"color:red");
							}
							//var editBtn = $("<button></button>").addClass(
							//		"btn btn-primary btn-sm edit_btn").append("编辑");
							//为编辑按钮添加一个自定义的属性，来表示当前用户的account
							//editBtn.attr("edit-account",item.account);
							var editBtn = $("<button></button>").addClass(
									"btn btn-primary btn-sm edit_btn").append(
									"编辑");
							var btnTd = $("<td></td>").append(editBtn);

							$("<tr></tr>").append(checkBoxTd).append(id)
									.append(householder_name).append(loupaihao)
									.append(water).append(water_cost).append(
											electricity).append(
											electricity_cost).append(
											property_fee).append(total_fee)
									.append(star_date).append(end_date).append(
											is_pay).append(btnTd).appendTo(
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
	//“新增”按钮点击后出现模态框
	$("#water_add_btn").click(function() {
		//清除表单数据（表单重置）
		$("#priceAddModal form")[0].reset();
		$("#priceAddModal").modal({
			backdrop : "static"
		});
	});
	//保存按钮点击事件,添加用户信息
	$("#price_update_btn").click(function() {
		//模态框中填写的表单数据提交给服务器进行保存
		$.ajax({
			url : "addWater_elec",
			type : "POST",
			data : $("#priceAddModal form").serialize()+'&'+$.param({"user_id":user_id}),
			success : function(result) {
				if (result.code == 300) {
					alert(result.msg);
					$("#priceAddModal").modal("hide");
					return;
				}
				if (result.code == 100) {
					alert(result.msg);
					$("#priceAddModal").modal("hide");
					to_page(urlPath,pages);
					return;
				}
			}
		});

	});
	
	
	
	//选择时间
	!function() {
		laydate({
			elem : '#star_date'
		});
		laydate({
			elem : '#end_date'
		});
	}();
</script>


</html>
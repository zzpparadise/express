<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
<title>多个用户水电查询</title>
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

	
	<div class="notice_check">
		<h4>水电收费管理</h4>
		<div class="l_left">
			<input type="text" class="find_input" id="find_input" placeholder="根据结算日期查找">

		</div>
		<button class="check_btn" id="select">查询</button>


		<div class="notice_nav r_right">
			<a class="btn btn-default" id="water_add_btn"><span
				class="glyphicon glyphicon-plus"></span>新增</a> <a
				class="btn btn-default" id="water_del"><span
				class="glyphicon glyphicon-remove"></span>删除</a>

		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover table-bordered" id="user_table">
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
		//页面加载完成以后，直接去发送一个ajax请求，要到分页数据
		var currentPage;//当前页
		var pages;//总页数
		var flag;//条件查询或全部查询标志
		$(function() {
			flag = 1;
			//去首页
			to_page(1, 1);
		})

		//跳转到指定的页码号
		function to_page(pn, flag) {
			flag = 1;
			$.ajax({
				url : "manageUsers",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					if (result.code == 100) {
						//解析并显示用户数据
						build_user_table(result);
						//解析显示分页信息
						build_page_info(result);
						//解析显示分页条
						build_page_nav(result, flag);
						currentPage = result.extend.pageInfo.pageNum;//保存当前页码
						pages = result.extend.pageInfo.pages;
					} else {
						alert(result.msg);
					}
				}
			});
		}
		//解析并显示用户数据
		function build_user_table(result) {
			//清空table表格
			$("#user_table tbody").empty();
			var user = result.extend.pageInfo.list;
			var tr = $("<tr></tr>");
			$.each(user, function(index, item) {	
				var user_id = $("<td></td>").append(
						item.user_id);
				var householder_name = $("<td></td>").append(item.householder_name);
				var loupaihao = $("<td></td>").append(item.loupaihao);
			
				var editBtn = $("<button></button>").addClass(
						"btn btn-primary btn-sm edit_btn").append("录入");				
				//为录入按钮添加一个自定义的属性，来表示当前用户的id
				editBtn.attr("user-id", item.user_id);				
				var btnTd = $("<td></td>").append(editBtn);
				
				tr.append(user_id).append(householder_name)
						.append(loupaihao).append(editBtn);
				//最后一页且记录小于等于4
				if((result.extend.pageInfo.size != 10) && result.extend.pageInfo.size <= 3){
					if(index == result.extend.pageInfo.size-1){
						tr.appendTo("#user_table tbody");
						tr = $("<tr></tr>");
					}
					
				}//最后一页且记录大于4
				if((result.extend.pageInfo.size != 10) && result.extend.pageInfo.size%3!=0){
					if( (index+1)%3==0 || (index == result.extend.pageInfo.size-1) ){
						tr.appendTo("#user_table tbody");
						tr = $("<tr></tr>");
					}
					
				}
				
				//不是最后一页
				else if( (index+1)%3==0 || index == 9){
					tr.appendTo("#user_table tbody");
					tr = $("<tr></tr>");
				}
						
						/* .appendTo(
								"#user_table tbody"); */
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
		function build_page_nav(result, flag) {
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
					switch_select(1, flag);
				});
				prePageLi.click(function() {
					switch_select(result.extend.pageInfo.pageNum - 1, flag);

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
					switch_select(result.extend.pageInfo.pageNum + 1, flag);
				});
				lastPageLi.click(function() {
					switch_select(result.extend.pageInfo.pages, flag);
				});
			}

			//添加首页和前一页的提示
			ul.append(firstPageLi).append(prePageLi);

			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {

				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					switch_select(item, flag);
				});
				ul.append(numLi);
			});
			//添加下一页和末页的提示
			ul.append(nextLi).append(lastPageLi);
			//把ul加入到nav中
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		//条件查询或全部查询对应函数
		function switch_select(data, flag) {
			if (flag == 1) {
				to_page(data, 1);
			}
			if (flag == 2) {
				to_page_select(data, 2);
			}
		}

</script>


</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="utf-8" />
    <title></title>
    <link href="${pageContext.request.contextPath }/js/bstable/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/js/bstable/css/bootstrap-table.css" rel="stylesheet" type="text/css">   
    <link href="${pageContext.request.contextPath }/css/table.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/css/news.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
	<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/date/js/laydate.js"></script>
</head>
<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto">
<div class="news_main">
	<!-- 添加用户的模态款 -->
	<div class="modal fade" id="userAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增快递信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
					
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">手机号</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" name="user_tel" id="user_tel_add"
									placeholder="输入手机号">
								
							</div>
						</div>
						
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">到达时间</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" name="arrive" id="arrive_add">			
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">快递公司</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" name="express_company" id="express_company_add"
									placeholder="address">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">快递柜</label>
							<div class="col-sm-2">
							<input type="email" class="form-control" name="case_name" id="case_name_add">
							</div>
							<div class="col-sm-2">
							<input type="email" class="form-control" name="case_num" id="case_num_add">
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="user_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>




<div >
    <h6>待取快递列表</h6>

    <div class="notice_check">
    
        <div class="l_left">
            <input type="text" class="find_input">

        </div>
        <button class="check_btn">查询</button>


        <div class="notice_nav r_right">
            <a class="btn btn-default" id="user_add_modal_btn"><span class="glyphicon glyphicon-plus"></span>新增</a>
            <a class="btn btn-default" id="express_del"><span class="glyphicon glyphicon-remove"></span>删除</a>
           	
        </div>       
    </div>  
</div>

<div class="container">
<div class="row">
				<div class="col-md-12">
					<table class="table table-hover" id="user_table">
						<thead>
							<tr><th><input type="checkbox" id="check_all"/></th>
								<th>编号</th>
								<th>用户名</th>
								<th>手机号</th>
								<th>快递柜</th>
								<th>到达日期</th>
								<th>快递公司</th>
								<th>取货码</th>
								<th>操作</th>
							</tr>
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
</div>
<script type="text/javascript">
//页面加载完成以后，直接去发送一个ajax请求，要到分页数据
	var currentPage;//当前页
	var pages;//总页数
		$(function() {
		//去首页
		to_page(1);
		})
		//跳转到指定的页码号
		function to_page(pn) {
			$.ajax({
				url : "allUser",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//解析并显示用户数据
					build_user_table(result);
					//解析显示分页信息
					build_page_info(result);
					//解析显示分页条
					build_page_nav(result);
					currentPage=result.extend.pageInfo.pageNum;
					pages=result.extend.pageInfo.pages;
				}
			});
		}
	
		function build_user_table(result) {
			//清空table表格
			$("#user_table tbody").empty();
			var user = result.extend.pageInfo.list;
			$.each(user, function(index, item) {
				var checkBoxTd=$("<td></td>").append("<input type='checkbox' class='check_item'/>");
				var expressId = $("<td></td>").append(item.id);
				var userName = $("<td></td>").append(item.username);
				var userTel = $("<td></td>").append(item.user_tel);
				var case_name= $("<td></td>").append(item.case_name+item.case_num);
				var arrive = $("<td></td>").append(item.arrive);
				var express_company = $("<td></td>").append(item.express_company);
				var code = $("<td></td>").append(item.code);
				var editBtn = $("<button></button>").addClass(
						"btn btn-primary btn-sm edit_btn").append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前用户的account
				editBtn.attr("edit-account",item.account);
				var delBtn = $("<button></button>").addClass(
						"btn btn-success btn-sm del_btn").append("确认收货");
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(
						delBtn);

				$("<tr></tr>").append(checkBoxTd).append(expressId)
						.append(userName).append(userTel).append(case_name)
						.append(arrive).append(express_company).append(code).append(
						btnTd).appendTo("#user_table tbody");
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
					to_page(1);
				});
				prePageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum - 1);
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
					to_page(result.extend.pageInfo.pageNum + 1);
				});
				lastPageLi.click(function() {
					to_page(result.extend.pageInfo.pages);
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
					to_page(item);
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
		$("#user_add_modal_btn").click(function() {
			//清除表单数据（表单重置）
			$("#userAddModal form")[0].reset();
			$("#userAddModal").modal({
				backdrop : "static"
			});
		});
		//保存按钮点击事件,添加用户信息
		$("#user_save_btn").click(function(){						
			//模态框中填写的表单数据提交给服务器进行保存
			$.ajax({
					  url:"addExpress",
					  type:"POST",
					  data:$("#userAddModal form").serialize(),
					  success:function(result){
						  alert(result.msg);
						  if(result.code == 100){
							  $("#userAddModal").modal("hide");
							  to_page(pages);
						  }
						  else{
							  alert(result.extend.user_null);
							  $("#userAddModal").modal("hide");
							  to_page(currentPage);
						  }
												  						  						  
					  }
				  });
			
		});
		
		//确认收货
		$(document).on("click",".del_btn",function(){
			var num=$(this).parents("tr").find("td:eq(1)").text();
			if(confirm("确认快递编号【"+num+"】已经收货吗")){
				$.ajax({
					url:"expressConfirm/"+num,
					type:"PUT",
					success:function(result){
						to_page(currentPage);
					}
				});
			}
		});
		//单击全选框，完成全选
		$("#check_all").click(function(){
			//atrr获取checked是undefined;attr获取自定义属性的值，prop可以获取dom原生属性的值
			//alert($(this).prop("checked"));
			$(".check_item").prop("checked",$(this).prop("checked"));						
		});
		//全选框下的框都选中后也自动勾上
		$(document).on("click",".check_item",function(){
			//判断当前选中的元素是否为5个,:check作用：匹配所有选中的被选中元素，复选框，单选框等，不包括select中的option
			var flag=$(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flag);
		})
		//点击删除，删除勾选的快递
		$("#express_del").click(function(){
			var nums="";
			$.each($(".check_item:checked"),function(){
				nums+=$(this).parents("tr").find("td:eq(1)").text()+",";
			})
			//去除多余的","
			nums=nums.substring(0,nums.length-1);//截取字符串
			if($(".check_item:checked").length<1)
				confirm("未选中任何删除的快递!");
			else{
				if(confirm("确认删除快递【"+nums+"】吗？")){
				//发送ajax删除多个用户
				$.ajax({
					url:"expressDel/"+nums,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						to_page(currentPage);
					}
				});
				}
			}
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//选择时间
		 !function(){
		        laydate.skin('danlan');
		        laydate({elem: '#arrive_add'});
		    }();
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
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
	<style>
		.table th{
		text-align: center; 
		}
	</style>
</head>
<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto">
	<!-- 编辑用户信息的模态框 -->
	<div class="modal fade" id="userEditModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改户主个人信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
					
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" name="householder_name" id="householder_name">
								
							</div>
						<label for="inputEmail3" class="col-sm-2 control-label">性别</label>
						<label class="radio-inline"> <input type="radio"
							name="user_sex" id="man_update" value="男" >
							男
						</label> <label class="radio-inline"> <input type="radio"
							name="user_sex" id="woman_update" value="女">
							女
						</label>
						</div>						
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">身份证号</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" name="user_idnumber" id="user_idnumber">			
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">户籍</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" name="hokou_address" id="hokou_address">			
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">入住时间</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" name="live_date" id="live_date">			
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">户型</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" name="house_type" id="house_type">			
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">面积(m²)</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" name="area" id="area">			
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">楼牌号</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" name="loupaihao" id="loupaihao">			
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">联系电话</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" name="user_tel" id="user_tel">			
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">用户id</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" name="user_id" id="user_id"  readonly="readonly">			
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
    <h4>户主信息</h4>

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
							<tr><td></td>
								<th>姓名</th>
								<th>性别</th>
								<th>身份证号</th>
								<th>户籍</th>
								<th>入住时间</th>
								<th>户型</th>
								<th>面积(m²)</th>
								<th>楼牌号</th>
								<th>联系电话</th>
								<th></th>
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
			url : "manageUsers",
			data : "pn=" + pn,
			type : "GET",
			success : function(result) {
				if(result.code==100){
				//解析并显示用户数据
				build_user_table(result);
				//解析显示分页信息
				build_page_info(result);
				//解析显示分页条
				build_page_nav(result);
				currentPage=result.extend.pageInfo.pageNum;//保存当前页码
				pages=result.extend.pageInfo.pages;
				}
				else{
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
		$.each(user, function(index, item) {
			var checkBoxTd=$("<td></td>").append("<input type='checkbox' class='check_item'/>");
			var householder_name = $("<td></td>").append(item.householder_name);
			var user_sex = $("<td></td>").append(item.user_sex);
			var user_idnumber = $("<td></td>").append(item.user_idnumber);
			var hokou_address= $("<td></td>").append(item.hokou_address);
			var live_date = $("<td></td>").append(item.live_date);
			var house_type = $("<td></td>").append(item.house_type);
			var area = $("<td></td>").append(item.area);
			var loupaihao = $("<td></td>").append(item.loupaihao);
			var user_tel = $("<td></td>").append(item.user_tel);
			var editBtn = $("<button></button>").addClass(
					"btn btn-primary btn-sm edit_btn").append("编辑");
			//为编辑按钮添加一个自定义的属性，来表示当前用户的身份证号
			editBtn.attr("user-id",item.user_id);
			var btnTd = $("<td></td>").append(editBtn);

			$("<tr></tr>").append(checkBoxTd).append(householder_name)
					.append(user_sex).append(user_idnumber).append(hokou_address)
					.append(live_date).append(house_type).append(area)
					.append(loupaihao).append(user_tel).append(btnTd).appendTo("#user_table tbody");
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
	//“编辑”按钮点击后出现模态框
	$(document).on("click",".edit_btn",function(){		
		//清除表单数据（表单重置）
		$("#userEditModal form")[0].reset();
		//获取户主信息
		getholder($(this).attr("user-id"));
		$("#userEditModal").modal({
			backdrop : "static"
		});
	});
	
	
	
	//点击编辑按钮时获取户主信息
	function getholder(user_id){
		$.ajax({
			url:"holder/"+user_id,
			type:"GET",
			success:function(result){
				var holder = result.extend.holder;
				$("#householder_name").val(holder.householder_name);
				$("#userEditModal input[name=user_sex]").val([holder.user_sex]);
				$("#user_idnumber").val(holder.user_idnumber);
				$("#hokou_address").val(holder.hokou_address);
				$("#live_date").val(holder.live_date);
				$("#house_type").val(holder.house_type);
				$("#area").val(holder.area);
				$("#loupaihao").val(holder.loupaihao);
				$("#user_tel").val(holder.user_tel);
				$("#user_id").val(user_id);
			}
		});
	}
	//更新户主信息
			$("#user_save_btn").click(function(){
			$.ajax({
				url:"updateHolder",
				type:"PUT",
				data:$("#userEditModal form").serialize(),
				success:function(result){
					if(result.code == 100){
						  alert("修改成功");
						  $("#userEditModal").modal("hide");
						  to_page(currentPage);
					  }					
					}
				})
			});
	
			//选择时间
			 !function(){
			        laydate({elem: '#live_date'});
			    }();
	
</script>
</body>
</html>

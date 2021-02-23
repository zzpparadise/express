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
									placeholder="address" list = "data-list">
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
						</div>
						
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">快递位置</label>
							<div class="col-sm-10">
							<select name="case_name" class="btn btn-default " id="case_name_add">
								<option value="a">A</option>
								<option value="b">B</option>
								<option value="c">C</option>
								<option value="d">D</option>
								<option value="e">E</option>
								<option value="f">F</option>
							</select>
							<select name="case_num" class="btn btn-default " id="case_num_add">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
							</select>						
							</div>					
						</div>
						<!-- 
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">快递柜</label>
							<div class="col-sm-2">
							<input type="email" class="form-control" name="case_name" id="case_name_add">
							</div>
							<div class="col-sm-2">
							<input type="email" class="form-control" name="case_num" id="case_num_add">
							</div>
						</div>
						 -->
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
    <h4>待取快递列表</h4>

    <div class="notice_check">
    
        <div class="l_left">
            <input type="text" class="find_input" id="find_input">

        </div>
        <button class="check_btn" id="select">查询</button>


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
							<tr><th ><input type="checkbox" id="check_all"/></th>
								<th>编号</th>
								<th>用户账号</th>
								<th>手机号</th>
								<th>快递柜</th>
								<th>到达日期</th>
								<th>快递公司</th>
								<th>取货码</th>
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
	var lastPage;//最后一页
	var flag;//条件查询或全部查询标志
		$(function() {
			flag=1;
		//去首页
			to_page(1,1);
		})
		//跳转到指定的页码号
		function to_page(pn,flag) {
			$.ajax({
				url : "allUser",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					if(result.code==100){
					//解析并显示用户数据
					build_user_table(result);
					//解析显示分页信息
					build_page_info(result);
					//解析显示分页条
					build_page_nav(result,flag);
					currentPage=result.extend.pageInfo.pageNum;
					pages=result.extend.pageInfo.pages;
					}
					else{
						alert(result.msg);
					}
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
				//var editBtn = $("<button></button>").addClass(
				//		"btn btn-primary btn-sm edit_btn").append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前用户的account
				//editBtn.attr("edit-account",item.account);
				var delBtn = $("<button></button>").addClass(
						"btn btn-success btn-sm del_btn").append("确认收货");
				var btnTd = $("<td></td>").append(delBtn);

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
					switch_select(1,flag);
				});
				prePageLi.click(function() {
					switch_select(result.extend.pageInfo.pageNum - 1,flag);
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
					switch_select(result.extend.pageInfo.pageNum + 1,flag);
				});
				lastPageLi.click(function() {
					switch_select(result.extend.pageInfo.pages,flag);
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
					switch_select(item,flag);
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
						  if(result.code==300){
							  alert(result.msg);
							  return;
						  }
						  alert(result.msg);
						  if(result.code == 100){
							  $("#userAddModal").modal("hide");
							  switch_select(pages,flag);
						  }
						  else{
							  alert(result.extend.user_null);
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
						if(result.code==300){
							alert(result.msg);
							  return;
						}
						switch_select(currentPage,flag);
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
			var flaggg=$(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flaggg);
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
						if(result.code==300){
							alert(result.msg);
							  return;
						}						
						alert(result.msg);
						  switch_select(currentPage,flag);
					}
				});
				}
			}
		});
		//按条件查询
		$("#select").click(function(){
			flag=2;
			to_page_select(1,2);
		});
								
		//查询函数
		function to_page_select(pn,flag) {
			flag=2;
			var find_input = $("#find_input").val();
			$.ajax({
				url : "select_express",
				data : {'content':find_input,'pn':pn},
				type : "GET",
				success : function(result) {
					if(result.code==100){
					//解析并显示用户数据
					build_user_table(result);
					//解析显示分页信息
					build_page_info(result);
					//解析显示分页条
					build_page_nav(result,flag);
					currentPage=result.extend.pageInfo.pageNum;//保存当前页码
					pages=result.extend.pageInfo.pages;
					}
					else{
						alert(result.msg);
					}
				}
			});
		}
		//条件查询或全部查询对应函数
		function switch_select(data,flag){
			if(flag==1){
			  	to_page(data,1);
			  }
			  if(flag==2){
				  to_page_select(data,2);
			  }
		}
	
		//添加选择时间的组件
		 !function(){
		        laydate.skin('danlan');
		        laydate({elem: '#arrive_add'});
		    }();
</script>
</body>
</html>

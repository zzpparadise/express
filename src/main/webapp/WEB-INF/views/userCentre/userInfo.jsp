<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户信息</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>

</head>
<body
	background="${pageContext.request.contextPath }/img/lufei_aisi.jpg"
	style="background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
	<!-- 修改用户的模态款 -->
	<div class="modal fade" id="userUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" >修改个人信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
					
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">名称</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" name="householder_name" id="userName_update_input"
									placeholder="昵称">
								<span class="help-block"></span>
							</div>
						</div>
						
						<div class="form-group">
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
							<label for="inputEmail3" class="col-sm-2 control-label">手机号码</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" name="user_tel" id="tel_update_input"
									placeholder="手机号码">
									<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">楼号</label>
							<div class="col-sm-10">
							<select name="building" class="btn btn-default " >
								<option value=""></option>
								<option value="a">a</option>
								<option value="b">b</option>
							</select>
							<select name="number1" class="btn btn-default " >
								<option value=""></option>
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
							</select>
							<select name="number2" class="btn btn-default " >
								<option value=""></option>
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
								<option value="17A">17A</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>						
							</select>
							</div>					
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="user_update_btn">修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 添加修改密码模态框-->
	<div class="modal fade" id="userUpdatePasswordModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改密码</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">输入当前密码</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" name="currentPassword" id="currentPassword">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">输入新密码</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" name="user_password" id="user_password">								
							</div>
						</div>
						<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">确认新密码</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" name="confirmPassword" id="confirmPassword">
								
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="password_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-3">
			<div style="height: 100px"></div>
				<h4 style="font-size:30px; font-family:华文行楷">个人信息</h4>
				<table class="table table-hover" id="user_information">
					<tr><td>名称</td><td id="householder_name"></td></tr>
					<tr><td>账号</td><td id="userName"></td></tr>
					<tr><td>性别</td><td id="userSex"></td></tr>
					<tr><td>楼号</td><td id="userAddress"></td></tr>
					<tr><td>电话</td><td id="userTel"></td></tr>
				</table>
				<button class="btn btn-primary col-md-4 col-md-offset-1" id="user_update_btn">修改个人信息</button>
				<button class="btn btn-primary col-md-4	 col-md-offset-2" id="user_update_password">修改密码</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//获取用户信息
		$(function(){
			$.ajax({
				url:"../userCentre/getUserInfo",
				data:"",
				type:"GET",
				success:function(result){
					if(result.code==100)
						build_user_table(result);
					else{
						alert(result.msg);
						window.location.href="../index/login";					
					}
				}
				});
		})
		//用户信息
		function build_user_table(result){
			var user=result.extend.myInfo;
			$("#householder_name").append(user.householder_name).attr("householder_name",user.householder_name);
			$("#userName").append(user.user_name).attr("user-name",user.user_name).attr("is_master",user.is_master);
			$("#userSex").append(user.user_sex).attr("user-sex",user.user_sex);
			$("#userAddress").append(user.user_address).attr("user-address",user.user_address);
			$("#userTel").append(user.user_tel).attr("user-tel",user.user_tel);
		}
		//“修改个人信息”按钮点击后出现模态框
		$(document).on("click","#user_update_btn",function(){
			//判断是不是户主
			if($("#userName").attr("is_master")==1){
				alert("您是户主，无法修改个人信息");
				return;
			}		
			//清除表单数据（表单重置）
			$("#userUpdateModal form")[0].reset();
			$("#userName_update_input").val($("#householder_name").attr("householder_name"));
			$("#userUpdateModal input[name=user_sex]").val([$("#userSex").attr("user-sex")]);
			$("#tel_update_input").val($("#userTel").attr("user-tel"));
			$("#address_update_input").val($("#userAddress").attr("user-address"));
			$("#userUpdateModal").modal({
				backdrop : "static"
			});
		});
		//更新操作
		$("#user_update_btn").click(function(){
			$.ajax({
				url:"updateInfo",
				type:"PUT",
				data:$("#userUpdateModal form").serialize(),
				success:function(result){
					if(result.code == 100){
						  alert(result.msg);
						  window.location.href="userInfo";
					  }
					if(result.extend.nameCheck != undefined){
						   alert(result.extend.nameCheck);
						  }
					  if(result.extend.telCheck != undefined){
						   alert(result.extend.telCheck);
						  }
					 if(result.extend.errorFields.user_name != undefined){
						  	alert(result.extend.errorFields.user_name);
						  	}
						  else if(result.extend.errorFields.user_tel != undefined){
						  	alert(result.extend.errorFields.user_tel);
						  	}
					}
				})
		});
		//修改密码按钮点击后出现模态框
		$(document).on("click","#user_update_password",function(){
			$("#userUpdatePasswordModal form")[0].reset();
			$("#userUpdatePasswordModal").modal({				
				backdrop : "static"
			});
			
		});
		//修改密码
		$("#password_save_btn").click(function(){
			$.ajax({
				url:"updatePassword",
				type:"PUT",
				data:$("#userUpdatePasswordModal form").serialize(),
				success:function(result){
					if(result.code == 100){
						alert("修改密码成功，请重新登录");
						window.location.href="../index/login";
					}
					else{
						if(result.extend.passwordFail !=undefined){
							alert(result.extend.passwordFail);
						}
						else if(result.extend.confirmFail !=undefined){
							alert(result.extend.confirmFail);
						}
						else if(result.extend.errorFields.user_password !=undefined){
							alert(result.extend.errorFields.user_password);
						}
						
					}
											
					}			
			});
		});

		
	</script>
</body>
</html>
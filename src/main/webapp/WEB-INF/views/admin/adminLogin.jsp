<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员登录</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function(){
		//点击图片切换验证码
		$("#vcodeImg").click(function(){
			this.src="../index/get_cpacha?vl=4&w=120&h=40&t="+new Date().getTime();
		});
		});
	//登录
	$(document).on("click","#submitBtn",function(){
		$.ajax({
			url:"checkLogin",
			data: $("#form").serialize(), 
			type: "POST",
			success:function(result){						
					if(result.code == 100){
						window.location.href="adminIndex";
					}
					else{
						alert(result.extend.message);
						$("#vcodeImg").click();
						}
					}
				
		});
	});
	
	
	
	
</script>

</head>

<body>
	<div class="container">		
		<div class="row">		
			<div style="height:100px"></div>
			<div class="col-md-4 col-md-offset-4">
			<h2>管理员登录</h2>
				<br/><br/>
				<form action="login" method="post" id="form" class="form-horizontal">
					<div class="form-group">
						<div class="col-md-1"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>				
						<label class="col-md-3" for="account">账&nbsp;&nbsp;&nbsp;&nbsp;号</label>
						<div class="col-md-8">
							<input type="text" name="username" class="form-control" placeholder="输入用户名">
						</div>
					</div>

					<div class="form-group">
					<div class="col-md-1"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></div>
						<label class="col-md-3" for="account">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
						<div class="col-md-8">
							<input type="password" name="password" class="form-control" placeholder="输入密码">
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-md-1"><span class="glyphicon glyphicon-barcode" aria-hidden="true"></span></div>
						<label class="col-md-3" for="account">验证码</label>
						<div class="col-md-4">
							<input type="text" name="vcode" class="form-control" placeholder="输入验证码">					
						</div>
						<div><img title="点击图片切换验证码" id="vcodeImg" src="../index/get_cpacha?vl=4&w=120&h=40"></div>
					</div>
					
					<div class="form-group">
						<div class="col-md-2 col-md-offset-2">
							<input type="button" id="submitBtn" value="登录" class="btn btn-primary">
						</div>
						<div class="col-md-2 col-md-offset-1">
							<input type="reset" value="重置" class="btn btn-primary">
						</div>						
										
					</div>
					

				</form>
			</div>
			<div class="col-md-4 col-md-offset-4" style="height:100px"></div>
		</div>
		
		</div>
</body>
</html>
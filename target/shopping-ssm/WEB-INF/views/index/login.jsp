<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登录</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function(){
		//点击图片切换验证码
		$("#vcodeImg").click(function(){
			this.src="get_cpacha?vl=4&w=120&h=40&t="+new Date().getTime();
		});
		});
	//登录
	$(document).on("click","#submitBtn",function(){
		$.ajax({
			url:"checkLogin",
			data: $("#form").serialize(), 
			type: "POST",		
			success:function(result){			
					//window.location.href="../user/list";
					//window.parent.location.href ="index";	
					if(result.code == 100){				
						
								window.location.href="../user/express";
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
			<div class="bg-success" style="height:100px;">
				<br/>
				<p style="font-size:30px">小区快递管理系统-用户登录</p>
			</div>
		</div>
		<div class="row" style="background-image:url(${pageContext.request.contextPath }/img/background.jpg);
		background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
			<div style="height:100px"></div>
			<div class="col-md-4 col-md-offset-4">
				<div style="height:50px"></div>
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
						<div><img title="点击图片切换验证码" id="vcodeImg" src="get_cpacha?vl=4&w=120&h=40"></div>
					</div>
					
					<div class="form-group">
						<div class="col-md-2 col-md-offset-2">
							<input type="button" id="submitBtn" value="登录" class="btn btn-primary">
						</div>
						<div class="col-md-2 col-md-offset-1">
							<input type="reset" value="重置" class="btn btn-primary">
						</div>						
										
					</div>
					<div class="col-md-6 col-md-offset-2">
					<a href="register" >还没账号？去注册</a>
					</div>

				</form>
			</div>
			<div class="col-md-4 col-md-offset-4" style="height:100px"></div>
		</div>
		<div class="row">
			<div class="bg-success container " style="height:100px">
				<br/>
				<div class="col-md-1 col-md-offset-3"><a href="#" style="color:black">关于我们</a></div>
				<div class="col-md-1"><a href="#" style="color:black">联系我们</a></div>
				<div class="col-md-1"><a href="#" style="color:black">用户协议</a></div>
				<div class="col-md-1"><a href="#" style="color:black">隐私政策</a></div>
				<div class="col-md-1"><a href="#" style="color:black">帮助中心</a></div>
				<div class="col-md-1"><a href="#" style="color:black">加入我们</a></div>
			</div>
		</div>
		</div>
</body>
</html>
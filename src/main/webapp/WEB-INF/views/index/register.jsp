<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户注册</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="bg-success" style="height:100px;">
				<br/>
				<p style="font-size:30px">小区物业及快递服务系统-用户注册</p>
			</div>
		</div>
		<div class="row" style="background-image:url(${pageContext.request.contextPath }/img/background.jpg);
		background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
			<div style="height:100px"></div>
			<div class="col-md-4 col-md-offset-4" >
				<div style="height:50px"></div>
				<form id="form" action="doRegister" method="post" class="form-horizontal">
					<div class="form-group">
						<label class="col-md-4" for="account">输入姓名</label>
						<div class="col-md-7">
							<input type="text" name="user_name" id="user_name" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4" for="account">输入手机号</label>
						<div class="col-md-7" >
							<input type="text" name="user_tel" id="user_tel" class="form-control">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-4" for="account">设置密码</label>
						<div class="col-md-7">
							<input type="password" name="user_password" id="user_password" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4" for="account">确认密码</label>
						<div class="col-md-7">
							<input type="password" name="password" id="password" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4" for="account">您的性别</label>
						<div class="col-md-2">
							<input type="radio" name="user_sex" value="男">男
							</div>
							<div class="col-md-2">
							<input type="radio" name="user_sex" value="女" checked>女

						</div>
					</div>
					<div class="form-group">
						<div class="col-md-2 col-md-offset-3">
								<input type="button" value="注册" class="btn btn-primary" id="registerBtn"/>
							
						</div>
						<div class="col-md-2 col-md-offset-3">
						<input type="reset" value="重置" class="btn btn-info"/>
							
						</div>
						
					</div>
				</form>
			</div>
			<div style="height:500px"></div>
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

<script type="text/javascript">
	$("#registerBtn").click(function(){
		$.ajax({
			  url:"doRegister",
			  type:"POST",
			  data:$("#form").serialize(),
			  success:function(result){
				  
				  if(result.code == 100){
					  alert(result.extend.successRegister);
					  window.location.href="";
				  }
				  else{
					  //显示失败信息
					  if(result.extend.password != undefined){
					   alert(result.extend.password);
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
					  else if(result.extend.errorFields.user_password != undefined){
						  alert(result.extend.errorFields.user_password);
						  }			  
				  }				 
					  			  
						 
						  				 						  						  						  
			  }
		  });
	});
</script>




</body>
</html>
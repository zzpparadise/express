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
</head>
<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto">
<div class="news_main">


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
</script>
</body>
</html>

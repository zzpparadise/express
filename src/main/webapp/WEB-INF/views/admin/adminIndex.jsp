<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>首页</title>
    <script src="${pageContext.request.contextPath }/js/jquery/jQuery-2.2.0.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/js/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/skins/_all-skins.css">
</head>
<body class="hold-transition skin-blue sidebar-mini" style="overflow:hidden;">
	<!-- 修改水电单价的模态款 -->
	<div class="modal fade bs-example-modal-sm" id="priceUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" >修改水电单价</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
					
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">水单价</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" name="water_price" id="water_price">
								<span class="help-block"></span>
							</div>
							<label for="inputEmail3" class="col-sm-3 control-label">元 / 吨</label>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">电单价</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" name="electricity_price" id="electricity_price">
									<span class="help-block"></span>
							</div>
							<label for="inputEmail3" class="col-sm-3 control-label">元 / 度</label>
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




    <div id="ajax-loader" style="cursor: progress; position: fixed; top: -50%; left: -50%; width: 200%; height: 200%; background: #fff; z-index: 10000; overflow: hidden;">
        <img src="${pageContext.request.contextPath }/img/ajax-loader.gif" style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; margin: auto;" />
    </div>
    <div class="wrapper">
        <!--头部信息-->
        <header class="main-header">
            <a href="javascript:void (0)" class="logo">
                <span class="logo-mini"></span>
                <span class="logo-lg"><font size="4">小区物业及快递管理系统 </font></span>
            </a>
            <nav class="navbar navbar-static-top" style="display:block;font-weight: 500;font-size: 14px;color: #fff;padding-left: 10px">
                <span class="index_top"><strong></strong></span>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <li class="dropdown messages-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-envelope-o "></i>
                                <span class="label label-success">4</span>
                            </a>
                        </li>
                        <li class="dropdown notifications-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-bell-o"></i>
                                <span class="label label-warning">10</span>
                            </a>
                        </li>
                        <li class="dropdown tasks-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-flag-o"></i>
                                <span class="label label-danger">9</span>
                            </a>
                        </li>
                        <li class="dropdown user user-menu">
                        	<c:if test="${ sessionScope.admin!=null }">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="${pageContext.request.contextPath }/img/emo.jpg" class="user-image" alt="User Image">
                                <span class="hidden-xs">${sessionScope.admin.account}</span>
                            </a>
                            </c:if>
                            <c:if test="${ sessionScope.admin==null }">
                            	<a href="login">请登录</a>
                            </c:if>
                            <ul class="dropdown-menu pull-right">
                                <li><a class="menuItem" data-id="userInfo" type = "button" id = "update_price"><i class="fa fa-user"></i>修改单价</a></li>
                                <li><a><i class="fa fa-trash-o"></i>清空缓存</a></li>
                                <li id="color"><a><i class="fa fa-paint-brush"></i>皮肤设置</a>
                                    <div style="position: absolute;left:-90px;top:50px;border: 1px #eee solid;box-shadow: 0 6px 12px rgba(0,0,0,.175);display: none" id="color_div">
                                     <ul class="color_ul">
                                         <li style="background-color: green;color:green"></li>
                                         <li style="background-color: #cc0000;color: #cc0000"></li>
                                         <li style="background-color: #330099;color: #330099"></li>
                                         <li style="background-color: red;color:red"></li>
                                         <li style="background-color: #3c8dbc;color: #3c8dbc"></li>
                                         <li style="background-color: green;color: green"></li>
                                         <li style="background-color: green;color:green"></li>
                                         <li style="background-color: green;color: green"></li>
                                         <li style="background-color: green;color: green"></li>
                                     </ul>
                                    </div>
                                </li>
                                

                                <li class="divider"></li>
                                <li><a href="logout"><i class="ace-icon fa fa-power-off"></i>安全退出</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!--左边导航-->
        <div class="main-sidebar">
            <div class="sidebar">
                <ul class="sidebar-menu" id="sidebar-menu">
                    <li class="header">导航菜单</li>
                </ul>
            </div>
        </div>
        <!--中间内容-->
        <div id="content-wrapper" class="content-wrapper">
            <div class="content-tabs">
                <button class="roll-nav roll-left tabLeft">
                    <i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs menuTabs">
                    <div class="page-tabs-content" style="margin-left: 0px;">
                        <a href="javascript:;" class="menuTab active" data-id="default.html">欢迎首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right tabRight">
                    <i class="fa fa-forward" style="margin-left: 3px;"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown tabClose" data-toggle="dropdown">
                        页签操作<i class="fa fa-caret-down" style="padding-left: 3px;"></i>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a class="tabReload" href="javascript:void(0);">刷新当前</a></li>
                        <li><a class="tabCloseCurrent" href="javascript:void(0);">关闭当前</a></li>
                        <li><a class="tabCloseAll" href="javascript:void(0);">全部关闭</a></li>
                        <li><a class="tabCloseOther" href="javascript:void(0);">除此之外全部关闭</a></li>
                    </ul>
                </div>
                <button class="roll-nav roll-right fullscreen"><i class="fa fa-arrows-alt"></i></button>
            </div>
            <div class="content-iframe" style="overflow: hidden;">
                <div class="mainContent" id="content-main" style="margin: 10px; margin-bottom: 0; padding: 0;">
                    <iframe id="myFrame" class="LRADMS_iframe" width="100%" height="100%" src="home" frameborder="0" data-id="default.html"></iframe>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath }/js/jquery/jQuery-2.2.0.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/index.js"></script>
    <script>

   
		//“修改水电”按钮点击后出现模态框
		$("#update_price").click(function(){
			getPrice();
			$("#priceUpdateModal").modal({
				backdrop : "static"
			});
		});
		
		//获取水电单价信息
		function getPrice() {
			$.ajax({
				url : "getPrice",
				type : "GET",
				success : function(result) {
					var price = result.extend.price;
					$("#water_price").val(price.water_price);
					$("#electricity_price").val(price.electricity_price);
				}
			});
		}
		
		//更新水电单价
		$("#price_update_btn").click(function() {
			$.ajax({
				url : "updatePrice",
				type : "PUT",
				data : $("#priceUpdateModal form").serialize(),
				success : function(result) {
					if (result.code == 100) {
						alert("修改成功");
						$("#priceUpdateModal").modal("hide");
					}
					if (result.code == 300) {
						alert(result.msg);
						return;
					}
				}
			})
		});
    
    
    
    
    
    
    
    
    
    
    
    
    
        var colorIndex = 0;
        $(function(){
            changeColor(colorIndex);
            $(".hidden-xs").click(function(){
                $("#color_div").hide();
            });
            $("#color").hover(function(){
                $("#color_div").show();
            });
            $(".color_ul li").each(function(index){
                $(this).click(function(){
                    if(index<5){
                        changeColor(index)
                    }else {
                        changeColor(0)
                    }

                })
            })
        });
        function changeColor(index){
            var logo = $(".logo");
            var navbar = $(".skin-blue .main-header .navbar");
            var left_Side = $(".skin-blue .wrapper, .skin-blue .main-sidebar, .skin-blue .left-side");
            var header = $(".skin-blue .sidebar-menu > li.header");
            var treeview_menu = $(".skin-blue .sidebar-menu > li > .treeview-menu");
            var aa = $(".skin-blue .sidebar-menu > li.active > a");
            var page_tabs_content = $(".content-wrapper .content-tabs .page-tabs .page-tabs-content a");
            if(index==0) {
                logo.addClass("logo1");
                navbar.addClass("navbar1");
                left_Side.addClass("left-side1");
                header.addClass("header1");
                treeview_menu.addClass("treeview-menu1");
                aa.addClass("a0");

                logo.removeClass("logo2");
                navbar.removeClass("navbar2");
                left_Side.removeClass("left-side2");
                header.removeClass("header2");
                treeview_menu.removeClass("treeview-menu2");
                aa.removeClass("a2");

                logo.removeClass("logo3");
                navbar.removeClass("navbar3");
                left_Side.removeClass("left-side3");
                header.removeClass("header3");
                treeview_menu.removeClass("treeview-menu3");
                aa.removeClass("a3");

                logo.removeClass("logo4");
                navbar.removeClass("navbar4");
                left_Side.removeClass("left-side4");
                header.removeClass("header4");
                treeview_menu.removeClass("treeview-menu4");
                aa.removeClass("a4");

                logo.removeClass("logo5");
                navbar.removeClass("navbar5");
                left_Side.removeClass("left-side5");
                header.removeClass("header5");
                treeview_menu.removeClass("treeview-menu5");
                aa.removeClass("a5");
            }else if(index==1){
                logo.removeClass("logo1");
                navbar.removeClass("navbar1");
                left_Side.removeClass("left-side1");
                header.removeClass("header1");
                treeview_menu.removeClass("treeview-menu1");
                aa.removeClass("a0");

                logo.addClass("logo2");
                navbar.addClass("navbar2");
                left_Side.addClass("left-side2");
                header.addClass("header2");
                treeview_menu.addClass("treeview-menu2");
                aa.addClass("a2");

                logo.removeClass("logo3");
                navbar.removeClass("navbar3");
                left_Side.removeClass("left-side3");
                header.removeClass("header3");
                treeview_menu.removeClass("treeview-menu3");
                aa.removeClass("a3");

                logo.removeClass("logo4");
                navbar.removeClass("navbar4");
                left_Side.removeClass("left-side4");
                header.removeClass("header4");
                treeview_menu.removeClass("treeview-menu4");
                aa.removeClass("a4");


                logo.removeClass("logo5");
                navbar.removeClass("navbar5");
                left_Side.removeClass("left-side5");
                header.removeClass("header5");
                treeview_menu.removeClass("treeview-menu5");
                aa.removeClass("a5");

            }else if(index==2){
                logo.removeClass("logo1");
                navbar.removeClass("navbar1");
                left_Side.removeClass("left-side1");
                header.removeClass("header1");
                treeview_menu.removeClass("treeview-menu1");
                aa.removeClass("a0");

                logo.removeClass("logo2");
                navbar.removeClass("navbar2");
                left_Side.removeClass("left-side2");
                header.removeClass("header2");
                treeview_menu.removeClass("treeview-menu2");
                aa.removeClass("a2");

                logo.addClass("logo3");
                navbar.addClass("navbar3");
                left_Side.addClass("left-side3");
                header.addClass("header3");
                treeview_menu.addClass("treeview-menu3");
                aa.addClass("a3");


                logo.removeClass("logo4");
                navbar.removeClass("navbar4");
                left_Side.removeClass("left-side4");
                header.removeClass("header4");
                treeview_menu.removeClass("treeview-menu4");
                aa.removeClass("a4");

                logo.removeClass("logo5");
                navbar.removeClass("navbar5");
                left_Side.removeClass("left-side5");
                header.removeClass("header5");
                treeview_menu.removeClass("treeview-menu5");
                aa.removeClass("a5");

            }else if(index==3){
                logo.removeClass("logo1");
                navbar.removeClass("navbar1");
                left_Side.removeClass("left-side1");
                header.removeClass("header1");
                treeview_menu.removeClass("treeview-menu1");
                aa.removeClass("a0");

                logo.removeClass("logo2");
                navbar.removeClass("navbar2");
                left_Side.removeClass("left-side2");
                header.removeClass("header2");
                treeview_menu.removeClass("treeview-menu2");
                aa.removeClass("a2");

                logo.removeClass("logo3");
                navbar.removeClass("navbar3");
                left_Side.removeClass("left-side3");
                header.removeClass("header3");
                treeview_menu.removeClass("treeview-menu3");
                aa.removeClass("a3");


                logo.addClass("logo4");
                navbar.addClass("navbar4");
                left_Side.addClass("left-side4");
                header.addClass("header4");
                treeview_menu.addClass("treeview-menu4");
                aa.addClass("a4");


                logo.removeClass("logo5");
                navbar.removeClass("navbar5");
                left_Side.removeClass("left-side5");
                header.removeClass("header5");
                treeview_menu.removeClass("treeview-menu5");
                aa.removeClass("a5");

            }
            else if(index==4){
                logo.removeClass("logo1");
                navbar.removeClass("navbar1");
                left_Side.removeClass("left-side1");
                header.removeClass("header1");
                treeview_menu.removeClass("treeview-menu1");
                aa.removeClass("a0");

                logo.removeClass("logo2");
                navbar.removeClass("navbar2");
                left_Side.removeClass("left-side2");
                header.removeClass("header2");
                treeview_menu.removeClass("treeview-menu2");
                aa.removeClass("a2");

                logo.removeClass("logo3");
                navbar.removeClass("navbar3");
                left_Side.removeClass("left-side3");
                header.removeClass("header3");
                treeview_menu.removeClass("treeview-menu3");
                aa.removeClass("a3");


                logo.removeClass("logo4");
                navbar.removeClass("navbar4");
                left_Side.removeClass("left-side4");
                header.removeClass("header4");
                treeview_menu.removeClass("treeview-menu4");
                aa.removeClass("a4");

                logo.addClass("logo5");
                navbar.addClass("navbar5");
                left_Side.addClass("left-side5");
                header.addClass("header5");
                treeview_menu.addClass("treeview-menu5");
                aa.addClass("a5");

            }


        }
    </script>
</body>
</html>

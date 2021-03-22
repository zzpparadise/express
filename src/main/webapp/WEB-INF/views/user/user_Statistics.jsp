<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>统计分析</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
	<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    <script  src="${pageContext.request.contextPath }/js/echarts/echarts-all.js"></script>

</head>
<body style="background-image:url(${pageContext.request.contextPath }/img/lufei_aisi.jpg);
		background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">
	<!-- 导航条 -->
	<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#" style="color: green; ">水电统计</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <form class="navbar-form navbar-left">
        <div class="form-group">
         <select name="year" class="btn btn-default " id = "year">
							<option value="2021">2021年</option>
							<option value="2020">2020年</option>
							<option value="2019">2019年</option>
							<option value="2018">2018年</option>
		</select>
        </div>
        <button type="button" id="user_find_btn" class="btn btn-default">查询</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <c:if test="${ sessionScope.user != null }">
						<li><a href="#">${ sessionScope.user.user_name }</a></li>
					</c:if>
					<c:if test="${ sessionScope.user==null }">
						<li><a href="../index/login">你好，请登录</a></li>
					</c:if>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">菜单 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="../userCentre/userInfo">个人中心</a></li>
							<li><a href="user_water_elec">水电查询</a></li>
							<li><a href="express">我的快递</a></li>
							<li><a href="user_complain_repair">报修/投诉</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="logout">退出登录</a></li>
						</ul></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div style="float: left; width: 35%;">
                <div style="height: 250px; border: 1px solid #e6e6e6; background-color: #fff;">
                    <div class="panel panel-default">
                        <div class="panel-heading"><i class="fa fa-bar-chart fa-lg" style="padding-right: 5px;"></i>用水统计_单位：吨</div>
                        <div class="panel-body" style="background-image:url(${pageContext.request.contextPath }/img/touming1.png)">
                            <p  id="bar01" style="height: 250px; width: 100%;"></p>
                        </div>
                    </div>
                </div>
</div>
<div style="float: left; width: 35%;">
                <div style="height: 250px; border: 1px solid #e6e6e6; background-color: #fff;">
                    <div class="panel panel-default">
                        <div class="panel-heading"><i class="fa fa-bar-chart fa-lg" style="padding-right: 5px;"></i>用电统计_ 单位：度</div>
                        <div class="panel-body" style="background-image:url(${pageContext.request.contextPath }/img/touming1.png)">
                            <p  id="bar02" style="height: 250px; width: 100%;"></p>
                        </div>
                    </div>
                </div>
</div>
<script>
var January_shui;
var Jaunary_dian;
var February_shui;
var February_dian;
var March_shui;
var March_dian;
var April_shui;
var April_dian;
var May_shui;
var May_dian;
var June_shui;
var June_dian;
var July_shui;
var July_dian;
var August_shui;
var August_dian;
var September_shui;
var September_dian;
var October_shui;
var October_dian;
var November_shui;
var November_dian;
var December_shui;
var December_dian;


$(function() {
	var year = $("#year").val();
	tongji(year);
})
function tongji(year) {
	$.ajax({
		url : "shuidiantongji",
		data : {'year':year},
		type : "GET",
		success : function(result) {
			 if(result.msg == 300){
				 alert(result.msg);
				 return;
			 }
			 January_shui= result.extend.January_shui;
			 Jaunary_dian= result.extend.Jaunary_dian;
			 February_shui= result.extend.February_shui;
			 February_dian= result.extend.February_dian;
			 March_shui= result.extend.March_shui;
			 March_dian= result.extend.March_dian;
			 April_shui= result.extend.April_shui;
			 April_dian= result.extend.April_dian;
			 May_shui= result.extend.May_shui;
			 May_dian= result.extend.May_dian;
			 June_shui= result.extend.June_shui;
			 June_dian= result.extend.June_dian;
			 July_shui= result.extend.July_shui;
			 July_dian= result.extend.July_dian;
			 August_shui= result.extend.August_shui;
			 August_dian= result.extend.August_dian;
			 September_shui= result.extend.September_shui;
			 September_dian= result.extend.September_dian;
			 October_shui= result.extend.October_shui;
			 October_dian= result.extend.October_dian;
			 November_shui= result.extend.November_shui;
			 November_dian= result.extend.November_dian;
			 December_shui= result.extend.December_shui;
			 December_dian= result.extend.December_dian;
			 tongji_shui();
			 tongji_dian();
		}
	});
}

$("#user_find_btn").click(function(){
	var year = $("#year").val();
	tongji(year);
});

//统计表

       function tongji_shui(){
            var myChart = echarts.init($("#bar01")[0]);
            option = {

                tooltip: {
                    trigger: 'item'
                },

                calculable: true,
                grid: {
                    borderWidth: 0,
                    y: 80,
                    y2: 60
                },
                xAxis: [
                    {
                        type: 'category',
                        splitLine:{show: false},
                        show: true,
                        data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月','十二月']
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        show: true,
                        splitLine:{show: false}
                    }
                ],
                series: [
                    {
                        name: '提案分类统计图',
                        type: 'bar',
                        itemStyle: {
                            normal: {
                                color: function(params) {
                                    // build a color map as your need.
                                    var colorList = [
                                        '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                                        '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                                        '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                                    ];
                                    return colorList[params.dataIndex]
                                },
                                label: {
                                    show: true,
                                    position: 'top',
                                    formatter: '{b}\n{c}'
                                }
                            }
                        },
                        data: [January_shui,February_shui,March_shui,April_shui,May_shui,June_shui,July_shui,August_shui,September_shui,October_shui,November_shui,December_shui],
                       
                    }
                ]
            };
            myChart.setOption(option);
        }
        
        
        function tongji_dian(){
            var myChart = echarts.init($("#bar02")[0]);
            option = {

                tooltip: {
                    trigger: 'item'
                },

                calculable: true,
                grid: {
                    borderWidth: 0,
                    y: 80,
                    y2: 60
                },
                xAxis: [
                    {
                        type: 'category',
                        splitLine:{show: false},
                        show: true,
                        data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月','十二月']
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        show: true,
                        splitLine:{show: false}
                    }
                ],
                series: [
                    {
                        name: '提案分类统计图',
                        type: 'bar',
                        itemStyle: {
                            normal: {
                                color: function(params) {
                                    // build a color map as your need.
                                    var colorList = [
                                        '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                                        '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                                        '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                                    ];
                                    return colorList[params.dataIndex]
                                },
                                label: {
                                    show: true,
                                    position: 'top',
                                    formatter: '{b}\n{c}'
                                }
                            }
                        },
                        data: [Jaunary_dian,February_dian,March_dian,April_dian,May_dian,June_dian,July_dian,August_dian,September_dian,October_dian,November_dian,December_dian],
                       
                    }
                ]
            };
            myChart.setOption(option);
        }
</script>


</body>
</html>

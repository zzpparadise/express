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



</head>
<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto">
<div class="news_main">

<div class="l_left news_right">
    <h6>新闻管理</h6>

    <div class="notice_check">
        <div class="btn-group l_left" style="margin-right: 4px">
            <button type="button" class="btn btn-default change" style="height: 30px;line-height: 30px;padding: 0 12px !important;font-size: 12px">选择条件</button>
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="height: 30px;line-height: 30px">
                <span class="caret"></span>
                <span class="sr-only"></span>
            </button>
            <ul class="dropdown-menu">
                <li>标题</li>
                <li>作者</li>
                <li>发布人</li>
                <li>发布时间</li>
            </ul>
        </div>
        <div class="l_left">
            <input type="text" class="find_input">

        </div>
        <button class="check_btn">查询</button>


        <div class="notice_nav r_right">
            <a class="btn btn-default" onclick="addNews()"><span class="glyphicon glyphicon-plus"></span>新增</a>
            <a class="btn btn-default"><span class="glyphicon glyphicon-remove"></span>删除</a>
            <a class="btn btn-default" onclick="addNews()"><span class="glyphicon glyphicon-pencil"></span>编辑</a>

        </div>
        <div class="clear"></div>
    </div>
    <ul class="news_table">
        <li>
            <table id="table" class="table_style" style="margin: 0 auto" ></table>
        </li>
        <li style="display: none">
            <table id="table1" class="table_style" style="margin: 0 auto" ></table>
        </li>
        <li style="display: none">
            <table id="table2" class="table_style" style="margin: 0 auto" ></table>
        </li>
    </ul>

</div>
<div class="clear"></div>

</div>
<script src="${pageContext.request.contextPath }/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bstable/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bstable/js/bootstrap-table.js"></script>
<script src="${pageContext.request.contextPath }/js/bstable/js/bootstrap-table-zh-CN.min.js"></script>
<script src="${pageContext.request.contextPath }/js/layer_v2.1/layer/layer.js"></script>
<script>
    $(function(){
        table();
        nav();
        change();
    });
    function nav(){
        $(".news_nav li").each(function(index){
            $(this).click(function(){
                $(".news_nav li").removeClass("nav_active");
                $(this).addClass("nav_active");
                $(".news_table>li").eq(index).show().siblings("li").stop().hide();
            })

        })
    }
    function change(){
        $(".dropdown-menu>li").click(function(){
            $(".change").html($(this).html())
        })
    }
    function table(){
        $('#table').bootstrapTable({
            method: "get",
            striped: true,
            singleSelect: false,
            url: "json/notice.json",
            dataType: "json",
            pagination: true, //分页
            pageSize: 10,
            pageNumber: 1,
            search: false, //显示搜索框
            contentType: "application/x-www-form-urlencoded",
            queryParams: null,
            columns: [
                {
                    checkbox: "true",
                    field: 'check',
                    align: 'center',
                    valign: 'middle'
                }
                ,
                {
                    title: "编号",
                    field: 'id',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '标题',
                    field: 'title',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '作者',
                    field: 'type',
                    align: 'center',
                    valign: 'middle'
                },

                {
                    title: '发布人',
                    field: 'person',
                    align: 'center'
                },
                {
                    title: '发布时间',
                    field: 'date',
                    align: 'center'
                },
                {
                    title: '操作',
                    field: 'opear',
                    align: 'center',
                    formatter: function (value, row) {
                        var e = '<a  href="#" title="查看详情" onclick="addNews(\'' + row.id + '\')">查看详情</a> ';
                        return e ;
                    }
                }
            ]
        });
        $('#table1').bootstrapTable({
            method: "get",
            striped: true,
            singleSelect: false,
            url: "json/notice.json",
            dataType: "json",
            pagination: true, //分页
            pageSize: 10,
            pageNumber: 1,
            search: false, //显示搜索框
            contentType: "application/x-www-form-urlencoded",
            queryParams: null,
            columns: [
                {
                    checkbox: "true",
                    field: 'check',
                    align: 'center',
                    valign: 'middle'
                }
                ,
                {
                    title: "编号",
                    field: 'id',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '标题',
                    field: 'title',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '作者',
                    field: 'type',
                    align: 'center',
                    valign: 'middle'
                },

                {
                    title: '发布人',
                    field: 'person',
                    align: 'center'
                },
                {
                    title: '发布时间',
                    field: 'date',
                    align: 'center'
                },
                {
                    title: '操作',
                    field: 'opear',
                    align: 'center',
                    formatter: function (value, row) {
                        var e = '<a  href="#" title="查看详情" onclick="addNews(\'' + row.id + '\')">查看详情</a> ';
                        return e ;
                    }
                }
            ]
        });
        $('#table2').bootstrapTable({
            method: "get",
            striped: true,
            singleSelect: false,
            url: "json/notice.json",
            dataType: "json",
            pagination: true, //分页
            pageSize: 10,
            pageNumber: 1,
            search: false, //显示搜索框
            contentType: "application/x-www-form-urlencoded",
            queryParams: null,
            columns: [
                {
                    checkbox: "true",
                    field: 'check',
                    align: 'center',
                    valign: 'middle'
                }
                ,
                {
                    title: "编号",
                    field: 'id',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '标题',
                    field: 'title',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '作者',
                    field: 'type',
                    align: 'center',
                    valign: 'middle'
                },

                {
                    title: '发布人',
                    field: 'person',
                    align: 'center'
                },
                {
                    title: '发布时间',
                    field: 'date',
                    align: 'center'
                },
                {
                    title: '操作',
                    field: 'opear',
                    align: 'center',
                    formatter: function (value, row) {
                        var e = '<a  href="#" title="查看详情" onclick="addNews(\'' + row.id + '\')">查看详情</a> ';
                        return e ;
                    }
                }
            ]
        });
    }
    function addNews(){
        layer.open({
            type: 2,
            title: '新闻发布',
            shade: 0.5,
            skin: 'layui-layer-rim',
            area: ['920px', '580px'],
            shadeClose: true,
            closeBtn: 1,
            content: 'addNotice.html'
        });
    }
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-07-24
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>

<head>
    <title>用户列表</title>
</head>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-select.js"></script>
<script type="text/javascript" src="js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrap-select.css"/>
<link rel="stylesheet" href="css/bootstrap-table.min.css"/>
<body>
<div class="panel">
    <div class="panel-heading" style="background-color: whitesmoke">
        <div class="input-group" style="width: 300px">
            <span class="input-group-addon">用户名</span>
            <input type="text" class="form-control" name="username" id="username"  placeholder="请输入用户名" style="width: 150px"/>
            <div class="input-group-btn">
                <button class="btn btn-primary" id="btnsearch" style="width: 85px">查询</button>
            </div>

        </div>

    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover table-condensed" id="userlist">
            </table>
        </div>
    </div>
</div>
<div id="edituserwin" class="modal" data-backdrop="static">
    <!-- 对话框容器div-->
    <div class="modal-dialog">
        <!--内容容器 -->
        <div class="modal-content">
            <!-- 头部标题-->
            <div class="modal-title text-center">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;&nbsp;&nbsp;</span>
                </button>
                <h4>用户编辑</h4></div>
            <!-- 主体内容-->
            <div class="modal-body">

                <form id="updateuser_form" method="post">
                    <input type="hidden" name="id" id="id" />
                   <div class="form-group">
                        用户名：
                        <input name="username" id="username2" class="form-control" placeholder="请输入名称"/>
                    </div>
                    <div class="form-group">
                        密码：
                        <input name="userpwd" id="userpwd2" class="form-control" placeholder="请输入密码"/>
                    </div>
                    <br>
                    <div class="form-group">
                        性别：
                        男<input type="radio" id="nan" name="sex" value="男" checked="checked">
                        女<input type="radio" id="nv" name="sex" value="女">
                    </div>
                    <br>
                    <div class="form-group">
                        身高/cm：
                        <input type="number" name="height" id="height2"class="form-control" min="1.00" max="300.00" step="0.01" placeholder="请输入身高">
                    </div>
                    <div class="form-group">
                        生日：
                        <input name="birthday" id="birthday2" class="form-control" type="date"/>
                    </div>
                    <div class="modal-footer">
                        <input type="button" id="updateuser" class="btn btn-primary" value="提交">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
    <script type="text/javascript">

        //初始化表格数据
        $('#userlist').bootstrapTable({
            url: 'queryUserbycond2.action',
            method: 'GET',                      //请求方式（*）
            //toolbar: '#toolbar',              //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: true,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
            pageSize: 5,                     //每页的记录行数（*）
            pageList: [2, 5, 10, 20, 50],        //可供选择的每页的行数（*）
            search: false,                      //是否显示表格搜索
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列（选择显示的列）
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height: 450,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                  //是否显示父子表
            queryParams: function (params) {
                //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                var temp = {
                    rows: params.limit,                         //页面大小
                    page: (params.offset / params.limit) + 1,   //页码
                    username: $("#username").val()
                };
                return temp;
            },
            columns: [{
                field: 'id',
                title: '编号'
            }, {
                field: 'username',
                title: '用户名'
            },
                {
                    field: 'userpwd',
                    title: '密码'
                },
                {
                    field: 'sex',
                    title: '性别'
                },
                {
                    field: 'birthday',
                    title: '出生日期'
                },
                {
                    field: 'height',
                    title: '身高/cm'
                },
                {
                    field: '',
                    width:200,
                    align:'center',
                    title: '操作',
                    formatter: function (value, row, index) {
                        var id = row.id;
                        return '<button class=\"btn btn-success\" data-toggle=\"modal\" data-target=\"#addModal\" onclick=\"edituser('+id+')\" >编辑</button>&nbsp;' +
                            '<button class=\"btn btn-danger\" onclick=\"deluser('+id+')\" >删除</button>';
                    }
                }]
        });

        //查询条件
        $("#btnsearch").click(function () {
            $('#userlist').bootstrapTable("refresh");
        })

        //点击删除按钮，获取id ，删除
        function  deluser(id) {
            var flag=confirm("确定要删除吗？");
            if(flag==true){
                location.href="deleteUser.action?id="+id;
            }
        }

        //点击编辑按钮，获取id ，查询数据，回显在编辑页面
        function edituser(id) {
            $("#edituserwin").modal("show");
                $.get("queryById.action",{"id":id},function (data) {
                    $("#id").val(data.id);
                    $("#username2").val(data.username);
                    $("#userpwd2").val(data.userpwd);
                    $("#birthday2").val(data.birthday);
                    $("#height2").val(data.height);

                    if( data.sex=='男'){
                        $("#nan").attr("checked",true);
                    }else{
                        $("#nv").attr("checked",true);
                    }
                },"json");


        }


        $("#updateuser").click(function () {
            var params = {
                url: "updateUser.action",
                dataType: "text",
                success: function (data) {
                    alert(data)
                }
            }
            $("#updateuser_form").ajaxSubmit(params);
            $("#edituserwin").modal("hide");
            $('#userlist').bootstrapTable("refresh");

        });
    </script>

</body>
</html>

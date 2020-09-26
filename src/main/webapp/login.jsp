<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-09-16
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <style type="text/css">
        html, body {
            height: 100%;
        }

        .box {
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#6699FF', endColorstr='#6699FF'); /*  IE */
            background-image: linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
            background-image: -o-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
            background-image: -moz-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
            background-image: -webkit-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
            background-image: -ms-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);

            margin: 0 auto;
            position: relative;
            width: 100%;
            height: 100%;
        }

        .login-box {
            width: 100%;
            max-width: 500px;
            height: 400px;
            position: absolute;
            top: 50%;

            margin-top: -200px;
            /*设置负值，为要定位子盒子的一半高度*/

        }

        @media screen and (min-width: 500px) {
            .login-box {
                left: 50%;
                /*设置负值，为要定位子盒子的一半宽度*/
                margin-left: -250px;
            }
        }

        .form {
            width: 100%;
            max-width: 500px;
            height: 275px;
            margin: 25px auto 0px auto;
            padding-top: 25px;
        }

        .login-content {
            height: 300px;
            width: 100%;
            max-width: 500px;
            background-color: rgba(255, 250, 2550, .6);
            float: left;
        }


        .input-group {
            margin: 0px 0px 30px 0px !important;
        }

        .form-control,
        .input-group {
            height: 40px;
        }

        .form-group {
            margin-bottom: 0px !important;
        }

        .login-title {
            padding: 20px 10px;
            background-color: rgba(0, 0, 0, .6);
        }

        .login-title h1 {
            margin-top: 10px !important;
        }

        .login-title small {
            color: #fff;
        }

        .link p {
            line-height: 20px;
            margin-top: 30px;
        }

        .btn-sm {
            padding: 8px 24px !important;
            font-size: 16px !important;
        }
    </style>

</head>

<body>
<div class="box">
    <div class="login-box">
        <div class="login-title text-center">
            <h1><small>登录</small></h1>
        </div>
        <div class="login-content ">
            <div class="form">
                <form method="post" id="loginform">
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <input type="text" id="username" name="username" class="form-control" placeholder="用户名">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12  ">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                <input type="password" id="password" name="userpwd" class="form-control"
                                       placeholder="密码">
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-actions">
                        <div class="col-xs-4 col-xs-offset-5">
                            <input id="btnlogins" type="button" value="登录" class="btn btn-sm btn-info"/>
                        </div>
                    </div>
                </form>
                    <div class="form-group">
                        <div class="col-xs-6 link">
                            <p class="text-center remove-margin"><small>忘记密码？</small> <a
                                    href="login2.jsp"><small>人脸识别登录</small></a>
                            </p>
                        </div>
                        <div class="col-xs-6 link">
                            <p class="text-center remove-margin"><small>还没注册?</small>
                                <a href="javascript:void(0)" data-toggle="modal" data-target="#addModal"><small>注册</small></a>
                            </p>
                            <div>
                            <div>
                                <div class="col-*-12">
                                    <div id="toolbar">
                                       </div>
                                    <table id="mytab" class="table table-hover"></table>
                            <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                &times;
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">注册</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form id="adduser_form" method="post">
                                                <div class="form-group">
                                                     用户名：
                                                    <input name="username" class="form-control" placeholder="请输入名称"/>
                                                </div>
                                                <div class="form-group">
                                                    密码：
                                                    <input name="userpwd" class="form-control" placeholder="请输入密码" />
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    性别：
                                                        男<input type="radio" name="sex" value="男"/>
                                                        女<input type="radio" name="sex" value="女" />
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    身高/cm：
                                                        <input type="number" name="height" class="form-control" min="1.00" max="300.00" step="0.01" placeholder="请输入身高" />
                                                </div>
                                                <div class="form-group">
                                                    生日：
                                                    <input name="birthday" class="form-control" type="date"/>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="button" id="zhuce" class="btn btn-primary" value="提交">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $("#btnlogins").click(function () {
        var params = {
            url: "login.action",
            dataType: "text",
            success: function (data) {
                alert(data)
                if (data == "登录成功") {
                    window.location = "show.jsp";
                }
            }
        }
        $("#loginform").ajaxSubmit(params);
    });
    $("#zhuce").click(function () {
        var params = {
            url: "addUser.action",
            dataType: "text",
            success: function (data) {
                alert(data)
                if (data == "注册成功") {
                    window.location = "login.jsp";
                }
            }
        }
        $("#adduser_form").ajaxSubmit(params);
    });
</script>
</body>
</html>

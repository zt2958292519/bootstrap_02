<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/8/5
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<head>
    <title>注册页面</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
</head>
<body>

<form id="adduser_form" method="post">
    <%--validType:'length[6,10]'--%>
    <table align="center">
        <tr>
            <td> 用户名：</td>
            <td><input id="username" name="username" /></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input id="userpwd" name="userpwd" type="password"/></td>
        </tr>
        <tr>
            <td>性别：</td>
            <td>男<input type="radio" name="sex" value="男" checked="checked">
                女<input type="radio" name="sex" value="女"></td>
        </tr>
        <tr>
            <td>身高/cm：</td>
            <td><input type="number" name="height" min="1.00" max="300.00" step="0.01" ></td>
        </tr>
        <tr>
            <td>生日：</td>
            <td><input name="birthday" type="date"/></td>
        </tr>
        <tr>
            <td>
               <input type="button" id="zhuce" value="注册">
        </tr>
    </table>

</form>

<script type="text/javascript">
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

<%--
  Created by IntelliJ IDEA.
  User: ZQ
  Date: 2020/1/21
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">

    $(function () {
        $("#submit").click(function () {
            if ($("[name=userCode]").val() == "" || $("[name=password]").val() == "") {
                alert("账号或密码不能为空！");
            }else{
                if ($("[name=userCode]").val().length == 7 && $("[name=password]").val().length == 6) {
                    $.ajax({
                        url: "dologin",
                        data: "userCode=" + $("[name=userCode]").val() + "&password=" + $("[name=password]").val(),
                        dataType: "json",
                        type: "post",
                        success: function (data) {
                            if (data) {
                                sessionStorage.setItem("userName", $("[name=userCode]").val());
                                location.href = "index";
                            } else if (data == false) {
                                alert("登录失败，登录账号或密码错误，请重新输入")
                            }
                        }
                    });
                } else {
                    alert("账号长度必须为7位，密码长度必须为6位！");
                }
            }
        });
    });
</script>
<body>
<div align="center">
<h2 align="center">图书借阅系统</h2>
<form action="javascript:void(0);" method="post">
    <div>
        登录账号：<input name="userCode" id="userName"/><br/>
        登录密码：<input name="password"/><br/>
        <input type="button" value="登录" id="submit"/>&nbsp;&nbsp;&nbsp;<input type="button" value="注册用户">
    </div>
</form>
</div>
</body>
</html>

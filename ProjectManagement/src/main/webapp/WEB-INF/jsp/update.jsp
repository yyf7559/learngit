<%--
  Created by IntelliJ IDEA.
  User: ZQ
  Date: 2020/1/26
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        tr > td:last-child {
            background-color: pink;
        }
    </style>
</head>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
    $(function () {
        $("#submit").click(function () {
            $.ajax({
                url: "/Project/check",
                data: "id=" + $("[name=id]").val() + "&status=" + $("[name=status]").val(),
                dataType: "json",
                type: "post",
                success: function (data) {
                    if (data == true) {
                        sessionStorage.setItem("msg", "审核成功！");
                        location.href = "/Project/index";
                    } else {
                        sessionStorage.setItem("msg", "审核失败！");
                        location.href = "/Project/index";
                    }
                }, error: function () {
                    alert("请求失败！")
                }
            });
        });
    });
</script>
<body>
<form method="post" action="/Project/check">
    <table border="1" align="center">
        <tr>
            <th colspan="2" style="text-align: center;height: 50px;"><h1 style="position:relative;bottom: -10px;">
                申报项目信息</h1></th>
        </tr>
        <tr>
            <td>项目编号</td>
            <td>${audit.id}<input type="hidden" name="id" value="${audit.id}"/></td>
        </tr>
        <tr>
            <td>项目名称</td>
            <td>${audit.projectName}</td>
        </tr>
        <tr>
            <td>申报开始日期</td>
            <td>
                <fmt:formatDate value="${audit.startDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
            </td>
        </tr>
        <tr>
            <td>申报结束日期</td>
            <td>
                <fmt:formatDate value="${audit.endDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
            </td>
        </tr>
        <tr>
            <td>申报状态</td>
            <td>
                <select name="status">
                    <c:if test="${audit.status == 0}">
                        <option value="0" selected="selected">已申报</option>
                        <option value="1">审核中</option>
                        <option value="2">已审核</option>
                    </c:if>
                    <c:if test="${audit.status == 1}">
                        <option value="1" selected="selected">审核中</option>
                        <option value="2">已审核</option>
                    </c:if>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="background-color: white" align="center">
                <input type="button" id="submit" value="审核"/>&nbsp;&nbsp;<input type="button" value="返回"
                                                                                onclick="history.back();"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>

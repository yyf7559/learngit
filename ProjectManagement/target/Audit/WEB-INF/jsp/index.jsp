<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>

</head>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
    $(function () {
        $("tr:first-child").next().css("background-color", "gray");
        $(".info:even").css("background-color", "pink");
    });

    function page(curPage) {
        $("[name=curPage]").val(curPage);
        $("form").submit();
        sessionStorage.clear();
    }
</script>
<body>
<div>
    <form action="/Project/index" method="post">
        <p align="center" style="position:relative;right: 100px"><label>申报状态：</label>
            <select name="status">
                <option value="">全部</option>
                <option value="0" <c:if test="${status == 0}">selected="selected"</c:if>>已申报</option>
                <option value="1" <c:if test="${status == 1}">selected="selected"</c:if>>审核中</option>
                <option value="2" <c:if test="${status == 2}">selected="selected"</c:if>>已审核</option>
            </select>
            <input type="submit" value="查询"/>
        </p>
        <table border="1" align="center">
            <tr>
                <th colspan="6" style="text-align: center;"><h1 style="position: relative; bottom: -10px;">申报项目列表</h1>
                </th>
            </tr>
            <tr>
                <th>项目编号</th>
                <th>项目名称</th>
                <th>申报开始日期</th>
                <th>申报结束日期</th>
                <th>申报状态</th>
                <th>操作</th>
            </tr>
            <c:forEach var="audit" items="${auditList}">
                <tr class="info">
                    <td>${audit.id}</td>
                    <td>${audit.projectName}</td>
                    <td>
                        <fmt:formatDate value="${audit.startDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
                    </td>
                    <td>
                        <fmt:formatDate value="${audit.endDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
                    </td>
                    <td>
                        <c:if test="${audit.status == 0}">已申报</c:if>
                        <c:if test="${audit.status == 1}">审核中</c:if>
                        <c:if test="${audit.status == 2}">已审核</c:if>
                    </td>
                    <td>
                        <c:if test="${audit.status != 2}"><a href="/Project/update?id=${audit.id}">审核</a></c:if>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="6">
                    <div>
                        <div align="center" style="position: relative;right: -150px;">
                            <span style="color: red" id="msg"></span>
                            <script>
                                document.getElementById("msg").innerHTML = sessionStorage.getItem("msg");
                            </script>
                        </div>
                    </div>
                    <input type="hidden" name="curPage" value=""/>
                </td>
            </tr>
        </table>
        <div align="center">
                    <a href="javascript:;" onclick="page(1)">首页</a>&nbsp;&nbsp;
                    <a href="javascript:;" onclick="page(${curPage-1})">上一页</a>&nbsp;
                    <a href="javascript:;" onclick="page(${curPage+1})">下一页</a>&nbsp;
                    <a href="javascript:;" onclick="page(${totalPageCount})">尾页</a>&nbsp;
                    <span>第${curPage}页/共${totalPageCount}页</span>
        </div>
    </form>
</div>
</body>
</html>

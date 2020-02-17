<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
    $(function () {
        $(".even:odd").css("background-color", "pink");
    });

    function page(curPage) {
        $("[name=curPage]").val(curPage);
        $("form").submit();
    }
</script>
<body>
<h2 align="center">图书借阅系统</h2>
<div align="center">
    <form method="post" action="/Book/index">
        <div>
            <p>
                <label>图书分类：</label>
                <select name="book_type">
                    <option value="0">——请选择——</option>
                    <option value="1" <c:if test="${book_type == 1}">selected="selected"</c:if>>小说</option>
                    <option value="2" <c:if test="${book_type == 2}">selected="selected"</c:if>>文学</option>
                    <option value="3" <c:if test="${book_type == 3}">selected="selected"</c:if>>传记</option>
                    <option value="4" <c:if test="${book_type == 4}">selected="selected"</c:if>>艺术</option>
                    <option value="5" <c:if test="${book_type == 5}">selected="selected"</c:if>>少儿</option>
                    <option value="6" <c:if test="${book_type == 6}">selected="selected"</c:if>>经济</option>
                    <option value="7" <c:if test="${book_type == 7}">selected="selected"</c:if>>管理</option>
                    <option value="8" <c:if test="${book_type == 8}">selected="selected"</c:if>>科技</option>
                    <c:if test="${book_type == 1}">selected="selected"</c:if>
                </select>

                <label>图书名称：</label><input name="book_name" value="${book_name}"/>
                &nbsp;&nbsp;&nbsp;
                <label>是否借阅：</label>
                <select name="is_borrow">
                    <option value="-1">--请选择--</option>
                    <option value="0" <c:if test="${is_borrow == 0}">selected="selected"</c:if>>未借阅</option>
                    <option value="1" <c:if test="${is_borrow == 1}">selected="selected"</c:if>>已借阅</option>
                </select>
                &nbsp;&nbsp;&nbsp;
                <input type="submit" value="查询"/>
            </p>
        </div>
        <div>
            <p style="position: relative;right: -280px;">
                <span>当前用户：</span><span id="loginName"></span>
                <script>document.getElementById("loginName").innerHTML = sessionStorage.getItem("userName")</script>
                <a href="javascript:;"
                   onclick="if (confirm('是否退出系统？')){sessionStorage.clear();location.href='/Book/login';}">退出</a>
            </p>
            <table border="1">
                <tr bgcolor="#9acd32">
                    <th>图书编号</th>
                    <th>图书分类</th>
                    <th>图书名称</th>
                    <th>作者</th>
                    <th>出版社</th>
                    <th>操作</th>
                </tr>
                <c:if test="${bookList != null}">
                    <c:forEach var="book" items="${bookList}">
                        <tr class="even">
                            <td>${book.book_code}</td>
                            <td>
                                <c:if test="${book.book_type==1}">小说</c:if>
                                <c:if test="${book.book_type==2}">文学</c:if>
                                <c:if test="${book.book_type==3}">传记</c:if>
                                <c:if test="${book.book_type==4}">艺术</c:if>
                                <c:if test="${book.book_type==5}">少儿</c:if>
                                <c:if test="${book.book_type==6}">经济</c:if>
                                <c:if test="${book.book_type==7}">管理</c:if>
                                <c:if test="${book.book_type==8}">科技</c:if>
                            </td>
                            <td>${book.book_name}</td>
                            <td>${book.book_author}</td>
                            <td>${book.publish_press}</td>
                            <td>
                                <c:if test="${book.is_borrow== 0}">
                                    <a href="">申请借阅</a>
                                </c:if>
                                <c:if test="${book.is_borrow== 1}">
                                    <span style="color:red">已借阅</span>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty bookList}">
                    <td colspan="6" style="text-align: center">对不起，没有符合查询条件的结果！</td>
                </c:if>
            </table>
        </div>
        <input type="hidden" name="curPage" value=""/>
        <br>
        <c:if test="${!empty bookList}">
            <div align="center">
                <a href="javascript:;" onclick="page(${curPage-1})">上一页</a>&nbsp;&nbsp;
                <c:forEach begin="1" end="${totalPageCount}" var="i">
                    <a href="javascript:;" onclick="page(${i})"
                       <c:if test="${curPage == i}">style="color: #ff0000"</c:if>>${i}</a>
                </c:forEach>
                &nbsp; &nbsp;<a href="javascript:;"
                                 onclick="page(${curPage + 1})">下一页</a>&nbsp;<span>共${totalPageCount}页</span>
                &nbsp;<span>到第<input type="text" name="pageNo"/>页 </span><input type="button" value="确定"
                                                                                onclick="page($('[name=pageNo]').val())"/>
            </div>
        </c:if>
    </form>
</div>

</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.BMS.model.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员</title>
    <link href="static/css/index.css" type="text/css" rel="stylesheet">
</head>
<body>
<jsp:include page="top.jsp"/>
<div id="main">
    <div class="navigation">
        <ul>
            <li><a href="admin.jsp">主页</a></li>
            <li><a class="active" href="book.jsp">图书管理</a></li>
            <li><a href="user.jsp">用户管理</a></li>
            <div id="readerBlock">欢迎回来&nbsp;:
                <%
                    Admin admin = (Admin) session.getAttribute("admin");
                %>
                <%=admin.getUserName()%>
                &nbsp;<a href="logoutServlet">注销</a>
            </div>
        </ul>
    </div>
    <hr class="hr"/>
    <div id="query">
        <form action="adminBookServlet">
            <label for="bookName">请输入查询的图书：</label>
            <input type="text" name="bookName" id="bookName">
            <input type="submit" value="查询">
        </form>
    </div>
    <hr class="hr"/>
    <div>
        <table class="table">
            <thead>
            <tr>
                <th>图书编号</th>
                <th>图书名称</th>
                <th>图书价格</th>
                <th>图书作者</th>
                <th>出版社</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.list3}" var="book">
                <tr>
                    <td>${book.id}</td>
                    <td>${book.name}</td>
                    <td>${book.price}</td>
                    <td>${book.author}</td>
                    <td>${book.publisher}</td>
                    <c:choose>
                        <c:when test="${book.state}">
                            <td>借阅人：${book.borrower}</td>
                            <td>
                                <a href="returnBookServlet?b_id=${book.id}&add=book">还书</a>
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td>空闲</td>
                            <td></td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>

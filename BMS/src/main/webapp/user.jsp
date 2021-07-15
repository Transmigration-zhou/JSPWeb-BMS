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
            <li><a href="book.jsp">图书管理</a></li>
            <li><a class="active" href="user.jsp">用户管理</a></li>
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
        <form action="adminReaderServlet">
            <label for="userName">请输入查询的用户：</label>
            <input type="text" name="userName" id="userName">
            <input type="submit" value="查询">
        </form>
    </div>
    <hr class="hr"/>
    <div>
        <table class="table">
            <thead>
            <tr>
                <th>读者ID</th>
                <th>读者名称</th>
                <th>读者电话</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.list4}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.userName}</td>
                    <td>${user.phone}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>

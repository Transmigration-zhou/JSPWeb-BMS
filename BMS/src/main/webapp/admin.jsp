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
            <li><a class="active" href="admin.jsp">主页</a></li>
            <li><a href="book.jsp">图书管理</a></li>
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

    <div id="main_bg">
        <span style="color: #f0f8ff; font-size: xxx-large;text-align: center;display:block;">欢迎使用图书管理系统</span>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>

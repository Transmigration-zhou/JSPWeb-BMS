<%@ page import="com.BMS.model.Reader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link href="static/css/index.css" type="text/css" rel="stylesheet">
</head>
<body>
<%
    Reader reader = (Reader) session.getAttribute("reader");
%>
<jsp:include page="top.jsp"/>
<div id="main">
    <div class="navigation">
        <ul>
            <li><a class="active" href="index.jsp">主页</a></li>
            <li><a href="query.jsp">查询图书</a></li>
            <li><a href="queryBorrowServlet?u_id=<%=reader.getId()%>">当前借阅</a></li>
            <li><a href="home.jsp">个人中心</a></li>
            <div id="readerBlock">欢迎回来&nbsp;:
                <%=reader.getUserName()%>
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

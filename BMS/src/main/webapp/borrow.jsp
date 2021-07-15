<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.BMS.model.Reader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>当前借阅</title>
    <link href="static/css/index.css" type="text/css" rel="stylesheet">
</head>
<body>
<jsp:include page="top.jsp"/>
<%
    Reader reader = (Reader) session.getAttribute("reader");
%>
<div id="main">
    <div class="navigation">
        <ul>
            <li><a href="index.jsp">主页</a></li>
            <li><a href="query.jsp">查询图书</a></li>
            <li><a class="active" href="queryBorrowServlet?u_id=<%=reader.getId()%>">当前借阅</a></li>
            <li><a href="home.jsp">个人中心</a></li>
            <div id="readerBlock">欢迎回来&nbsp;:
                <%=reader.getUserName()+" "%>
                <a href="logoutServlet">注销</a>
            </div>
        </ul>
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
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.list2}" var="book">
                <tr>
                    <td>${book.id}</td>
                    <td>${book.name}</td>
                    <td>${book.price}</td>
                    <td>${book.author}</td>
                    <td>${book.publisher}</td>
                    <td><a href="returnBookServlet?b_id=${book.id}&add=borrow">还书</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.BMS.model.Reader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书查询</title>
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
            <li><a class="active" href="query.jsp">查询图书</a></li>
            <li><a href="queryBorrowServlet?u_id=<%=reader.getId()%>">当前借阅</a></li>
            <li><a href="home.jsp">个人中心</a></li>
            <div id="readerBlock">欢迎回来&nbsp;:
                <%=reader.getUserName()%>
                &nbsp;<a href="logoutServlet">注销</a>
            </div>
        </ul>
    </div>
    <hr class="hr"/>

    <div id="query">
        <form action="queryBookServlet">
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
                <th>状态及操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.list}" var="book">
                <tr>
                    <td>${book.id}</td>
                    <td>${book.name}</td>
                    <td>${book.price}</td>
                    <td>${book.author}</td>
                    <td>${book.publisher}</td>
                    <c:choose>
                        <c:when test="${book.state}">
                            <td>已被借阅</td>
                        </c:when>
                        <c:otherwise>
                            <td>空闲&nbsp;&nbsp;<a href="borrowBookServlet?b_id=${book.id}&u_id=<%=reader.getId()%>">借阅</a></td>
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

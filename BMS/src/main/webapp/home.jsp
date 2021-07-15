<%@ page import="com.BMS.model.Reader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <link href="static/css/index.css" type="text/css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<%
    Reader reader = (Reader) session.getAttribute("reader");
%>
<jsp:include page="top.jsp"/>
<div id="main">
    <div class="navigation">
        <ul>
            <li><a href="index.jsp">主页</a></li>
            <li><a href="query.jsp">查询图书</a></li>
            <li><a href="queryBorrowServlet?u_id=<%=reader.getId()%>">当前借阅</a></li>
            <li><a class="active" href="home.jsp">个人中心</a></li>
            <div id="readerBlock">欢迎回来&nbsp;:
                <%=reader.getUserName()%>
                &nbsp;<a href="logoutServlet">注销</a>
            </div>
        </ul>
    </div>
    <hr class="hr"/>

    <div id="profile">
        <div class="hd"><h3 class="tt" style="margin-left: 10px;">我的资料</h3></div>
        <div class="bd">
            <form class="form-horizontal" action="uploadImgServlet" method="post" enctype="multipart/form-data">
                <div class="avatar"><img id="showUpImg" src="static/files/nullIDHeadImage.jpeg" alt="头像">
                    <a class="upload">点击更换</a><input id="uploadImg" type="file" name="usrHeadImage" accept="image/png, image/jpeg, image/gif, image/jpg" class="upload-input">
                </div>
                <div class="form-group">
                    ID:  <%=reader.getId()%>
                </div>
                <div class="form-group">
                    用户名:  <%=reader.getUserName()%>
                </div>
                <div class="form-group">
                    手机号:  <%=reader.getPhone()%>
                </div>
                <div class="ft">
                    <input type="submit" id="btn_save" class="btn btn-primary" value="保存"/>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
<script>
    $("#uploadImg").change(function () {
        var url, imgBase64;
        //获取file对象URL
        if (navigator.userAgent.indexOf("MSIE") >= 1) { // IE
            url = document.getElementById('uploadImg').value;
        } else if (navigator.userAgent.indexOf("Firefox") > 0) { // Firefox
            url = window.URL.createObjectURL(document.getElementById('uploadImg').files.item(0));
        } else if (navigator.userAgent.indexOf("Chrome") > 0) { // Chrome
            url = window.URL.createObjectURL(document.getElementById('uploadImg').files[0]);
        }

        // 创建Image对象
        var image = new Image();
        image.src = url;
        image.onload = function () {
            function getBase64Image(img) {
                var canvas = document.createElement("canvas");
                canvas.width = img.width;
                canvas.height = img.height;
                var ctx = canvas.getContext("2d");
                ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
                var dataURL = canvas.toDataURL('image/jpeg');
                return dataURL;
            }
            imgBase64 = getBase64Image(image);
            $("#showUpImg").attr("src",image.src);
        }
    });
</script>
</html>

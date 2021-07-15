<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <link rel="stylesheet" type="text/css" href="static/css/register.css"/>
</head>
<body>
<div id="register" class="register">
    <div class="register-header">
        <img src="static/images/logo.png">
    </div>
    <el-form :model="registerForm" :rules="rules" ref="registerForm" label-width="100px" class="registerForm">
        <el-form-item label="用户名" prop="userName">
            <el-input type="text" v-model="registerForm.userName" placeholder="请输入用户名"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
            <el-input type="password" v-model="registerForm.password" autocomplete="off" placeholder="请输入密码"></el-input>
        </el-form-item>
        <el-form-item label="确认密码" prop="checkPass">
            <el-input type="password" v-model="registerForm.checkPass" autocomplete="off"
                      placeholder="请再次输入密码"></el-input>
        </el-form-item>
        <el-form-item label="手机号" prop="phone">
            <el-input type="text" v-model="registerForm.phone" autocomplete="off" placeholder="请输入手机号"></el-input>
        </el-form-item>
        <el-form-item label="验证码" prop="validate">
            <el-input type="text" v-model="registerForm.validate" autocomplete="off" placeholder="请输入验证码"></el-input>
            <img id="img" src="http://localhost:8080/BMS_war_exploded/validateCodeServlet" onclick="changeImg()"/>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="submitForm('registerForm')">注册</el-button>
            <el-button @click="resetForm('registerForm')">重置</el-button>
        </el-form-item>
        <a href="login.jsp">已有账号请登录</a>
    </el-form>
</div>
</body>
<script src="static/js/vue.js" type="text/javascript" charset="utf-8"></script>
<script src="https://unpkg.com/element-ui/lib/index.js" type="text/javascript" charset="utf-8"></script>
<script src="static/js/vue-resource.js" type="text/javascript" charset="utf-8"></script>
<script src="static/js/register.js" type="text/javascript" charset="utf-8"></script>
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script type="text/javascript">
    function changeImg() {
        document.getElementById("img").src="http://localhost:8080/BMS_war_exploded/validateCodeServlet?n="+Math.random();
    }
</script>
</html>

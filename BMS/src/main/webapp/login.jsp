<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <link rel="stylesheet" type="text/css" href="static/css/login.css"/>
</head>
<body>

<div id="login" class="login">
    <div class="login-header">
        <img src="static/images/logo.png">
    </div>
    <el-form :model="loginForm" :rules="rules" ref="loginForm" label-width="100px" class="loginForm"
             hide-required-asterisk="true">
        <el-form-item label="用户名" prop="userName">
            <el-input type="text" v-model="loginForm.userName" placeholder="请输入用户名"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
            <el-input type="password" v-model="loginForm.password" placeholder="请输入密码"></el-input>
        </el-form-item>
        <el-form-item prop="userType">
            <el-radio-group v-model="loginForm.userType">
                <el-radio label="读者"></el-radio>
                <el-radio label="管理员"></el-radio>
            </el-radio-group>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="submitForm('loginForm')">登录</el-button>
            <el-button @click="resetForm('loginForm')">重置</el-button>
        </el-form-item>
        <a href="register.jsp">没有账号请注册</a>
    </el-form>
</div>
</body>
<script src="static/js/vue.js" type="text/javascript" charset="utf-8"></script>
<script src="https://unpkg.com/element-ui/lib/index.js" type="text/javascript" charset="utf-8"></script>
<script src="static/js/vue-resource.js" type="text/javascript" charset="utf-8"></script>
<script src="static/js/login.js" type="text/javascript" charset="utf-8"></script>
</html>

var Main = {
    data() {
        return {
            loginForm: {
                userName: '',
                password: '',
                userType: ''
            },
            rules: {
                userName: [
                    {required: true, message: '请输入用户名', trigger: 'blur'}
                ],
                password: [
                    {required: true, message: '请输入密码', trigger: 'blur'}
                ],
                userType: [
                    {required: true, message: '请至少选择一个用户类型', trigger: 'change'}
                ]
            }
        };
    },
    methods: {
        submitForm(formName) {
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    this.$http.get('http://localhost:8080/BMS_war_exploded/loginServlet', {
                        params: {
                            userName: this.loginForm.userName,
                            password: this.loginForm.password,
                            userType: this.loginForm.userType
                        }
                    }).then(function (data) {
                        if (data.data.ok != 1) {
                            alert(data.data.msg);
                        } else {
                            if(this.loginForm.userType==="管理员") window.location.replace("http://localhost:8080/BMS_war_exploded/admin.jsp");
                            else window.location.replace("http://localhost:8080/BMS_war_exploded/index.jsp");
                        }
                    }, function () {
                        console.log('传输失败');
                    });
                }
            });
        },
        resetForm(formName) {
            this.$refs[formName].resetFields();
        }
    }
}
var Ctor = Vue.extend(Main)
new Ctor().$mount('#login')
var Main = {
    data() {
        var validatePass = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入密码'));
            } else {
                if (this.registerForm.checkPass !== '') {
                    this.$refs.registerForm.validateField('checkPass');
                }
                callback();
            }
        };
        var validatePass2 = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请再次输入密码'));
            } else if (value !== this.registerForm.password) {
                callback(new Error('两次输入密码不一致!'));
            } else {
                callback();
            }
        };
        var validatePhone = async (rule, value, callback) => {
            if (value === '') {
                callback(new Error('手机号不能为空'));
            } else {
                const reg = /^1[3|4|5|7|8][0-9]\d{8}$/
                if ((reg.test(value))) {
                    callback();
                } else {
                    callback(new Error('请输入正确的手机号'));
                }
            }
        };

        return {
            registerForm: {
                userName: '',
                password: '',
                checkPass: '',
                phone: '',
                validate: ''
            },
            rules: {
                userName: [
                    {required: true, message: '请输入用户名', trigger: 'blur'},
                    {min: 2, max: 10, message: '长度在 2 到 10 个字符', trigger: 'blur'}
                ],
                password: [
                    {required: true, validator: validatePass, trigger: 'blur'}
                ],
                checkPass: [
                    {required: true, validator: validatePass2, trigger: 'blur'}
                ],
                phone: [
                    {required: true, validator: validatePhone, trigger: 'blur'}
                ],
                validate: [
                    {required: true, message: '请输入验证码', trigger: 'blur'}
                ]
            }
        };
    },
    methods: {
        submitForm(formName) {
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    this.$http.get('http://localhost:8080/BMS_war_exploded/regServlet', {
                        params: {
                            userName: this.registerForm.userName,
                            password: this.registerForm.password,
                            phone: this.registerForm.phone,
                            validate: this.registerForm.validate
                        }
                    }).then(function (data) {
                        if (data.data.ok != 1) {
                            alert(data.data.msg);
                        } else {
                            alert(data.data.msg);
                            window.location.replace("http://localhost:8080/BMS_war_exploded/login.jsp");
                        }
                    }, function () {
                        console.log('传输失败');
                    });
                } else {
                    console.log('error submit!!');
                    return false;
                }
            });
        },
        resetForm(formName) {
            this.$refs[formName].resetFields();
        }
    }
}
var Ctor1 = Vue.extend(Main)
new Ctor1().$mount('#register')
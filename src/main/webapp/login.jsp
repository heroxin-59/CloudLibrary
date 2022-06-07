<%--
  Created by IntelliJ IDEA.
  User: hero_
  Date: 2022/3/31
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户登录</title>
    <script src="https://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
    <style>
        * {
            box-sizing:border-box;
        }
        body {
            font-family:'Montserrat',sans-serif;
            background:#f6f5f7;
            display:flex;
            flex-direction:column;
            justify-content:center;
            align-items:center;
            height:100vh;
            margin:-20px 0 50px;
        }
        h1 {
            font-weight:bold;
            margin:0;
        }
        p {
            font-size:14px;
            line-height:20px;
            letter-spacing:.5px;
            margin:20px 0 30px;
        }
        span {
            font-size:12px;
        }
        a {
            color:#333;
            font-size:14px;
            text-decoration:none;
            margin:15px 0;
        }
        .dowebok {
            background:#fff;
            border-radius:10px;
            box-shadow:0 14px 28px rgba(0,0,0,.25),0 10px 10px rgba(0,0,0,.22);
            position:relative;
            overflow:hidden;
            width:768px;
            max-width:100%;
            min-height:480px;
        }
        .form-container form {
            background:#fff;
            display:flex;
            flex-direction:column;
            padding:0 50px;
            height:100%;
            justify-content:center;
            align-items:center;
            text-align:center;
        }
        .social-container {
            margin:20px 0;
        }
        .social-container a {
            border:1px solid #ddd;
            border-radius:50%;
            display:inline-flex;
            justify-content:center;
            align-items:center;
            margin:0 5px;
            height:40px;
            width:40px;
        }
        .social-container a:hover {
            background-color:#eee;
        }
        .form-container input {
            background:#eee;
            border:none;
            padding:12px 15px;
            margin:8px 0;
            width:100%;
            outline:none;
        }
        button {
            border-radius:20px;
            border:1px solid lightseagreen;
            background:lightseagreen;
            color:#fff;
            font-size:12px;
            font-weight:bold;
            padding:12px 45px;
            letter-spacing:1px;
            text-transform:uppercase;
            transition:transform 80ms ease-in;
            cursor:pointer;
        }
        button:active {
            transform:scale(.95);
        }
        button:focus {
            outline:none;
        }
        button.ghost {
            background:transparent;
            border-color:#fff;
        }
        .form-container {
            position:absolute;
            top:0;
            height:100%;
            transition:all .6s ease-in-out;
        }
        .sign-in-container {
            left:0;
            width:50%;
            z-index:2;
        }
        .sign-up-container {
            left:0;
            width:50%;
            z-index:1;
            opacity:0;
        }
        .overlay-container {
            position:absolute;
            top:0;
            left:50%;
            width:50%;
            height:100%;
            overflow:hidden;
            transition:transform .6s ease-in-out;
            z-index:100;
        }
        .overlay {
            background:lightseagreen;
            background:linear-gradient(to right,lightseagreen,lightseagreen) no-repeat 0 0 / cover;
            color:#fff;
            position:relative;
            left:-100%;
            height:100%;
            width:200%;
            transform:translateY(0);
            transition:transform .6s ease-in-out;
        }
        .overlay-panel {
            position:absolute;
            top:0;
            display:flex;
            flex-direction:column;
            justify-content:center;
            align-items:center;
            padding:0 40px;
            height:100%;
            width:50%;
            text-align:center;
            transform:translateY(0);
            transition:transform .6s ease-in-out;
        }
        .overlay-right {
            right:0;
            transform:translateY(0);
        }
        .overlay-left {
            transform:translateY(-20%);
        }
        /* Move signin to right */
        .dowebok.right-panel-active .sign-in-container {
            transform:translateY(100%);
        }
        /* Move overlay to left */
        .dowebok.right-panel-active .overlay-container {
            transform:translateX(-100%);
        }
        /* Bring signup over signin */
        .dowebok.right-panel-active .sign-up-container {
            transform:translateX(100%);
            opacity:1;
            z-index:5;
        }
        /* Move overlay back to right */
        .dowebok.right-panel-active .overlay {
            transform:translateX(50%);
        }
        /* Bring back the text to center */
        .dowebok.right-panel-active .overlay-left {
            transform:translateY(0);
        }
        /* Same effect for right */
        .dowebok.right-panel-active .overlay-right {
            transform:translateY(20%);
        }
    </style>
</head>

<%--<script type="text/javascript">--%>
<%--    //onblur失去焦点事件，用户离开输入框时执行 JavaScript 代码：--%>
<%--    //函数1：验证用户名格式--%>
<%--    function validate_username(username) {--%>

<%--        if (username != "${query.user_name}") {--%>
<%--            document.getElementById("test_user").innerHTML = "<font color='green' size='3px'>√用户名正确</font>";--%>
<%--        } else {--%>
<%--            document.getElementById("test_user").innerHTML = "<font color='red' size='3px'>用户名错误</font>";--%>
<%--        }--%>
<%--    }--%>

<%--    //函数2：验证密码是否符合要求--%>
<%--    function validate_password(password) {--%>
<%--        //^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6-10}$--%>
<%--        var passwordReg = /^[a-zA-Z]\w{5,17}$/;--%>
<%--        if (password != "${query.password}" && password.search(passwordReg) != -1) {--%>
<%--            document.getElementById("test_pw").innerHTML = "<font color='green' size='3px'>√密码格式正确</font>";--%>
<%--        } else {--%>
<%--            document.getElementById("test_pw").innerHTML = "<font color='red' size='3px'>亲，您输入的密码格式有误哦</font>";--%>
<%--            // alert("密码由数字和字母组成!");--%>
<%--        }--%>
<%--    }--%>

<%--    //函数3：验证两次输入的密码是否一样--%>
<%--    function validate_password2(password2) {--%>
<%--        var password = document.getElementById("password").value;--%>
<%--        //测试：console.log(password);--%>
<%--        //测试：console.log(password2);--%>
<%--        if (password == "${query.password}") {--%>
<%--            document.getElementById("is_test_pw").innerHTML = "<font color='red' size='3px'>密码不为空</font>";--%>
<%--        } else if (password == password2) {--%>
<%--            document.getElementById("is_test_pw").innerHTML = "<font color='green' size='3px'>√两次输入的密码相同</font>";--%>
<%--        } else {--%>
<%--            document.getElementById("is_test_pw").innerHTML = "<font color='red' size='3px'>两次输入的密码不相同</font>";--%>
<%--            // console.log("密码由数字和字母组成!");--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
<body>
<div class="dowebok" id="dowebok">
    <div class="form-container sign-up-container">
        <form action="${pageContext.request.contextPath}/user/init" method="post">
            <h1>注册</h1>

            <span>请输入您的信息</span>
            <input type="email" id="idcard" name="user_email" placeholder="邮箱" required>

            <input type="text" id="Username" name="user_name" placeholder="用户名" required
                   onblur="validate_username(this.value)">

            <input type="password" id="Password" name="user_password" placeholder="以字母开头只能包含字母、数字和下划线" required
                   onblur="validate_password(this.value)">
            <input type="password" id="Password2" name="user_password2" onblur="validate_password2(this.value)" placeholder="确认密码">
            <button type="submit">注册</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form action="${pageContext.request.contextPath}/user/login" method="post">
            <h1>登录</h1>

            <span>请输入您的用户信息</span>
            <input type="text" name="user_email" placeholder="邮箱" required>
            <input type="text" name="user_name" placeholder="用户名" required>
            <input type="password" name="user_password" placeholder="密码" required>
            <a href="${pageContext.request.contextPath}/forget.jsp">忘记密码？</a>
            <button type="submit">登录</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>已有帐号？</h1>
                <p>请使用您的帐号进行登录</p>
                <button class="ghost" id="signIn">登录</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>没有帐号？</h1>
                <p>立即注册加入我们，和我们一起开始旅程吧</p>
                <button class="ghost" id="signUp">注册</button>
            </div>
        </div>
    </div>
</div>

<script>
    var signUpButton = document.getElementById('signUp')
    var signInButton = document.getElementById('signIn')
    var container = document.getElementById('dowebok')

    signUpButton.addEventListener('click', function() {
        container.classList.add('right-panel-active')
    })

    signInButton.addEventListener('click', function() {
        container.classList.remove('right-panel-active')
    })
</script>

</body>
</html>



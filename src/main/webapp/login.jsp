<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <title>高校实验室管理系统</title>
    <meta charset="UTF-8">
    <script src="layui/jquery.min.js"></script>
    <script src="layui/jquery.cookie.js"></script>
    <script src="layui/layui.all.js"></script>
    <style type="text/css">
        body {
            text-align: center;
            background-size: 100%;
            color: white;
        }
        
        div {
            background-color: rgba(255, 255, 255, 0.3);
            width: 400px;
            height: 280px;
            margin: 80px auto;
            padding-top: 10px;
            border-radius: 10px;
            box-shadow: 1px 1px 2px lightgray;
            text-align: center;
            position: relative;
        }
        
        p {
            font-size: 20px;
        }
        
        #login {
            width: 170px;
            border: 0px;
            line-height: 0.5;
            padding: 10px 20px;
            margin-top: 8px;
            background-color: #50D6DE;
            color: white;
            cursor: pointer;
        }
        
        input {
            height: 24px;
            width: 200px;
            background-color: rgba(255, 255, 255, 0.5);
            border: 1px solid gray;
            padding: 0 5px;
            border: 0;
        }
        
        #bgvid {
            position: fixed;
            right: 0;
            bottom: 0;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: -100;
            background: url(Images/Desert.png) no-repeat;
            background-size: cover;
        }
        
        .ipt {
            width: 130px;
            height: 30px;
        }
        
        #ma {
            width: 70px;
            height: 35px;
            font-size: 22px;
            text-align: center;
            line-height: 30px;
            display: inline-block;
            border: 1px solid #ccc;
            vertical-align: middle;
        }
        
        .huan {
            color: black;
            text-decoration: none;
        }
    </style>
</head>

<body>
    <form class="form-signin" method="post" action="user/verify.action">
        <div>
            <h2 class="form-signin-heading">登录系统</h2>

            <p>账号：<input type="text" name="userName" id="account" placeholder="请输入账户"></p>
            <p>密码：<input type="password" name="password" id="pass" placeholder="密码"></p>
            <!-- onkeyup监听键盘输入 -->
            <input type="text" placeholder="请输入验证码" class="ipt" onkeyup="inputCode(this)" style="border: 1px solid #ccc;">
            <a href="#" onclick="createCode()" class="huan"><span id="ma"></span>&nbsp;换一张</a><br>
            <p><button id="login" type="button">登录</button></p>
        </div>
    </form>
    <video autoplay loop poster="Images/Desert.png" id="bgvid"> 
		<source src="video/movie.mp4" type="video/mp4" id="source1">
    </video>
    <script>
        var code; //定义存储4位随机验证码的变量
        createCode(); //函数，执行验证码生成的过程
        var flag = 0;

        function createCode() {
            code = "";
            var codeLength = 4; //验证码长度
            var chekCode = document.getElementById("ma"); //去查找元素节点
            var codeChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
            for (var i = 0; i < codeLength; i++) {
                //Math.floor 取整
                //Math.random 随机生成0-1的之间的小数
                var charNum = Math.floor(Math.random() * 52);
                code += codeChar[charNum];
            }
            if (chekCode) { //判断元素节点是否存在
                chekCode.innerHTML = code;
            }
        }

        function inputCode(obj) {
            var inputCodeValue = obj.value; //获取用户输入的信息，obj代表文本框，value代表用户输入的值
            var loginBtn = document.getElementById("login"); //去查找元素节点
            if (inputCodeValue.length < 0) {
                $(".ipt").attr("style", "border: 2px solid red;");
                loginBtn.setAttribute("type", "button");
                flag = 0;
            } else if (inputCodeValue.toUpperCase() != code.toUpperCase()) { //将所有的验证码全部转换为大写
                $(".ipt").attr("style", "border: 2px solid red;");
                loginBtn.setAttribute("type", "button");
                flag = 1;
            } else {
                $(".ipt").attr("style", "border: 2px solid green;");
                loginBtn.setAttribute("type", "submit");
                flag = 2;
            }
        }
    </script>
</body>

<script type="text/javascript">
    $("#login").click(function() {
        if (flag == 2) {
        	$.cookie('user_account', $("#account").val());
            $.cookie('user_pwd', $("#pass").val());
        } else if (flag == 1) {
            alert("验证码出错!");
        } else if (flag == 0) {
            alert("请输入验证码!");
        }
    });
</script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../layui/css/layui.css" media="all">
    <script src="../layui/layui.all.js"></script>
    <script src="../layui/jquery.min.js"></script>
    <script src="../layui/jquery.cookie.js"></script>
    <title></title>
    <style>
        body {
            margin: 20px;
        }
    </style>
</head>

<body>
    <fieldset class="layui-elem-field">
        <legend>修改用户信息</legend>
        <div class="layui-field-box">
            <form class="layui-form" action="../user/editInfo.action">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="user_name" required lay-verify="required" placeholder="请输入用户姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">用户密码</label>
                    <div class="layui-input-block">
                        <input type="text" name="user_pwd" required lay-verify="required" placeholder="请输入用户密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">用户电话</label>
                    <div class="layui-input-block">
                        <input type="text" name="user_tel" required lay-verify="required" placeholder="请输入用户电话" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button id="submit" class="layui-btn" lay-submit lay-filter="formDemo"><i class="layui-icon">&#xe610;</i>修改</button>
                        <a href="../main_frame.html" class="layui-btn layui-btn-normal example"><i class="layui-icon">&#xe705;</i>返回</a>
                    </div>
                </div>
            </form>
        </div>
    </fieldset>
</body>
</html>
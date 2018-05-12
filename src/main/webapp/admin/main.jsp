<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>高校实验室管理系统</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/jquery.min.js"></script>
    <script src="../layui/jquery.cookie.js"></script>
    <script src="../layui/layui.all.js"></script>
    <style>
        #main {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 99%;
            border: 0;
        }
    </style>
</head>

<body class="layui-layout-body">
	<audio id="audio" autoplay></audio>
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header layui-bg-cyan">
            <div class="layui-logo">高校实验室管理系统</div>
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a href="javascript:;" id="headerImg">
                    </a>
                </li>
                <li class="layui-nav-item"><a id="cancel" href="logout.action">🚪 注销</a></li>
            </ul>
        </div>

        <div class="layui-side layui-bg-cyan">
            <div class="layui-side-scroll">
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree layui-bg-cyan" lay-filter="test">
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;">🧖 用户管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="../admin/user.jsp" target="main">🧖 查询用户</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;">🏘️ 实验室管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="../admin/lab.jsp" target="main">🏘️ 查询实验室信息</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;">🔬 设备管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="../admin/device.jsp" target="main">🔬 查询设备信息</a></dd>
                        </dl>
                 	</li>
                 	<li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;">✌ 审批模块</a>
                        <dl class="layui-nav-child">
                            <dd><a href="../admin/apply_device.jsp" target="main">✌ 设备维修申请审批</a></dd>
                            <dd><a href="../admin/apply_lab.jsp" target="main">✌ 实验室申请审批</a></dd>
                        </dl>
                 	</li>
                 	<li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;">📋 统计报表</a>
                        <dl class="layui-nav-child">
                            <dd><a href="../admin/charts_lab.jsp" target="main">📋 实验室历史借用总次数</a></dd>
                            <dd><a href="../admin/charts_device.jsp" target="main">📋 设备历史借用总次数</a></dd>
                        </dl>
                 	</li>
                </ul>
            </div>
        </div>

        <div class="layui-body">
            <!-- 内容主体区域 -->
                <iframe src="../main_frame.html" frameborder="0" name="main" id="main"></iframe>
        </div>

        <div class="layui-footer">
            <!-- 底部固定区域 -->
            Powered by <a href="https://blog.hdqyf.club/" style="text-decoration: none;color: #00F7DE;">ZQWZ</a> Theme <a href="https://blog.hdqyf.club/" style="text-decoration: none;color: #00F7DE;">Garen</a> @2018 Garen
        </div>
    </div>
    <script src="../layui/layui.all.js"></script>
    <script>
        //JavaScript代码区域
        layui.use('element', function() {
            var element = layui.element;

        });

        $.ajax({
            url: "backUser.action",
            type: "get",
            dataType: "json",
            success: function(data) {
                $("#audio").attr("src", "https://sp0.baidu.com/-rM1hT4a2gU2pMbgoY3K/gettts?lan=zh&text='+欢迎:" + data.user_name + "来到高校实验室管理系统'&spd=5&source=web");
                if (data.user_type == "用户") {
                    $("#headerImg").html('<img src="../Images/head1.jpg" class="layui-nav-img" />' + data.user_name);
                }
                if (data.user_type == "管理员") {
                    $("#headerImg").html('<img src="../Images/head2.jpg" class="layui-nav-img" />' + data.user_name);
                }
            },
            error: function() {
                layer.open({
                    title: '系统提醒',
                    content: '系统未知错误',
                    icon: 2
                });
            }
        });
    </script>
</body>

</html>
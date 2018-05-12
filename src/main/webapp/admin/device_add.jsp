<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增设备</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
  <script src="../layui/jquery.min.js" type="text/javascript" charset="utf-8"></script>
  <script src="../layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
</head>
<style>
  *{
      margin: 0px;
      padding: 0;
   }
   body {
        margin: 20px;
    }
  .layui-btn-container{
  	padding-top: 10px;
  }
</style>
</head>
<body>
<fieldset class="layui-elem-field">
	<legend>添加设备信息</legend>
 	<div class="layui-field-box">
            <form class="layui-form" action="../user/addDevice.action">
                <div class="layui-form-item">
                    <label class="layui-form-label">设备名</label>
                    <div class="layui-input-block">
                        <input type="text" name="device_name" required lay-verify="required" placeholder="请输入设备名" autocomplete="off" class="layui-input u_id">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">设备状态</label>
                    <div class="layui-input-block">
                        <input type="text" name="device_state" required lay-verify="required" placeholder="请输入设备状态" autocomplete="off" class="layui-input u_id">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button id="submit" class="layui-btn" lay-submit lay-filter="formDemo"><i class="layui-icon">&#xe610;</i>添加</button>
                        <a href="../main_frame.html" class="layui-btn layui-btn-normal example"><i class="layui-icon">&#xe705;</i>返回</a>
                    </div>
                </div>
            </form>
        </div>
</fieldset>
</body>
</html>
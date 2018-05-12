<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申请实验室</title>
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
  #submit-btn{
  	width: 80px;
  	height: 30px;
  	line-height: 30px;
  	margin-left: 20px;
  }
  #return-btn{
  	width: 80px;
  	height: 30px;
  	line-height: 30px;
  	margin-left: 20px;
  	background-color: green;
  }
</style>
</head>
<body>
<fieldset class="layui-elem-field">
	<legend>申请实验室</legend>
	<div class="layui-field-box">
            <form class="layui-form" action="../user/applyLab.action">
                <div class="layui-form-item">
                    <label class="layui-form-label">申请人工号</label>
                    <div class="layui-input-block">
                        <input type="text" name="user_id" required lay-verify="number" placeholder="请输入用户工号" autocomplete="off" class="layui-input u_id">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">实验室号</label>
                    <div class="layui-input-block">
                        <input type="text" name="lab_id" required lay-verify="required" autocomplete="off" class="layui-input u_id" value="${param.lab_id }" readonly="readonly">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">申请时间</label>
                    <div class="layui-input-block">
                        <input type="text" name="use_time" id="date" lay-verify="date" placeholder="请输入申请时间" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">申请原因</label>
                    <div class="layui-input-block">
                        <input type="text" name="apply_content" required lay-verify="required" placeholder="请输入申请原因" autocomplete="off" class="layui-input u_id">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button id="submit" class="layui-btn" lay-submit lay-filter="formDemo"><i class="layui-icon">&#xe610;</i>提交</button>
                        <a href="../main_frame.html" class="layui-btn layui-btn-normal example"><i class="layui-icon">&#xe705;</i>返回</a>
                    </div>
                </div>
            </form>
        </div>
</fieldset>
</body>
<script type="text/javascript">
    //日期layui
    layui.use('laydate', function() {
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#date', //指定元素
            type: 'date'
        });
    });
</script>
</html>
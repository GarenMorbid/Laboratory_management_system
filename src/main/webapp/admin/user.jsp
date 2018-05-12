<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>个人信息</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
  <script src="../layui/jquery.min.js" type="text/javascript" charset="utf-8"></script>
  <script src="../layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
</head>
<style>
  *{
      margin: 0;
      padding: 0;
   }
   body {
        margin: 20px;
    }
  #search{
    float: left;
    height:50px;
    line-height:50px;
  }
  #tb{
    margin: auto;
  }
  #mainn{
    border: 0;
  }
  .layui-input-inline{
  	width: 100px;
  	height: 24px;
  }
  #startTime,#endTime{
  	width: 140px;
  }
  .sel{
  	width: 120px;
  	height: 24px;
  }
  .layui-btn-container{
  	padding-top: 10px;
  }
  #search-btn{
  	height: 30px;
  	line-height: 30px;
  }
  #add-btn,#admin-btn{
  	height: 30px;
  	line-height: 30px;
  	margin-left: 30px;
  }
  #opinion{
  	height: 200px;
  	width: 300px;
  }
  #userName{
  	width: 200px;
  }
  .tp{
  	width: 120px;
  	height: 24px;
  }
</style>
<body>
 
<!-- 你的HTML代码 -->
<div class="layui-select-title" id="search">
  &nbsp;&nbsp;<input type="text" placeholder="请输入姓名" value="" id="username" class="layui-input-inline">&nbsp;&nbsp;
  <i class="layui-edge"></i>
</div>
<div class="layui-btn-container">
  <button class="layui-btn layui-btn-radius layui-btn-normal" id="search-btn">搜索</button> 
  <a href="user_add.jsp" class="layui-btn layui-btn-radius layui-btn-normal" id="add-btn">新增用户信息</a>
</div>

<table class="layui-table" id="tb">
    <thead>
      <tr>
        <th>用户名</th>
        <th>用户账户</th>
        <th>用户电话</th>
        <th>员工类型</th>
        <th>密码</th>
        <th>操作</th>
      </tr> 
    </thead>
    <tbody id="content">
      
    </tbody>
</table>
</body>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url: "../user/findAllUser.action",
			type: "post",
			dataType: "json",
			data: {},
			success: function(data){
				var inHtml="";
				for(var i=0;i<data.length;i++){
					inHtml +='<tr><td>'+data[i].user_name+'</td>';
					inHtml +='<td>'+data[i].user_account+'</td>';
					inHtml +='<td>'+data[i].user_tel+'</td>';
					inHtml +='<td>'+data[i].user_type+'</td>';
					inHtml +='<td>'+data[i].user_pwd+'</td>';
					inHtml +='<td><a href="../user/deleteUser.action?&user_id='+data[i].user_id+'" id="del" class="layui-btn layui-btn-big">删除</a></td></tr>';
				}
				$("#content").html(inHtml);
			},
			error: function(){
				console.log("服务器有问题！");
			}
		});
		
		//搜索设备
		$("#search-btn").click(function(){
			var username=$("#username").val();
			$.ajax({
				url: "../user/findUserByName.action",
				type: "post",
				dataType: "json",
				data: {"username":username},
				success: function(data){
					var inHtml="";
					for(var i=0;i<data.length;i++){
						inHtml +='<tr><td>'+data[i].user_name+'</td>';
						inHtml +='<td>'+data[i].user_account+'</td>';
						inHtml +='<td>'+data[i].user_tel+'</td>';
						inHtml +='<td>'+data[i].user_type+'</td>';
						inHtml +='<td>'+data[i].user_pwd+'</td>';
						inHtml +='<td><a href="../user/deleteUser.action?&user_id='+data[i].user_id+'" id="del" class="layui-btn layui-btn-big">删除</a></td></tr>';
					}
					$("#content").html(inHtml);
				},
				error: function(){
					console.log("服务器有问题！");
				}
			});
		})
		
	});
</script>
</html>
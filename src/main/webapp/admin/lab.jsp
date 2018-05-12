<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>实验室信息</title>
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
  &nbsp;&nbsp;<input type="text" placeholder="请输入实验室号" value="" id="lab_id" class="layui-input-inline">&nbsp;&nbsp;
  <i class="layui-edge"></i>
</div>
<div class="layui-btn-container">
  <button class="layui-btn layui-btn-radius layui-btn-normal" id="search-btn">🔍 搜索</button>
  <a href="lab_add.jsp" class="layui-btn layui-btn-radius layui-btn-normal" id="add-btn">🏡 新增实验室信息</a>
</div>

<table class="layui-table" id="tb" style="text-align: center;">
    <thead>
      <tr>
          <th style="text-align: center;">实验室号</th>
          <th style="text-align: center;">实验室状态</th>
          <th style="text-align: center;">负责人</th>
          <th style="text-align: center;">操作</th>
      </tr> 
    </thead>
    <tbody id="content">
      
    </tbody>
</table>
</body>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url: "../user/findAllLab.action",
			type: "post",
			dataType: "json",
			data: {},
			success: function(data){
				var inHtml="";
				for(var i=0;i<data.length;i++){
					inHtml +='<tr><td>'+data[i].lab_id+'</td>';
					inHtml +='<td>'+data[i].lab_state+'</td>';
					inHtml +='<td>'+data[i].lab_man+'</td>';
					inHtml +='<td><a href="lab_edit.jsp?&lab_id='+data[i].lab_id+'&lab_state='+data[i].lab_state+'&lab_man='+data[i].lab_man+'" id="edit" class="layui-btn layui-btn-big">🔨 编辑</a><a href="../user/deleteLab.action?&lab_id='+data[i].lab_id+'" id="del" class="layui-btn layui-btn-danger">🔪 删除</a></td></tr>';
				}
				$("#content").html(inHtml);
			},
			error: function(){
				console.log("服务器有问题！");
			}
		});
		
		//搜索实验室
		$("#search-btn").click(function(){
			var lab_id=$("#lab_id").val();
			$.ajax({
				url: "../user/findLabByID.action",
				type: "post",
				dataType: "json",
				data: {"lab_id":lab_id},
				success: function(data){
					var inHtml="";
					if(data != null){
						inHtml +='<tr><td>'+data.lab_id+'</td>';
						inHtml +='<td>'+data.lab_state+'</td>';
						inHtml +='<td>'+data.lab_man+'</td>';
						inHtml +='<td><a href="lab_edit.jsp?&lab_id='+data.lab_id+'&lab_state='+data.lab_state+'&lab_man='+data.lab_man+'" id="edit" class="layui-btn layui-btn-big">🔨 编辑</a><a href="../user/deleteLab.action?&lab_id='+data.lab_id+'" id="del" class="layui-btn layui-btn-danger">🔪 删除</a></td></tr>';

						$("#content").html(inHtml);
					}else {
						layer.open({
                            title: '系统提醒',
                            content: '没有该用户信息，请重新输入实验室工号！',
                            icon: 6
                        });
					}
				},
				error: function(){
					console.log("服务器有问题！");
				}
			});
		})
		
	});
</script>

</html>
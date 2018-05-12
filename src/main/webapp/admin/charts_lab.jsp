<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>下载总量</title>
<script src="../layui/echarts.js" type="text/javascript" charset="utf-8"></script>
<script src="../layui/echarts-liquidfill.js" type="text/javascript" charset="utf-8"></script>
<script src="../layui/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
	.divFrom{
		width: 500px;
		height: 500px;
		display: inline-block;
		margin-left: 29%;
	}
</style>
</head>
<body>
	<div class="divFrom" id="firstForm"></div>
</body>
<script type="text/javascript">
    $(function() {
        var myChart = echarts.init(document.getElementById('firstForm'));
        $.ajax({
            url: "../user/labCount.action",
            type: "post",
            dataType: "json",
            success: function (data) {
                option = {
                    title: {
                        text: '龙虎榜,实验室借出量',
                        left: 'center',
                        top: 10,
                        textStyle: {
                            color: 'black'
                        }
                    },
                    series: [{
                        type: 'liquidFill',
                        data: [
                            0.6,
                        ],
                        color: ['#40B6E0'],
                        radius: '80%',
                        shape: 'path://M500,990C229.5,990,10,770.7,10,500C10,229.5,229.3,10,500,10c270.7,0,490,219.3,490,490C989.8,770.7,770.5,990,500,990z M500,86C271.2,86,85.8,271.4,85.8,500.2c0,186.3,123.1,343.9,292.4,396c0-9.6,0-66.6,0-76.9c-0.9-0.7-97,28.2-138.5-41.2c-6.5-11.3-17.4-51-46-72.9c-1.1-0.9-22.4-11.7-24.3-22.4c-0.2-1.5,1.3-4.6,3.5-5.4c2.2-0.9,37.3-15.2,76.4,34.3c11.7,16.5,38.4,79.9,131.6,40.8c2.6-9.8,7.6-32.3,37.1-38.4c-138.7-16.5-202.1-69-221.7-187.1c-12.4-80.5,11.3-147.4,46.7-180.4c-5.4-6.9-23-65.8,4.3-128.1c29.7-5.9,84.5,15.4,132.4,49.7c67.7-24.3,195-18,240.5,0c21.7-17.8,99-59.5,132-49.7c9.8,24.7,23.9,84.5,4.3,128.1c43.2,44.3,55.4,101.4,47.5,171.5c-9.6,106.4-74.9,182.4-221.9,194.7c37.1,25.4,38.6,65.1,39.9,80.8c0.2,36.5-0.4,86.2,0,102c169.1-52.1,292-209.7,292-396C914.2,271.4,728.8,86,500,86z',
                        waveAnimation: true,
                        backgroundStyle: {
                            borderColor: '#212D3C',
                            borderWidth: 3,
                            shadowColor: 'grey',
                            shadowBlur: 20,
                            color: 'grey'
                        },
                        outline: {
                            show: false
                        },
                        amplitude: 30,
                        direction: 'right',
                        animationDuration: 2000,
                        label: {
                            formatter: function () {
                                return "" + data + "";
                            },
                        }
                    }],
                }
                myChart.setOption(option);
            }
        });
    });
</script>
</html>
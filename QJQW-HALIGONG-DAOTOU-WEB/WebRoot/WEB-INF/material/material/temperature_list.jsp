<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Long date = System.currentTimeMillis();
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0, user-scalable=no" name="viewport" />
    <title></title>
	<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.2.js"></script>
	<script type="text/javascript" src="/resources/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
	<script type="text/javascript" src="/resources/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
	<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
	<script src="<%=path%>/resources/js/common/detail.js?v=<%=date%>"  type="text/javascript"></script>
	<link href="<%=path%>/resources/css/index/style_a.css?v=<%=date%>" rel="stylesheet" type="text/css" />
	<!-- <link href="<%=path%>/resources/css/bootstrap.min.css" rel="stylesheet" /> -->
	<!-- <link href="<%=path%>/resources/css/bootstrap-responsive.min.css" rel="stylesheet" /> -->
	
	<script src="<%=path%>/resources/Highcharts-5.0.5/code/highcharts.js"></script>
    <script src="<%=path%>/resources/Highcharts-5.0.5/code/js/modules/exporting.js"></script>
	
    <script type="text/JavaScript">
    $(document).ready(function(){
    	onChangeQX();
    });
    	data1 = [];
		function onChangeQX(){
			var data_str = '[';
			var dataName = 0;
			if(dataName == 0){//点击的之前是编辑状态，需变为“保存”
				var inputs1 = $("#tempTable td.edit_1");
				var inputs2 = $("#tempTable td.edit_2");
				for(var i = 0;i<inputs1.length;i++){
					var wendu = $(inputs1[i]).text();
					var canshu = $(inputs2[i]).text();
					data1[i] = [];
					data1[i][0] = wendu * 1;
					data1[i][1] = canshu * 1;
// 					if(i < inputs1.length - 1){
// 						data_str = data_str + '[' + wendu + ',' + canshu + '],';
// 					}else{
// 						data_str = data_str + '[' + wendu + ',' + canshu + ']';
// 					}
					
				}
			}else{
				//执行保存事件
				var inputs1 = $("#tempTable td.edit_1");
				var inputs2 = $("#tempTable td.edit_2");
				for(var i = 0;i<inputs1.length;i++){
					var wendu = $(inputs1[i]).children('input').val();
					var canshu = $(inputs2[i]).children('input').val();
					data1[i] = [];
					data1[i][0] = wendu * 1;
					data1[i][1] = canshu * 1;
// 					if(i < inputs1.length - 1){
// 						data_str = data_str + '[' + wendu + ',' + canshu + '],';
// 					}else{
// 						data_str = data_str + '[' + wendu + ',' + canshu + ']';
// 					}
				}
				
			}
// 			data_str = data_str + ']';
// 			alert(data_str);
// 			data1 = data_str; 
// 			data1 =  eval(data_str); 
			
// 			data2 = JSON.parse(data1)
			data2 = arrayToJson(data1);
// 			data2 = [[1,2],[3,4],[5,6]];
			
			//曲线图
	
			var options ={
		    	chart: {
		        	renderTo: 'container',
		            defaultSeriesType: 'spline' // 定义报表类型 例如：line ，spline ，colume
		        },
		        title: {//主标题
		            text: '我是主标题'
		        },
		        subtitle: {//副标题
		            text: '我是副标题'
		        },
		        exporting: {//右上角的导出与打印
		            enabled:false
		        },
		        credits: {//右下角不显示LOGO
		            enabled: false
		        },
		        xAxis: {
		//          categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
		            tickmarkPlacement: 'on' //刻度正位于刻度线下方（“between”：将会位于两两刻度线之间，默认为“between”）
		        },
		        yAxis: {
		            title: {
		            	text: 'Temperature (°C)'  //纵坐标名称
		        	},
			        plotLines: [{
			            value: 0,
			            lineWidth:1,
			            width: 1,
			            color: '#808080'
			        }]
		
		        },
		        tooltip: {
		            formatter: function() {
		            	//当鼠标悬置数据点时的格式化提示
		                return '('+ this.x + ',' + this.y + ')';
		            }
		        },
		        legend: {
		            layout: 'vertical',//图例显示的样式：水平（horizontal）/垂直（vertical）
		            align: 'right',//图例水平对齐方式
		            verticalAlign: 'middle',//图例垂直对齐方式
		            borderWidth: 0
		        },
		
		        //折线数组
		        series: [
		                 {
		                    name: 'Tokyo',
		                    data: eval(data2)
		                }
		        ]
			};
	
			var chart = new Highcharts.Chart(options);//执行绘图方法
		}
    </script>
</head>
<body style="background:#fff;">
<input type = "hidden" id="input_wdxg" value=""/>
<div class="content_box_text">

	<ul class="box_text">
		<form>
			<li class="block nobor">
			</li>
			<li class="block nobor">
				<table border="1" class="li_table" id="tempTable">
					<tr>
						<th class="th">温度</td>
						<th class="th">参数</th>
					</tr>
					<c:forEach items="${list}" var="var" varStatus="vs">
					<tr id="temp_tr${vs.index }" >
						<td class="td edit_1" id="temp_td1_tr${vs.index }">${var.wendu }</td>
						<td class="td edit_2" id="temp_td2_tr${vs.index }">${var.canshu }</td>
					</tr>
					</c:forEach>
				</table>
			</li>
			<li class="block nobor">
				<div id="container" class="iframe_boxqx"></div>	
				<!-- <iframe width="740px" height="300px" src="" class="iframe_boxqx"></iframe> -->		
			</li>
		</form>
	</ul>
	
</div>
<script>

</script>
</body>
</html>
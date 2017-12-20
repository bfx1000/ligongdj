<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.2.js"></script>
<script type="text/javascript" src="/resources/js/chosen.jquery.min.js"></script>
<!-- 下拉框 -->
<script type="text/javascript" src="/resources/js/bootstrap-datepicker.min.js"></script>
<!-- 日期框 -->
<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js" type="text/javascript"></script>
<script src="<%=path%>/resources/js/common/detail.js" type="text/javascript"></script>
<link href="<%=path%>/resources/css/index/style_a.css" rel="stylesheet" type="text/css" />
<!-- <link href="<%=path%>/resources/css/bootstrap.min.css" rel="stylesheet" /> -->
<!-- <link href="<%=path%>/resources/css/bootstrap-responsive.min.css" rel="stylesheet" /> -->
<script src="<%=path%>/resources/Highcharts-5.0.5/code/highcharts.js"></script>
<script src="<%=path%>/resources/Highcharts-5.0.5/code/highcharts-3d.js"></script>
<script src="<%=path%>/resources/Highcharts-5.0.5/code/js/modules/exporting.js"></script>

</head>
<body>
	<div class="content_box_table">
		<!-- 展开详情   -->
		<div class="box_p">
			<h4>应变 应变率</h4>
			<li class="block nobor">
				<table border="1" class="box_table li_table" id="yblTable">
					<tr>
						<th class="th">数据点 </th>
						<td class="th">温度</td>
						<td class="th">应变</td>
						<td class="th">应变率</td>
					</tr>
					<c:forEach items="${material.StrainRateList}" var="var1" varStatus="vs1">
						<tr id="ybl_tr${vs1.index }">
							<td class="td edit_1" id="ybl_td1_tr${vs1.index }">${var1.shujudian }</td>
							<td class="td edit_2" id="ybl_td2_tr${vs1.index }">${var1.wendu }</td>
							<td class="td edit_3" id="ybl_td3_tr${vs1.index }">${var1.yingbian }</td>
							<td class="td edit_4" id="ybl_td4_tr${vs1.index }">${var1.yingbianlv }</td>
							<td class="td edit_4" id="ybl_td4_tr${vs1.index }">${var1 }</td>
						</tr>
					</c:forEach>
				</table>
			</li>
			<li class="block nobor  graph_wrap"><input type="button" value="生成曲线" class="btn_add" onclick="onChangeQX();" /> <span
				class="graph_type">曲线维数: <select name="graph_type" id="graph_type" onChange="graphType();">
						<option value="0">二维曲线图</option>
						<option value="1">三维曲线图</option>
				</select>
			</span> <span class="x_val">x: <select name="" id="x_val">
						<option value="1">温度</option>
						<option value="2">应变</option>
						<option value="3">应变率</option>
				</select>
			</span> <span class="y_val">y: <select name="" id="y_val">
						<option value="1">温度</option>
						<option value="2">应变</option>
						<option value="3">应变率</option>
				</select>
			</span> <span class="z_val">z: <select name="" id="z_val">
						<option value="1">温度</option>
						<option value="2">应变</option>
						<option value="3">应变率</option>
				</select>
			</span></li>
			<div id="container" class="iframe_boxqx"></div>
			<div class="clear"></div>
		</div>
	</div>
	</div>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		onChangeQX();
	});

	//生成曲线
	function onChangeQX() {
		var data2;
		var graph_type = $("#graph_type").val();//0 二维曲线 1三维曲线
		var dataName = 0;

		var yblTdLength = $("#yblTable tr").length;//table列数
		var dataName = 0;
		var wendu = '';
		var yingbian = '';
		var yingbianlv = '';

		if (graph_type == 0) {//0 二维曲线

			var x_val = $("#x_val").val();// 1 温度 2 应变 3 应变率
			var y_val = $("#y_val").val();// 1 温度 2 应变 3 应变率
			var data1 = [];
			if (x_val != 1 && y_val != 1) {//X,Y轴没有温度，绘制多曲线图
				var wendus = [];

				if (dataName == 0) {//点击的之前是编辑状态，需变为“保存”
					var inputs1 = $("#yblTable td.edit_1");
					var inputs2 = $("#yblTable td.edit_2");
					var inputs3 = $("#yblTable td.edit_3");
					var inputs4 = $("#yblTable td.edit_4");

					for (var i = 0; i < inputs1.length; i++) {
						data1[i] = [];
						wendu = $(inputs2[i]).text();
						yingbian = $(inputs3[i]).text();
						yingbianlv = $(inputs4[i]).text();

						data1[i][0] = wendu;
						data1[i][1] = yingbian;
						data1[i][2] = yingbianlv;
					}
					data2 = arrayToJson(data1);

				} else {
					//执行保存事件
					var StrainRate_str = '';
					//执行保存事件
					var inputs1 = $("#yblTable td.edit_1");
					var inputs2 = $("#yblTable td.edit_2");
					var inputs3 = $("#yblTable td.edit_3");
					var inputs4 = $("#yblTable td.edit_4");
					for (var i = 0; i < inputs1.length; i++) {
						data1[i] = [];
						wendu = $(inputs2[i]).children('input').val()
						yingbian = $(inputs3[i]).children('input').val()
						yingbianlv = $(inputs4[i]).children('input').val()

						data1[i][0] = wendu;
						data1[i][1] = yingbian;
						data1[i][2] = yingbianlv;
					}

				}

				var count = 0;
				for (var i = 0; i < data1.length; i++) {
					var flag = 0;
					for (var j = 0; j < wendus.length; j++) {
						if (wendus[j] == data1[i][0]) {//重复了
							flag = 1;
							break;
						}
					}
					if (flag == 0) {

						wendus[wendus.length] = data1[i][0];
					}
				}
				//循环所有温度
				var data3 = [];
				for (var i = 0; i < wendus.length; i++) {
					var data4 = [];
					var data5 = [];
					var data4_count = 0;
					for (j = 0; j < data1.length; j++) {
						if (wendus[i] == data1[j][0]) {
							data4[data4_count] = [];
							if (x_val == 1) {
								data4[data4_count][0] = data1[j][0] * 1;
							} else if (x_val == 2) {
								data4[data4_count][0] = data1[j][1] * 1;
							} else if (x_val == 3) {
								data4[data4_count][0] = data1[j][2] * 1;
							}

							if (y_val == 1) {
								data4[data4_count][1] = data1[j][0] * 1;
							} else if (y_val == 2) {
								data4[data4_count][1] = data1[j][1] * 1;
							} else if (y_val == 3) {
								data4[data4_count][1] = data1[j][2] * 1;
							}
							data5.push({
								x : data4[data4_count][0],
								y : data4[data4_count][1]
							})
							data4_count++;
						}

					}
					data2 = arrayToJson(data4);
					data3[i] = {
						"name" : wendus[i],
						"data" : data5
					};
				}

				//曲线图
				var options = {
					chart : {
						renderTo : 'container',
						defaultSeriesType : 'spline' // 定义报表类型 例如：line ，spline ，colume
					},
					title : {//主标题
						text : '我是主标题'
					},
					subtitle : {//副标题
						text : '我是副标题'
					},
					exporting : {//右上角的导出与打印
						enabled : false
					},
					credits : {//右下角不显示LOGO
						enabled : false
					},
					xAxis : {
						//          categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
						tickmarkPlacement : 'on' //刻度正位于刻度线下方（“between”：将会位于两两刻度线之间，默认为“between”）
					},
					yAxis : {
						title : {
							text : 'Temperature (°C)' //纵坐标名称
						},
						plotLines : [ {
							value : 0,
							lineWidth : 1,
							width : 1,
							color : '#808080'
						} ]

					},
					tooltip : {
						formatter : function() {
							//当鼠标悬置数据点时的格式化提示
							return '(' + this.x + ',' + this.y + ')';
						}
					},
					legend : {
						layout : 'vertical',//图例显示的样式：水平（horizontal）/垂直（vertical）
						align : 'right',//图例水平对齐方式
						verticalAlign : 'middle',//图例垂直对齐方式
						borderWidth : 0
					},

					//折线数组
					series : eval(data3)
				//						        [{name:'1',data:[[1,2]]},{name:'2',data:[[3,4]]}]
				};

			} else {//绘制单条二维曲线
				if (dataName == 0) {//点击的之前是编辑状态，需变为“保存”
					var inputs1 = $("#yblTable td.edit_1");
					var inputs2 = $("#yblTable td.edit_2");
					var inputs3 = $("#yblTable td.edit_3");
					var inputs4 = $("#yblTable td.edit_4");

					for (var i = 0; i < inputs1.length; i++) {
						data1[i] = [];
						wendu = $(inputs2[i]).text();
						yingbian = $(inputs3[i]).text();
						yingbianlv = $(inputs4[i]).text();

						if (x_val == 1) {
							data1[i][0] = wendu * 1;
						} else if (x_val == 2) {
							data1[i][0] = yingbian * 1;
						} else if (x_val == 3) {
							data1[i][0] = yingbianlv * 1;
						}

						if (y_val == 1) {
							data1[i][1] = wendu * 1;
						} else if (y_val == 2) {
							data1[i][1] = yingbian * 1;
						} else if (y_val == 3) {
							data1[i][1] = yingbianlv * 1;
						}
					}
					data2 = arrayToJson(data1);

				} else {
					//执行保存事件
					var StrainRate_str = '';
					//执行保存事件
					var inputs1 = $("#yblTable td.edit_1");
					var inputs2 = $("#yblTable td.edit_2");
					var inputs3 = $("#yblTable td.edit_3");
					var inputs4 = $("#yblTable td.edit_4");
					for (var i = 0; i < inputs1.length; i++) {
						data1[i] = [];
						wendu = $(inputs2[i]).children('input').val()
						yingbian = $(inputs3[i]).children('input').val()
						yingbianlv = $(inputs4[i]).children('input').val()

						if (x_val == 1) {
							data1[i][0] = wendu * 1;
						} else if (x_val == 2) {
							data1[i][0] = yingbian * 1;
						} else if (x_val == 3) {
							data1[i][0] = yingbianlv * 1;
						}

						if (y_val == 1) {
							data1[i][1] = wendu * 1;
						} else if (y_val == 2) {
							data1[i][1] = yingbian * 1;
						} else if (y_val == 3) {
							data1[i][1] = yingbianlv * 1;
						}
					}
					data2 = arrayToJson(data1);
				}

				//曲线图
				var options = {
					chart : {
						renderTo : 'container',
						defaultSeriesType : 'spline' // 定义报表类型 例如：line ，spline ，colume
					},
					title : {//主标题
						text : '我是主标题'
					},
					subtitle : {//副标题
						text : '我是副标题'
					},
					exporting : {//右上角的导出与打印
						enabled : false
					},
					credits : {//右下角不显示LOGO
						enabled : false
					},
					xAxis : {
						//          categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
						tickmarkPlacement : 'on' //刻度正位于刻度线下方（“between”：将会位于两两刻度线之间，默认为“between”）
					},
					yAxis : {
						title : {
							text : 'Temperature (°C)' //纵坐标名称
						},
						plotLines : [ {
							value : 0,
							lineWidth : 1,
							width : 1,
							color : '#808080'
						} ]

					},
					tooltip : {
						formatter : function() {
							//当鼠标悬置数据点时的格式化提示
							return '(' + this.x + ',' + this.y + ')';
						}
					},
					legend : {
						layout : 'vertical',//图例显示的样式：水平（horizontal）/垂直（vertical）
						align : 'right',//图例水平对齐方式
						verticalAlign : 'middle',//图例垂直对齐方式
						borderWidth : 0
					},

					//折线数组
					series : [ {
						name : 'Tokyo',
						data : eval(data2)
					} ]
				};
			}

		} else {//1三维曲线
			var x_val = $("#x_val").val();// 1 温度 2 应变 3 应变率
			var y_val = $("#y_val").val();// 1 温度 2 应变 3 应变率
			var z_val = $("#z_val").val();// 1 温度 2 应变 3 应变率

			var data1 = [];
			if (dataName == 0) {//点击的之前是编辑状态，需变为“保存”
				var inputs1 = $("#yblTable td.edit_1");
				var inputs2 = $("#yblTable td.edit_2");
				var inputs3 = $("#yblTable td.edit_3");
				var inputs4 = $("#yblTable td.edit_4");

				for (var i = 0; i < inputs1.length; i++) {
					data1[i] = [];
					wendu = $(inputs2[i]).text();
					yingbian = $(inputs3[i]).text();
					yingbianlv = $(inputs4[i]).text();

					if (x_val == 1) {
						data1[i][0] = wendu * 1;
					} else if (x_val == 2) {
						data1[i][0] = yingbian * 1;
					} else if (x_val == 3) {
						data1[i][0] = yingbianlv * 1;
					}

					if (y_val == 1) {
						data1[i][1] = wendu * 1;
					} else if (y_val == 2) {
						data1[i][1] = yingbian * 1;
					} else if (y_val == 3) {
						data1[i][1] = yingbianlv * 1;
					}

					if (z_val == 1) {
						data1[i][2] = wendu * 1;
					} else if (z_val == 2) {
						data1[i][2] = yingbian * 1;
					} else if (z_val == 3) {
						data1[i][2] = yingbianlv * 1;
					}
				}
				data2 = arrayToJson(data1);

			} else {
				//执行保存事件
				var StrainRate_str = '';
				//执行保存事件
				var inputs1 = $("#yblTable td.edit_1");
				var inputs2 = $("#yblTable td.edit_2");
				var inputs3 = $("#yblTable td.edit_3");
				var inputs4 = $("#yblTable td.edit_4");
				for (var i = 0; i < inputs1.length; i++) {
					data1[i] = [];
					wendu = $(inputs2[i]).children('input').val()
					yingbian = $(inputs3[i]).children('input').val()
					yingbianlv = $(inputs4[i]).children('input').val()

					if (x_val == 1) {
						data1[i][0] = wendu * 1;
					} else if (x_val == 2) {
						data1[i][0] = yingbian * 1;
					} else if (x_val == 3) {
						data1[i][0] = yingbianlv * 1;
					}

					if (y_val == 1) {
						data1[i][1] = wendu * 1;
					} else if (y_val == 2) {
						data1[i][1] = yingbian * 1;
					} else if (y_val == 3) {
						data1[i][1] = yingbianlv * 1;
					}

					if (z_val == 1) {
						data1[i][2] = wendu * 1;
					} else if (z_val == 2) {
						data1[i][2] = yingbian * 1;
					} else if (z_val == 3) {
						data1[i][2] = yingbianlv * 1;
					}
				}
				data2 = arrayToJson(data1);
			}

			var options = {
				chart : {
					renderTo : 'container',
					margin : 100,
					type : 'scatter',
					options3d : {
						enabled : true,
						alpha : 10,
						beta : 30,
						depth : 250,
						viewDistance : 5,
						frame : {
							bottom : {
								size : 1,
								color : 'rgba(0,0,0,0.02)'
							},
							back : {
								size : 1,
								color : 'rgba(0,0,0,0.04)'
							},
							side : {
								size : 1,
								color : 'rgba(0,0,0,0.06)'
							}
						}
					}
				},
				title : {
					text : ''
				},
				plotOptions : {
					scatter : {
						width : 10,
						height : 10,
						depth : 10
					}
				},
				yAxis : {
					min : 0,
					max : 10,
					title : null
				},
				xAxis : {
					min : 0,
					max : 10,
					gridLineWidth : 1
				},
				zAxis : {
					min : 0,
					max : 10
				},
				legend : {
					enabled : false
				},
				series : [ {
					name : 'Reading',//曲线名称（点击这个名称，会自动切换对用点集的隐藏与显示）
					color : 'rgba(245, 8, 59,.5)',//点的颜色值（0-255,0-255,0-255,0-1）
					data : eval(data2)
				//			                data: [[1, 6, 5], [8, 7, 9], [1, 3, 4], [4, 6, 8], [5, 7, 7], [6, 9, 6], [7, 0, 5], [2, 3, 3]]
				} ]
			};

		}

		//			if(dataName == 0){//点击的之前是编辑状态，需变为“保存”
		//				var inputs1 = $("#tempTable td.edit_1");
		//				var inputs2 = $("#tempTable td.edit_2");
		//				for(var i = 0;i<inputs1.length;i++){
		//					var wendu = $(inputs1[i]).text();
		//					var canshu = $(inputs2[i]).text();
		//					data1[i] = [];
		//					data1[i][0] = wendu * 1;
		//					data1[i][1] = canshu * 1;
		//				}
		//			}else{
		//				执行保存事件
		//				var inputs1 = $("#tempTable td.edit_1");
		//				var inputs2 = $("#tempTable td.edit_2");
		//				for(var i = 0;i<inputs1.length;i++){
		//					var wendu = $(inputs1[i]).children('input').val();
		//					var canshu = $(inputs2[i]).children('input').val();
		//					data1[i] = [];
		//					data1[i][0] = wendu * 1;
		//					data1[i][1] = canshu * 1;
		//				}

		//			}
		//			data2 = arrayToJson(data1);

		var chart = new Highcharts.Chart(options);//执行绘图方法

	}

	//切换曲线维数
	function graphType() {
		var graphTypeVal = document.getElementById('graph_type').options[document
				.getElementById('graph_type').selectedIndex].value;
		if (graphTypeVal == 1) {//三维
			$(".z_val").show();
		} else {
			$(".z_val").hide();
		}
	}
</script>
</html>


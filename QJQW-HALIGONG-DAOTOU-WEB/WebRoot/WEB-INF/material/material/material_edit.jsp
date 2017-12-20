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
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="images/dt2.ico">
	<title>哈理工刀头</title>
    <meta name="description" content="哈理工刀头,专业打造各种类型机械刀头,产品类型齐全,质量放心有保障,联合祈福科技公司打造专业的刀头网站。" />
    <meta name="keywords" content="哈理工刀头,刀头,刀具,切断切槽,仿形切削,外圆切槽刀,内圆切槽刀,端面切槽。" />
	<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.2.js"></script>
	<script type="text/javascript" src="/resources/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
	<script type="text/javascript" src="/resources/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
	<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
	<script src="<%=path%>/resources/js/common/detail.js?v=<%=date%>"  type="text/javascript"></script>
	<link href="<%=path%>/resources/css/index/style_a.css?v=<%=date%>" rel="stylesheet" type="text/css" />
	<script src="<%=path%>/resources/Highcharts-5.0.5/code/highcharts.js"></script>
	<script src="<%=path%>/resources/Highcharts-5.0.5/code/highcharts-3d.js"></script>
    <script src="<%=path%>/resources/Highcharts-5.0.5/code/js/modules/exporting.js"></script>

    <script type="text/JavaScript">
		<!--
		function MM_jumpMenu(targ,selObj,restore){ //v3.0
		  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
		  if (restore) selObj.selectedIndex=0;
		}
		//-->
		
		$(document).ready(function(){
			changeValue();
					
			
			//材料图片
			var array_PictureMaterial = $("#array_PictureMaterial").val();
			if(array_PictureMaterial != null && array_PictureMaterial != ''){
				var pictureMaterials = array_PictureMaterial.split(',');
				var pictureMaterials_str = '';
				for(var i = 0; i < pictureMaterials.length; i++){
					if(pictureMaterials[i] != null && pictureMaterials[i] != ''){
						pictureMaterials_str = pictureMaterials_str + "<div><img name='pictureMaterials_img' width='100px' height='100px' src='<%=path%>/goods"+pictureMaterials[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureMaterialImg(\""+pictureMaterials[i]+"\");'>删除</a><br/></div>";
					}
				}
				$("#span_PictureMaterialList").html(pictureMaterials_str);
			}
			
			//详细信息
			var array_InformDetailMaterial = $("#array_InformDetailMaterial").val();
			var array_InformDetailMaterial_name = $("#array_InformDetailMaterial_name").val();
			if(array_InformDetailMaterial != null && array_InformDetailMaterial != ''){
				var informDetailMaterials = array_InformDetailMaterial.split(',');
				var informDetailMaterials_name = array_InformDetailMaterial_name.split(',');
				var informDetailMaterials_str = '';
				for(var i = 0; i < informDetailMaterials.length; i++){
					if(informDetailMaterials[i] != null && informDetailMaterials[i] != ''){
						informDetailMaterials_str = informDetailMaterials_str + "<div><span name='informDetailMaterials_img' url='"+informDetailMaterials[i]+"' >"+informDetailMaterials_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelInformDetailMaterialImg(\""+informDetailMaterials[i]+"\");'>删除</a><br/></div>";
					}
				}
				$("#span_InformDetailMaterialList").html(informDetailMaterials_str);
			}
			
			
			
			
			//应用实例
			var array_ApplicationMaterial = $("#array_ApplicationMaterial").val();
			var array_ApplicationMaterial_name = $("#array_ApplicationMaterial_name").val();
			if(array_ApplicationMaterial != null && array_ApplicationMaterial != ''){
				var applicationMaterials = array_ApplicationMaterial.split(',');
				var applicationMaterials_name = array_ApplicationMaterial_name.split(',');
				var applicationMaterials_str = '';
				for(var i = 0; i < applicationMaterials.length; i++){
					if(applicationMaterials[i] != null && applicationMaterials[i] != ''){
						applicationMaterials_str = applicationMaterials_str + "<div><span name='applicationMaterials_img' url='"+applicationMaterials[i]+"' >"+applicationMaterials_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelApplicationMaterialImg(\""+applicationMaterials[i]+"\");'>删除</a><br/></div>";
					}
				}
				$("#span_ApplicationMaterialList").html(applicationMaterials_str);
			}
			
			
			
			//仿真参数
			var array_SimulationMaterial = $("#array_SimulationMaterial").val();
			var array_SimulationMaterial_name = $("#array_SimulationMaterial_name").val();
			if(array_SimulationMaterial != null && array_SimulationMaterial != ''){
				var simulationMaterials = array_SimulationMaterial.split(',');
				var simulationMaterials_name = array_SimulationMaterial_name.split(',');
				var simulationMaterials_str = '';
				for(var i = 0; i < simulationMaterials.length; i++){
					if(simulationMaterials[i] != null && simulationMaterials[i] != ''){
						simulationMaterials_str = simulationMaterials_str + "<div><span name='simulationMaterials_img' url='"+simulationMaterials[i]+"' >" + simulationMaterials_name[i] + "</span><a class='btn btn_shanchu' onclick='onDelSimulationMaterialImg(\""+simulationMaterials[i]+"\");'>删除</a><br/></div>";
						
					}
				}
				$("#span_SimulationMaterialList").html(simulationMaterials_str);
			}
			
			
			
		});
		
		
		//保存
		function save(){
	  
			$("#ConstituentsMaterial_userForm_1").val($("#ConstituentsMaterial_userForm").val());
			$("#MachineableMaterial_userForm_1").val($("#MachineableMaterial_userForm").val());
			$("#DensityMaterial_userForm_1").val($("#DensityMaterial_userForm").val());
			$("#ModulusMaterial_userForm_1").val($("#ModulusMaterial_userForm").val());
			$("#HardnessMaterial_userForm_1").val($("#HardnessMaterial_userForm").val());
			$("#ConductivityMaterial_userForm_1").val($("#ConductivityMaterial_userForm").val());
			$("#SpecificheatMaterial_userForm_1").val($("#SpecificheatMaterial_userForm").val());
			$("#StrengthMaterial_userForm_1").val($("#StrengthMaterial_userForm").val());
			$("#ThermalExpansionMaterial_userForm_1").val($("#ThermalExpansionMaterial_userForm").val());
			$("#JCMaterial_userForm_1").val($("#JCMaterial_userForm").val());
			$("#StrainRate_userForm_1").val($("#StrainRate_userForm").val());
			
			$("#array_PictureMaterial_userForm").val($("#array_PictureMaterial").val());
			$("#array_InformDetailMaterial_userForm").val($("#array_InformDetailMaterial").val());
			$("#array_InformDetailMaterial_name_userForm").val($("#array_InformDetailMaterial_name").val());
			$("#array_ApplicationMaterial_userForm").val($("#array_ApplicationMaterial").val());
			$("#array_ApplicationMaterial_name_userForm").val($("#array_ApplicationMaterial_name").val());
			$("#array_SimulationMaterial_userForm").val($("#array_SimulationMaterial").val());
			$("#array_SimulationMaterial_name_userForm").val($("#array_SimulationMaterial_name").val());
		
			$("#userForm").ajaxSubmit(function(result){
				if(result == 1){
					alert('操作成功！');
					onClose();
				}else{
					alert('操作失败，请联系管理员！');
				}
			});
		}
		
		//取消
		function onClose(){
			window.location.href='<%=path%>/material/queryMaterialList';
		}
		
		//保存材料图片
		function onSavePictureMaterialList(){
		
			$("#NameMaterial_pictureMaterialForm").val($("#NameMaterial_userForm").val());
			$("#NumberMaterial_pictureMaterialForm").val($("#NumberMaterial_userForm").val());
			$("#id_CategoryMaterial_pictureMaterialForm").val($("#id_CategoryMaterial_userForm").val());
			$("#ISOCuttingMaterial_pictureMaterialForm").val($("#ISOCuttingMaterial_userForm").val());
			$("#CategoryMaterial_pictureMaterialForm").val($("#CategoryMaterial_userForm").val());
			$("#CompanyMaterial_pictureMaterialForm").val($("#CompanyMaterial_userForm").val());
			
			$("#ConstituentsMaterial_pictureMaterialForm").val($("#ConstituentsMaterial_userForm").val());
			$("#MachineableMaterial_pictureMaterialForm").val($("#MachineableMaterial_userForm").val());
			$("#DensityMaterial_pictureMaterialForm").val($("#DensityMaterial_userForm").val());
			$("#ModulusMaterial_pictureMaterialForm").val($("#ModulusMaterial_userForm").val());
			$("#HardnessMaterial_pictureMaterialForm").val($("#HardnessMaterial_userForm").val());
			$("#ConductivityMaterial_pictureMaterialForm").val($("#ConductivityMaterial_userForm").val());
			$("#SpecificheatMaterial_pictureMaterialForm").val($("#SpecificheatMaterial_userForm").val());
			$("#StrengthMaterial_pictureMaterialForm").val($("#StrengthMaterial_userForm").val());
			$("#ThermalExpansionMaterial_pictureMaterialForm").val($("#ThermalExpansionMaterial_userForm").val());
			$("#JCMaterial_pictureMaterialForm").val($("#JCMaterial_userForm").val());
			$("#StrainRate_pictureMaterialForm").val($("#StrainRate_userForm").val());
		    
			$("#pictureMaterialForm").submit();
		}
		
		//删除材料图片
		function onDelPictureMaterialImg(url_pictureMaterial){
			var array_PictureMaterial = $("#array_PictureMaterial").val();
			array_PictureMaterial = array_PictureMaterial.replace(url_pictureMaterial,'');
			$("#array_PictureMaterial").val(array_PictureMaterial);
			var img_array = $("img[name='pictureMaterials_img']");
			for(var i=0;i<img_array.length;i++){
				if($(img_array[i]).attr("src") == "/goods" + url_pictureMaterial){
					$(img_array[i]).parent().remove();
				}
			}
		}
		
		//保存详细信息
		function onSaveInformDetailMaterialList(){
			$("#NameMaterial_informDetailMaterialForm").val($("#NameMaterial_userForm").val());
			$("#NumberMaterial_informDetailMaterialForm").val($("#NumberMaterial_userForm").val());
			$("#id_CategoryMaterial_informDetailMaterialForm").val($("#id_CategoryMaterial_userForm").val());
			$("#ISOCuttingMaterial_informDetailMaterialForm").val($("#ISOCuttingMaterial_userForm").val());
			$("#CategoryMaterial_informDetailMaterialForm").val($("#CategoryMaterial_userForm").val());
			$("#CompanyMaterial_informDetailMaterialForm").val($("#CompanyMaterial_userForm").val());
			
			$("#ConstituentsMaterial_informDetailMaterialForm").val($("#ConstituentsMaterial_userForm").val());
			$("#MachineableMaterial_informDetailMaterialForm").val($("#MachineableMaterial_userForm").val());
			$("#DensityMaterial_informDetailMaterialForm").val($("#DensityMaterial_userForm").val());
			$("#ModulusMaterial_informDetailMaterialForm").val($("#ModulusMaterial_userForm").val());
			$("#HardnessMaterial_informDetailMaterialForm").val($("#HardnessMaterial_userForm").val());
			$("#ConductivityMaterial_informDetailMaterialForm").val($("#ConductivityMaterial_userForm").val());
			$("#SpecificheatMaterial_informDetailMaterialForm").val($("#SpecificheatMaterial_userForm").val());
			$("#StrengthMaterial_informDetailMaterialForm").val($("#StrengthMaterial_userForm").val());
			$("#ThermalExpansionMaterial_informDetailMaterialForm").val($("#ThermalExpansionMaterial_userForm").val());
			$("#JCMaterial_informDetailMaterialForm").val($("#JCMaterial_userForm").val());
			$("#StrainRate_informDetailMaterialForm").val($("#StrainRate_userForm").val());
		    
			$("#informDetailMaterialForm").submit();
		}
		
		//删除详细信息
		function onDelInformDetailMaterialImg(url_informDetailMaterial){
		
			var array_InformDetailMaterial = $("#array_InformDetailMaterial").val();
			array_InformDetailMaterial = array_InformDetailMaterial.replace(url_informDetailMaterial,'');
			$("#array_InformDetailMaterial").val(array_InformDetailMaterial);
			var img_array = $("span[name='informDetailMaterials_img']");
			for(var i=0;i<img_array.length;i++){
				if($(img_array[i]).attr("url") == url_informDetailMaterial){
					$(img_array[i]).parent().remove();
				}
			}
		}
		
		
		//保存应用实例
		function onSaveApplicationMaterialList(){
			$("#NameMaterial_applicationMaterialForm").val($("#NameMaterial_userForm").val());
			$("#NumberMaterial_applicationMaterialForm").val($("#NumberMaterial_userForm").val());
			$("#id_CategoryMaterial_applicationMaterialForm").val($("#id_CategoryMaterial_userForm").val());
			$("#ISOCuttingMaterial_applicationMaterialForm").val($("#ISOCuttingMaterial_userForm").val());
			$("#CategoryMaterial_applicationMaterialForm").val($("#CategoryMaterial_userForm").val());
			$("#CompanyMaterial_applicationMaterialForm").val($("#CompanyMaterial_userForm").val());
			
			$("#ConstituentsMaterial_applicationMaterialForm").val($("#ConstituentsMaterial_userForm").val());
			$("#MachineableMaterial_applicationMaterialForm").val($("#MachineableMaterial_userForm").val());
			$("#DensityMaterial_applicationMaterialForm").val($("#DensityMaterial_userForm").val());
			$("#ModulusMaterial_applicationMaterialForm").val($("#ModulusMaterial_userForm").val());
			$("#HardnessMaterial_applicationMaterialForm").val($("#HardnessMaterial_userForm").val());
			$("#ConductivityMaterial_applicationMaterialForm").val($("#ConductivityMaterial_userForm").val());
			$("#SpecificheatMaterial_applicationMaterialForm").val($("#SpecificheatMaterial_userForm").val());
			$("#StrengthMaterial_applicationMaterialForm").val($("#StrengthMaterial_userForm").val());
			$("#ThermalExpansionMaterial_applicationMaterialForm").val($("#ThermalExpansionMaterial_userForm").val());
			$("#JCMaterial_applicationMaterialForm").val($("#JCMaterial_userForm").val());
			$("#StrainRate_applicationMaterialForm").val($("#StrainRate_userForm").val());
		    
			$("#applicationMaterialForm").submit();
		}
		
		//删除详细信息
		function onDelApplicationMaterialImg(url_applicationMaterial){
		
			var array_ApplicationMaterial = $("#array_ApplicationMaterial").val();
			array_ApplicationMaterial = array_ApplicationMaterial.replace(url_applicationMaterial,'');
			$("#array_ApplicationMaterial").val(array_ApplicationMaterial);
			var img_array = $("span[name='applicationMaterials_img']");
			for(var i=0;i<img_array.length;i++){
				if($(img_array[i]).attr("url") == url_applicationMaterial){
					$(img_array[i]).parent().remove();
				}
			}
		}
		
		
		//保存仿真参数
		function onSaveSimulationMaterialList(){
			$("#NameMaterial_simulationMaterialForm").val($("#NameMaterial_userForm").val());
			$("#NumberMaterial_simulationMaterialForm").val($("#NumberMaterial_userForm").val());
			$("#id_CategoryMaterial_simulationMaterialForm").val($("#id_CategoryMaterial_userForm").val());
			$("#ISOCuttingMaterial_simulationMaterialForm").val($("#ISOCuttingMaterial_userForm").val());
			$("#CategoryMaterial_simulationMaterialForm").val($("#CategoryMaterial_userForm").val());
			$("#CompanyMaterial_simulationMaterialForm").val($("#CompanyMaterial_userForm").val());
			
			$("#ConstituentsMaterial_simulationMaterialForm").val($("#ConstituentsMaterial_userForm").val());
			$("#MachineableMaterial_simulationMaterialForm").val($("#MachineableMaterial_userForm").val());
			$("#DensityMaterial_simulationMaterialForm").val($("#DensityMaterial_userForm").val());
			$("#ModulusMaterial_simulationMaterialForm").val($("#ModulusMaterial_userForm").val());
			$("#HardnessMaterial_simulationMaterialForm").val($("#HardnessMaterial_userForm").val());
			$("#ConductivityMaterial_simulationMaterialForm").val($("#ConductivityMaterial_userForm").val());
			$("#SpecificheatMaterial_simulationMaterialForm").val($("#SpecificheatMaterial_userForm").val());
			$("#StrengthMaterial_simulationMaterialForm").val($("#StrengthMaterial_userForm").val());
			$("#ThermalExpansionMaterial_simulationMaterialForm").val($("#ThermalExpansionMaterial_userForm").val());
			$("#JCMaterial_simulationMaterialForm").val($("#JCMaterial_userForm").val());
			$("#StrainRate_simulationMaterialForm").val($("#StrainRate_userForm").val());
		    
			$("#simulationMaterialForm").submit();
		}
		
		//删除详细信息
		function onDelSimulationMaterialImg(url_simulationMaterial){
		
			var array_SimulationMaterial = $("#array_SimulationMaterial").val();
			array_SimulationMaterial = array_SimulationMaterial.replace(url_simulationMaterial,'');
			$("#array_SimulationMaterial").val(array_SimulationMaterial);
			var img_array = $("span[name='simulationMaterials_img']");
			for(var i=0;i<img_array.length;i++){
				if($(img_array[i]).attr("url") == url_simulationMaterial){
					$(img_array[i]).parent().remove();
				}
			}
		}
		
		//修改温度相关
		function onEditWDXG(id){
		
			var str = $("#" + id).val();
			
			$("#iframe_wdxg").attr("src",  '<%=path%>/material/queryWDXG?id=' + id + '&str=' + str);
			$(".iframe_wrap").show();
		}
		
		function changeValue(){
			document.getElementById('id_CategoryMaterial_userForm').value=document.getElementById('selectWrap').options[document.getElementById('selectWrap').selectedIndex].text;
		}
		
		//生成曲线
		function onChangeQX(){
			var data2;
			var graph_type = $("#graph_type").val();//0 二维曲线 1三维曲线
			var dataName = $("#add_btn").attr("data-name");
			
			var yblTdLength = $("#yblTable tr").length;//table列数
			var dataName = $("#StrainRate_btn").attr("data-name");
			var wendu = '';
			var yingbian = '';
			var yingbianlv = '';
			
			if(graph_type == 0){//0 二维曲线

				var x_val = $("#x_val").val();// 1 温度 2 应变 3 应变率
				var y_val = $("#y_val").val();// 1 温度 2 应变 3 应变率
				var data1 = [];
				if(x_val != 1 && y_val != 1){//X,Y轴没有温度，绘制多曲线图
					var wendus = []; 
				
					if(dataName == 0){//点击的之前是编辑状态，需变为“保存”
						var inputs1 = $("#yblTable td.edit_1");
						var inputs2 = $("#yblTable td.edit_2");
						var inputs3 = $("#yblTable td.edit_3");
						var inputs4 = $("#yblTable td.edit_4");
						
						for(var i = 0;i<inputs1.length;i++){
							data1[i] = [];
							wendu = $(inputs2[i]).text();
						 	yingbian = $(inputs3[i]).text();
							yingbianlv = $(inputs4[i]).text();
							
							data1[i][0] = wendu;
							data1[i][1] = yingbian;
							data1[i][2] = yingbianlv;
						}
						data2 = arrayToJson(data1);
						
					}else{				
						//执行保存事件
						var StrainRate_str = '';
						//执行保存事件
						var inputs1 = $("#yblTable td.edit_1");
						var inputs2 = $("#yblTable td.edit_2");
						var inputs3 = $("#yblTable td.edit_3");
						var inputs4 = $("#yblTable td.edit_4");
						for(var i = 0;i<inputs1.length;i++){
							data1[i] = [];
							wendu = $(inputs2[i]).children('input').val()
						 	yingbian = $(inputs3[i]).children('input').val()
							yingbianlv = $(inputs4[i]).children('input').val()
							
							data1[i][0] = wendu;
							data1[i][1] = yingbian;
							data1[i][2] = yingbianlv;
						}
						
						
					}
					
						var count = 0 ;
						for(var i = 0 ; i<data1.length;i++){
							var flag = 0;
							for(var j=0;j<wendus.length;j++){
								if(wendus[j] == data1[i][0]){//重复了
									flag = 1;
									break;
								}
							}
							if(flag == 0){
								
								wendus[wendus.length] = data1[i][0];
							}
						}
						//循环所有温度
						var data3 = [];
						for(var i = 0; i < wendus.length; i++){
							var data4 = [];
							var data5 = [];
							var data4_count = 0;
							for(j = 0; j<data1.length; j++){
								if(wendus[i] == data1[j][0]){
									data4[data4_count] = [];
									if(x_val == 1){
										data4[data4_count][0] = data1[j][0] * 1;
									}else if(x_val == 2){
										data4[data4_count][0] = data1[j][1] * 1;
									}else if(x_val == 3){
										data4[data4_count][0] = data1[j][2] * 1;
									}
									
									if(y_val == 1){
										data4[data4_count][1] = data1[j][0] * 1;
									}else if(y_val == 2){
										data4[data4_count][1] = data1[j][1] * 1;
									}else if(y_val == 3){
										data4[data4_count][1] = data1[j][2] * 1;
									}
									data5.push({x : data4[data4_count][0] , y : data4[data4_count][1]})
									data4_count++;
								}
								
							}
							data2 = arrayToJson(data4);
							data3[i] = {"name":   wendus[i], "data": data5 };
						}
						
						
						
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
 						        series:  eval(data3)
// 						        [{name:'1',data:[[1,2]]},{name:'2',data:[[3,4]]}]
							};
							
							
							
							
					
				}else{//绘制单条二维曲线
					if(dataName == 0){//点击的之前是编辑状态，需变为“保存”
						var inputs1 = $("#yblTable td.edit_1");
						var inputs2 = $("#yblTable td.edit_2");
						var inputs3 = $("#yblTable td.edit_3");
						var inputs4 = $("#yblTable td.edit_4");
						
						for(var i = 0;i<inputs1.length;i++){
							data1[i] = [];
							wendu = $(inputs2[i]).text();
						 	yingbian = $(inputs3[i]).text();
							yingbianlv = $(inputs4[i]).text();
							
							if(x_val == 1){
								data1[i][0] = wendu * 1;
							}else if(x_val == 2){
								data1[i][0] = yingbian * 1;
							}else if(x_val == 3){
								data1[i][0] = yingbianlv * 1;
							}
							
							if(y_val == 1){
								data1[i][1] = wendu * 1;
							}else if(y_val == 2){
								data1[i][1] = yingbian * 1;
							}else if(y_val == 3){
								data1[i][1] = yingbianlv * 1;
							}
						}
						data2 = arrayToJson(data1);
						
					}else{
						//执行保存事件
						var StrainRate_str = '';
						//执行保存事件
						var inputs1 = $("#yblTable td.edit_1");
						var inputs2 = $("#yblTable td.edit_2");
						var inputs3 = $("#yblTable td.edit_3");
						var inputs4 = $("#yblTable td.edit_4");
						for(var i = 0;i<inputs1.length;i++){
							data1[i] = [];
							wendu = $(inputs2[i]).children('input').val()
						 	yingbian = $(inputs3[i]).children('input').val()
							yingbianlv = $(inputs4[i]).children('input').val()
							
							if(x_val == 1){
								data1[i][0] = wendu * 1;
							}else if(x_val == 2){
								data1[i][0] = yingbian * 1;
							}else if(x_val == 3){
								data1[i][0] = yingbianlv * 1;
							}
							
							if(y_val == 1){
								data1[i][1] = wendu * 1;
							}else if(y_val == 2){
								data1[i][1] = yingbian * 1;
							}else if(y_val == 3){
								data1[i][1] = yingbianlv * 1;
							}
						}
						data2 = arrayToJson(data1);
					}
					
					
					
					
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
				}
				
							
			}else{//1三维曲线
				var x_val = $("#x_val").val();// 1 温度 2 应变 3 应变率
				var y_val = $("#y_val").val();// 1 温度 2 应变 3 应变率
				var z_val = $("#z_val").val();// 1 温度 2 应变 3 应变率
				
				var data1 = [];
				if(dataName == 0){//点击的之前是编辑状态，需变为“保存”
					var inputs1 = $("#yblTable td.edit_1");
					var inputs2 = $("#yblTable td.edit_2");
					var inputs3 = $("#yblTable td.edit_3");
					var inputs4 = $("#yblTable td.edit_4");
					
					for(var i = 0;i<inputs1.length;i++){
						data1[i] = [];
						wendu = $(inputs2[i]).text();
					 	yingbian = $(inputs3[i]).text();
						yingbianlv = $(inputs4[i]).text();
						
						if(x_val == 1){
							data1[i][0] = wendu * 1;
						}else if(x_val == 2){
							data1[i][0] = yingbian * 1;
						}else if(x_val == 3){
							data1[i][0] = yingbianlv * 1;
						}
						
						if(y_val == 1){
							data1[i][1] = wendu * 1;
						}else if(y_val == 2){
							data1[i][1] = yingbian * 1;
						}else if(y_val == 3){
							data1[i][1] = yingbianlv * 1;
						}
						
						if(z_val == 1){
							data1[i][2] = wendu * 1;
						}else if(z_val == 2){
							data1[i][2] = yingbian * 1;
						}else if(z_val == 3){
							data1[i][2] = yingbianlv * 1;
						}
					}
					data2 = arrayToJson(data1);
					
				}else{
					//执行保存事件
					var StrainRate_str = '';
					//执行保存事件
					var inputs1 = $("#yblTable td.edit_1");
					var inputs2 = $("#yblTable td.edit_2");
					var inputs3 = $("#yblTable td.edit_3");
					var inputs4 = $("#yblTable td.edit_4");
					for(var i = 0;i<inputs1.length;i++){
						data1[i] = [];
						wendu = $(inputs2[i]).children('input').val()
					 	yingbian = $(inputs3[i]).children('input').val()
						yingbianlv = $(inputs4[i]).children('input').val()
						
						if(x_val == 1){
							data1[i][0] = wendu * 1;
						}else if(x_val == 2){
							data1[i][0] = yingbian * 1;
						}else if(x_val == 3){
							data1[i][0] = yingbianlv * 1;
						}
						
						if(y_val == 1){
							data1[i][1] = wendu * 1;
						}else if(y_val == 2){
							data1[i][1] = yingbian * 1;
						}else if(y_val == 3){
							data1[i][1] = yingbianlv * 1;
						}
						
						if(z_val == 1){
							data1[i][2] = wendu * 1;
						}else if(z_val == 2){
							data1[i][2] = yingbian * 1;
						}else if(z_val == 3){
							data1[i][2] = yingbianlv * 1;
						}
					}
					data2 = arrayToJson(data1);
				}
				
				
				
				
				
				
				
				var options = {
			            chart: {
			                renderTo: 'container',
			                margin: 100,
			                type: 'scatter',
			                options3d: {
			                    enabled: true,
			                    alpha: 10,
			                    beta: 30,
			                    depth: 250,
			                    viewDistance: 5,
			                    frame: {
			                        bottom: { size: 1, color: 'rgba(0,0,0,0.02)' },
			                        back: { size: 1, color: 'rgba(0,0,0,0.04)' },
			                        side: { size: 1, color: 'rgba(0,0,0,0.06)' }
			                    }
			                }
			            },
			            title: {
			                text: ''
			            },
			            plotOptions: {
			                scatter: {
			                    width: 10,
			                    height: 10,
			                    depth: 10
			                }
			            },
			            yAxis: {
			                min: 0,
			                max: 10,
			                title: null
			            },
			            xAxis: {
			                min: 0,
			                max: 10,
			                gridLineWidth: 1
			            },
			            zAxis: {
			                min: 0,
			                max: 10
			            },
			            legend: {
			                enabled: false
			            },
			            series: [{
			                name: 'Reading',//曲线名称（点击这个名称，会自动切换对用点集的隐藏与显示）
			                color: 'rgba(245, 8, 59,.5)',//点的颜色值（0-255,0-255,0-255,0-1）
			                data: eval(data2)
// 			                data: [[1, 6, 5], [8, 7, 9], [1, 3, 4], [4, 6, 8], [5, 7, 7], [6, 9, 6], [7, 0, 5], [2, 3, 3]]
			            }]
			        };
				
				
				
				
			
				
				
			}
			
			
					
			
		
		
// 			if(dataName == 0){//点击的之前是编辑状态，需变为“保存”
// 				var inputs1 = $("#tempTable td.edit_1");
// 				var inputs2 = $("#tempTable td.edit_2");
// 				for(var i = 0;i<inputs1.length;i++){
// 					var wendu = $(inputs1[i]).text();
// 					var canshu = $(inputs2[i]).text();
// 					data1[i] = [];
// 					data1[i][0] = wendu * 1;
// 					data1[i][1] = canshu * 1;
// 				}
// 			}else{
// 				执行保存事件
// 				var inputs1 = $("#tempTable td.edit_1");
// 				var inputs2 = $("#tempTable td.edit_2");
// 				for(var i = 0;i<inputs1.length;i++){
// 					var wendu = $(inputs1[i]).children('input').val();
// 					var canshu = $(inputs2[i]).children('input').val();
// 					data1[i] = [];
// 					data1[i][0] = wendu * 1;
// 					data1[i][1] = canshu * 1;
// 				}
				
// 			}
// 			data2 = arrayToJson(data1);
			
			
			var chart = new Highcharts.Chart(options);//执行绘图方法
			
		}
    </script>
</head>
<body style="background:#fff;">
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">

	<ul class="box_text">
	<form action="/material/saveMaterial" name="userForm" id="userForm" method="post">
	  <input type="hidden" id="array_PictureMaterial_userForm" name="array_PictureMaterial"/>
	  <input type="hidden" id="array_InformDetailMaterial_userForm" name="array_InformDetailMaterial"/>
	  <input type="hidden" id="array_InformDetailMaterial_name_userForm" name="array_InformDetailMaterial_name"/>
	  <input type="hidden" id="array_ApplicationMaterial_userForm" name="array_ApplicationMaterial"/>
	  <input type="hidden" id="array_ApplicationMaterial_name_userForm" name="array_ApplicationMaterial_name"/>
	  <input type="hidden" id="array_SimulationMaterial_userForm" name="array_SimulationMaterial"/>
	  <input type="hidden" id="array_SimulationMaterial_name_userForm" name="array_SimulationMaterial_name"/>
		
	  <input type="hidden" id="ConstituentsMaterial_userForm_1" name="ConstituentsMaterial"/>
	  <input type="hidden" id="MachineableMaterial_userForm_1" name="MachineableMaterial"/>
	  <input type="hidden" id="DensityMaterial_userForm_1" name="DensityMaterial"/>
	  <input type="hidden" id="ModulusMaterial_userForm_1" name="ModulusMaterial"/>
	  <input type="hidden" id="HardnessMaterial_userForm_1" name="HardnessMaterial"/>
	  <input type="hidden" id="ConductivityMaterial_userForm_1" name="ConductivityMaterial"/>
	  <input type="hidden" id="SpecificheatMaterial_userForm_1" name="SpecificheatMaterial"/>
	  <input type="hidden" id="StrengthMaterial_userForm_1" name="StrengthMaterial"/>
	  <input type="hidden" id="ThermalExpansionMaterial_userForm_1" name="ThermalExpansionMaterial"/>
	  <input type="hidden" id="JCMaterial_userForm_1" name="JCMaterial"/>
	  <input type="hidden" id="StrainRate_userForm_1" name="StrainRate"/>
	  
	  <input type="hidden" name="id_Material" id="id_Material_userForm" value="${(material.id_Material == null || material.id_Material == '') ? 0 : material.id_Material}"/>
		<li>
		  <span id="lititle">材料名称</span>
		  <input type="text" name="NameMaterial" id="NameMaterial_userForm" value="${material.NameMaterial }" class="input"/>
		</li>
		<li>
		  <span id="lititle">材料牌号</span>
		  <input type="text" name="NumberMaterial" id="NumberMaterial_userForm" value="${material.NumberMaterial }" class="input"/>
		</li>
		<li>
			<span id="lititle">材料类别</span>
			<span class="select_wrap">
				<span class="edit_select">
					<select  name="selectWrap"  id="selectWrap" onChange="changeValue();" class="select" contenteditable="true">
						<c:forEach items="${categoryMaterialList}" var="var" varStatus="vs">
							<option value="${var.id_CategoryMaterial }" ${material.id_CategoryMaterial == var.id_CategoryMaterial ? 'selected' : '' }>${var.name_CategoryMaterial }</option>	
						</c:forEach>
					</select>
				</span>
				<span class="input_select">
					<input type="text" name="id_CategoryMaterial" id="id_CategoryMaterial_userForm" value="">
				</span>
			</span>
		</li>
		<li>
		  <span id="lititle">ISO加工分类</span>
		  <select name="ISOCuttingMaterial" id="ISOCuttingMaterial_userForm" class="select">
			<option value="P" ${material.ISOCuttingMaterial == 'P' ? 'selected' : '' }>P</option>
			<option value="M" ${material.ISOCuttingMaterial == 'M' ? 'selected' : '' }>M</option>
			<option value="K" ${material.ISOCuttingMaterial == 'K' ? 'selected' : '' }>K</option>
			<option value="N" ${material.ISOCuttingMaterial == 'N' ? 'selected' : '' }>N</option>
			<option value="S" ${material.ISOCuttingMaterial == 'S' ? 'selected' : '' }>S</option>
			<option value="H" ${material.ISOCuttingMaterial == 'H' ? 'selected' : '' }>H</option>
		  </select>
		</li>
		<li>
		  <span id="lititle">热处理方式</span> 
		  <input type="text" name="CategoryMaterial" id="CategoryMaterial_userForm" value="${material.CategoryMaterial }" class="input"/>
		</li>
		<li>
		  <span id="lititle">供应商</span>
		  <input type="text" name="CompanyMaterial" id="CompanyMaterial_userForm" value="${material.CompanyMaterial }" class="input"/>
		</li>
		</form>
		<form action="/material/savePictureMaterial" name="pictureMaterialForm" id="pictureMaterialForm" method="post" enctype="multipart/form-data">
		  
		  
		  <input name="id_Material" type="hidden" value="${(material.id_Material == null || material.id_Material == '') ? 0 : material.id_Material}"/>
		  
		  <input type="hidden" id="NameMaterial_pictureMaterialForm" value="${material.NameMaterial }" class="input" name="NameMaterial"/>
		  <input type="hidden" id="NumberMaterial_pictureMaterialForm" value="${material.NumberMaterial }" class="input" name="NumberMaterial"/>
		  <input type="hidden" id="id_CategoryMaterial_pictureMaterialForm" value="${material.id_CategoryMaterial }" class="input" name="id_CategoryMaterial"/>
		  <input type="hidden" id="ISOCuttingMaterial_pictureMaterialForm" value="${material.ISOCuttingMaterial }" class="input" name="ISOCuttingMaterial"/>
		  <input type="hidden" id="CategoryMaterial_pictureMaterialForm" value="${material.CategoryMaterial }" class="input" name="CategoryMaterial"/>
		  <input type="hidden" id="CompanyMaterial_pictureMaterialForm" value="${material.CompanyMaterial }" class="input" name="CompanyMaterial"/>
		  <input type="hidden" id="ConstituentsMaterial_pictureMaterialForm" value="${material.ConstituentsMaterial }" class="input" name="ConstituentsMaterial"/>
		  <input type="hidden" id="MachineableMaterial_pictureMaterialForm" value="${material.MachineableMaterial }" class="input" name="MachineableMaterial"/>
		  <input type="hidden" id="DensityMaterial_pictureMaterialForm" value="${material.DensityMaterial }" class="input" name="DensityMaterial"/>
		  <input type="hidden" id="ModulusMaterial_pictureMaterialForm" value="${material.ModulusMaterial }" class="input" name="ModulusMaterial"/>
		  <input type="hidden" id="HardnessMaterial_pictureMaterialForm" value="${material.HardnessMaterial }" class="input" name="HardnessMaterial"/>
		  <input type="hidden" id="ConductivityMaterial_pictureMaterialForm" value="${material.ConductivityMaterial }" class="input" name="ConductivityMaterial"/>
		  <input type="hidden" id="SpecificheatMaterial_pictureMaterialForm" value="${material.SpecificheatMaterial }" class="input" name="SpecificheatMaterial"/>
		  <input type="hidden" id="StrengthMaterial_pictureMaterialForm" value="${material.StrengthMaterial }" class="input" name="StrengthMaterial"/>
		  <input type="hidden" id="ThermalExpansionMaterial_pictureMaterialForm" value="${material.ThermalExpansionMaterial }" class="input" name="ThermalExpansionMaterial"/>
		  <input type="hidden" id="JCMaterial_pictureMaterialForm" value="${material.JCMaterial }" class="input" name="JCMaterial"/>
		  <input type="hidden" id="StrainRate_pictureMaterialForm" value="${material.StrainRate }" class="input" name="StrainRate"/>
		  
		  <li class="block">
		    <span id="lititle">图片</span>
		    <input type="hidden" value="${array_PictureMaterial == null ? '' : array_PictureMaterial }" id="array_PictureMaterial" name="array_PictureMaterial"/>
		    <input type="hidden" value="${array_InformDetailMaterial == null ? '' : array_InformDetailMaterial }" name="array_InformDetailMaterial"/>
		    <input type="hidden" value="${array_InformDetailMaterial_name == null ? '' : array_InformDetailMaterial_name }" name="array_InformDetailMaterial_name"/>
		    <input type="hidden" value="${array_ApplicationMaterial == null ? '' : array_ApplicationMaterial }" name="array_ApplicationMaterial"/>
		    <input type="hidden" value="${array_ApplicationMaterial_name == null ? '' : array_ApplicationMaterial_name }" name="array_ApplicationMaterial_name"/>
		    <input type="hidden" value="${array_SimulationMaterial == null ? '' : array_SimulationMaterial }" name="array_SimulationMaterial"/>
		    <input type="hidden" value="${array_SimulationMaterial_name == null ? '' : array_SimulationMaterial_name }" name="array_SimulationMaterial_name"/>
		    <input type="file" accept="image/*" name="PictureMaterial" id="PictureMaterial" />
		    <input type="button" value="加载图片" class="btn" onclick="onSavePictureMaterialList();"/>
		    <span id="span_PictureMaterialList">
		      <c:forEach items="${material.pictureMaterialList}" var="var" varStatus="vs">
		      	<div><img name='pictureMaterials_img' width='100px' height='100px' src='<%=path%>/goods${var.url_PictureMaterial }' /><a class="btn btn_shanchu" onclick='onDelPictureMaterialImg("${var.url_PictureMaterial }");'>删除</a><br/></div>
		      </c:forEach>
		    </span>
		  </li>
		  
		</form>
		<li class="block nobor">
			<input type="hidden" name="ConstituentsMaterial" id="ConstituentsMaterial_userForm" value="${material.ConstituentsMaterial }" /> 
			<span id="lititle">材料主要成分</span>
			<input type="button" value="点击输入" class="btn_add" id="ConstituentsMaterial_btn" data-name="0" onclick="editCl(this);"><!-- data-name : 值为0时对应的状态为“点击输入”  ， 值为1时对应的状态为“保存”-->
			&nbsp;
			<input type="button" value="添加" class="btn_add" id="btn_add_ConstituentsMaterial"  onclick="addCl(this);" style="display: none;"/>
		</li>


		<li class="block nobor">
			<!--  材料表格  -->
			<table border="1" class="li_table box_table"  id="clTable">
			  <tr class="cl_tr_0">
			    <th class="th">元素</th>
			    <c:forEach items="${material.ConstituentsMaterialList}" var="var" varStatus="vs">
			    	<td class="td edit_1" id="cl_tr0_td${vs.index }">${var.yuansu }</td>
			    </c:forEach>
			  </tr>
			  <tr class="cl_tr_1">
			    <th class="th">百分比</th>
			    <c:forEach items="${material.ConstituentsMaterialList}" var="var" varStatus="vs">
			    	<td class="td edit_2" id="cl_tr1_td${vs.index }">${var.baifenbi }</td>
			    </c:forEach>
			  </tr>
			  <tr class="cl_tr_2">
			    <th class="th">操作</th>
			    <c:forEach items="${material.ConstituentsMaterialList}" var="var" varStatus="vs">
			     	<td class="td" id="cl_tr2_td${vs.index }"><a class="btn btn_bg_orange b_block" onclick="delCl(${vs.index })">删除</a></td>
			    </c:forEach>
			  </tr>
			</table>
		</li>


		<li class="block nobor">
		  <span id="lititle">材料加工性</span> &nbsp; 
		</li>
		<li class="block">
		  <textarea id="MachineableMaterial_userForm" name="MachineableMaterial" cols="" rows="" class="textarea textarea_block">${material.MachineableMaterial }</textarea>
		</li>
		<form action="/material/saveInformDetailMaterial" name="informDetailMaterialForm" id="informDetailMaterialForm" method="post" enctype="multipart/form-data">
		<input name="id_Material" type="hidden" value="${(material.id_Material == null || material.id_Material == '') ? 0 : material.id_Material}"/>
		  
		  <input type="hidden" id="NameMaterial_informDetailMaterialForm" value="${material.NameMaterial }" class="input" name="NameMaterial"/>
		  <input type="hidden" id="NumberMaterial_informDetailMaterialForm" value="${material.NumberMaterial }" class="input" name="NumberMaterial"/>
		  <input type="hidden" id="id_CategoryMaterial_informDetailMaterialForm" value="${material.id_CategoryMaterial }" class="input" name="id_CategoryMaterial"/>
		  <input type="hidden" id="ISOCuttingMaterial_informDetailMaterialForm" value="${material.ISOCuttingMaterial }" class="input" name="ISOCuttingMaterial"/>
		  <input type="hidden" id="CategoryMaterial_informDetailMaterialForm" value="${material.CategoryMaterial }" class="input" name="CategoryMaterial"/>
		  <input type="hidden" id="CompanyMaterial_informDetailMaterialForm" value="${material.CompanyMaterial }" class="input" name="CompanyMaterial"/>
		  <input type="hidden" id="ConstituentsMaterial_informDetailMaterialForm" value="${material.ConstituentsMaterial }" class="input" name="ConstituentsMaterial"/>
		  <input type="hidden" id="MachineableMaterial_informDetailMaterialForm" value="${material.MachineableMaterial }" class="input" name="MachineableMaterial"/>
		  <input type="hidden" id="DensityMaterial_informDetailMaterialForm" value="${material.DensityMaterial }" class="input" name="DensityMaterial"/>
		  <input type="hidden" id="ModulusMaterial_informDetailMaterialForm" value="${material.ModulusMaterial }" class="input" name="ModulusMaterial"/>
		  <input type="hidden" id="HardnessMaterial_informDetailMaterialForm" value="${material.HardnessMaterial }" class="input" name="HardnessMaterial"/>
		  <input type="hidden" id="ConductivityMaterial_informDetailMaterialForm" value="${material.ConductivityMaterial }" class="input" name="ConductivityMaterial"/>
		  <input type="hidden" id="SpecificheatMaterial_informDetailMaterialForm" value="${material.SpecificheatMaterial }" class="input" name="SpecificheatMaterial"/>
		  <input type="hidden" id="StrengthMaterial_informDetailMaterialForm" value="${material.StrengthMaterial }" class="input" name="StrengthMaterial"/>
		  <input type="hidden" id="ThermalExpansionMaterial_informDetailMaterialForm" value="${material.ThermalExpansionMaterial }" class="input" name="ThermalExpansionMaterial"/>
		  <input type="hidden" id="JCMaterial_informDetailMaterialForm" value="${material.JCMaterial }" class="input" name="JCMaterial"/>
		  <input type="hidden" id="StrainRate_informDetailMaterialForm" value="${material.StrainRate }" class="input" name="StrainRate"/>
		  
		
		<li class="block">
		  <span id="lititle">详细信息</span>
		  <input type="hidden" value="${array_PictureMaterial == null ? '' : array_PictureMaterial }"  name="array_PictureMaterial"/>
		    <input type="hidden" value="${array_InformDetailMaterial == null ? '' : array_InformDetailMaterial }" id="array_InformDetailMaterial" name="array_InformDetailMaterial"/>
		    <input type="hidden" value="${array_InformDetailMaterial_name == null ? '' : array_InformDetailMaterial_name }" id="array_InformDetailMaterial_name" name="array_InformDetailMaterial_name"/>
		    <input type="hidden" value="${array_ApplicationMaterial == null ? '' : array_ApplicationMaterial }" name="array_ApplicationMaterial"/>
		    <input type="hidden" value="${array_ApplicationMaterial_name == null ? '' : array_ApplicationMaterial_name }" name="array_ApplicationMaterial_name"/>
		    <input type="hidden" value="${array_SimulationMaterial == null ? '' : array_SimulationMaterial }" name="array_SimulationMaterial"/>
		    <input type="hidden" value="${array_SimulationMaterial_name == null ? '' : array_SimulationMaterial_name }" name="array_SimulationMaterial_name"/>
		    <input type="file" accept=".pdf" name="InformDetailMaterial" id="InformDetailMaterial" />
	    	<input type="button" value="加载文档" class="btn" onclick="onSaveInformDetailMaterialList();"/>
		  <span id="span_InformDetailMaterialList">
	      <c:forEach items="${material.informDetailMaterialList}" var="var" varStatus="vs">
	      	<div><span name='informDetailMaterials_img' >${var.url_InformDetailMaterial }</span><a class="btn btn_shanchu" onclick='onDelInformDetailMaterialImg("${var.url_InformDetailMaterial }");'>删除</a><br/></div>
	      
	      </c:forEach>
	    </span>
		</li>
		</form>
		<form action="/material/saveApplicationMaterial" name="applicationMaterialForm" id="applicationMaterialForm" method="post" enctype="multipart/form-data">
		
		<input name="id_Material" type="hidden" value="${(material.id_Material == null || material.id_Material == '') ? 0 : material.id_Material}"/>
		  
		  <input type="hidden" id="NameMaterial_applicationMaterialForm" value="${material.NameMaterial }" class="input" name="NameMaterial"/>
		  <input type="hidden" id="NumberMaterial_applicationMaterialForm" value="${material.NumberMaterial }" class="input" name="NumberMaterial"/>
		  <input type="hidden" id="id_CategoryMaterial_applicationMaterialForm" value="${material.id_CategoryMaterial }" class="input" name="id_CategoryMaterial"/>
		  <input type="hidden" id="ISOCuttingMaterial_applicationMaterialForm" value="${material.ISOCuttingMaterial }" class="input" name="ISOCuttingMaterial"/>
		  <input type="hidden" id="CategoryMaterial_applicationMaterialForm" value="${material.CategoryMaterial }" class="input" name="CategoryMaterial"/>
		  <input type="hidden" id="CompanyMaterial_applicationMaterialForm" value="${material.CompanyMaterial }" class="input" name="CompanyMaterial"/>
		  <input type="hidden" id="ConstituentsMaterial_applicationMaterialForm" value="${material.ConstituentsMaterial }" class="input" name="ConstituentsMaterial"/>
		  <input type="hidden" id="MachineableMaterial_applicationMaterialForm" value="${material.MachineableMaterial }" class="input" name="MachineableMaterial"/>
		  <input type="hidden" id="DensityMaterial_applicationMaterialForm" value="${material.DensityMaterial }" class="input" name="DensityMaterial"/>
		  <input type="hidden" id="ModulusMaterial_applicationMaterialForm" value="${material.ModulusMaterial }" class="input" name="ModulusMaterial"/>
		  <input type="hidden" id="HardnessMaterial_applicationMaterialForm" value="${material.HardnessMaterial }" class="input" name="HardnessMaterial"/>
		  <input type="hidden" id="ConductivityMaterial_applicationMaterialForm" value="${material.ConductivityMaterial }" class="input" name="ConductivityMaterial"/>
		  <input type="hidden" id="SpecificheatMaterial_applicationMaterialForm" value="${material.SpecificheatMaterial }" class="input" name="SpecificheatMaterial"/>
		  <input type="hidden" id="StrengthMaterial_applicationMaterialForm" value="${material.StrengthMaterial }" class="input" name="StrengthMaterial"/>
		  <input type="hidden" id="ThermalExpansionMaterial_applicationMaterialForm" value="${material.ThermalExpansionMaterial }" class="input" name="ThermalExpansionMaterial"/>
		  <input type="hidden" id="JCMaterial_applicationMaterialForm" value="${material.JCMaterial }" class="input" name="JCMaterial"/>
		  <input type="hidden" id="StrainRate_applicationMaterialForm" value="${material.StrainRate }" class="input" name="StrainRate"/>
		  
		
		<li class="block">
		  <span id="lititle">应用实例</span>
		  <input type="hidden" value="${array_PictureMaterial == null ? '' : array_PictureMaterial }"  name="array_PictureMaterial"/>
		    <input type="hidden" value="${array_InformDetailMaterial == null ? '' : array_InformDetailMaterial }"  name="array_InformDetailMaterial"/>
		    <input type="hidden" value="${array_InformDetailMaterial_name == null ? '' : array_InformDetailMaterial_name }"  name="array_InformDetailMaterial_name"/>
		    <input type="hidden" value="${array_ApplicationMaterial == null ? '' : array_ApplicationMaterial }" id="array_ApplicationMaterial" name="array_ApplicationMaterial"/>
		    <input type="hidden" value="${array_ApplicationMaterial_name == null ? '' : array_ApplicationMaterial_name }" id="array_ApplicationMaterial_name" name="array_ApplicationMaterial_name"/>
		    <input type="hidden" value="${array_SimulationMaterial == null ? '' : array_SimulationMaterial }" name="array_SimulationMaterial"/>
		    <input type="hidden" value="${array_SimulationMaterial_name == null ? '' : array_SimulationMaterial_name }" name="array_SimulationMaterial_name"/>
		    <input type="file" accept=".pdf" name="ApplicationMaterial" id="ApplicationMaterial" />
	    	<input type="button" value="加载文档" class="btn" onclick="onSaveApplicationMaterialList();"/>
			<span id="span_ApplicationMaterialList">
	      <c:forEach items="${material.applicationMaterialList}" var="var" varStatus="vs">
	      	<div><span name='applicationMaterials_img' >${var.url_ApplicationMaterial }</span><a class="btn btn_shanchu" onclick='onDelApplicationMaterialImg("${var.url_ApplicationMaterial }");'>删除</a><br/></div>
	      
	      </c:forEach>
		</li>
		</form>
		<li>
		  
		  <span id="lititle">材料密度</span>
		  <input type="text"  readonly="readonly" name="DensityMaterial" id="DensityMaterial_userForm" value="${material.DensityMaterial }" class="input" />
<!-- 		  <input type="text" value="0" class="input"/> -->
		  <a href="#" class="btn btn_wd" onclick="onEditWDXG('DensityMaterial_userForm');">温度相关</a>
		</li>
		<li>
		  
		  <span id="lititle">弹性模量</span>
		  <input type="text"  readonly="readonly" name="ModulusMaterial" id="ModulusMaterial_userForm" value="${material.ModulusMaterial }" class="input" />
<!-- 		  <input type="text" value="0" class="input"/> -->
		  <a href="#" class="btn btn_wd" onclick="onEditWDXG('ModulusMaterial_userForm');">温度相关</a>
		</li>
		<li>
		  
		  <span id="lititle">材料硬度</span>
		  <input type="text"  readonly="readonly" name="HardnessMaterial" id="HardnessMaterial_userForm" value="${material.HardnessMaterial }" class="input" />
<!-- 		  <input type="text" value="0" class="input"/> -->
		  <a href="#" class="btn btn_wd" onclick="onEditWDXG('HardnessMaterial_userForm');">温度相关</a>
		</li>
		<li>
		  
		  <span id="lititle">材料热导率</span>
		  <input type="text"  readonly="readonly" name="ConductivityMaterial" id="ConductivityMaterial_userForm" value="${material.ConductivityMaterial }" class="input" />
<!-- 		  <input type="text" value="0" class="input"/> -->
		  <a href="#" class="btn btn_wd" onclick="onEditWDXG('ConductivityMaterial_userForm');">温度相关</a>
		</li>
		<li>
		  
		  <span id="lititle">材料比热</span>
		  <input type="text"  readonly="readonly" name="SpecificheatMaterial" id="SpecificheatMaterial_userForm" value="${material.SpecificheatMaterial }" class="input" />
<!-- 		  <input type="text" value="0" class="input"/> -->
		  <a href="#" class="btn btn_wd" onclick="onEditWDXG('SpecificheatMaterial_userForm');">温度相关</a>
		</li>
		<li>
		  
		  <span id="lititle">抗拉强度</span>
		  <input type="text"  readonly="readonly" name="StrengthMaterial" id="StrengthMaterial_userForm" value="${material.StrengthMaterial }" class="input" />
<!-- 		  <input type="text" value="0" class="input"/> -->
		  <a href="#" class="btn btn_wd" onclick="onEditWDXG('StrengthMaterial_userForm');">温度相关</a>
		</li>
		<li>
		  
		  <span id="lititle">热膨胀系数</span>
		  <input type="text"  readonly="readonly" name="ThermalExpansionMaterial" id="ThermalExpansionMaterial_userForm" value="${material.ThermalExpansionMaterial }" class="input" />
<!-- 		  <input type="text" value="0" class="input"/> -->
		  <a href="#" class="btn btn_wd" onclick="onEditWDXG('ThermalExpansionMaterial_userForm');">温度相关</a>
		</li>
		<form action="/material/saveSimulationMaterial" name="simulationMaterialForm" id="simulationMaterialForm" method="post" enctype="multipart/form-data">
		
		<input name="id_Material" type="hidden" value="${(material.id_Material == null || material.id_Material == '') ? 0 : material.id_Material}"/>
		  
		  <input type="hidden" id="NameMaterial_simulationMaterialForm" value="${material.NameMaterial }" class="input" name="NameMaterial"/>
		  <input type="hidden" id="NumberMaterial_simulationMaterialForm" value="${material.NumberMaterial }" class="input" name="NumberMaterial"/>
		  <input type="hidden" id="id_CategoryMaterial_simulationMaterialForm" value="${material.id_CategoryMaterial }" class="input" name="id_CategoryMaterial"/>
		  <input type="hidden" id="ISOCuttingMaterial_simulationMaterialForm" value="${material.ISOCuttingMaterial }" class="input" name="ISOCuttingMaterial"/>
		  <input type="hidden" id="CategoryMaterial_simulationMaterialForm" value="${material.CategoryMaterial }" class="input" name="CategoryMaterial"/>
		  <input type="hidden" id="CompanyMaterial_simulationMaterialForm" value="${material.CompanyMaterial }" class="input" name="CompanyMaterial"/>
		  <input type="hidden" id="ConstituentsMaterial_simulationMaterialForm" value="${material.ConstituentsMaterial }" class="input" name="ConstituentsMaterial"/>
		  <input type="hidden" id="MachineableMaterial_simulationMaterialForm" value="${material.MachineableMaterial }" class="input" name="MachineableMaterial"/>
		  <input type="hidden" id="DensityMaterial_simulationMaterialForm" value="${material.DensityMaterial }" class="input" name="DensityMaterial"/>
		  <input type="hidden" id="ModulusMaterial_simulationMaterialForm" value="${material.ModulusMaterial }" class="input" name="ModulusMaterial"/>
		  <input type="hidden" id="HardnessMaterial_simulationMaterialForm" value="${material.HardnessMaterial }" class="input" name="HardnessMaterial"/>
		  <input type="hidden" id="ConductivityMaterial_simulationMaterialForm" value="${material.ConductivityMaterial }" class="input" name="ConductivityMaterial"/>
		  <input type="hidden" id="SpecificheatMaterial_simulationMaterialForm" value="${material.SpecificheatMaterial }" class="input" name="SpecificheatMaterial"/>
		  <input type="hidden" id="StrengthMaterial_simulationMaterialForm" value="${material.StrengthMaterial }" class="input" name="StrengthMaterial"/>
		  <input type="hidden" id="ThermalExpansionMaterial_simulationMaterialForm" value="${material.ThermalExpansionMaterial }" class="input" name="ThermalExpansionMaterial"/>
		  <input type="hidden" id="JCMaterial_simulationMaterialForm" value="${material.JCMaterial }" class="input" name="JCMaterial"/>
		  <input type="hidden" id="StrainRate_simulationMaterialForm" value="${material.StrainRate }" class="input" name="StrainRate"/>
		  
		
		<li class="block">
		  <span id="lititle">仿真参数</span>
		  <input type="hidden" value="${array_PictureMaterial == null ? '' : array_PictureMaterial }"  name="array_PictureMaterial"/>
		    <input type="hidden" value="${array_InformDetailMaterial == null ? '' : array_InformDetailMaterial }"  name="array_InformDetailMaterial"/>
		    <input type="hidden" value="${array_InformDetailMaterial_name == null ? '' : array_InformDetailMaterial_name }"  name="array_InformDetailMaterial_name"/>
		    <input type="hidden" value="${array_ApplicationMaterial == null ? '' : array_ApplicationMaterial }"  name="array_ApplicationMaterial"/>
		    <input type="hidden" value="${array_ApplicationMaterial_name == null ? '' : array_ApplicationMaterial_name }"  name="array_ApplicationMaterial_name"/>
		    <input type="hidden" value="${array_SimulationMaterial == null ? '' : array_SimulationMaterial }" id="array_SimulationMaterial" name="array_SimulationMaterial"/>
		    <input type="hidden" value="${array_SimulationMaterial_name == null ? '' : array_SimulationMaterial_name }" id="array_SimulationMaterial_name" name="array_SimulationMaterial_name"/>
		    <input type="file" accept=".txt" name="SimulationMaterial" id="SimulationMaterial" />
	    	<input type="button" value="导入仿真文件" class="btn" onclick="onSaveSimulationMaterialList();"/>
			<span id="span_SimulationMaterialList">
	      <c:forEach items="${material.simulationMaterialList}" var="var" varStatus="vs">
	      	<div><span name='simulationMaterials_img' >${var.url_SimulationMaterial }</span><a class="btn btn_shanchu" onclick='onDelSimulationMaterialImg("${var.url_SimulationMaterial }");'>删除</a><br/></div>
	      
	      </c:forEach>
		</li>
		</form>


		<li class="block nobor">
		  <input type="hidden" name="JCMaterial" id="JCMaterial_userForm" value="${material.JCMaterial }" />
		  <span id="lititle">JC模型</span>
		  <input type="button" value="点击输入" class="btn_add" data-name="0"  onclick="editJsModel(this);">
		</li>



		<li><span id="lititle" class="text_c">A</span><span class="model">${material.JCMaterials[0] }</span></li>
		<li><span id="lititle" class="text_c">B</span><span class="model">${material.JCMaterials[1] }</span></li>
		<li><span id="lititle" class="text_c">n</span><span class="model">${material.JCMaterials[2] }</span></li>
		<li><span id="lititle" class="text_c">C</span><span class="model">${material.JCMaterials[3] }</span></li>
		<li><span id="lititle" class="text_c">m</span><span class="model">${material.JCMaterials[4] }</span></li>



		<li class="block nobor">
		<input type="hidden" name="StrainRate" id="StrainRate_userForm" value="${material.StrainRate }" />
			<span id="lititle">应变 应变率</span>
			<input type="button" value="点击输入" id="StrainRate_btn" class="btn_add"  data-name="0"  onclick="editYblData(this);">&nbsp;
			<input type="button" value="增加行" id="btn_add_StrainRate" class="btn_add"  onclick="addYblData();" style="display: none;">
		</li>


		<li class="block nobor">
			<table border="1" class="box_table li_table" id="yblTable">
				  <tr>
						<th class="th">数据点</td>
						<td class="th">温度</td>
						<td class="th">应变</td>
						<td class="th">应变率</td>
						<td class="th">操作</td>
				  </tr>
				  <c:forEach items="${material.StrainRateList}" var="var" varStatus="vs">
				  	<tr id="ybl_tr${vs.index }" >
						<td class="td edit_1" id="ybl_td1_tr${vs.index }">${var.shujudian }</td>
						<td class="td edit_2" id="ybl_td2_tr${vs.index }">${var.wendu }</td>
						<td class="td edit_3" id="ybl_td3_tr${vs.index }">${var.yingbian }</td>
						<td class="td edit_4" id="ybl_td4_tr${vs.index }">${var.yingbianlv }</td>
						<td class="td"><a class="btn btn_bg_orange b_block" onclick="delYbl(${vs.index });">删除</a></td>
					</tr>
				  </c:forEach>
			</table>
		</li>
		<li class="block nobor  graph_wrap">
		
			<input type="button" value="生成曲线" class="btn_add" onclick="onChangeQX();" />
			
			
			<span class="graph_type">曲线维数:
				<select name="graph_type" id="graph_type"  onChange="graphType();">
					<option value="0">二维曲线图</option>
					<option value="1">三维曲线图</option>
				</select>
			</span>
			
			<span class="x_val" >x:
				<select name="" id="x_val">
					<option value="1">温度</option>
					<option value="2">应变</option>
					<option value="3">应变率</option>
				</select>
			</span>
			
			<span class="y_val" >y:
				<select name="" id="y_val">
					<option value="1">温度</option>
					<option value="2">应变</option>
					<option value="3">应变率</option>
				</select>
			</span>
			
			<span class="z_val" >z:
				<select name="" id="z_val">
					<option value="1">温度</option>
					<option value="2">应变</option>
					<option value="3">应变率</option>
				</select>
			</span>
		
		
		
		</li>
		
		
		
		
		
		<li class="block nobor">
		
			<div id="container" class="iframe_boxqx"></div>
		
			<!-- <iframe width="740px" height="300px" src="" class="iframe_boxqx"></iframe> -->
		</li>
		<div class="clear"></div>
	
	</ul>
</div>

<!-- 温度弹出   -->
<!-- <div class="bg"></div> -->
<div class="iframe_wrap">
	<iframe src="" id="iframe_wdxg"  width="100%"  height="970px" frameborder="0"></iframe>
</div>

<script>

	//点击输入材料
	function editCl(id){
		var clTdLength = $("#clTable td").length;//table列数
		var dataName = $(id).attr("data-name");
		if(dataName == 0){//点击的之前是编辑状态，需变为“保存”
			$("#btn_add_ConstituentsMaterial").show();
			$(id).attr("data-name","1");
				$(id).val("保存");
		}else{
			$("#btn_add_ConstituentsMaterial").hide();
			$(id).attr("data-name","0");
				$(id).val("点击输入");
		}
		if(clTdLength != 0) {
			
			
			if(dataName == 0){//点击的之前是编辑状态，需变为“保存”
				
				htmlInput = '<input type="text" />';
				var inputs1 = $("#clTable td.edit_1");
				var inputs2 = $("#clTable td.edit_2");
				for(var i = 0;i<inputs1.length;i++){
					$(inputs1[i]).html('<input type="text" value="'+$(inputs1[i]).text()+'" />');
					$(inputs2[i]).html('<input type="text" value="'+$(inputs2[i]).text()+'" />');
					
				}
				
			}else{
				var ConstituentsMaterial_str = '';
				
				//执行保存事件
				var inputs1 = $("#clTable td.edit_1");
				var inputs2 = $("#clTable td.edit_2");
				for(var i = 0;i<inputs1.length;i++){
					ConstituentsMaterial_str = ConstituentsMaterial_str + ($(inputs1[i]).children('input').val()==""?" ":$(inputs1[i]).children('input').val()) + "-" + ($(inputs2[i]).children('input').val()==""?" ":$(inputs2[i]).children('input').val()) + ",";
					$("#ConstituentsMaterial_userForm").val(ConstituentsMaterial_str);
					$(inputs1[i]).html($(inputs1[i]).children('input').val());
					$(inputs2[i]).html($(inputs2[i]).children('input').val());
				}
				$("#clTable td.edit input").remove();//td变为不可编辑
				
			}
		}
	}




	//添加材料
	function addCl(id){
		var dataName = $(id).attr("data-name");
		
		var clTdLength = document.getElementById("clTable").rows.item(0).cells.length;//材料table列数
		
		
		var addTrId = $("#clTable tr.cl_tr_0 td").eq(clTdLength-2).attr("id");//获取table表格最后一列的td的ID
		
		
		if(addTrId != undefined || addTrId != null){
			addTrIdNum = parseInt(addTrId.substring(addTrId.lastIndexOf("td")+2));
			
		
			var clTrLength = $("#clTable tr").length;//材料table行数

			var htmlTr = new Array();
	
			htmlTr[0] = '<td class="td edit_1" id="cl_tr0_td' + (addTrIdNum+1)  +'"><input type="text" value=" " /></td>';
			htmlTr[1] = '<td class="td edit_2" id="cl_tr1_td' + (addTrIdNum+1)  +'"><input type="text" value=" " /></td>';
			htmlTr[2] = '<td class="td" id="cl_tr2_td' + (addTrIdNum+1)  +'"><a class="btn btn_bg_orange b_block" onclick="delCl(' + (addTrIdNum+1) + ')">删除</a></td>';
			for(var i=0;i<clTrLength;i++){
				$(".cl_tr_" + i).append(htmlTr[i]);
			}
	
		}else{
		
			var clTrLength = $("#clTable tr").length;//材料table行数

			var htmlTr = new Array();
	
			htmlTr[0] = '<td class="td edit_1" id="cl_tr0_td' + (clTdLength-1)  +'"><input type="text" value=" " /></td>';
			htmlTr[1] = '<td class="td edit_2" id="cl_tr1_td' + (clTdLength-1)  +'"><input type="text" value=" " /></td>';
			htmlTr[2] = '<td class="td" id="cl_tr2_td' + (clTdLength-1)  +'"><a class="btn btn_bg_orange b_block" onclick="delCl(' + (clTdLength-1) + ')">删除</a></td>';
			for(var i=0;i<clTrLength;i++){
				$(".cl_tr_" + i).append(htmlTr[i]);
			}
		
		
		}
		
		
		
		
		
	}
	
	

	//删除材料整列
	function delCl(id){
		var dataName = $("#ConstituentsMaterial_btn").attr("data-name");
		var str = '';
		if(dataName == 0){//保存
			str = str + $("#cl_tr" + 0 + "_td" + id ).html() + "-";
			str = str + $("#cl_tr" + 1 + "_td" + id ).html() + ",";
		}else{//点击输入
			str = str + $("#cl_tr" + 0 + "_td" + id + " input").val() + "-";
			str = str + $("#cl_tr" + 1 + "_td" + id + " input").val() + ",";
		}
		var ConstituentsMaterial = $("#ConstituentsMaterial_userForm").val();
		ConstituentsMaterial = ConstituentsMaterial.replace(str, '');
		$("#ConstituentsMaterial_userForm").val(ConstituentsMaterial);
		
		if(confirm("确定要删除吗?")){
			var clTrLength = $("#clTable tr").length;//材料table行数
			for(var i=0;i<clTrLength;i++){
				$("#cl_tr" + i + "_td" + id).remove();
			}
		}
	}


	//Js模型
	function editJsModel(id){ 
		var dataName = $(id).attr("data-name");
		if(dataName == 0){//点击的之前是编辑状态，需变为“保存”
			var model = $(".model");
			for(var i = 0; i < model.length; i++){
				$(model[i]).html('<input type="text" value="' + $(model[i]).text() + '" >');
			}
			$(".model").addClass("model_val");
			$(id).attr("data-name","1");
			$(id).val("保存");
		}else{

			//执行保存事件
			var model_str = '';
			var model = $(".model");
			for(var i = 0; i < model.length; i++){
				model_str = model_str + $(model[i]).children('input').val() + ',';
				$(model[i]).html($(model[i]).children('input').val());
				
			}
			
			$("#JCMaterial_userForm").val(model_str);
// 			$(".model input").remove();
			$(".model").removeClass("model_val");
			$(id).attr("data-name","0");
			$(id).val("点击输入");

		}
	}


	//应变率
	//点击输入应变率
	function editYblData(id){ 
		var yblTdLength = $("#yblTable tr").length;//table列数
		var dataName = $(id).attr("data-name");
		if(dataName == 0){//点击的之前是编辑状态，需变为“保存”
				$("#btn_add_StrainRate").show();
				$(id).attr("data-name","1");
				$(id).val("保存");
			}else{

				//执行保存事件
				$("#btn_add_StrainRate").hide();
				
				$(id).attr("data-name","0");
				$(id).val("点击输入");

			}
		if(yblTdLength > 1) {
			
			if(dataName == 0){//点击的之前是编辑状态，需变为“保存”
// 				htmlInput = '<input type="text"  >';
// 				$("#yblTable td.edit").append(htmlInput);
				var inputs1 = $("#yblTable td.edit_1");
				var inputs2 = $("#yblTable td.edit_2");
				var inputs3 = $("#yblTable td.edit_3");
				var inputs4 = $("#yblTable td.edit_4");
				for(var i = 0;i<inputs1.length;i++){
					
					$(inputs1[i]).html('<input type="text" value="'+$(inputs1[i]).text()+'" />');
					$(inputs2[i]).html('<input type="text" value="'+$(inputs2[i]).text()+'" />');
					$(inputs3[i]).html('<input type="text" value="'+$(inputs3[i]).text()+'" />');
					$(inputs4[i]).html('<input type="text" value="'+$(inputs4[i]).text()+'" />');
					
				}
			}else{

				//执行保存事件
				var StrainRate_str = '';
				
				//执行保存事件
				var inputs1 = $("#yblTable td.edit_1");
				var inputs2 = $("#yblTable td.edit_2");
				var inputs3 = $("#yblTable td.edit_3");
				var inputs4 = $("#yblTable td.edit_4");
				for(var i = 0;i<inputs1.length;i++){
					StrainRate_str = StrainRate_str + ($(inputs1[i]).children('input').val()==""?" ":$(inputs1[i]).children('input').val()) + "-" 
													+ ($(inputs2[i]).children('input').val()==""?" ":$(inputs2[i]).children('input').val()) + "-"
													+ ($(inputs3[i]).children('input').val()==""?" ":$(inputs3[i]).children('input').val()) + "-"
													+ ($(inputs4[i]).children('input').val()==""?" ":$(inputs4[i]).children('input').val()) + ",";
					$("#StrainRate_userForm").val(StrainRate_str);
					$(inputs1[i]).html($(inputs1[i]).children('input').val());
					$(inputs2[i]).html($(inputs2[i]).children('input').val());
					$(inputs3[i]).html($(inputs3[i]).children('input').val());
					$(inputs4[i]).html($(inputs4[i]).children('input').val());
				}
// 				$("#clTable td.edit input").remove();
				//td变为不可编辑
				$("#yblTable td.edit input").remove();
				
			}
		}
	}



	//增加“应变率”的行
	function addYblData(){
		var yblTrLength = $("#yblTable tr").length;
		
		var addTrId = $("#yblTable tr").eq(yblTrLength-1).attr("id");//获取table表格最后一行的tr的ID
		
		if(addTrId != undefined || addTrId != null){
		
			addTrIdNum = parseInt(addTrId.substring(addTrId.lastIndexOf("tr")+2));
			yblTrLength --;
			var html ='';
			html += '<tr id="ybl_tr' + (addTrIdNum+1) + '" >';
			html += '<td class="td edit_1" id="ybl_td1_tr' + (addTrIdNum+1) + '"><input type="text" value="" /></td>';
			html += '<td class="td edit_2" id="ybl_td2_tr' + (addTrIdNum+1) + '"><input type="text" value="" /></td>';
			html += '<td class="td edit_3" id="ybl_td3_tr' + (addTrIdNum+1) + '"><input type="text" value="" /></td>';
			html += '<td class="td edit_4" id="ybl_td4_tr' + (addTrIdNum+1) + '"><input type="text" value="" /></td>';
			html += '<td class="td"><a class="btn btn_bg_orange b_block" onclick="delYbl(' + (addTrIdNum+1) + ');">删除</a></td>';
			html += '</tr>';
		
			$("#yblTable").append(html);
		}else{
		
			yblTrLength --;
			var html ='';
			html += '<tr id="ybl_tr' + yblTrLength + '" >';
			html += '<td class="td edit_1" id="ybl_td1_tr' + yblTrLength + '"><input type="text" value="" /></td>';
			html += '<td class="td edit_2" id="ybl_td2_tr' + yblTrLength + '"><input type="text" value="" /></td>';
			html += '<td class="td edit_3" id="ybl_td3_tr' + yblTrLength + '"><input type="text" value="" /></td>';
			html += '<td class="td edit_4" id="ybl_td4_tr' + yblTrLength + '"><input type="text" value="" /></td>';
			html += '<td class="td"><a class="btn btn_bg_orange b_block" onclick="delYbl(' + yblTrLength + ');">删除</a></td>';
			html += '</tr>';
		
			$("#yblTable").append(html);
		
		}
	
		
	}

	//删除“应变率”整列
	function delYbl(id){
		
		if(confirm("确定要删除吗?")){
			var dataName = $("#StrainRate_btn").attr("data-name");
			var str = '';
			if(dataName == 0){//保存
				str = str + $("#ybl_td1_tr" + id).html() + "-";
				str = str + $("#ybl_td2_tr" + id).html() + "-";
				str = str + $("#ybl_td3_tr" + id).html() + "-";
				str = str + $("#ybl_td4_tr" + id).html() + ",";
			}else{//点击输入
				str = str + $("#ybl_td1_tr" + id + " input").val() + "-";
				str = str + $("#ybl_td2_tr" + id + " input").val() + "-";
				str = str + $("#ybl_td3_tr" + id + " input").val() + "-";
				str = str + $("#ybl_td4_tr" + id + " input").val() + ",";
			}
			var StrainRate = $("#StrainRate_userForm").val();
			StrainRate = StrainRate.replace(str, '');
			$("#StrainRate_userForm").val(StrainRate);
		
			$("#ybl_tr" + id).remove();
		}
	}
	
	
	
	

	$(document).ready(function(){
//         var chart = new Highcharts.Chart(options);//执行绘图方法
    });

	
	
	
	//切换曲线维数
	function graphType(){	
		var graphTypeVal = document.getElementById('graph_type').options[document.getElementById('graph_type').selectedIndex].value;		
		if(graphTypeVal == 1){//三维
			$(".z_val").show();
		}else{
			$(".z_val").hide();
		}
	}
	
	//三维曲线函数
	$(function () {
        // Set up the chart
        
       
    });
</script>
</body>
</html>
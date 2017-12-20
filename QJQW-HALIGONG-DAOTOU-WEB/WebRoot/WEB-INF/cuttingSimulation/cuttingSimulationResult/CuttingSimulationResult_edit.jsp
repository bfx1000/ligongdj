<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Long date = System.currentTimeMillis();
%>
<!DOCTYPE html>
<html lang="zh-CN">
 <head>
    <meta charset="utf-8">
	<title>哈理工刀头</title>
    <meta name="description" content="哈理工刀头,专业打造各种类型机械刀头,产品类型齐全,质量放心有保障,联合祈福科技公司打造专业的刀头网站。" />
    <meta name="keywords" content="哈理工刀头,刀头,刀具,切断切槽,仿形切削,外圆切槽刀,内圆切槽刀,端面切槽。" />
<link href="<%=path%>/resources/css/index/style_a.css?v=<%=date%>" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="/resources/js/CuttingSimulationResult_edit_js.js"></script>
<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>


<script type="text/JavaScript">

	$(document).ready(function(){
		//加载图片到页面
		var array_PictureFileCutSim = $("#array_PictureFileCutSim").val();
		if(array_PictureFileCutSim != null && array_PictureFileCutSim != ''){
			var PictureFileCutSims = array_PictureFileCutSim.split(',');
			var PictureFileCutSims_str = '';
			for(var i = 0; i < PictureFileCutSims.length; i++){
				if(PictureFileCutSims[i] != null && PictureFileCutSims[i] != ''){
					PictureFileCutSims_str = PictureFileCutSims_str + "<div><img name='PictureFileCutSims_img' width='100px' height='100px' src='<%=path%>/goods"+PictureFileCutSims[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureFileCutSimImg(\""+PictureFileCutSims[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureFileCutSim").html(PictureFileCutSims_str);
		}
		
		//加载图片到页面
		var array_ChipShapePicCutSim = $("#array_ChipShapePicCutSim").val();
		if(array_ChipShapePicCutSim != null && array_ChipShapePicCutSim != ''){
			var ChipShapePicCutSims = array_ChipShapePicCutSim.split(',');
			var ChipShapePicCutSims_str = '';
			for(var i = 0; i < ChipShapePicCutSims.length; i++){
				if(ChipShapePicCutSims[i] != null && ChipShapePicCutSims[i] != ''){
					ChipShapePicCutSims_str = ChipShapePicCutSims_str + "<div><img name='ChipShapePicCutSims_img' width='100px' height='100px' src='<%=path%>/goods"+ChipShapePicCutSims[i]+"' /><a class='btn btn_shanchu' onclick='onDelChipShapePicCutSimImg(\""+ChipShapePicCutSims[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ChipShapePicCutSim").html(ChipShapePicCutSims_str);
		}
		
		//加载图片到页面
		var array_ExReWearPicture = $("#array_ExReWearPicture").val();
		if(array_ExReWearPicture != null && array_ExReWearPicture != ''){
			var ExReWearPictures = array_ExReWearPicture.split(',');
			var ExReWearPictures_str = '';
			for(var i = 0; i < ExReWearPictures.length; i++){
				if(ExReWearPictures[i] != null && ExReWearPictures[i] != ''){
					ExReWearPictures_str = ExReWearPictures_str + "<div><img name='ExReWearPictures_img' width='100px' height='100px' src='<%=path%>/goods"+ExReWearPictures[i]+"' /><a class='btn btn_shanchu' onclick='onDelExReWearPictureImg(\""+ExReWearPictures[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ExReWearPicture").html(ExReWearPictures_str);
		}
	});
	
	//折叠
	function zd(index){
		$("#box_clcs"+index).css("display","block");
		$("#zd_"+index).css("display","none");
		$("#zd1_"+index).css("display","block");
	}
	function zd1(index){
		$("#box_clcs"+index).css("display","none");
		$("#zd_"+index).css("display","block");
		$("#zd1_"+index).css("display","none");
	}

	//取消
	function onClose(){
		window.location.href='<%=path%>/CuttingSimulationResult/queryCuttingSimulationList';
	}
	function onSaveResultPicture(ascription){
		var file = null;
		if("PictureFileCutSim"==ascription){
			file = $("#PictureFileCutSim").get(0).files[0]; //选择上传的文件
		}
		else if("ChipShapePicCutSim"==ascription){
			file = $("#ChipShapePicCutSim").get(0).files[0]; //选择上传的文件
		}
		else if("ExReWearPicture"==ascription){
			file = $("#ExReWearPicture").get(0).files[0]; //选择上传的文件
		}
		if(file==null||file==""){
			alert("请选择文件");
			return false;
		}
		var formData = new FormData();
		formData.append("resultFile",file);
		formData.append("ascription",ascription);
		
		$.ajax({  
	          url: '/CuttingSimulationResult/saveResultFile' ,  
	          type: 'POST',  
	          data: formData,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	        	  if(data.url!=null&&data.url!=""){
	            	  if(data.ascription=="PictureFileCutSim"){
		            	  $("#span_PictureFileCutSim").append("<div><img name='PictureFileCutSims_img' width='100px' height='100px' src='<%=path%>/goods"+data.url+"' /><a class='btn btn_shanchu' onclick='onDelPictureFileCutSimImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#PictureFileCutSim").remove();
		            	  $("#span_input_PictureFileCutSim").html('<input type="file" name="PictureFileCutSim" id="PictureFileCutSim" />');
		            	  var array_PictureFileCutSim = $("#array_PictureFileCutSim").val();
		            	  array_PictureFileCutSim = array_PictureFileCutSim + data.url + "," ;
		            	  $("#array_PictureFileCutSim").val(array_PictureFileCutSim);
	            	  }
	            	  if(data.ascription=="ChipShapePicCutSim"){
		            	  $("#span_ChipShapePicCutSim").append("<div><img name='ChipShapePicCutSims_img' width='100px' height='100px' src='<%=path%>/goods"+data.url+"' /><a class='btn btn_shanchu' onclick='onDelChipShapePicCutSimImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#ChipShapePicCutSim").remove();
		            	  $("#span_input_ChipShapePicCutSim").html('<input type="file" name="ChipShapePicCutSim" id="ChipShapePicCutSim" />');
		            	  var array_ChipShapePicCutSim = $("#array_ChipShapePicCutSim").val();
		            	  array_ChipShapePicCutSim = array_ChipShapePicCutSim + data.url + "," ;
		            	  $("#array_ChipShapePicCutSim").val(array_ChipShapePicCutSim);
	            	  }
	            	  if(data.ascription=="ExReWearPicture"){
		            	  $("#span_ExReWearPicture").append("<div><img name='ExReWearPictures_img' width='100px' height='100px' src='<%=path%>/goods"+data.url+"' /><a class='btn btn_shanchu' onclick='onDelExReWearPictureImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#ExReWearPicture").remove();
		            	  $("#span_input_ExReWearPicture").html('<input type="file" name="ExReWearPicture" id="ExReWearPicture" />');
		            	  var array_ExReWearPicture = $("#array_ExReWearPicture").val();
		            	  array_ExReWearPicture = array_ExReWearPicture + data.url + "," ;
		            	  $("#array_ExReWearPicture").val(array_ExReWearPicture);
	            	  }
	        	  }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//保存
	function save(){
		$("#array_PictureFileCutSim_userForm").val($("#array_PictureFileCutSim").val());
		
		$("#array_ChipShapePicCutSim_userForm").val($("#array_ChipShapePicCutSim").val());
		
		$("#array_ExReWearPicture_userForm").val($("#array_ExReWearPicture").val());
		
		$("#array_ResultFileCutSim_userForm").val($("#array_ResultFileCutSim").val());
		$("#array_ResultFileCutSim_name_userForm").val($("#array_ResultFileCutSim_name").val());
		
		$("#array_ForceFileCutSim_userForm").val($("#array_ForceFileCutSim").val());
		$("#array_ForceFileCutSim_name_userForm").val($("#array_ForceFileCutSim_name").val());
		
		$("#array_TemperatureFileCutSim_userForm").val($("#array_TemperatureFileCutSim").val());
		$("#array_TemperatureFileCutSim_name_userForm").val($("#array_TemperatureFileCutSim_name").val());
		
		$("#array_SurfaceStressFileCutSim_userForm").val($("#array_SurfaceStressFileCutSim").val());
		$("#array_SurfaceStressFileCutSim_name_userForm").val($("#array_SurfaceStressFileCutSim_name").val());
		
		$("#array_ExReWearFile_userForm").val($("#array_ExReWearFile").val());
		$("#array_ExReWearFile_name_userForm").val($("#array_ExReWearFile_name").val());
		
		$("#array_Defined1File_userForm").val($("#array_Defined1File").val());
		$("#array_Defined1File_name_userForm").val($("#array_Defined1File_name").val());
		
		$("#array_Defined2File_userForm").val($("#array_Defined2File").val());
		$("#array_Defined2File_name_userForm").val($("#array_Defined2File_name").val());
		
		$("#array_Defined3File_userForm").val($("#array_Defined3File").val());
		$("#array_Defined3File_name_userForm").val($("#array_Defined3File_name").val());

		$("#ExReToolLife_userForm").val($("#ExReToolLife").val());
		$("#ExReWearTimeAndValue_userForm").val($("#ExReWearTimeAndValue").val());
		$("#CutSimDefined1_userForm").val($("#CutSimDefined1").val());
		$("#CutSimDefined1Value_userForm").val($("#CutSimDefined1Value").val());
		$("#CutSimDefined2_userForm").val($("#CutSimDefined2").val());
		$("#CutSimDefined2Value_userForm").val($("#CutSimDefined2Value").val());
		$("#CutSimDefined3_userForm").val($("#CutSimDefined3").val());
		$("#CutSimDefined3Value_userForm").val($("#CutSimDefined3Value").val());
		
		
		 $("#userForm").ajaxSubmit(function(result){
			if(result == 1){
				alert('操作成功！');
				onClose();
			}else{
				alert('操作失败，请联系管理员！');
			}
		}); 
	}
	
	
</script>
</head>
<body>
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text">
	  <li>
	    <span id="lititle">仿真编号</span>${CuttingSimulation.IDCutSim}
	  </li>		
	  <li>
	    <span id="lititle">仿真名称</span>${CuttingSimulation.NameCutSim}
	  </li>
	  <li>
	    <span id="lititle">工件材料</span>${CuttingSimulation.MaterialWorkpieceCutSim}
	  </li>
	  <li>
	    <span id="lititle">仿真类型</span>
	    <span class="select_wrap">
				<span class="edit_select">
					<select  name="selectWrap"  disabled="disabled" id="selectWrap" onChange="changeValue();" class="select" contenteditable="true">
						<c:forEach items="${CategoryTypeCutSimList}" var="var" varStatus="vs">
							<option value="${var.id_CategoryTypeCutSim }" ${CuttingSimulation.TypeCutSim == var.id_CategoryTypeCutSim ? 'selected' : '' }>${var.name_CategoryTypeCutSim }</option>	
						</c:forEach>
					</select>
				</span>
		</span>
	  </li>
	  <li>
	    <span id="lititle">刀具类型</span>
	    	<span class="select_wrap">
	    	<span class="edit_select">
	    	<select name="ToolType" disabled="disabled" class="select" style="width : 100px;">
				<option value="">请选择</option>
				<option value="1" ${CuttingSimulation.ToolType == 1 ? 'selected' : '' }>刀片</option>	
				<option value="2" ${CuttingSimulation.ToolType == 2 ? 'selected' : '' }>整体刀具</option>
			  </select>
			 </span>
			 </span>
	  </li>
	  <li>
	    <span id="lititle">刀具材料</span>${CuttingSimulation.MaterialToolCutSim}
	  </li>
	  <li>
	    <span id="lititle">刀具/刀片编号</span>${CuttingSimulation.MaterialToolCutSimNum}
	  </li>
	</ul>
	<div class="clear"></div>
	<div class="box_xiangxi zhedie">
		<div class="box_zhedie">
			<span class="a_zhedie1" id = "zd_1" onclick = "zd(1);" style="display:block;">结果信息</span>
			<span class="a_zhedie2" id = "zd1_1" onclick = "zd1(1);" style="display:none;">结果信息</span>
		</div>
		<div class="box_u1" id="box_clcs1" style="display:none">
			<ul class="box_text">
			<form action="/CuttingSimulationResult/saveCuttingSimulation" name="userForm" id="userForm" method="post">
			<input type="hidden" name="id_CuttingSimulation" id="id_CuttingSimulation_userForm" value="${(CuttingSimulation.id_CuttingSimulation == null || CuttingSimulation.id_CuttingSimulation == '') ? 0 : CuttingSimulation.id_CuttingSimulation}"/>
			
			<input type = "hidden" name = "array_PictureFileCutSim" id ="array_PictureFileCutSim_userForm" />
			<input type = "hidden" name = "array_ChipShapePicCutSim" id ="array_ChipShapePicCutSim_userForm" />
			<input type = "hidden" name = "array_ExReWearPicture" id ="array_ExReWearPicture_userForm" />
			
			<input type = "hidden" name = "array_ResultFileCutSim" id ="array_ResultFileCutSim_userForm" />
			<input type = "hidden" name = "array_ResultFileCutSim_name" id ="array_ResultFileCutSim_name_userForm" />
			<input type = "hidden" name = "array_ForceFileCutSim" id ="array_ForceFileCutSim_userForm" />
			<input type = "hidden" name = "array_ForceFileCutSim_name" id ="array_ForceFileCutSim_name_userForm" />
			<input type = "hidden" name = "array_TemperatureFileCutSim" id ="array_TemperatureFileCutSim_userForm" />
			<input type = "hidden" name = "array_TemperatureFileCutSim_name" id ="array_TemperatureFileCutSim_name_userForm" />
			<input type = "hidden" name = "array_SurfaceStressFileCutSim" id ="array_SurfaceStressFileCutSim_userForm" />
			<input type = "hidden" name = "array_SurfaceStressFileCutSim_name" id ="array_SurfaceStressFileCutSim_name_userForm" />
			<input type = "hidden" name = "array_ExReWearFile" id ="array_ExReWearFile_userForm" />
			<input type = "hidden" name = "array_ExReWearFile_name" id ="array_ExReWearFile_name_userForm" />
			<input type = "hidden" name = "array_Defined1File" id ="array_Defined1File_userForm" />
			<input type = "hidden" name = "array_Defined1File_name" id ="array_Defined1File_name_userForm" />
			<input type = "hidden" name = "array_Defined2File" id ="array_Defined2File_userForm" />
			<input type = "hidden" name = "array_Defined2File_name" id ="array_Defined2File_name_userForm" />
			<input type = "hidden" name = "array_Defined3File" id ="array_Defined3File_userForm" />
			<input type = "hidden" name = "array_Defined3File_name" id ="array_Defined3File_name_userForm" />
			
			<input type = "hidden" name ="ExReToolLife" id="ExReToolLife_userForm" />
			<input type = "hidden" name ="ExReWearTimeAndValue" id="ExReWearTimeAndValue_userForm" />
			
			<input type = "hidden" name ="CutSimDefined1" id="CutSimDefined1_userForm" />
			<input type = "hidden" name ="CutSimDefined1Value" id="CutSimDefined1Value_userForm" />
			<input type = "hidden" name ="CutSimDefined2" id="CutSimDefined1_userForm" />
			<input type = "hidden" name ="CutSimDefined2Value" id="CutSimDefined2Value_userForm" />
			<input type = "hidden" name ="CutSimDefined3" id="CutSimDefined1_userForm" />
			<input type = "hidden" name ="CutSimDefined3Value" id="CutSimDefined3Value_userForm" />
			
			    	<li><span id="lititle">切削力Fx</span>
			    	<input name="ForceXCutSim" id="ForceXCutSim_userForm" type="text" value="${CuttingSimulation.ForceXCutSim}" class="input" />
			    	</li>
			    	<li>
			    	<span id="lititle">切削力Fy</span>
			    	<input name="ForceYCutSim" id="ForceYCutSim_userForm" type="text" value="${CuttingSimulation.ForceYCutSim}" class="input" />
			    	</li>
			    	<li>
			    	<span id="lititle">切削力Fz</span>
			    	<input name="ForceZCutSim" id="ForceZCutSim_userForm" type="text" value="${CuttingSimulation.ForceZCutSim}" class="input" />
			    	</li>
			    	<li>
			    	<span id="lititle">扭矩 N</span>
			    	<input name="TorqueCutSim" id="TorqueCutSim_userForm" type="text" value="${CuttingSimulation.TorqueCutSim}" class="input" />
			    	</li>
			    	<li>
			    	<span id="lititle">切削温度</span>
			    	<input name="TemperatureCutSim" id="TemperatureCutSim_userForm" type="text" value="${CuttingSimulation.TemperatureCutSim}" class="input" />
			    	</li>
			    	<li>
			    	<span id="lititle">切屑形态</span>
			    	<input name="ChipShapeCutSim" id="ChipShapeCutSim_userForm" type="text" value="${CuttingSimulation.ChipShapeCutSim}" class="input" />
			    	</li>
			    	<li>
			    	<span id="lititle">表面残余应力</span>
			    	<input name="SurfaceStressCutSim" id="SurfaceStressCutSim_userForm" type="text" value="${CuttingSimulation.SurfaceStressCutSim}" class="input" />
			    	</li>
		  	  </form>
		  	  </ul>
		  	  </div>
				<div class="clear"></div>
			</div>
			
			
	<div class="box_xiangxi zhedie">
		<div class="box_zhedie">
			<span class="a_zhedie1" id = "zd_2" onclick = "zd(2);" style="display:block;">结果文件及图</span>
			<span class="a_zhedie2" id = "zd1_2" onclick = "zd1(2);" style="display:none;">结果文件及图</span>
		</div>
		<div class="box_u1" id="box_clcs2" style="display:none">
			<ul class="box_text">
		        <li class="block">
				    <span id="lititle">仿真结果图片</span>
				    <input type ="hidden" name = "array_PictureFileCutSim" id = "array_PictureFileCutSim" value="${array_PictureFileCutSim }" />
			    	<span id="span_input_PictureFileCutSim">
			    		<input type="file" name="PictureFileCutSim" id="PictureFileCutSim" />
			    	</span>
				    <input type="button" value="加载文件" class="btn" onclick="onSaveResultPicture('PictureFileCutSim');"/>
				    <div class="clear"></div>	
				    <span id="span_PictureFileCutSim">
			    	</span>
			    </li>
		    	<li class="block">
				    <span id="lititle">切屑形态图片</span>
				    <input type ="hidden" name = "array_ChipShapePicCutSim" id = "array_ChipShapePicCutSim" value="${array_ChipShapePicCutSim }" />
			    	<span id="span_input_ChipShapePicCutSim">
			    		<input type="file" name="ChipShapePicCutSim" id="ChipShapePicCutSim" />
			    	</span>
				    <input type="button" value="加载文件" class="btn" onclick="onSaveResultPicture('ChipShapePicCutSim');"/>
				    <div class="clear"></div>	
				    <span id="span_ChipShapePicCutSim">
			    	</span>
			    </li>
			    <li class="block">
				    <span id="lititle">仿真结果文件</span>
				    <input type ="hidden" name = "array_ResultFileCutSim" id = "array_ResultFileCutSim" value="${array_ResultFileCutSim }" />
				    <input type ="hidden" name = "array_ResultFileCutSim_name" id = "array_ResultFileCutSim_name" value="${array_ResultFileCutSim_name }" />
			    	<span id="span_input_ResultFileCutSim">
			    		<input type="file" name="ResultFileCutSim" id="ResultFileCutSim" />
			    	</span>
				    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('ResultFileCutSim');"/>
				    <div class="clear"></div>	
				    <span id="span_ResultFileCutSim">
			    	</span>
			    </li>
			    <li class="block">
				    <span id="lititle">切削力文件</span>
				    <input type ="hidden" name = "array_ForceFileCutSim" id = "array_ForceFileCutSim" value="${array_ForceFileCutSim }" />
				    <input type ="hidden" name = "array_ForceFileCutSim_name" id = "array_ForceFileCutSim_name" value="${array_ForceFileCutSim_name }" />
			    	<span id="span_input_ForceFileCutSim">
			    		<input type="file" name="ForceFileCutSim" id="ForceFileCutSim" />
			    	</span>
				    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('ForceFileCutSim');"/>
				    <div class="clear"></div>	
				    <span id="span_ForceFileCutSim">
			    	</span>
			    </li>
			    <li class="block">
				    <span id="lititle">切削温度文件</span>
				    <input type ="hidden" name = "array_TemperatureFileCutSim" id = "array_TemperatureFileCutSim" value="${array_TemperatureFileCutSim }" />
				    <input type ="hidden" name = "array_TemperatureFileCutSim_name" id = "array_TemperatureFileCutSim_name" value="${array_TemperatureFileCutSim_name }" />
			    	<span id="span_input_TemperatureFileCutSim">
			    		<input type="file" name="TemperatureFileCutSim" id="TemperatureFileCutSim" />
			    	</span>
				    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('TemperatureFileCutSim');"/>
				    <div class="clear"></div>	
				    <span id="span_TemperatureFileCutSim">
			    	</span>
			    </li>
			    <li class="block">
				    <span id="lititle">切削力文件</span>
				    <input type ="hidden" name = "array_SurfaceStressFileCutSim" id = "array_SurfaceStressFileCutSim" value="${array_SurfaceStressFileCutSim }" />
				    <input type ="hidden" name = "array_SurfaceStressFileCutSim_name" id = "array_SurfaceStressFileCutSim_name" value="${array_SurfaceStressFileCutSim_name }" />
			    	<span id="span_input_SurfaceStressFileCutSim">
			    		<input type="file" name="SurfaceStressFileCutSim" id="SurfaceStressFileCutSim" />
			    	</span>
				    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('SurfaceStressFileCutSim');"/>
				    <div class="clear"></div>	
				    <span id="span_SurfaceStressFileCutSim">
			    	</span>
			    </li>
		  	  </ul>
		  	  </div>
				<div class="clear"></div>
			</div>
			
			
			<div class="box_xiangxi zhedie">
		<div class="box_zhedie">
			<span class="a_zhedie1" id = "zd_3" onclick = "zd(3);" style="display:block;">刀具磨损</span>
			<span class="a_zhedie2" id = "zd1_3" onclick = "zd1(3);" style="display:none;">刀具磨损</span>
		</div>
		<div class="box_u1" id="box_clcs3" style="display:none">
			<ul class="box_text">
			    	<li><span id="lititle">刀具寿命：</span>
			    	<input name="ExReToolLife" id="ExReToolLife" type="text" value="${CuttingSimulation.ExReToolLife}" class="input" />
			    	</li>
			    	<li class="block">
				    <span id="lititle">刀具磨损文件：</span>
				    <input type ="hidden" name = "array_ExReWearFile" id = "array_ExReWearFile" value="${array_ExReWearFile }" />
				    <input type ="hidden" name = "array_ExReWearFile_name" id = "array_ExReWearFile_name" value="${array_ExReWearFile_name }" />
			    	<span id="span_input_ExReWearFile">
			    		<input type="file" name="ExReWearFile" id="ExReWearFile" />
			    	</span>
				    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('ExReWearFile');"/>
				    <div class="clear"></div>	
				    <span id="span_ExReWearFile">
			    	</span>
			    	</li>
			    	
			    	
			    	<li class="block nobor">
						<input type="hidden" name="ExReWearTimeAndValue" id="ExReWearTimeAndValue" value="${CuttingSimulation.ExReWearTimeAndValue }" /> 
						<span id="lititle">刀具磨损表</span>
						<input type="button" value="点击输入" class="btn_add" id="ExReWearTimeAndValue_btn" data-name="0" onclick="editCl(this);"><!-- data-name : 值为0时对应的状态为“点击输入”  ， 值为1时对应的状态为“保存”-->
						&nbsp;
						<input type="button" value="添加" class="btn_add" id="btn_add_ExReWearTimeAndValue"  onclick="addCl(this);" style="display: none;"/>
					</li>
			
			
					<li class="block nobor">
						<!--  材料表格  -->
						<table border="1" class="li_table box_table"  id="clTable">
						  <tr class="cl_tr_0">
						    <th class="th">时间</th>
						    <c:forEach items="${CuttingSimulation.ExReWearTimeAndValueList}" var="var" varStatus="vs">
						    	<td class="td edit_1" id="cl_tr0_td${vs.index }">${var.shijian }</td>
						    </c:forEach>
						  </tr>
						  <tr class="cl_tr_1">
						    <th class="th">磨损量VB(mm)</th>
						    <c:forEach items="${CuttingSimulation.ExReWearTimeAndValueList}" var="var" varStatus="vs">
						    	<td class="td edit_2" id="cl_tr1_td${vs.index }">${var.mosundu }</td>
						    </c:forEach>
						  </tr>
						  <tr class="cl_tr_2">
						    <th class="th">操作</th>
						    <c:forEach items="${CuttingSimulation.ExReWearTimeAndValueList}" var="var" varStatus="vs">
						     	<td class="td" id="cl_tr2_td${vs.index }"><a class="btn btn_bg_orange b_block" onclick="delCl(${vs.index })">删除</a></td>
						    </c:forEach>
						  </tr>
						</table>
					</li>
		
					<li class="block">
				    <span id="lititle">磨损图片</span>
				    <input type ="hidden" name = "array_ExReWearPicture" id = "array_ExReWearPicture" value="${array_ExReWearPicture }" />
			    	<span id="span_input_ExReWearPicture">
			    		<input type="file" name="ExReWearPicture" id="ExReWearPicture" />
			    	</span>
				    <input type="button" value="加载文件" class="btn" onclick="onSaveResultPicture('ExReWearPicture');"/>
				    <div class="clear"></div>	
				    <span id="span_ExReWearPicture">
			    	</span>
			    	</li>
		  	  </ul>
		  	  </div>
				<div class="clear"></div>
			</div>
			
			<div class="box_xiangxi zhedie">
				<div class="box_zhedie">
					<span class="a_zhedie1" id = "zd_4" onclick = "zd(4);" style="display:block;">自定义结果</span>
					<span class="a_zhedie2" id = "zd1_4" onclick = "zd1(4);" style="display:none;">自定义结果</span>
				</div>
				<div class="box_u1" id="box_clcs4" style="display:none">
					<ul class="box_text">
					  <li class="block bor_t">
					    	<li><span id="lititle">参数1名称</span>
					    	<input name="CutSimDefined1" id="CutSimDefined1" type="text" value="${CuttingSimulation.CutSimDefined1}" class="input" />
					    	</li>
					    	<li>
					    	<span id="lititle">结果</span>
					    	<input name="CutSimDefined1Value" id="CutSimDefined1Value" type="text" value="${CuttingSimulation.CutSimDefined1Value}" class="input" />
					    	</li>
					    	<li class="block">
						    <span id="lititle">结果文件：</span>
						    <input type ="hidden" name = "array_Defined1File" id = "array_Defined1File" value="${array_Defined1File }" />
						    <input type ="hidden" name = "array_Defined1File_name" id = "array_Defined1File_name" value="${array_Defined1File_name }" />
					    	<span id="span_input_Defined1File">
					    		<input type="file" name="Defined1File" id="Defined1File" />
					    	</span>
						    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('Defined1File');"/>
						    <div class="clear"></div>	
						    <span id="span_Defined1File">
					    	</span>
					    	</li>
					    	<li><span id="lititle">参数2名称</span>
					    	<input name="CutSimDefined2" id="CutSimDefined2" type="text" value="${CuttingSimulation.CutSimDefined2}" class="input" />
					    	</li>
					    	<li>
					    	<span id="lititle">结果</span>
					    	<input name="CutSimDefined2Value" id="CutSimDefined2Value" type="text" value="${CuttingSimulation.CutSimDefined2Value}" class="input" />
					    	</li>
					    	<li class="block">
						    <span id="lititle">结果文件：</span>
						    <input type ="hidden" name = "array_Defined2File" id = "array_Defined2File" value="${array_Defined2File }" />
						    <input type ="hidden" name = "array_Defined2File_name" id = "array_Defined2File_name" value="${array_Defined2File_name }" />
					    	<span id="span_input_Defined2File">
					    		<input type="file" name="Defined2File" id="Defined2File" />
					    	</span>
						    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('Defined2File');"/>
						    <div class="clear"></div>	
						    <span id="span_Defined2File">
					    	</span>
					    	</li>
					    	<li><span id="lititle">参数3名称</span>
					    	<input name="CutSimDefined3" id="CutSimDefined3" type="text" value="${CuttingSimulation.CutSimDefined3}" class="input" />
					    	</li>
					    	<li>
					    	<span id="lititle">结果</span>
					    	<input name="CutSimDefined3Value" id="CutSimDefined3Value" type="text" value="${CuttingSimulation.CutSimDefined3Value}" class="input" />
					    	</li>
					    	<li class="block">
						    <span id="lititle">结果文件：</span>
						    <input type ="hidden" name = "array_Defined3File" id = "array_Defined3File" value="${array_Defined3File }" />
						    <input type ="hidden" name = "array_Defined3File_name" id = "array_Defined3File_name" value="${array_Defined3File_name }" />
					    	<span id="span_input_Defined3File">
					    		<input type="file" name="Defined3File" id="Defined3File" />
					    	</span>
						    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('Defined3File');"/>
						    <div class="clear"></div>	
						    <span id="span_Defined3File">
					    	</span>
					    	</li>
				  	  </li>
				  	  </ul>
				  	  </div>
						<div class="clear"></div>
					</div>
</div>
</body>

</html>
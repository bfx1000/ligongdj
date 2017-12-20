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
			var array_PictureToolMaterial = $("#array_PictureToolMaterial").val();
			if(array_PictureToolMaterial != null && array_PictureToolMaterial != ''){
				var pictureToolMaterials = array_PictureToolMaterial.split(',');
				var pictureToolMaterials_str = '';
				for(var i = 0; i < pictureToolMaterials.length; i++){
					if(pictureToolMaterials[i] != null && pictureToolMaterials[i] != ''){
						pictureToolMaterials_str = pictureToolMaterials_str + "<div><img name='pictureToolMaterials_img' width='100px' height='100px' src='<%=path%>/goods"+pictureToolMaterials[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureToolMaterialImg(\""+pictureToolMaterials[i]+"\");'>删除</a><br/></div>";
					}
				}
				$("#span_PictureToolMaterialList").html(pictureToolMaterials_str);
			}
			
			//详细信息
			var array_InformToolMaterial = $("#array_InformToolMaterial").val();
			var array_InformToolMaterial_name = $("#array_InformToolMaterial_name").val();
			if(array_InformToolMaterial != null && array_InformToolMaterial != ''){
				var informToolMaterials = array_InformToolMaterial.split(',');
				var informToolMaterials_name = array_InformToolMaterial_name.split(',');
				var informToolMaterials_str = '';
				for(var i = 0; i < informToolMaterials.length; i++){
					if(informToolMaterials[i] != null && informToolMaterials[i] != ''){
						informToolMaterials_str = informToolMaterials_str + "<div><span name='informToolMaterials_img' url='"+informToolMaterials[i]+"' >"+informToolMaterials_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelInformToolMaterialImg(\""+informToolMaterials[i]+"\");'>删除</a><br/></div>";
					}
				}
				$("#span_InformToolMaterialList").html(informToolMaterials_str);
			}
			
			//应用实例
			var array_ApplicationToolMaterial = $("#array_ApplicationToolMaterial").val();
			var array_ApplicationToolMaterial_name = $("#array_ApplicationToolMaterial_name").val();
			if(array_ApplicationToolMaterial != null && array_ApplicationToolMaterial != ''){
				var applicationToolMaterials = array_ApplicationToolMaterial.split(',');
				var applicationToolMaterials_name = array_ApplicationToolMaterial_name.split(',');
				var applicationToolMaterials_str = '';
				for(var i = 0; i < applicationToolMaterials.length; i++){
					if(applicationToolMaterials[i] != null && applicationToolMaterials[i] != ''){
						applicationToolMaterials_str = applicationToolMaterials_str + "<div><span name='applicationToolMaterials_img' url='"+applicationToolMaterials[i]+"' >"+applicationToolMaterials_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelApplicationToolMaterialImg(\""+applicationToolMaterials[i]+"\");'>删除</a><br/></div>";
					}
				}
				$("#span_ApplicationToolMaterialList").html(applicationToolMaterials_str);
			}
			
		});
		
		
		//保存
		function save(){
	  
			$("#ISOCuttingMaterial_userForm_1").val($("#ISOCuttingMaterial_userForm").val());
			$("#MachineableMaterial_userForm_1").val($("#MachineableMaterial_userForm").val());
			$("#DensityToolMaterial_userForm_1").val($("#DensityToolMaterial_userForm").val());
			$("#HardnessToolMaterial_userForm_1").val($("#HardnessToolMaterial_userForm").val());
			$("#BendingStrengthToolMaterial_userForm_1").val($("#BendingStrengthToolMaterial_userForm").val());
			$("#ImpactToughnessToolMaterial_userForm_1").val($("#ImpactToughnessToolMaterial_userForm").val());
			$("#ModulusToolMaterial_userForm_1").val($("#ModulusToolMaterial_userForm").val());
			$("#HeatResistanceToolMaterial_userForm_1").val($("#HeatResistanceToolMaterial_userForm").val());
			$("#ConductivityToolMaterial_userForm_1").val($("#ConductivityToolMaterial_userForm").val());
			$("#ThermalexpansionToolMaterial_userForm_1").val($("#ThermalexpansionToolMaterial_userForm").val());
			
			$("#array_PictureToolMaterial_userForm").val($("#array_PictureToolMaterial").val());
			$("#array_InformToolMaterial_userForm").val($("#array_InformToolMaterial").val());
			$("#array_InformToolMaterial_name_userForm").val($("#array_InformToolMaterial_name").val());
			$("#array_ApplicationToolMaterial_userForm").val($("#array_ApplicationToolMaterial").val());
			$("#array_ApplicationToolMaterial_name_userForm").val($("#array_ApplicationToolMaterial_name").val());
			
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
			window.location.href='<%=path%>/cuttingToolMaterial/queryCuttingToolMaterialList';
		}
		
		//保存材料图片
		function onSavePictureToolMaterialList(){
		
			$("#NameToolMaterial_pictureToolMaterialForm").val($("#NameToolMaterial_userForm").val());
			$("#NumberToolMaterial_pictureToolMaterialForm").val($("#NumberToolMaterial_userForm").val());
			$("#CategoryToolMaterial_pictureToolMaterialForm").val($("#CategoryToolMaterial_userForm").val());
			$("#CompanyToolMaterial_pictureToolMaterialForm").val($("#CompanyToolMaterial_userForm").val());
			$("#ISOCuttingMaterial_pictureToolMaterialForm").val($("#ISOCuttingMaterial_userForm").val());
			$("#MachineableMaterial_pictureToolMaterialForm").val($("#MachineableMaterial_userForm").val());
			$("#DensityToolMaterial_pictureToolMaterialForm").val($("#DensityToolMaterial_userForm").val());
			$("#HardnessToolMaterial_pictureToolMaterialForm").val($("#HardnessToolMaterial_userForm").val());
			$("#BendingStrengthToolMaterial_pictureToolMaterialForm").val($("#BendingStrengthToolMaterial_userForm").val());
			$("#ImpactToughnessToolMaterial_pictureToolMaterialForm").val($("#ImpactToughnessToolMaterial_userForm").val());
			$("#ModulusToolMaterial_pictureToolMaterialForm").val($("#ModulusToolMaterial_userForm").val());
			$("#HeatResistanceToolMaterial_pictureToolMaterialForm").val($("#HeatResistanceToolMaterial_userForm").val());
			$("#ConductivityToolMaterial_pictureToolMaterialForm").val($("#ConductivityToolMaterial_userForm").val());
			$("#ThermalexpansionToolMaterial_pictureToolMaterialForm").val($("#ThermalexpansionToolMaterial_userForm").val());
		    
			$("#pictureToolMaterialForm").submit();
		}
		
		//删除材料图片
		function onDelPictureToolMaterialImg(url_pictureToolMaterial){
			var array_PictureToolMaterial = $("#array_PictureToolMaterial").val();
			array_PictureToolMaterial = array_PictureToolMaterial.replace(url_pictureToolMaterial,'');
			$("#array_PictureToolMaterial").val(array_PictureToolMaterial);
			var img_array = $("img[name='pictureToolMaterials_img']");
			for(var i=0;i<img_array.length;i++){
				if($(img_array[i]).attr("src") == "/goods" + url_pictureMaterial){
					$(img_array[i]).parent().remove();
				}
			}
		}
		
		//保存详细信息
		function onSaveInformToolMaterialList(){
			$("#NameToolMaterial_informToolMaterialForm").val($("#NameToolMaterial_userForm").val());
			$("#NumberToolMaterial_informToolMaterialForm").val($("#NumberToolMaterial_userForm").val());
			$("#CategoryToolMaterial_informToolMaterialForm").val($("#CategoryToolMaterial_userForm").val());
			$("#CompanyToolMaterial_informToolMaterialForm").val($("#CompanyToolMaterial_userForm").val());
			$("#ISOCuttingMaterial_informToolMaterialForm").val($("#ISOCuttingMaterial_userForm").val());
			$("#MachineableMaterial_informToolMaterialForm").val($("#MachineableMaterial_userForm").val());
			$("#DensityToolMaterial_informToolMaterialForm").val($("#DensityToolMaterial_userForm").val());
			$("#HardnessToolMaterial_informToolMaterialForm").val($("#HardnessToolMaterial_userForm").val());
			$("#BendingStrengthToolMaterial_informToolMaterialForm").val($("#BendingStrengthToolMaterial_userForm").val());
			$("#ImpactToughnessToolMaterial_informToolMaterialForm").val($("#ImpactToughnessToolMaterial_userForm").val());
			$("#ModulusToolMaterial_informToolMaterialForm").val($("#ModulusToolMaterial_userForm").val());
			$("#HeatResistanceToolMaterial_informToolMaterialForm").val($("#HeatResistanceToolMaterial_userForm").val());
			$("#ConductivityToolMaterial_informToolMaterialForm").val($("#ConductivityToolMaterial_userForm").val());
			$("#ThermalexpansionToolMaterial_informToolMaterialForm").val($("#ThermalexpansionToolMaterial_userForm").val());
		    
			$("#informToolMaterialForm").submit();
		}
		
		//删除详细信息
		function onDelInformToolMaterialImg(url_informToolMaterial){
		
			var array_InformToolMaterial = $("#array_InformToolMaterial").val();
			array_InformToolMaterial = array_InformToolMaterial.replace(url_informToolMaterial,'');
			$("#array_InformToolMaterial").val(array_InformToolMaterial);
			var img_array = $("span[name='informToolMaterials_img']");
			for(var i=0;i<img_array.length;i++){
				if($(img_array[i]).attr("url") == url_informToolMaterial){
					$(img_array[i]).parent().remove();
				}
			}
		}
		
		
		//保存应用实例
		function onSaveApplicationToolMaterialList(){
			$("#NameToolMaterial_applicationToolMaterialForm").val($("#NameToolMaterial_userForm").val());
			$("#NumberToolMaterial_applicationToolMaterialForm").val($("#NumberToolMaterial_userForm").val());
			$("#CategoryToolMaterial_applicationToolMaterialForm").val($("#CategoryToolMaterial_userForm").val());
			$("#CompanyToolMaterial_applicationToolMaterialForm").val($("#CompanyToolMaterial_userForm").val());
			$("#ISOCuttingMaterial_applicationToolMaterialForm").val($("#ISOCuttingMaterial_userForm").val());
			$("#MachineableMaterial_applicationToolMaterialForm").val($("#MachineableMaterial_userForm").val());
			$("#DensityToolMaterial_applicationToolMaterialForm").val($("#DensityToolMaterial_userForm").val());
			$("#HardnessToolMaterial_applicationToolMaterialForm").val($("#HardnessToolMaterial_userForm").val());
			$("#BendingStrengthToolMaterial_applicationToolMaterialForm").val($("#BendingStrengthToolMaterial_userForm").val());
			$("#ImpactToughnessToolMaterial_applicationToolMaterialForm").val($("#ImpactToughnessToolMaterial_userForm").val());
			$("#ModulusToolMaterial_applicationToolMaterialForm").val($("#ModulusToolMaterial_userForm").val());
			$("#HeatResistanceToolMaterial_applicationToolMaterialForm").val($("#HeatResistanceToolMaterial_userForm").val());
			$("#ConductivityToolMaterial_applicationToolMaterialForm").val($("#ConductivityToolMaterial_userForm").val());
			$("#ThermalexpansionToolMaterial_applicationToolMaterialForm").val($("#ThermalexpansionToolMaterial_userForm").val());
		    
			$("#applicationToolMaterialForm").submit();
		}
		
		//删除详细信息
		function onDelApplicationToolMaterialImg(url_applicationToolMaterial){
		
			var array_ApplicationToolMaterial = $("#array_ApplicationToolMaterial").val();
			array_ApplicationToolMaterial = array_ApplicationToolMaterial.replace(url_applicationToolMaterial,'');
			$("#array_ApplicationToolMaterial").val(array_ApplicationToolMaterial);
			var img_array = $("span[name='applicationToolMaterials_img']");
			for(var i=0;i<img_array.length;i++){
				if($(img_array[i]).attr("url") == url_applicationToolMaterial){
					$(img_array[i]).parent().remove();
				}
			}
		}
		function changeValue(){
			document.getElementById('CategoryToolMaterial_userForm').value=document.getElementById('selectWrap').options[document.getElementById('selectWrap').selectedIndex].text;
		}
		
    </script>
</head>
<body style="background:#fff;">
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">

	<ul class="box_text">
	<form action="/cuttingToolMaterial/saveCuttingToolMaterial" name="userForm" id="userForm" method="post">
	  <input type="hidden" id="array_PictureToolMaterial_userForm" name="array_PictureToolMaterial"/>
	  <input type="hidden" id="array_InformToolMaterial_userForm" name="array_InformToolMaterial"/>
	  <input type="hidden" id="array_InformToolMaterial_name_userForm" name="array_InformToolMaterial_name"/>
	  <input type="hidden" id="array_ApplicationToolMaterial_userForm" name="array_ApplicationToolMaterial"/>
	  <input type="hidden" id="array_ApplicationToolMaterial_name_userForm" name="array_ApplicationToolMaterial_name"/>
		
		
	  <input type="hidden" id="ISOCuttingMaterial_userForm_1" name="ISOCuttingMaterial"/>
	  <input type="hidden" id="MachineableMaterial_userForm_1" name="MachineableMaterial"/>
	  <input type="hidden" id="DensityToolMaterial_userForm_1" name="DensityToolMaterial"/>
	  <input type="hidden" id="HardnessToolMaterial_userForm_1" name="HardnessToolMaterial"/>
	  <input type="hidden" id="BendingStrengthToolMaterial_userForm_1" name="BendingStrengthToolMaterial"/>
	  <input type="hidden" id="ImpactToughnessToolMaterial_userForm_1" name="ImpactToughnessToolMaterial"/>
	  <input type="hidden" id="ModulusToolMaterial_userForm_1" name="ModulusToolMaterial"/>
	  <input type="hidden" id="HeatResistanceToolMaterial_userForm_1" name="HeatResistanceToolMaterial"/>
	  <input type="hidden" id="ConductivityToolMaterial_userForm_1" name="ConductivityToolMaterial"/>
	  <input type="hidden" id="ThermalexpansionToolMaterial_userForm_1" name="ThermalexpansionToolMaterial"/>
	  
	  <input type="hidden" name="id_CuttingToolMaterialD" id="id_CuttingToolMaterialD_userForm" value="${(cuttingToolMaterial.id_CuttingToolMaterialD == null || cuttingToolMaterial.id_CuttingToolMaterialD == '') ? 0 : cuttingToolMaterial.id_CuttingToolMaterialD}"/>
		
		<li>
		  <span id="lititle">刀具材料名称</span>
		  <input name="NameToolMaterial" id="NameToolMaterial_userForm" type="text" value="${cuttingToolMaterial.NameToolMaterial }" class="input"/>
		</li>
		<li>
		  <span id="lititle">刀具材料牌号</span>
		  <input name="NumberToolMaterial" id="NumberToolMaterial_userForm" type="text" value="${cuttingToolMaterial.NumberToolMaterial }" class="input"/>
		</li>
		<li>
			<span id="lititle">材料类别</span>
			<span class="select_wrap">
				<span class="edit_select">
					<select  name="selectWrap"  id="selectWrap" onChange="changeValue();" class="select" contenteditable="true">
						<c:forEach items="${categoryToolMaterialList}" var="var" varStatus="vs">
							<option value="${var.id_CategoryToolMaterial }" ${cuttingToolMaterial.CategoryToolMaterial == var.id_CategoryToolMaterial ? 'selected' : '' }>${var.name_CategoryToolMaterial }</option>	
						</c:forEach>
					</select>
				</span>
				<span class="input_select">
					<input type="text" name=CategoryToolMaterial id="CategoryToolMaterial_userForm" value="">
				</span>
			</span>
		</li>
		
		<li>
		  <span id="lititle">供应商</span>
		  <input name="CompanyToolMaterial" id="CompanyToolMaterial_userForm" type="text" value="${cuttingToolMaterial.CompanyToolMaterial }" class="input"/>
		</li>
		
		</form>
		
		<form action="/cuttingToolMaterial/savePictureToolMaterial" name="pictureToolMaterialForm" id="pictureToolMaterialForm" method="post" enctype="multipart/form-data">
		<input name="id_CuttingToolMaterialD" type="hidden" value="${(cuttingToolMaterial.id_CuttingToolMaterialD == null || cuttingToolMaterial.id_CuttingToolMaterialD == '') ? 0 : cuttingToolMaterial.id_CuttingToolMaterialD}"/>
		
		<input type="hidden" id="NameToolMaterial_pictureToolMaterialForm" value="${cuttingToolMaterial.NameToolMaterial }" class="input" name="NameToolMaterial"/>
		<input type="hidden" id="NumberToolMaterial_pictureToolMaterialForm" value="${cuttingToolMaterial.NumberToolMaterial }" class="input" name="NumberToolMaterial"/>
		<input type="hidden" id="CategoryToolMaterial_pictureToolMaterialForm" value="${cuttingToolMaterial.CategoryToolMaterial }" class="input" name="CategoryToolMaterial"/>
		<input type="hidden" id="CompanyToolMaterial_pictureToolMaterialForm" value="${cuttingToolMaterial.CompanyToolMaterial }" class="input" name="CompanyToolMaterial"/>
		<input type="hidden" id="ISOCuttingMaterial_pictureToolMaterialForm" value="${cuttingToolMaterial.ISOCuttingMaterial }" class="input" name="ISOCuttingMaterial"/>
		<input type="hidden" id="MachineableMaterial_pictureToolMaterialForm" value="${cuttingToolMaterial.MachineableMaterial }" class="input" name="MachineableMaterial"/>
		<input type="hidden" id="DensityToolMaterial_pictureToolMaterialForm" value="${cuttingToolMaterial.DensityToolMaterial }" class="input" name="DensityToolMaterial"/>
		<input type="hidden" id="HardnessToolMaterial_pictureToolMaterialForm" value="${cuttingToolMaterial.HardnessToolMaterial }" class="input" name="HardnessToolMaterial"/>
		<input type="hidden" id="BendingStrengthToolMaterial_pictureToolMaterialForm" value="${cuttingToolMaterial.BendingStrengthToolMaterial }" class="input" name="BendingStrengthToolMaterial"/>
		<input type="hidden" id="ImpactToughnessToolMaterial_pictureToolMaterialForm" value="${cuttingToolMaterial.ImpactToughnessToolMaterial }" class="input" name="ImpactToughnessToolMaterial"/>
		<input type="hidden" id="ModulusToolMaterial_pictureToolMaterialForm" value="${cuttingToolMaterial.ModulusToolMaterial }" class="input" name="ModulusToolMaterial"/>
		<input type="hidden" id="HeatResistanceToolMaterial_pictureToolMaterialForm" value="${cuttingToolMaterial.HeatResistanceToolMaterial }" class="input" name="HeatResistanceToolMaterial"/>
		<input type="hidden" id="ConductivityToolMaterial_pictureToolMaterialForm" value="${cuttingToolMaterial.ConductivityToolMaterial }" class="input" name="ConductivityToolMaterial"/>
		<input type="hidden" id="ThermalexpansionToolMaterial_pictureToolMaterialForm" value="${cuttingToolMaterial.ThermalexpansionToolMaterial }" class="input" name="ThermalexpansionToolMaterial"/>
		
		<li class="block">
		  <span id="lititle">图片</span>
		    <input type="hidden" value="${array_PictureToolMaterial == null ? '' : array_PictureToolMaterial }" id="array_PictureToolMaterial" name="array_PictureToolMaterial"/>
		    <input type="hidden" value="${array_InformToolMaterial == null ? '' : array_InformToolMaterial }" name="array_InformToolMaterial"/>
		    <input type="hidden" value="${array_InformToolMaterial_name == null ? '' : array_InformToolMaterial_name }" name="array_InformToolMaterial_name"/>
		    <input type="hidden" value="${array_ApplicationToolMaterial == null ? '' : array_ApplicationToolMaterial }" name="array_ApplicationToolMaterial"/>
		    <input type="hidden" value="${array_ApplicationToolMaterial_name == null ? '' : array_ApplicationToolMaterial_name }" name="array_ApplicationToolMaterial_name"/>
		  <input type="file" accept="image/*" name="PictureToolMaterial" id="PictureToolMaterial" />
		    <input type="button" value="加载图片" class="btn" onclick="onSavePictureToolMaterialList();"/>
		<span id="span_PictureToolMaterialList">
	    </span>
		</li>
		</form>
		<li class="block nobor">
			<input type="hidden" name="ISOCuttingMaterial" id="ISOCuttingMaterial_userForm" value="${cuttingToolMaterial.ISOCuttingMaterial }" /> 
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
			    <c:forEach items="${cuttingToolMaterial.ISOCuttingMaterialList}" var="var" varStatus="vs">
			    	<td class="td edit_1" id="cl_tr0_td${vs.index }">${var.yuansu }</td>
			    </c:forEach>
			  </tr>
			  <tr class="cl_tr_1">
			    <th class="th">百分比</th>
			    <c:forEach items="${cuttingToolMaterial.ISOCuttingMaterialList}" var="var" varStatus="vs">
			    	<td class="td edit_2" id="cl_tr1_td${vs.index }">${var.baifenbi }</td>
			    </c:forEach>
			  </tr>
			  <tr class="cl_tr_2">
			    <th class="th">操作</th>
			    <c:forEach items="${cuttingToolMaterial.ISOCuttingMaterialList}" var="var" varStatus="vs">
			     	<td class="td" id="cl_tr2_td${vs.index }"><a class="btn btn_bg_orange b_block" onclick="delCl(${vs.index })">删除</a></td>
			    </c:forEach>
			  </tr>
			</table>
		</li>
		
		
		<li class="block nobor">
		  <span id="lititle">刀具材料特点</span> &nbsp; 
		</li>
		<li class="block">
		  <textarea name="MachineableMaterial" id="MachineableMaterial_userForm" cols="" rows="" class="textarea textarea_block">${cuttingToolMaterial.MachineableMaterial }</textarea>
		</li>
		<li>
		  <span id="lititle">刀具材料密度</span>
		  <input name="DensityToolMaterial" id="DensityToolMaterial_userForm" type="text" value="${cuttingToolMaterial.DensityToolMaterial }" class="input"/>
		</li>
		<li>
		  <span id="lititle">刀具材料硬度</span>
		  <input name="HardnessToolMaterial" id="HardnessToolMaterial_userForm" type="text" value="${cuttingToolMaterial.HardnessToolMaterial }" class="input"/>
		</li>
		<li>
		  <span id="lititle">抗弯强度</span>
		  <input name="BendingStrengthToolMaterial" id="BendingStrengthToolMaterial_userForm" type="text" value="${cuttingToolMaterial.BendingStrengthToolMaterial }" class="input"/>
		</li>
		<li>
		  <span id="lititle">冲击韧性</span>
		  <input name="ImpactToughnessToolMaterial" id="ImpactToughnessToolMaterial_userForm" type="text" value="${cuttingToolMaterial.ImpactToughnessToolMaterial }" class="input"/>
		</li>
		<li>
		  <span id="lititle">弹性模量</span>
		  <input name="ModulusToolMaterial" id="ModulusToolMaterial_userForm" type="text" value="${cuttingToolMaterial.ModulusToolMaterial }" class="input"/>
		</li>
		<li>
		  <span id="lititle">耐热性</span>
		  <input name="HeatResistanceToolMaterial" id="HeatResistanceToolMaterial_userForm" type="text" value="${cuttingToolMaterial.HeatResistanceToolMaterial }" class="input"/>
		</li>
		<li>
		  <span id="lititle">材料热导率</span>
		  <input name="ConductivityToolMaterial" id="ConductivityToolMaterial_userForm" type="text" value="${cuttingToolMaterial.ConductivityToolMaterial }" class="input"/>
		</li>
		<li>
		  <span id="lititle">热膨胀系数</span>
		  <input name="ThermalexpansionToolMaterial" id="ThermalexpansionToolMaterial_userForm" type="text" value="${cuttingToolMaterial.ThermalexpansionToolMaterial }" class="input"/>
		</li>
		<form action="/cuttingToolMaterial/saveInformToolMaterial" name="informToolMaterialForm" id="informToolMaterialForm" method="post" enctype="multipart/form-data">
			<input name="id_CuttingToolMaterialD" type="hidden" value="${(cuttingToolMaterial.id_CuttingToolMaterialD == null || cuttingToolMaterial.id_CuttingToolMaterialD == '') ? 0 : cuttingToolMaterial.id_CuttingToolMaterialD}"/>
			
			<input type="hidden" id="NameToolMaterial_informToolMaterialForm" value="${cuttingToolMaterial.NameToolMaterial }" class="input" name="NameToolMaterial"/>
			<input type="hidden" id="NumberToolMaterial_informToolMaterialForm" value="${cuttingToolMaterial.NumberToolMaterial }" class="input" name="NumberToolMaterial"/>
			<input type="hidden" id="CategoryToolMaterial_informToolMaterialForm" value="${cuttingToolMaterial.CategoryToolMaterial }" class="input" name="CategoryToolMaterial"/>
			<input type="hidden" id="CompanyToolMaterial_informToolMaterialForm" value="${cuttingToolMaterial.CompanyToolMaterial }" class="input" name="CompanyToolMaterial"/>
			<input type="hidden" id="ISOCuttingMaterial_informToolMaterialForm" value="${cuttingToolMaterial.ISOCuttingMaterial }" class="input" name="ISOCuttingMaterial"/>
			<input type="hidden" id="MachineableMaterial_informToolMaterialForm" value="${cuttingToolMaterial.MachineableMaterial }" class="input" name="MachineableMaterial"/>
			<input type="hidden" id="DensityToolMaterial_informToolMaterialForm" value="${cuttingToolMaterial.DensityToolMaterial }" class="input" name="DensityToolMaterial"/>
			<input type="hidden" id="HardnessToolMaterial_informToolMaterialForm" value="${cuttingToolMaterial.HardnessToolMaterial }" class="input" name="HardnessToolMaterial"/>
			<input type="hidden" id="BendingStrengthToolMaterial_informToolMaterialForm" value="${cuttingToolMaterial.BendingStrengthToolMaterial }" class="input" name="BendingStrengthToolMaterial"/>
			<input type="hidden" id="ImpactToughnessToolMaterial_informToolMaterialForm" value="${cuttingToolMaterial.ImpactToughnessToolMaterial }" class="input" name="ImpactToughnessToolMaterial"/>
			<input type="hidden" id="ModulusToolMaterial_informToolMaterialForm" value="${cuttingToolMaterial.ModulusToolMaterial }" class="input" name="ModulusToolMaterial"/>
			<input type="hidden" id="HeatResistanceToolMaterial_informToolMaterialForm" value="${cuttingToolMaterial.HeatResistanceToolMaterial }" class="input" name="HeatResistanceToolMaterial"/>
			<input type="hidden" id="ConductivityToolMaterial_informToolMaterialForm" value="${cuttingToolMaterial.ConductivityToolMaterial }" class="input" name="ConductivityToolMaterial"/>
			<input type="hidden" id="ThermalexpansionToolMaterial_informToolMaterialForm" value="${cuttingToolMaterial.ThermalexpansionToolMaterial }" class="input" name="ThermalexpansionToolMaterial"/>
			
		<li class="block">
		  <span id="lititle">详细信息</span>
		   <input type="hidden" value="${array_PictureToolMaterial == null ? '' : array_PictureToolMaterial }"  name="array_PictureToolMaterial"/>
		    <input type="hidden" value="${array_InformToolMaterial == null ? '' : array_InformToolMaterial }" name="array_InformToolMaterial" id="array_InformToolMaterial"/>
		    <input type="hidden" value="${array_InformToolMaterial_name == null ? '' : array_InformToolMaterial_name }" name="array_InformToolMaterial_name" id="array_InformToolMaterial_name"/>
		    <input type="hidden" value="${array_ApplicationToolMaterial == null ? '' : array_ApplicationToolMaterial }" name="array_ApplicationToolMaterial"/>
		    <input type="hidden" value="${array_ApplicationToolMaterial_name == null ? '' : array_ApplicationToolMaterial_name }" name="array_ApplicationToolMaterial_name"/>
		  <input type="file" accept=".pdf" name="InformToolMaterial" id="InformToolMaterial" />
	      <input type="button" value="加载文档" class="btn" onclick="onSaveInformToolMaterialList();"/>
		<span id="span_InformToolMaterialList">
	    </span>
		</li>
		</form>
		
		<form action="/cuttingToolMaterial/saveApplicationToolMaterial" name="applicationToolMaterialForm" id="applicationToolMaterialForm" method="post" enctype="multipart/form-data">
			<input name="id_CuttingToolMaterialD" type="hidden" value="${(cuttingToolMaterial.id_CuttingToolMaterialD == null || cuttingToolMaterial.id_CuttingToolMaterialD == '') ? 0 : cuttingToolMaterial.id_CuttingToolMaterialD}"/>
			
			<input type="hidden" id="NameToolMaterial_applicationToolMaterialForm" value="${cuttingToolMaterial.NameToolMaterial }" class="input" name="NameToolMaterial"/>
			<input type="hidden" id="NumberToolMaterial_applicationToolMaterialForm" value="${cuttingToolMaterial.NumberToolMaterial }" class="input" name="NumberToolMaterial"/>
			<input type="hidden" id="CategoryToolMaterial_applicationToolMaterialForm" value="${cuttingToolMaterial.CategoryToolMaterial }" class="input" name="CategoryToolMaterial"/>
			<input type="hidden" id="CompanyToolMaterial_applicationToolMaterialForm" value="${cuttingToolMaterial.CompanyToolMaterial }" class="input" name="CompanyToolMaterial"/>
			<input type="hidden" id="ISOCuttingMaterial_applicationToolMaterialForm" value="${cuttingToolMaterial.ISOCuttingMaterial }" class="input" name="ISOCuttingMaterial"/>
			<input type="hidden" id="MachineableMaterial_applicationToolMaterialForm" value="${cuttingToolMaterial.MachineableMaterial }" class="input" name="MachineableMaterial"/>
			<input type="hidden" id="DensityToolMaterial_applicationToolMaterialForm" value="${cuttingToolMaterial.DensityToolMaterial }" class="input" name="DensityToolMaterial"/>
			<input type="hidden" id="HardnessToolMaterial_applicationToolMaterialForm" value="${cuttingToolMaterial.HardnessToolMaterial }" class="input" name="HardnessToolMaterial"/>
			<input type="hidden" id="BendingStrengthToolMaterial_applicationToolMaterialForm" value="${cuttingToolMaterial.BendingStrengthToolMaterial }" class="input" name="BendingStrengthToolMaterial"/>
			<input type="hidden" id="ImpactToughnessToolMaterial_applicationToolMaterialForm" value="${cuttingToolMaterial.ImpactToughnessToolMaterial }" class="input" name="ImpactToughnessToolMaterial"/>
			<input type="hidden" id="ModulusToolMaterial_applicationToolMaterialForm" value="${cuttingToolMaterial.ModulusToolMaterial }" class="input" name="ModulusToolMaterial"/>
			<input type="hidden" id="HeatResistanceToolMaterial_applicationToolMaterialForm" value="${cuttingToolMaterial.HeatResistanceToolMaterial }" class="input" name="HeatResistanceToolMaterial"/>
			<input type="hidden" id="ConductivityToolMaterial_applicationToolMaterialForm" value="${cuttingToolMaterial.ConductivityToolMaterial }" class="input" name="ConductivityToolMaterial"/>
			<input type="hidden" id="ThermalexpansionToolMaterial_applicationToolMaterialForm" value="${cuttingToolMaterial.ThermalexpansionToolMaterial }" class="input" name="ThermalexpansionToolMaterial"/>
			
		
		<li class="block">
		  <span id="lititle">应用实例</span>
		  <input type="hidden" value="${array_PictureToolMaterial == null ? '' : array_PictureToolMaterial }"  name="array_PictureToolMaterial"/>
		    <input type="hidden" value="${array_InformToolMaterial == null ? '' : array_InformToolMaterial }" name="array_InformToolMaterial" />
		    <input type="hidden" value="${array_InformToolMaterial_name == null ? '' : array_InformToolMaterial_name }" name="array_InformToolMaterial_name"/>
		    <input type="hidden" value="${array_ApplicationToolMaterial == null ? '' : array_ApplicationToolMaterial }" name="array_ApplicationToolMaterial" id="array_ApplicationToolMaterial"/>
		    <input type="hidden" value="${array_ApplicationToolMaterial_name == null ? '' : array_ApplicationToolMaterial_name }" name="array_ApplicationToolMaterial_name" id="array_ApplicationToolMaterial_name"/>
		  <input type="file" accept=".pdf" name="ApplicationToolMaterial" id="ApplicationToolMaterial" />
	      <input type="button" value="加载文档" class="btn" onclick="onSaveApplicationToolMaterialList();"/>
		<span id="span_ApplicationToolMaterialList">
	    </span>
		</li>	
		</form>
		
		
		
		
		
		


		


		
		
		
		
		
		
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
				$("#ISOCuttingMaterial_userForm").val(ConstituentsMaterial_str);
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
	
			htmlTr[0] = '<td class="td edit_1" id="cl_tr0_td' + (addTrIdNum+1)  +'"><input type="text" value="" /></td>';
			htmlTr[1] = '<td class="td edit_2" id="cl_tr1_td' + (addTrIdNum+1)  +'"><input type="text" value="" /></td>';
			htmlTr[2] = '<td class="td" id="cl_tr2_td' + (addTrIdNum+1)  +'"><a class="btn btn_bg_orange b_block" onclick="delCl(' + (addTrIdNum+1) + ')">删除</a></td>';
			for(var i=0;i<clTrLength;i++){
				$(".cl_tr_" + i).append(htmlTr[i]);
			}
	
		}else{
		
			var clTrLength = $("#clTable tr").length;//材料table行数

			var htmlTr = new Array();
	
			htmlTr[0] = '<td class="td edit_1" id="cl_tr0_td' + (clTdLength-1)  +'"><input type="text" value="" /></td>';
			htmlTr[1] = '<td class="td edit_2" id="cl_tr1_td' + (clTdLength-1)  +'"><input type="text" value="" /></td>';
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
		
		
		if(confirm("确定要删除吗?")){
			var ConstituentsMaterial = $("#ISOCuttingMaterial_userForm").val();
			ConstituentsMaterial = ConstituentsMaterial.replace(str, '');
			$("#ISOCuttingMaterial_userForm").val(ConstituentsMaterial);
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
					StrainRate_str = StrainRate_str + $(inputs1[i]).children('input').val() + "-" 
													+ $(inputs2[i]).children('input').val() + "-" 
													+ $(inputs3[i]).children('input').val() + "-" 
													+ $(inputs4[i]).children('input').val() + ",";
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
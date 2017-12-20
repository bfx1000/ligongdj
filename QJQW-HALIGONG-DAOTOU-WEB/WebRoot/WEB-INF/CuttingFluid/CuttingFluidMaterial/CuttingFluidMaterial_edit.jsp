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
		
		$(document).ready(function(){
 			changeValue();
			
			//材料图片
			var array_PictureCuttingFluidMaterial = $("#array_PictureCuttingFluidMaterial").val();
			if(array_PictureCuttingFluidMaterial != null && array_PictureCuttingFluidMaterial != ''){
				var PictureCuttingFluidMaterials = array_PictureCuttingFluidMaterial.split(',');
				var PictureCuttingFluidMaterials_str = '';
				for(var i = 0; i < PictureCuttingFluidMaterials.length; i++){
					if(PictureCuttingFluidMaterials[i] != null && PictureCuttingFluidMaterials[i] != ''){
						PictureCuttingFluidMaterials_str = PictureCuttingFluidMaterials_str + "<div><img name='PictureCuttingFluidMaterials_img' width='100px' height='100px' src='<%=path%>/goods"+PictureCuttingFluidMaterials[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureCuttingFluidMaterialImg(\""+PictureCuttingFluidMaterials[i]+"\");'>删除</a><br/></div>";
					}
				}
				$("#span_PictureCuttingFluidMaterialList").html(PictureCuttingFluidMaterials_str);
			}
			
			//详细信息
			var array_InformDetailCuttingFluidMaterial = $("#array_InformDetailCuttingFluidMaterial").val();
			var array_InformDetailCuttingFluidMaterial_name = $("#array_InformDetailCuttingFluidMaterial_name").val();
			if(array_InformDetailCuttingFluidMaterial != null && array_InformDetailCuttingFluidMaterial != ''){
				var InformDetailCuttingFluidMaterials = array_InformDetailCuttingFluidMaterial.split(',');
				var InformDetailCuttingFluidMaterials_name = array_InformDetailCuttingFluidMaterial_name.split(',');
				var InformDetailCuttingFluidMaterials_str = '';
				for(var i = 0; i < InformDetailCuttingFluidMaterials.length; i++){
					if(InformDetailCuttingFluidMaterials[i] != null && InformDetailCuttingFluidMaterials[i] != ''){
						InformDetailCuttingFluidMaterials_str = InformDetailCuttingFluidMaterials_str + "<div><span name='InformDetailCuttingFluidMaterials_img' url='"+InformDetailCuttingFluidMaterials[i]+"' >"+InformDetailCuttingFluidMaterials_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelInformDetailCuttingFluidMaterialImg(\""+InformDetailCuttingFluidMaterials[i]+"\");'>删除</a><br/></div>";
					}
				}
				$("#span_InformDetailCuttingFluidMaterialList").html(InformDetailCuttingFluidMaterials_str);
			}
			
			//应用实例
			var array_ApplicationCuttingFluidMaterial = $("#array_ApplicationCuttingFluidMaterial").val();
			var array_ApplicationCuttingFluidMaterial_name = $("#array_ApplicationCuttingFluidMaterial_name").val();
			if(array_ApplicationCuttingFluidMaterial != null && array_ApplicationCuttingFluidMaterial != ''){
				var ApplicationCuttingFluidMaterials = array_ApplicationCuttingFluidMaterial.split(',');
				var ApplicationCuttingFluidMaterials_name = array_ApplicationCuttingFluidMaterial_name.split(',');
				var ApplicationCuttingFluidMaterials_str = '';
				for(var i = 0; i < ApplicationCuttingFluidMaterials.length; i++){
					if(ApplicationCuttingFluidMaterials[i] != null && ApplicationCuttingFluidMaterials[i] != ''){
						ApplicationCuttingFluidMaterials_str = ApplicationCuttingFluidMaterials_str + "<div><span name='ApplicationCuttingFluidMaterials_img' url='"+ApplicationCuttingFluidMaterials[i]+"' >"+ApplicationCuttingFluidMaterials_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelApplicationCuttingFluidMaterialImg(\""+ApplicationCuttingFluidMaterials[i]+"\");'>删除</a><br/></div>";
					}
				}
				$("#span_ApplicationCuttingFluidMaterialList").html(ApplicationCuttingFluidMaterials_str);
			}
			
		});
		
		
		//保存
		function save(){
	  
			$("#array_PictureCuttingFluidMaterial_userForm").val($("#array_PictureCuttingFluidMaterial").val());
			$("#array_InformDetailCuttingFluidMaterial_userForm").val($("#array_InformDetailCuttingFluidMaterial").val());
			$("#array_InformDetailCuttingFluidMaterial_name_userForm").val($("#array_InformDetailCuttingFluidMaterial_name").val());
			$("#array_ApplicationCuttingFluidMaterial_userForm").val($("#array_ApplicationCuttingFluidMaterial").val());
			$("#array_ApplicationCuttingFluidMaterial_name_userForm").val($("#array_ApplicationCuttingFluidMaterial_name").val());
			$("#StrainRate_userForm_1").val($("#StrainRate_userForm").val());
			
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
			window.location.href='<%=path%>/CuttingFluidMaterial/queryCuttingFluidMaterialList';
		}
		
		//保存材料图片
		function onSavePictureCuttingFluidMaterialList(){
		
			$("#NameCuttingFluid_PictureCuttingFluidMaterialForm").val($("#NameCuttingFluid_userForm").val());
			$("#NumberCuttingFluid_PictureCuttingFluidMaterialForm").val($("#NumberCuttingFluid_userForm").val());
			$("#CategoryCuttingFluid_PictureCuttingFluidMaterialForm").val($("#CategoryCuttingFluid_userForm").val());
			$("#CompanyCuttingFluid_PictureCuttingFluidMaterialForm").val($("#CompanyCuttingFluid_userForm").val());
			$("#FormulaCuttingFluid_PictureCuttingFluidMaterialForm").val($("#FormulaCuttingFluid_userForm").val());
			$("#CharacterCuttingFluid_PictureCuttingFluidMaterialForm").val($("#CharacterCuttingFluid_userForm").val());
			$("#TechnicalCuttingFluid_PictureCuttingFluidMaterialForm").val($("#TechnicalCuttingFluid_userForm").val());
		    
			$("#PictureCuttingFluidMaterialForm").submit();
		}
		
		//删除材料图片
		function onDelPictureCuttingFluidMaterialImg(url_PictureCuttingFluid){
			var array_PictureCuttingFluidMaterial = $("#array_PictureCuttingFluidMaterial").val();
			array_PictureCuttingFluidMaterial = array_PictureCuttingFluidMaterial.replace(url_PictureCuttingFluid,'');
			$("#array_PictureCuttingFluidMaterial").val(array_PictureCuttingFluidMaterial);
			var img_array = $("img[name='PictureCuttingFluidMaterials_img']");
			for(var i=0;i<img_array.length;i++){
				if($(img_array[i]).attr("src") == "/goods" + url_PictureCuttingFluid){
					$(img_array[i]).parent().remove();
				}
			}
		}
		
		//保存详细信息
		function onSaveInformDetailCuttingFluidMaterialList(){
			$("#NameCuttingFluid_InformDetailCuttingFluidMaterialForm").val($("#NameCuttingFluid_userForm").val());
			$("#NumberCuttingFluid_InformDetailCuttingFluidMaterialForm").val($("#NumberCuttingFluid_userForm").val());
			$("#CategoryCuttingFluid_InformDetailCuttingFluidMaterialForm").val($("#CategoryCuttingFluid_userForm").val());
			$("#CompanyCuttingFluid_InformDetailCuttingFluidMaterialForm").val($("#CompanyCuttingFluid_userForm").val());
			$("#FormulaCuttingFluid_InformDetailCuttingFluidMaterialForm").val($("#FormulaCuttingFluid_userForm").val());
			$("#CharacterCuttingFluid_InformDetailCuttingFluidMaterialForm").val($("#CharacterCuttingFluid_userForm").val());
			$("#TechnicalCuttingFluid_InformDetailCuttingFluidMaterialForm").val($("#TechnicalCuttingFluid_userForm").val());
		    
			$("#InformDetailCuttingFluidMaterialForm").submit();
		}
		
		//删除详细信息
		function onDelInformDetailCuttingFluidMaterialImg(url_InformDetailCuttingFluid){
		
			var array_InformDetailCuttingFluidMaterial = $("#array_InformDetailCuttingFluidMaterial").val();
			array_InformDetailCuttingFluidMaterial = array_InformDetailCuttingFluidMaterial.replace(url_InformDetailCuttingFluid,'');
			$("#array_InformDetailCuttingFluidMaterial").val(array_InformDetailCuttingFluidMaterial);
			var img_array = $("span[name='InformDetailCuttingFluidMaterials_img']");
			for(var i=0;i<img_array.length;i++){
				if($(img_array[i]).attr("url") == url_InformDetailCuttingFluid){
					$(img_array[i]).parent().remove();
				}
			}
		}
		
		
		//保存应用实例
		function onSaveApplicationCuttingFluidMaterialList(){
			$("#NameCuttingFluid_ApplicationCuttingFluidMaterialForm").val($("#NameCuttingFluid_userForm").val());
			$("#NumberCuttingFluid_ApplicationCuttingFluidMaterialForm").val($("#NumberCuttingFluid_userForm").val());
			$("#CategoryCuttingFluid_ApplicationCuttingFluidMaterialForm").val($("#CategoryCuttingFluid_userForm").val());
			$("#CompanyCuttingFluid_ApplicationCuttingFluidMaterialForm").val($("#CompanyCuttingFluid_userForm").val());
			$("#FormulaCuttingFluid_ApplicationCuttingFluidMaterialForm").val($("#FormulaCuttingFluid_userForm").val());
			$("#CharacterCuttingFluid_ApplicationCuttingFluidMaterialForm").val($("#CharacterCuttingFluid_userForm").val());
			$("#TechnicalCuttingFluid_ApplicationCuttingFluidMaterialForm").val($("#TechnicalCuttingFluid_userForm").val());
		    
			$("#ApplicationCuttingFluidMaterialForm").submit();
		}
		
		//删除应用实例
		function onDelApplicationCuttingFluidMaterialImg(url_ApplicationCuttingFluid){
		
			var array_ApplicationCuttingFluidMaterial = $("#array_ApplicationCuttingFluidMaterial").val();
			array_ApplicationCuttingFluidMaterial = array_ApplicationCuttingFluidMaterial.replace(url_ApplicationCuttingFluid,'');
			$("#array_ApplicationCuttingFluidMaterial").val(array_ApplicationCuttingFluidMaterial);
			var img_array = $("span[name='ApplicationCuttingFluidMaterials_img']");
			for(var i=0;i<img_array.length;i++){
				if($(img_array[i]).attr("url") == url_ApplicationCuttingFluid){
					$(img_array[i]).parent().remove();
				}
			}
		}
		function changeValue(){
			document.getElementById('CategoryCuttingFluid_userForm').value=document.getElementById('selectWrap').options[document.getElementById('selectWrap').selectedIndex].text;
		}
		
    </script>
</head>
<body style="background:#fff;">
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">

	<ul class="box_text">
	<form action="/CuttingFluidMaterial/saveCuttingFluidMaterial" name="userForm" id="userForm" method="post">
	  <input type="hidden" id="array_PictureCuttingFluidMaterial_userForm" name="array_PictureCuttingFluidMaterial"/>
	  <input type="hidden" id="array_InformDetailCuttingFluidMaterial_userForm" name="array_InformDetailCuttingFluidMaterial"/>
	  <input type="hidden" id="array_InformDetailCuttingFluidMaterial_name_userForm" name="array_InformDetailCuttingFluidMaterial_name"/>
	  <input type="hidden" id="array_ApplicationCuttingFluidMaterial_userForm" name="array_ApplicationCuttingFluidMaterial"/>
	  <input type="hidden" id="array_ApplicationCuttingFluidMaterial_name_userForm" name="array_ApplicationCuttingFluidMaterial_name"/>
	  <input type="hidden" id="StrainRate_userForm_1" name="StrainRate"/> 
	  
	  <input type="hidden" name="id_CuttingFluidMaterial" id="id_CuttingFluidMaterial_userForm" value="${(cuttingFluidMaterial.id_CuttingFluidMaterial == null || cuttingFluidMaterial.id_CuttingFluidMaterial == '') ? 0 : cuttingFluidMaterial.id_CuttingFluidMaterial}"/>
		
		<li>
		  <span id="lititle">切削液名称</span>
		  <input name="NameCuttingFluid" id="NameCuttingFluid_userForm" type="text" value="${cuttingFluidMaterial.NameCuttingFluid }" class="input"/>
		</li>
		<li>
		  <span id="lititle">切削液编号</span>
		  <input name="NumberCuttingFluid" id="NumberCuttingFluid_userForm" type="text" value="${cuttingFluidMaterial.NumberCuttingFluid }" class="input"/>
		</li>
		<li>
			<span id="lititle">切削液种类</span>
			<span class="select_wrap">
				<span class="edit_select">
					<select  name="selectWrap"  id="selectWrap" onChange="changeValue();" class="select" contenteditable="true">
						<c:forEach items="${CategoryCuttingFluidMaterialList}" var="var" varStatus="vs">
							<option value="${var.id_CategoryCuttingFluid }" ${cuttingFluidMaterial.CategoryCuttingFluid == var.id_CategoryCuttingFluid ? 'selected' : '' }>${var.name_CategoryCuttingFluid }</option>	
						</c:forEach>
					</select>
				</span>
				<span class="input_select">
					<input type="text" name="CategoryCuttingFluid" id="CategoryCuttingFluid_userForm" value="">
				</span>
			</span>
		</li>
		
		<li>
		  <span id="lititle">供应商</span>
		  <input name="CompanyCuttingFluid" id="CompanyCuttingFluid_userForm" type="text" value="${cuttingFluidMaterial.CompanyCuttingFluid }" class="input"/>
		</li>
		
		<li class="block nobor">
		  <span id="lititle">切削液配方</span>
		</li>
		<li>
		   <textarea name="FormulaCuttingFluid" id="FormulaCuttingFluid_userForm" cols="" rows="" class="textarea" maxlength="2000">${cuttingFluidMaterial.FormulaCuttingFluid}</textarea>
		</li>
		
		<li class="block nobor">
		  <span id="lititle">切削液性能特征</span>
		</li>
		<li>
		   <textarea name="CharacterCuttingFluid" id="CharacterCuttingFluid_userForm" cols="" rows="" class="textarea" maxlength="2000">${cuttingFluidMaterial.CharacterCuttingFluid}</textarea>
		</li>
		
		<li class="block nobor">
		  <span id="lititle">切削液技术指标</span>
		</li>
		<li>
		   <textarea name="TechnicalCuttingFluid" id="TechnicalCuttingFluid_userForm" cols="" rows="" class="textarea" maxlength="2000">${cuttingFluidMaterial.TechnicalCuttingFluid}</textarea>
		</li>
		</form>
		
		
		<form action="/CuttingFluidMaterial/savePictureCuttingFluidMaterial" name="PictureCuttingFluidMaterialForm" id="PictureCuttingFluidMaterialForm" method="post" enctype="multipart/form-data">
		<input name="id_CuttingFluidMaterial" type="hidden" value="${(cuttingFluidMaterial.id_CuttingFluidMaterial == null || cuttingFluidMaterial.id_CuttingFluidMaterial == '') ? 0 : cuttingFluidMaterial.id_CuttingFluidMaterial}"/>
		
		<input type="hidden" id="NameCuttingFluid_PictureCuttingFluidMaterialForm" value="${cuttingFluidMaterial.NameCuttingFluid }" class="input" name="NameCuttingFluid"/>
		<input type="hidden" id="NumberCuttingFluid_PictureCuttingFluidMaterialForm" value="${cuttingFluidMaterial.NumberCuttingFluid }" class="input" name="NumberCuttingFluid"/>
		<input type="hidden" id="CategoryCuttingFluid_PictureCuttingFluidMaterialForm" value="${cuttingFluidMaterial.CategoryCuttingFluid }" class="input" name="CategoryCuttingFluid"/>
		<input type="hidden" id="CompanyCuttingFluid_PictureCuttingFluidMaterialForm" value="${cuttingFluidMaterial.CompanyCuttingFluid }" class="input" name="CompanyCuttingFluid"/>
		<input type="hidden" id="FormulaCuttingFluid_PictureCuttingFluidMaterialForm" value="${cuttingFluidMaterial.FormulaCuttingFluid }" class="input" name="FormulaCuttingFluid"/>
		<input type="hidden" id="CharacterCuttingFluid_PictureCuttingFluidMaterialForm" value="${cuttingFluidMaterial.CharacterCuttingFluid }" class="input" name="CharacterCuttingFluid"/>
		<input type="hidden" id="TechnicalCuttingFluid_PictureCuttingFluidMaterialForm" value="${cuttingFluidMaterial.TechnicalCuttingFluid }" class="input" name="TechnicalCuttingFluid"/>
		
		<li class="block">
		  <span id="lititle">图片</span>
		    <input type="hidden" value="${array_PictureCuttingFluidMaterial == null ? '' : array_PictureCuttingFluidMaterial }" id="array_PictureCuttingFluidMaterial" name="array_PictureCuttingFluidMaterial"/>
		    <input type="hidden" value="${array_InformDetailCuttingFluidMaterial == null ? '' : array_InformDetailCuttingFluidMaterial }" name="array_InformDetailCuttingFluidMaterial"/>
		    <input type="hidden" value="${array_InformDetailCuttingFluidMaterial_name == null ? '' : array_InformDetailCuttingFluidMaterial_name }" name="array_InformDetailCuttingFluidMaterial_name"/>
		    <input type="hidden" value="${array_ApplicationCuttingFluidMaterial == null ? '' : array_ApplicationCuttingFluidMaterial }" name="array_ApplicationCuttingFluidMaterial"/>
		    <input type="hidden" value="${array_ApplicationCuttingFluidMaterial_name == null ? '' : array_ApplicationCuttingFluidMaterial_name }" name="array_ApplicationCuttingFluidMaterial_name"/>
		  	<input type="file" accept="image/*" name="PictureCuttingFluidMaterial" id="PictureCuttingFluidMaterial" />
		    <input type="button" value="加载图片" class="btn" onclick="onSavePictureCuttingFluidMaterialList();"/>
		<span id="span_PictureCuttingFluidMaterialList">
	    </span>
		</li>
		</form>
		
		<form action="/CuttingFluidMaterial/saveInformDetailCuttingFluidMaterial" name="InformDetailCuttingFluidMaterialForm" id="InformDetailCuttingFluidMaterialForm" method="post" enctype="multipart/form-data">
		<input name="id_CuttingFluidMaterial" type="hidden" value="${(cuttingFluidMaterial.id_CuttingFluidMaterial == null || cuttingFluidMaterial.id_CuttingFluidMaterial == '') ? 0 : cuttingFluidMaterial.id_CuttingFluidMaterial}"/>
		
		<input type="hidden" id="NameCuttingFluid_InformDetailCuttingFluidMaterialForm" value="${cuttingFluidMaterial.NameCuttingFluid }" class="input" name="NameCuttingFluid"/>
		<input type="hidden" id="NumberCuttingFluid_InformDetailCuttingFluidMaterialForm" value="${cuttingFluidMaterial.NumberCuttingFluid }" class="input" name="NumberCuttingFluid"/>
		<input type="hidden" id="CategoryCuttingFluid_InformDetailCuttingFluidMaterialForm" value="${cuttingFluidMaterial.CategoryCuttingFluid }" class="input" name="CategoryCuttingFluid"/>
		<input type="hidden" id="CompanyCuttingFluid_InformDetailCuttingFluidMaterialForm" value="${cuttingFluidMaterial.CompanyCuttingFluid }" class="input" name="CompanyCuttingFluid"/>
		<input type="hidden" id="FormulaCuttingFluid_InformDetailCuttingFluidMaterialForm" value="${cuttingFluidMaterial.FormulaCuttingFluid }" class="input" name="FormulaCuttingFluid"/>
		<input type="hidden" id="CharacterCuttingFluid_InformDetailCuttingFluidMaterialForm" value="${cuttingFluidMaterial.CharacterCuttingFluid }" class="input" name="CharacterCuttingFluid"/>
		<input type="hidden" id="TechnicalCuttingFluid_InformDetailCuttingFluidMaterialForm" value="${cuttingFluidMaterial.TechnicalCuttingFluid }" class="input" name="TechnicalCuttingFluid"/>
			
		<li class="block">
		  <span id="lititle">详细信息</span>
		    <input type="hidden" value="${array_PictureCuttingFluidMaterial == null ? '' : array_PictureCuttingFluidMaterial }" name="array_PictureCuttingFluidMaterial" />
		    <input type="hidden" value="${array_InformDetailCuttingFluidMaterial == null ? '' : array_InformDetailCuttingFluidMaterial }" id="array_InformDetailCuttingFluidMaterial" name="array_InformDetailCuttingFluidMaterial"/>
		    <input type="hidden" value="${array_InformDetailCuttingFluidMaterial_name == null ? '' : array_InformDetailCuttingFluidMaterial_name }" id="array_InformDetailCuttingFluidMaterial_name" name="array_InformDetailCuttingFluidMaterial_name"/>
		    <input type="hidden" value="${array_ApplicationCuttingFluidMaterial == null ? '' : array_ApplicationCuttingFluidMaterial }" name="array_ApplicationCuttingFluidMaterial"/>
		    <input type="hidden" value="${array_ApplicationCuttingFluidMaterial_name == null ? '' : array_ApplicationCuttingFluidMaterial_name }" name="array_ApplicationCuttingFluidMaterial_name"/>
		  <input type="file" accept=".pdf" name="InformDetailCuttingFluidMaterial" id="InformDetailCuttingFluidMaterial" />
	      <input type="button" value="加载文档" class="btn" onclick="onSaveInformDetailCuttingFluidMaterialList();"/>
		<span id="span_InformDetailCuttingFluidMaterialList">
	    </span>
		</li>
		</form>
		
		<form action="/CuttingFluidMaterial/saveApplicationCuttingFluidMaterial" name="ApplicationCuttingFluidMaterialForm" id="ApplicationCuttingFluidMaterialForm" method="post" enctype="multipart/form-data">
		<input name="id_CuttingFluidMaterial" type="hidden" value="${(cuttingFluidMaterial.id_CuttingFluidMaterial == null || cuttingFluidMaterial.id_CuttingFluidMaterial == '') ? 0 : cuttingFluidMaterial.id_CuttingFluidMaterial}"/>
		
		<input type="hidden" id="NameCuttingFluid_ApplicationCuttingFluidMaterialForm" value="${cuttingFluidMaterial.NameCuttingFluid }" class="input" name="NameCuttingFluid"/>
		<input type="hidden" id="NumberCuttingFluid_ApplicationCuttingFluidMaterialForm" value="${cuttingFluidMaterial.NumberCuttingFluid }" class="input" name="NumberCuttingFluid"/>
		<input type="hidden" id="CategoryCuttingFluid_ApplicationCuttingFluidMaterialForm" value="${cuttingFluidMaterial.CategoryCuttingFluid }" class="input" name="CategoryCuttingFluid"/>
		<input type="hidden" id="CompanyCuttingFluid_ApplicationCuttingFluidMaterialForm" value="${cuttingFluidMaterial.CompanyCuttingFluid }" class="input" name="CompanyCuttingFluid"/>
		<input type="hidden" id="FormulaCuttingFluid_ApplicationCuttingFluidMaterialForm" value="${cuttingFluidMaterial.FormulaCuttingFluid }" class="input" name="FormulaCuttingFluid"/>
		<input type="hidden" id="CharacterCuttingFluid_ApplicationCuttingFluidMaterialForm" value="${cuttingFluidMaterial.CharacterCuttingFluid }" class="input" name="CharacterCuttingFluid"/>
		<input type="hidden" id="TechnicalCuttingFluid_ApplicationCuttingFluidMaterialForm" value="${cuttingFluidMaterial.TechnicalCuttingFluid }" class="input" name="TechnicalCuttingFluid"/>
		
		<li class="block">
		  <span id="lititle">应用实例</span>
		    <input type="hidden" value="${array_PictureCuttingFluidMaterial == null ? '' : array_PictureCuttingFluidMaterial }" name="array_PictureCuttingFluidMaterial" />
		    <input type="hidden" value="${array_InformDetailCuttingFluidMaterial == null ? '' : array_InformDetailCuttingFluidMaterial }" name="array_InformDetailCuttingFluidMaterial"/>
		    <input type="hidden" value="${array_InformDetailCuttingFluidMaterial_name == null ? '' : array_InformDetailCuttingFluidMaterial_name }" name="array_InformDetailCuttingFluidMaterial_name"/>
		    <input type="hidden" value="${array_ApplicationCuttingFluidMaterial == null ? '' : array_ApplicationCuttingFluidMaterial }" id="array_ApplicationCuttingFluidMaterial" name="array_ApplicationCuttingFluidMaterial"/>
		    <input type="hidden" value="${array_ApplicationCuttingFluidMaterial_name == null ? '' : array_ApplicationCuttingFluidMaterial_name }" id="array_ApplicationCuttingFluidMaterial_name" name="array_ApplicationCuttingFluidMaterial_name"/>
		  <input type="file" accept=".pdf" name="ApplicationCuttingFluidMaterial" id="ApplicationCuttingFluidMaterial" />
	      <input type="button" value="加载文档" class="btn" onclick="onSaveApplicationCuttingFluidMaterialList();"/>
		<span id="span_ApplicationCuttingFluidMaterialList">
	    </span>
		</li>	
		</form>
		
		
		
		<li class="block nobor">
			<br/>
			<input type="hidden" name="StrainRate" id="StrainRate_userForm" value="${StrainRate }" />
			<span id="lititle">切削液应用</span>
			<input type="button" value="点击输入" id="StrainRate_btn" class="btn_add"  data-name="0"  onclick="editYblData(this);">&nbsp;
			<input type="button" value="增加行" id="btn_add_StrainRate" class="btn_add"  onclick="addYblData();" style="display: none;">
		</li>
		<li class="block nobor">
			<table border="1" class="box_table li_table" id="yblTable">
				  <tr>
						<td class="th">工件材料</td>
						<td class="th">加工方式</td>
						<td class="th">加工精度</td>
						<td class="th">操作</td>
				  </tr>
				  <c:forEach items="${UsingCuttingFluidList}" var="var" varStatus="vs">
				  	<tr id="ybl_tr${vs.index }" >
						<td class="td edit_1" id="ybl_td1_tr${vs.index }">${var.WorkpieceMaterial }</td>
						<td class="td edit_2" id="ybl_td2_tr${vs.index }">${var.MachiningMethod }</td>
						<td class="td edit_3" id="ybl_td3_tr${vs.index }">${var.MachiningPrecision }</td>
						<td class="td"><a class="btn btn_bg_orange b_block" onclick="delYbl(${vs.index });">删除</a></td>
					</tr>
				  </c:forEach>
			</table>
		</li>	
		
		<br/>
		
		
		<div class="clear"></div>
	</ul>
</div>
<script type="text/javascript">
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
//				htmlInput = '<input type="text"  >';
//				$("#yblTable td.edit").append(htmlInput);
			var inputs1 = $("#yblTable td.edit_1");
			var inputs2 = $("#yblTable td.edit_2");
			
			var inputs3 = $("#yblTable td.edit_3");
			for(var i = 0;i<inputs1.length;i++){
				
				$(inputs1[i]).html('<input type="text" value="'+$(inputs1[i]).text()+'" />');
				$(inputs2[i]).html('<input type="text" value="'+$(inputs2[i]).text()+'" />');
				$(inputs3[i]).html('<input type="text" value="'+$(inputs3[i]).text()+'" />');
							
			}
		}else{

			//执行保存事件
			var StrainRate_str = '';
			
			//执行保存事件
			var inputs1 = $("#yblTable td.edit_1");
			var inputs2 = $("#yblTable td.edit_2");
			var inputs3 = $("#yblTable td.edit_3");
			for(var i = 0;i<inputs1.length;i++){
				StrainRate_str = StrainRate_str + ($(inputs1[i]).children('input').val()==""?" ":$(inputs1[i]).children('input').val()) + "-" 
												+ ($(inputs2[i]).children('input').val()==""?" ":$(inputs2[i]).children('input').val()) + "-" 
												+ ($(inputs3[i]).children('input').val()==""?" ":$(inputs3[i]).children('input').val()) + "," 
				$("#StrainRate_userForm").val(StrainRate_str);
				$(inputs1[i]).html($(inputs1[i]).children('input').val());
				$(inputs2[i]).html($(inputs2[i]).children('input').val());
				$(inputs3[i]).html($(inputs3[i]).children('input').val());
			}
//				$("#clTable td.edit input").remove();
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
			str = str + ($("#ybl_td1_tr" + id).html()==""?"11":$("#ybl_td1_tr" + id).html()) + "-";
			str = str + ($("#ybl_td2_tr" + id).html()==""?"11":$("#ybl_td1_tr" + id).html()) + "-";
			str = str + ($("#ybl_td3_tr" + id).html()==""?"11":$("#ybl_td1_tr" + id).html()) + ",";
		}else{//点击输入
			str = str + $("#ybl_td1_tr" + id + " input").val() + "-";
			str = str + $("#ybl_td2_tr" + id + " input").val() + "-";
			str = str + $("#ybl_td3_tr" + id + " input").val() + ",";
		}
		var StrainRate = $("#StrainRate_userForm").val();
		StrainRate = StrainRate.replace(str, '');
		$("#StrainRate_userForm").val(StrainRate);
	
		$("#ybl_tr" + id).remove();
	}
}

</script>


</body>
</html>
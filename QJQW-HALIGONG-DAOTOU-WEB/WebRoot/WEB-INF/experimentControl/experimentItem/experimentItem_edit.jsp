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
<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
<script src="<%=path%>/resources/js/laydate/laydate.js"></script>

<script type="text/JavaScript">


	$(document).ready(function(){
		
		changeValue();
		
		//材料图片
		var array_PictureExperimentPart = $("#array_PictureExperimentPart").val();
		if(array_PictureExperimentPart != null && array_PictureExperimentPart != ''){
			var PictureExperimentParts = array_PictureExperimentPart.split(',');
			var PictureExperimentParts_str = '';
			for(var i = 0; i < PictureExperimentParts.length; i++){
				if(PictureExperimentParts[i] != null && PictureExperimentParts[i] != ''){
					PictureExperimentParts_str = PictureExperimentParts_str + "<div><img name='PictureExperimentPartLists_img' width='100px' height='100px' src='<%=path%>/goods"+PictureExperimentParts[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureExperimentPartImg(\""+PictureExperimentParts[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureExperimentPartList").html(PictureExperimentParts_str);
		}
		
		//详细信息
		var array_InformDetailExperimentPart = $("#array_InformDetailExperimentPart").val();
		var array_InformDetailExperimentPart_name = $("#array_InformDetailExperimentPart_name").val();
		if(array_InformDetailExperimentPart != null && array_InformDetailExperimentPart != ''){
			var InformDetailExperimentParts = array_InformDetailExperimentPart.split(',');
			var InformDetailExperimentParts_name = array_InformDetailExperimentPart_name.split(',');
			var InformDetailExperimentParts_str = '';
			for(var i = 0; i < InformDetailExperimentParts.length; i++){
				if(InformDetailExperimentParts[i] != null && InformDetailExperimentParts[i] != ''){
					InformDetailExperimentParts_str = InformDetailExperimentParts_str + "<div><span name='InformDetailExperimentParts_img' url='"+InformDetailExperimentParts[i]+"' >"+InformDetailExperimentParts_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelInformDetailExperimentPartImg(\""+InformDetailExperimentParts[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_InformDetailExperimentPartList").html(InformDetailExperimentParts_str);
		}
		
		
		
		
		//应用实例
		var array_PartExperimentPart = $("#array_PartExperimentPart").val();
		var array_PartExperimentPart_name = $("#array_PartExperimentPart_name").val();
		if(array_PartExperimentPart != null && array_PartExperimentPart != ''){
			var PartExperimentParts = array_PartExperimentPart.split(',');
			var PartExperimentParts_name = array_PartExperimentPart_name.split(',');
			var PartExperimentParts_str = '';
			for(var i = 0; i < PartExperimentParts.length; i++){
				if(PartExperimentParts[i] != null && PartExperimentParts[i] != ''){
					PartExperimentParts_str = PartExperimentParts_str + "<div><span name='PartExperimentParts_img' url='"+PartExperimentParts[i]+"' >"+PartExperimentParts_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelPartExperimentPartImg(\""+PartExperimentParts[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PartExperimentPartList").html(PartExperimentParts_str);
		}
		
	});


	
	//保存
	function save(){
		
		$("#array_PictureExperimentPart_userForm").val($("#array_PictureExperimentPart").val());
		$("#array_InformDetailExperimentPart_userForm").val($("#array_InformDetailExperimentPart").val());
		$("#array_InformDetailExperimentPart_name_userForm").val($("#array_InformDetailExperimentPart_name").val());
		$("#array_PartExperimentPart_userForm").val($("#array_PartExperimentPart").val());
		$("#array_PartExperimentPart_name_userForm").val($("#array_PartExperimentPart_name").val());
		
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
		window.location.href='<%=path%>/experimentItem/experimentItemList';
	}
	
	
	
	//保存材料图片
	function onSavePictureExperimentPartImgList(){
	
		$("#nameExperimentPart_pictureExperimentItemForm").val($("#nameExperimentPart_userForm").val());
		$("#numberExperimentPart_pictureExperimentItemForm").val($("#numberExperimentPart_userForm").val());
		$("#typeExperimentPart_pictureExperimentItemForm").val($("#typeExperimentPart_userForm").val());
		$("#numberMaterialExperimentPart_pictureExperimentItemForm").val($("#numberMaterialExperimentPart_userForm").val());
		$("#categoryMaterialExperimentPart_pictureExperimentItemForm").val($("#categoryMaterialExperimentPart_userForm").val());
		$("#remarkExperimentPart_pictureExperimentItemForm").val($("#remarkExperimentPart_userForm").val());
		
		$("#PictureExperimentPartForm").submit();
	}
	
	//删除材料图片
	function onDelPictureExperimentPartImg(url_pictureMaterial){
		var array_PictureExperimentPart = $("#array_PictureExperimentPart").val();
		array_PictureExperimentPart = array_PictureExperimentPart.replace(url_pictureMaterial,'');
		$("#array_PictureExperimentPart").val(array_PictureExperimentPart);
		var img_array = $("img[name='PictureExperimentPartLists_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_pictureMaterial){
				$(img_array[i]).parent().remove();
				var array_PictureExperimentPart = $("#array_PictureExperimentPart").val();
				array_PictureExperimentPart = array_PictureExperimentPart.replace(url_pictureMaterial,'');
				$("#array_PictureExperimentPart").val(array_PictureExperimentPart);
			}
		}
	}
	
	//保存材料图片
	function onSaveInformDetailMachineInformList(){
	
		$("#nameExperimentPart_informExperimentItemForm").val($("#nameExperimentPart_userForm").val());
		$("#numberExperimentPart_informExperimentItemForm").val($("#numberExperimentPart_userForm").val());
		$("#typeExperimentPart_informExperimentItemForm").val($("#typeExperimentPart_userForm").val());
		$("#numberMaterialExperimentPart_informExperimentItemForm").val($("#numberMaterialExperimentPart_userForm").val());
		$("#categoryMaterialExperimentPart_informExperimentItemForm").val($("#categoryMaterialExperimentPart_userForm").val());
		$("#remarkExperimentPart_informExperimentItemForm").val($("#remarkExperimentPart_userForm").val());
		
		$("#InformDetailExperimentPartForm").submit();
	}
	
	//删除材料图片
	function onDelInformDetailExperimentPartImg(url_pictureMaterial){
		
		var img_array = $("span[name='InformDetailExperimentParts_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_pictureMaterial){
				$(img_array[i]).parent().remove();
				var array_InformDetailExperimentPart = $("#array_InformDetailExperimentPart").val();
				array_InformDetailExperimentPart = array_InformDetailExperimentPart.replace(url_pictureMaterial,'');
				$("#array_InformDetailExperimentPart").val(array_InformDetailExperimentPart);
			}
		}
	}
	
	
	//保存材料图片
	function onSavePartExperimentPartList(){
	
		$("#nameExperimentPart_partExperimentItemForm").val($("#nameExperimentPart_userForm").val());
		$("#numberExperimentPart_partExperimentItemForm").val($("#numberExperimentPart_userForm").val());
		$("#typeExperimentPart_partExperimentItemForm").val($("#typeExperimentPart_userForm").val());
		$("#numberMaterialExperimentPart_partExperimentItemForm").val($("#numberMaterialExperimentPart_userForm").val());
		$("#categoryMaterialExperimentPart_partExperimentItemForm").val($("#categoryMaterialExperimentPart_userForm").val());
		$("#remarkExperimentPart_partExperimentItemForm").val($("#remarkExperimentPart_userForm").val());
		
		$("#PartExperimentPartForm").submit();
	}
	
	//删除材料图片
	function onDelPartExperimentPartImg(url_pictureMaterial){
		
		var img_array = $("span[name='PartExperimentParts_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_pictureMaterial){
				$(img_array[i]).parent().remove();
				var array_PartExperimentPart = $("#array_PartExperimentPart").val();
				array_PartExperimentPart = array_PartExperimentPart.replace(url_pictureMaterial,'');
				$("#array_PartExperimentPart").val(array_PartExperimentPart);
			}
		}
	}
	
	
	
	
	
	function changeValue(){
		
			document.getElementById('typeExperimentPart_userForm').value=document.getElementById('selectWrap').options[document.getElementById('selectWrap').selectedIndex].text;
			var loading = $("#categoryMaterialExperimentPart_userForm").val();
			if(loading == null || loading == ""){
				document.getElementById('categoryMaterialExperimentPart_userForm').value=document.getElementById('selectWrap1').options[document.getElementById('selectWrap1').selectedIndex].text;
			}
	}
	
	
	
	
	
	function loadingTool(){
			$("#id_experimentPart_loadingTool").val($("#id_experimentPart_userForm").val());
			$("#nameExperimentPart_loadingTool").val($("#nameExperimentPart_userForm").val());
		    $("#numberExperimentPart_loadingTool").val($("#numberExperimentPart_userForm").val());
		    $("#typeExperimentPart_loadingTool").val($("#typeExperimentPart_userForm").val());
		    $("#numberMaterialExperimentPart_loadingTool").val($("#numberMaterialExperimentPart_userForm").val());
		    $("#categoryMaterialExperimentPart_loadingTool").val($("#categoryMaterialExperimentPart_userForm").val());
		    $("#remarkExperimentPart_loadingTool").val($("#remarkExperimentPart_userForm").val());
		    
			$("#array_PictureExperimentPart_loadingTool").val($("#array_PictureExperimentPart").val());
			$("#array_InformDetailExperimentPart_loadingTool").val($("#array_InformDetailExperimentPart").val());
			$("#array_InformDetailExperimentPart_name_loadingTool").val($("#array_InformDetailExperimentPart_name").val());
			$("#array_PartExperimentPart_loadingTool").val($("#array_PartExperimentPart").val());
			$("#array_PartExperimentPart_name_loadingTool").val($("#array_PartExperimentPart_name").val());
			
			$("#loadingTool").submit();
	}
</script>
</head>
<body>



<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text">
    <form action="/experimentItem/saveExperimentPart" name="userForm" id="userForm" method="post">
      <input type="hidden" id="array_PictureExperimentPart_userForm" name="array_PictureExperimentPart"/>
  	  <input type="hidden" id="array_InformDetailExperimentPart_userForm" name="array_InformDetailExperimentPart"/>
  	  <input type="hidden" id="array_InformDetailExperimentPart_name_userForm" name="array_InformDetailExperimentPart_name"/>
  	  <input type="hidden" id="array_PartExperimentPart_userForm" name="array_PartExperimentPart"/>
  	  <input type="hidden" id="array_PartExperimentPart_name_userForm" name="array_PartExperimentPart_name"/>
  	    
  	    
	  <input type="hidden" name="id_experimentPart" id="id_experimentPart_userForm" value="${(ExperimentItem.id_experimentPart == null || ExperimentItem.id_experimentPart == '') ? 0 : ExperimentItem.id_experimentPart}"/>
	  <li>
	    <span id="lititle">零件名称</span>
	    <input name="nameExperimentPart" id="nameExperimentPart_userForm" type="text" value="${ExperimentItem.nameExperimentPart}" class="input" maxlength="10"/>
	  </li>		
	  <li>
	    <span id="lititle">材料牌号</span>
	    <input name="numberMaterialExperimentPart" id="numberMaterialExperimentPart_userForm" type="text" value="${Material.NumberMaterial == null ? ExperimentItem.numberMaterialExperimentPart : Material.NumberMaterial }" class="input" maxlength="100"/>
	  </li>
	  <li class="append_wrap">
	    <span id="lititle">零件编号</span>
	    <div class="first">
	    	<input name="numberExperimentPart" id="numberExperimentPart_userForm" type="text" value="${ExperimentItem.numberExperimentPart}" class="input" maxlength="100"/>
	  	</div>
	  </li>
	  <li>
	    <span id="lititle">材料类别</span>
	    <span class="select_wrap">
				<span class="edit_select">
					<select  name="selectWrap1"  id="selectWrap1" onChange="changeValue();" class="select" contenteditable="true">
						<c:forEach items="${categoryMaterialExperimentPartList}" var="var" varStatus="vs">
							<option value="${var.id_CategoryMaterialExperimentPart }" ${ExperimentItem.categoryMaterialExperimentPart == var.id_CategoryMaterialExperimentPart ? 'selected' : '' }>${var.name_CategoryMaterialExperimentPart }</option>	
						</c:forEach>
					</select>
				</span>
				<span class="input_select">
				<input type="text" name="categoryMaterialExperimentPart" id="categoryMaterialExperimentPart_userForm" value="${name_CategoryMaterial }">
				</span>
		</span>
	  </li>
	  <li>
	    <span id="lititle">零件类别</span>
	    <span class="select_wrap">
				<span class="edit_select">
					<select  name="selectWrap"  id="selectWrap" onChange="changeValue();" class="select" contenteditable="true">
						<c:forEach items="${CategoryExperimentPart}" var="var" varStatus="vs">
							<option value="${var.id_typeExperimentPart }" ${ExperimentItem.typeExperimentPart == var.id_typeExperimentPart ? 'selected' : '' }>${var.name_typeExperimentPart }</option>	
						</c:forEach>
					</select>
				</span>
				<span class="input_select">
				<input type="text" name="typeExperimentPart"  id="typeExperimentPart_userForm" value="">
				</span>
		</span>
	  </li>
	  <li>
	  	<input type = "button" value = "加载材料牌号和类别" class="btn" onclick="loadingTool();"/>
	  </li>
	  <li class="block">
	    <span id="lititle">备注</span>
	    <input name="remarkExperimentPart" id="remarkExperimentPart_userForm" type="text" value="${ExperimentItem.remarkExperimentPart}" class="input" maxlength="100"/>
	  </li>
	</form>
	
	
	<!-- 图片  -->
	<form action="/experimentItem/savePictureExperimentItem" name="PictureExperimentPartForm" id="PictureExperimentPartForm" method="post" enctype="multipart/form-data">
 	  <input name="id_experimentPart" type="hidden" value="${ExperimentItem.id_experimentPart}"/>

      <input type="hidden" id="nameExperimentPart_pictureExperimentItemForm" value="" class="input" name="nameExperimentPart"/>
      <input type="hidden" id="numberExperimentPart_pictureExperimentItemForm" value="" class="input" name="numberExperimentPart"/>
      <input type="hidden" id="typeExperimentPart_pictureExperimentItemForm" value="" class="input" name="typeExperimentPart"/>
      <input type="hidden" id="numberMaterialExperimentPart_pictureExperimentItemForm" value="" class="input" name="numberMaterialExperimentPart"/>
      <input type="hidden" id="categoryMaterialExperimentPart_pictureExperimentItemForm" value="" class="input" name="categoryMaterialExperimentPart"/>
      <input type="hidden" id="remarkExperimentPart_pictureExperimentItemForm" value="" class="input" name="remarkExperimentPart"/>
	  
 	  <li class="block bor_t"> 
 	    <span id="lititle">图片</span>
    	<input type="hidden" value="${array_PictureExperimentPart == null ? '' : array_PictureExperimentPart }" id="array_PictureExperimentPart" name="array_PictureExperimentPart"/>
	    <input type="hidden" value="${array_InformDetailExperimentPart == null ? '' : array_InformDetailExperimentPart }" name="array_InformDetailExperimentPart"/>
    	<input type="hidden" value="${array_InformDetailExperimentPart_name == null ? '' : array_InformDetailExperimentPart_name }" name="array_InformDetailExperimentPart_name"/>
    	<input type="hidden" value="${array_PartExperimentPart == null ? '' : array_PartExperimentPart }"  name="array_PartExperimentPart"/>
    	<input type="hidden" value="${array_PartExperimentPart_name == null ? '' : array_PartExperimentPart_name }"  name="array_PartExperimentPart_name"/>
    	
	    <input type="file" accept="image/*" name="PictureExperimentPart" id="PictureExperimentPart" />
	    <input type="button" value="加载文件" class="btn" onclick="onSavePictureExperimentPartImgList();"/>
	    <span id="span_PictureExperimentPartList">
	      <c:forEach items="${ExperimentItem.pictureExperimentPart}" var="var" varStatus="vs">
	      	<div>
	      	  <div><img name='PartExperimentParts_img' width='100px' height='100px' src='<%=path%>/goods${var.url_pictureExperimentPart }' />
	      	  <a class="btn btn_shanchu" onclick='onDelInformDetailExperimentItemImg("${var.url_pictureExperimentPart }");'>删除</a><br/></div>
	      	</div>
	      </c:forEach>
	    </span>
 	  </li> 
 	</form>
  	<!-- 图片end  -->
  	

	<!-- 详细信息 begin  -->
	<form action="/experimentItem/saveInformDetailExperimentPart" name="InformDetailExperimentPartForm" id="InformDetailExperimentPartForm" method="post" enctype="multipart/form-data">
 	  <input name="id_experimentPart" type="hidden" value="${ExperimentItem.id_experimentPart}"/>

      <input type="hidden" id="nameExperimentPart_informExperimentItemForm" value="" class="input" name="nameExperimentPart"/>
      <input type="hidden" id="numberExperimentPart_informExperimentItemForm" value="" class="input" name="numberExperimentPart"/>
      <input type="hidden" id="typeExperimentPart_informExperimentItemForm" value="" class="input" name="typeExperimentPart"/>
      <input type="hidden" id="numberMaterialExperimentPart_informExperimentItemForm" value="" class="input" name="numberMaterialExperimentPart"/>
      <input type="hidden" id="categoryMaterialExperimentPart_informExperimentItemForm" value="" class="input" name="categoryMaterialExperimentPart"/>
      <input type="hidden" id="remarkExperimentPart_informExperimentItemForm" value="" class="input" name="remarkExperimentPart"/>
	  
 	  <li class="block bor_t"> 
 	    <span id="lititle">详细信息</span>
 	    <input type="hidden" value="${array_PictureExperimentPart == null ? '' : array_PictureExperimentPart }" name="array_PictureExperimentPart"/>
    	<input type="hidden" value="${array_InformDetailExperimentPart == null ? '' : array_InformDetailExperimentPart }" id="array_InformDetailExperimentPart" name="array_InformDetailExperimentPart"/>
    	<input type="hidden" value="${array_InformDetailExperimentPart_name == null ? '' : array_InformDetailExperimentPart_name }" id="array_InformDetailExperimentPart_name" name="array_InformDetailExperimentPart_name"/>
	    <input type="hidden" value="${array_PartExperimentPart == null ? '' : array_PartExperimentPart }"  name="array_PartExperimentPart"/>
    	<input type="hidden" value="${array_PartExperimentPart_name == null ? '' : array_PartExperimentPart_name }"  name="array_PartExperimentPart_name"/>
    	
	    <input type="file" accept=".pdf" name="InformDetailExperimentPart" id="InformDetailExperimentPart" />
	    <input type="button" value="加载文件" class="btn" onclick="onSaveInformDetailMachineInformList();"/>
	    <span id="span_InformDetailExperimentPartList">
	    </span>
 	  </li> 
 	</form>
  	<!-- 详细信息 end  -->
  	
  	<!-- part  -->
	<form action="/experimentItem/savePartExperimentPart" name="PartExperimentPartForm" id="PartExperimentPartForm" method="post" enctype="multipart/form-data">
 	  <input name="id_experimentPart" type="hidden" value="${ExperimentItem.id_experimentPart}"/>

      <input type="hidden" id="nameExperimentPart_informExperimentItemForm" value="" class="input" name="nameExperimentPart"/>
      <input type="hidden" id="numberExperimentPart_informExperimentItemForm" value="" class="input" name="numberExperimentPart"/>
      <input type="hidden" id="typeExperimentPart_informExperimentItemForm" value="" class="input" name="typeExperimentPart"/>
      <input type="hidden" id="numberMaterialExperimentPart_informExperimentItemForm" value="" class="input" name="numberMaterialExperimentPart"/>
      <input type="hidden" id="categoryMaterialExperimentPart_informExperimentItemForm" value="" class="input" name="categoryMaterialExperimentPart"/>
      <input type="hidden" id="remarkExperimentPart_informExperimentItemForm" value="" class="input" name="remarkExperimentPart"/>
	  
 	  <li class="block bor_t"> 
 	    <span id="lititle">part文件</span>
 	    <input type="hidden" value="${array_PictureExperimentPart == null ? '' : array_PictureExperimentPart }" name="array_PictureExperimentPart"/>
 	    <input type="hidden" value="${array_InformDetailExperimentPart == null ? '' : array_InformDetailExperimentPart }" name="array_InformDetailExperimentPart"/>
    	<input type="hidden" value="${array_InformDetailExperimentPart_name == null ? '' : array_InformDetailExperimentPart_name }" name="array_InformDetailExperimentPart_name"/>
    	<input type="hidden" value="${array_PartExperimentPart == null ? '' : array_PartExperimentPart }" id="array_PartExperimentPart" name="array_PartExperimentPart"/>
    	<input type="hidden" value="${array_PartExperimentPart_name == null ? '' : array_PartExperimentPart_name }" id="array_PartExperimentPart_name" name="array_PartExperimentPart_name"/>
	    
	    <input type="file" name="PartExperimentPart" id="PartExperimentPart" />
	    <input type="button" value="加载文件" class="btn" onclick="onSavePartExperimentPartList();"/>
	    <span id="span_PartExperimentPartList">
	     
	    </span>
 	  </li> 
 	</form>
  	<!-- 详细信息 end  -->
	<div class="clear"></div>
    
  </ul>
</div>
<div>
	<form action = "/experimentItem/loadingTool" id = "loadingTool" method="post">
		  <input type="hidden" id="id_experimentPart_loadingTool" value = ""  class = "input" name="id_experimentPart" />
		  <input type="hidden" id="nameExperimentPart_loadingTool" value="" class="input" name="nameExperimentPart"/>
	      <input type="hidden" id="numberExperimentPart_loadingTool" value="" class="input" name="numberExperimentPart"/>
	      <input type="hidden" id="typeExperimentPart_loadingTool" value="" class="input" name="typeExperimentPart"/>
	      <input type="hidden" id="numberMaterialExperimentPart_loadingTool" value="" class="input" name="numberMaterialExperimentPart"/>
	      <input type="hidden" id="categoryMaterialExperimentPart_loadingTool" value="$" class="input" name="categoryMaterialExperimentPart"/>
	      <input type="hidden" id="remarkExperimentPart_loadingTool" value="" class="input" name="remarkExperimentPart"/>
	      
	      <input type="hidden" id="array_PictureExperimentPart_loadingTool" name="array_PictureExperimentPart"/>
  	 	  <input type="hidden" id="array_InformDetailExperimentPart_loadingTool" name="array_InformDetailExperimentPart"/>
  	 	  <input type="hidden" id="array_InformDetailExperimentPart_name_loadingTool" name="array_InformDetailExperimentPart_name"/>
  	 	  <input type="hidden" id="array_PartExperimentPart_loadingTool" name="array_PartExperimentPart"/>
  	 	  <input type="hidden" id="array_PartExperimentPart_name_loadingTool" name="array_PartExperimentPart_name"/>
	</form>
</div>
</body>

</html>
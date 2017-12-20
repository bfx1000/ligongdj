<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
	<title>哈理工刀头</title>
    <meta name="description" content="哈理工刀头,专业打造各种类型机械刀头,产品类型齐全,质量放心有保障,联合祈福科技公司打造专业的刀头网站。" />
    <meta name="keywords" content="哈理工刀头,刀头,刀具,切断切槽,仿形切削,外圆切槽刀,内圆切槽刀,端面切槽。" />
<link href="<%=path%>/resources/css/index/style_a.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/js/jquery-1.7.2.js"></script>
<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>

<script type="text/JavaScript">

	$(document).ready(function(){
		//刀柄图片
		
		changeValue();
		
		
		var array_PictureDesignTurningHolder = $("#array_PictureDesignTurningHolder").val();
		if(array_PictureDesignTurningHolder != null && array_PictureDesignTurningHolder != ''){
			var pictureDesignTurningHolders = array_PictureDesignTurningHolder.split(',');
			var pictureDesignTurningHolders_str = '';
			for(var i = 0; i < pictureDesignTurningHolders.length; i++){
				if(pictureDesignTurningHolders[i] != null && pictureDesignTurningHolders[i] != ''){
					pictureDesignTurningHolders_str = pictureDesignTurningHolders_str + "<div><img name='pictureDesignTurningHolders_img' width='100px' height='100px' src='<%=path%>/goods"+pictureDesignTurningHolders[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureDesignTurningHolderImg(\""+pictureDesignTurningHolders[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureDesignTurningHolderList").html(pictureDesignTurningHolders_str);
		}
		
		//详细信息
		var array_PartDesignTurningHolder = $("#array_PartDesignTurningHolder").val();
		var array_PartDesignTurningHolder_name = $("#array_PartDesignTurningHolder_name").val();
		if(array_PartDesignTurningHolder != null && array_PartDesignTurningHolder != ''){
			var partDesignTurningHolders = array_PartDesignTurningHolder.split(',');
			var partDesignTurningHolders_name = array_PartDesignTurningHolder_name.split(',');
			var partDesignTurningHolders_str = '';
			for(var i = 0; i < partDesignTurningHolders.length; i++){
				if(partDesignTurningHolders[i] != null && partDesignTurningHolders[i] != ''){
					partDesignTurningHolders_str = partDesignTurningHolders_str + "<div><span name='partDesignTurningHolders_img' url='"+partDesignTurningHolders[i]+"' >"+partDesignTurningHolders_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelPartDesignTurningHolderImg(\""+partDesignTurningHolders[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PartDesignTurningHolderList").html(partDesignTurningHolders_str);
		}
		
		
		//详细信息
		var array_InformDetailDesignTurningHolder = $("#array_InformDetailDesignTurningHolder").val();
		var array_InformDetailDesignTurningHolder_name = $("#array_InformDetailDesignTurningHolder_name").val();
		if(array_InformDetailDesignTurningHolder != null && array_InformDetailDesignTurningHolder != ''){
			var informDetailDesignTurningHolders = array_InformDetailDesignTurningHolder.split(',');
			var informDetailDesignTurningHolders_name = array_InformDetailDesignTurningHolder_name.split(',');
			var informDetailDesignTurningHolders_str = '';
			for(var i = 0; i < informDetailDesignTurningHolders.length; i++){
				if(informDetailDesignTurningHolders[i] != null && informDetailDesignTurningHolders[i] != ''){
					informDetailDesignTurningHolders_str = informDetailDesignTurningHolders_str + "<div><span name='informDetailDesignTurningHolders_img' url='"+informDetailDesignTurningHolders[i]+"' >"+informDetailDesignTurningHolders_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelInformDetailDesignTurningHolderImg(\""+informDetailDesignTurningHolders[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_InformDetailDesignTurningHolderList").html(informDetailDesignTurningHolders_str);
		}
	});


	function changeValue(){
		document.getElementById('DesignTypeTurningHolder_userForm').value=document.getElementById('selectWrap').options[document.getElementById('selectWrap').selectedIndex].text;
	}
	
	//加工刀片类别自定义切换
	function onShowTypeBladeCustom(){
		var DesignBladecategoryTurningHolder = $("#DesignBladecategoryTurningHolder_userForm").val();
		if(DesignBladecategoryTurningHolder == 9){//自定义
			$("#DesignTypeCustomBlade_userForm").show();
		}else{
			$("#DesignTypeCustomBlade_userForm").val('');
			$("#DesignTypeCustomBlade_userForm").hide();
		}
	}
	
	
	//保存
	function save(){
		
		$("#array_PictureDesignTurningHolder_userForm").val($("#array_PictureDesignTurningHolder").val());//刀具图片
		$("#array_PartDesignTurningHolder_userForm").val($("#array_PartDesignTurningHolder").val());//part
		$("#array_PartDesignTurningHolder_name_userForm").val($("#array_PartDesignTurningHolder_name").val());//part
		$("#array_InformDetailDesignTurningHolder_userForm").val($("#array_InformDetailDesignTurningHolder").val());//详细信息
		$("#array_InformDetailDesignTurningHolder_name_userForm").val($("#array_InformDetailDesignTurningHolder_name").val());//详细信息
		
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
		window.location.href='<%=path%>/designTurningHolder/queryDesignTurningHolderList';
	}
	
	
	//保存刀柄图片
	function onSavePictureDesignTurningHolderList(){
	    $("#DesignNumberTurningHolder_pictureDesignTurningHolderForm").val($("#DesignNumberTurningHolder_userForm").val());
	    $("#DesignNameTurningHolder_pictureDesignTurningHolderForm").val($("#DesignNameTurningHolder_userForm").val());
	    $("#DesignTypeTurningHolder_pictureDesignTurningHolderForm").val($("#DesignTypeTurningHolder_userForm").val());
	    $("#DesignISOBladeTurning_pictureDesignTurningHolderForm").val($("#kw").val());
	    $("#DesignBladecategoryTurningHolder_pictureDesignTurningHolderForm").val($("#DesignBladecategoryTurningHolder_userForm").val());
	    $("#DesignEdgeAngleTurningHolder_pictureDesignTurningHolderForm").val($("#DesignEdgeAngleTurningHolder_userForm").val());
	    $("#DesignFeatureTurningHolder_pictureDesignTurningHolderForm").val($("#DesignFeatureTurningHolder_userForm").val());
	    $("#DesignCompanyTurningHolder_pictureDesignTurningHolderForm").val($("#DesignCompanyTurningHolder_userForm").val());
	    $("#DesignTypeCustomBlade_pictureDesignTurningHolderForm").val($("#DesignTypeCustomBlade_userForm").val());
	    
		$("#pictureDesignTurningHolderForm").submit();
	}
	
	//删除刀具图片
	function onDelPictureDesignTurningHolderImg(url_pictureDesignTurningHolder){
		var array_PictureDesignTurningHolder = $("#array_PictureDesignTurningHolder").val();
		array_PictureDesignTurningHolder = array_PictureDesignTurningHolder.replace(url_pictureDesignTurningHolder,'');
		$("#array_PictureDesignTurningHolder").val(array_PictureDesignTurningHolder);
		var img_array = $("img[name='pictureDesignTurningHolders_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_pictureDesignTurningHolder){
				$(img_array[i]).parent().remove();
			}
		}
	}
	
	//保存part
	function onSavePartDesignTurningHolderList(){
		$("#DesignNumberTurningHolder_partDesignTurningHolderForm").val($("#DesignNumberTurningHolder_userForm").val());
	    $("#DesignNameTurningHolder_partDesignTurningHolderForm").val($("#DesignNameTurningHolder_userForm").val());
	    $("#DesignTypeTurningHolder_partDesignTurningHolderForm").val($("#DesignTypeTurningHolder_userForm").val());
	    $("#DesignISOBladeTurning_partDesignTurningHolderForm").val($("#kw").val());
	    $("#DesignBladecategoryTurningHolder_partDesignTurningHolderForm").val($("#DesignBladecategoryTurningHolder_userForm").val());
	    $("#DesignEdgeAngleTurningHolder_partDesignTurningHolderForm").val($("#DesignEdgeAngleTurningHolder_userForm").val());
	    $("#DesignFeatureTurningHolder_partDesignTurningHolderForm").val($("#DesignFeatureTurningHolder_userForm").val());
	    $("#DesignCompanyTurningHolder_partDesignTurningHolderForm").val($("#DesignCompanyTurningHolder_userForm").val());
	    $("#DesignTypeCustomBlade_partDesignTurningHolderForm").val($("#DesignTypeCustomBlade_userForm").val());
	    
		$("#partDesignTurningHolderForm").submit();
	}
	

	//删除part
	function onDelPartDesignTurningHolderImg(url_partDesignTurningHolder){
		var array_PartDesignTurningHolder = $("#array_PartDesignTurningHolder").val();
		array_PartDesignTurningHolder = array_PartDesignTurningHolder.replace(url_partDesignTurningHolder,'');
		$("#array_PartDesignTurningHolder").val(array_PartDesignTurningHolder);
		var img_array = $("span[name='partDesignTurningHolders_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_partDesignTurningHolder){
				$(img_array[i]).parent().remove();
			}
		}
	}
	
	
	
	//保存详细信息
	function onSaveInformDetailDesignTurningHolderList(){
		$("#DesignNumberTurningHolder_informDetailDesignTurningHolderForm").val($("#DesignNumberTurningHolder_userForm").val());
	    $("#DesignNameTurningHolder_informDetailDesignTurningHolderForm").val($("#DesignNameTurningHolder_userForm").val());
	    $("#DesignTypeTurningHolder_informDetailDesignTurningHolderForm").val($("#DesignTypeTurningHolder_userForm").val());
	    $("#DesignISOBladeTurning_informDetailDesignTurningHolderForm").val($("#kw").val());
	    $("#DesignBladecategoryTurningHolder_informDetailDesignTurningHolderForm").val($("#DesignBladecategoryTurningHolder_userForm").val());
	    $("#DesignEdgeAngleTurningHolder_informDetailDesignTurningHolderForm").val($("#DesignEdgeAngleTurningHolder_userForm").val());
	    $("#DesignFeatureTurningHolder_informDetailDesignTurningHolderForm").val($("#DesignFeatureTurningHolder_userForm").val());
	    $("#DesignCompanyTurningHolder_informDetailDesignTurningHolderForm").val($("#DesignCompanyTurningHolder_userForm").val());
	    $("#DesignTypeCustomBlade_informDetailDesignTurningHolderForm").val($("#DesignTypeCustomBlade_userForm").val());
	    
		$("#informDetailDesignTurningHolderForm").submit();
	}
	
	//删除详细信息
	function onDelInformDetailDesignTurningHolderImg(url_informDetailDesignTurningHolder){
		var array_InformDetailDesignTurningHolder = $("#array_InformDetailDesignTurningHolder").val();
		array_InformDetailDesignTurningHolder = array_InformDetailDesignTurningHolder.replace(url_informDetailDesignTurningHolder,'');
		$("#array_InformDetailDesignTurningHolder").val(array_InformDetailDesignTurningHolder);
		var img_array = $("span[name='informDetailDesignTurningHolders_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_informDetailDesignTurningHolder){
				$(img_array[i]).parent().remove();
			}
		}
	}
</script>
</head>
<body>
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text">
    <form action="/designTurningHolder/saveDesignTurningHolder" name="userForm" id="userForm" method="post">
	  <input type="hidden" id="array_PictureDesignTurningHolder_userForm" name="array_PictureDesignTurningHolder"/>
  	  <input type="hidden" id="array_PartDesignTurningHolder_userForm" name="array_PartDesignTurningHolder"/>
  	  <input type="hidden" id="array_PartDesignTurningHolder_name_userForm" name="array_PartDesignTurningHolder_name"/>
  	  <input type="hidden" id="array_InformDetailDesignTurningHolder_userForm" name="array_InformDetailDesignTurningHolder"/>
  	  <input type="hidden" id="array_InformDetailDesignTurningHolder_name_userForm" name="array_InformDetailDesignTurningHolder_name"/>
  	    
	  <input type="hidden" name="id_DesignTurningHolder" id="id_DesignTurningHolder_userForm" value="${(designturningHolder.id_DesignTurningHolder == null || designturningHolder.id_DesignTurningHolder == '') ? 0 : designturningHolder.id_DesignTurningHolder}"/>
	  <li>
	    <span id="lititle">刀柄设计编号</span>
	    <input name="DesignNumberTurningHolder" id="DesignNumberTurningHolder_userForm" type="text" value="${designturningHolder.DesignNumberTurningHolder}" class="input" maxlength="10"/>
	  </li>		
	  <li>
	    <span id="lititle">刀柄名称</span>
	    <input name="DesignNameTurningHolder" id="DesignNameTurningHolder_userForm" type="text" value="${designturningHolder.DesignNameTurningHolder}" class="input" maxlength="50"/>
	  </li>
	  <li>
	    <span id="lititle">加工类别</span>
	    <span class="select_wrap">
				<span class="edit_select">
					<select  name="selectWrap"  id="selectWrap" onChange="changeValue();" class="select" contenteditable="true">
						<c:forEach items="${categoryDesignTurningHolder}" var="var" varStatus="vs">
							<option value="${var.id_CategoryDesignTurningHolder }" ${designturningHolder.DesignTypeTurningHolder == var.id_CategoryDesignTurningHolder ? 'selected' : '' }>${var.name_CategoryDesignTurningHolder }</option>	
						</c:forEach>
					</select>
				</span>
				<span class="input_select">
				<input type="text" name="DesignTypeTurningHolder" id="DesignTypeTurningHolder_userForm" value="">
				</span>
		</span>
	  </li>
	  <li class="append_wrap">
	    <span id="lititle">ISO基准刀片</span>
	    <div class="first">
	      <input name="DesignISOBladeTurning" id="kw" onKeyup="getContent(this);" class="input" value="${designturningHolder.DesignISOBladeTurning}" maxlength="250"/>
	    </div>
        <div id="append"></div>
	  </li>
	  <li>
	    <span id="lititle">刀片类别</span>
	    <!-- (1 正前角刀片 2 负前角刀片 3 陶瓷刀片 4 PCBN刀片 9 自定义) -->
	    <select name="DesignBladecategoryTurningHolder" id="DesignBladecategoryTurningHolder_userForm" onChange="onShowTypeBladeCustom();" class="select" style="width : 100px;">
		  <option value="1" ${designturningHolder.DesignBladecategoryTurningHolder == 1 ? 'selected' : '' }>正前角刀片</option>
		  <option value="2" ${designturningHolder.DesignBladecategoryTurningHolder == 2 ? 'selected' : '' }>负前角刀片</option>
		  <option value="3" ${designturningHolder.DesignBladecategoryTurningHolder == 3 ? 'selected' : '' }>陶瓷刀片</option>
		  <option value="4" ${designturningHolder.DesignBladecategoryTurningHolder == 4 ? 'selected' : '' }>PCBN刀片</option>
		  <option value="9" ${designturningHolder.DesignBladecategoryTurningHolder == 9 ? 'selected' : '' }>自定义</option>
	    </select>
	    <c:choose>
	      <c:when test="${designturningHolder.DesignBladecategoryTurningHolder == 9}">
	        <input name="DesignTypeCustomBlade" id="DesignTypeCustomBlade_userForm" type="text" value="${designturningHolder.DesignTypeCustomBlade}" class="input" style="width : 80px;" maxlength="200"/>
	      </c:when>
	      <c:otherwise>
		    <input name="DesignTypeCustomBlade" id="DesignTypeCustomBlade_userForm" type="text" value="${designturningHolder.DesignTypeCustomBlade}" class="input" style="display: none; width : 80px;" maxlength="200"/>
	      </c:otherwise>
	    </c:choose>
	  </li>
	  <li>
	    <span id="lititle">主偏角</span>
	    <input name="DesignEdgeAngleTurningHolder" id="DesignEdgeAngleTurningHolder_userForm" type="text" value="${designturningHolder.DesignEdgeAngleTurningHolder}" class="input" maxlength="250"/>
	  </li>
	  <li>
	    <span id="lititle">生产厂家</span>
	    <input name="DesignCompanyTurningHolder" id="DesignCompanyTurningHolder_userForm" type="text" value="${designturningHolder.DesignCompanyTurningHolder}" class="input" maxlength="100"/>
	  </li>
	  <li class="block">
	    <span id="lititle">加工特性简述</span>
	    <textarea name="DesignFeatureTurningHolder" id="DesignFeatureTurningHolder_userForm" cols="" rows="" class="textarea" maxlength="2000">${designturningHolder.DesignFeatureTurningHolder}</textarea>
	  </li>
	</form>
	<!-- 刀柄图片 begin  -->
  	<form action="/designTurningHolder/savePictureDesignTurningHolder" name="pictureDesignTurningHolderForm" id="pictureDesignTurningHolderForm" method="post" enctype="multipart/form-data">
  	
  	  <input name="id_DesignTurningHolder" type="hidden" value="${(designturningHolder.id_DesignTurningHolder == null || designturningHolder.id_DesignTurningHolder == '') ? 0 : designturningHolder.id_DesignTurningHolder}"/>
      <input type="hidden" id="DesignNumberTurningHolder_pictureDesignTurningHolderForm" value="" class="input" name="DesignNumberTurningHolder"/>
      <input type="hidden" id="DesignNameTurningHolder_pictureDesignTurningHolderForm" value="" class="input" name="DesignNameTurningHolder"/>
      <input type="hidden" id="DesignTypeTurningHolder_pictureDesignTurningHolderForm" value="" class="input" name="DesignTypeTurningHolder"/>
      <input type="hidden" id="DesignISOBladeTurning_pictureDesignTurningHolderForm" value="" class="input" name="DesignISOBladeTurning"/>
      <input type="hidden" id="DesignBladecategoryTurningHolder_pictureDesignTurningHolderForm" value="" class="input" name="DesignBladecategoryTurningHolder"/>
      <input type="hidden" id="DesignEdgeAngleTurningHolder_pictureDesignTurningHolderForm" value="" class="input" name="DesignEdgeAngleTurningHolder"/>
      <input type="hidden" id="DesignFeatureTurningHolder_pictureDesignTurningHolderForm" value="" class="input" name="DesignFeatureTurningHolder"/>
      <input type="hidden" id="DesignCompanyTurningHolder_pictureDesignTurningHolderForm" value="" class="input" name="DesignCompanyTurningHolder"/>
      <input type="hidden" id="DesignTypeCustomBlade_pictureDesignTurningHolderForm" value="" class="input" name="DesignTypeCustomBlade"/>
  	
  	  <li class="block bor_t">
    	<span id="lititle">刀柄图片</span>
    	<input type="hidden" value="${array_PictureDesignTurningHolder == null ? '' : array_PictureDesignTurningHolder }" id="array_PictureDesignTurningHolder" name="array_PictureDesignTurningHolder"/>
    	<input type="hidden" value="${array_PartDesignTurningHolder == null ? '' : array_PartDesignTurningHolder }"  name="array_PartDesignTurningHolder"/>
    	<input type="hidden" value="${array_PartDesignTurningHolder_name == null ? '' : array_PartDesignTurningHolder_name }"  name="array_PartDesignTurningHolder_name"/>
    	<input type="hidden" value="${array_InformDetailDesignTurningHolder == null ? '' : array_InformDetailDesignTurningHolder }"  name="array_InformDetailDesignTurningHolder"/>
    	<input type="hidden" value="${array_InformDetailDesignTurningHolder_name == null ? '' : array_InformDetailDesignTurningHolder_name }"  name="array_InformDetailDesignTurningHolder_name"/>
    	<input type="file" accept="image/*" name="PictureDesignTurningHolder" id="PictureDesignTurningHolder" />
    	<input type="button" value="加载图片" class="btn" onclick="onSavePictureDesignTurningHolderList();"/>
    	<span id="span_PictureDesignTurningHolderList">
    	</span>
  	  </li>
  	</form>
	<!-- 刀柄图片 end  -->

	<!-- 详细图片 begin  -->
	<form action="/designTurningHolder/savePartDesignTurningHolder" name="partDesignTurningHolderForm" id="partDesignTurningHolderForm" method="post" enctype="multipart/form-data">
  	  <input name="id_DesignTurningHolder" type="hidden" value="${(designturningHolder.id_DesignTurningHolder == null || designturningHolder.id_DesignTurningHolder == '') ? 0 : designturningHolder.id_DesignTurningHolder}"/>
      <input type="hidden" id="DesignNumberTurningHolder_partDesignTurningHolderForm" value="" class="input" name="DesignNumberTurningHolder"/>
      <input type="hidden" id="DesignNameTurningHolder_partDesignTurningHolderForm" value="" class="input" name="DesignNameTurningHolder"/>
      <input type="hidden" id="DesignTypeTurningHolder_partDesignTurningHolderForm" value="" class="input" name="DesignTypeTurningHolder"/>
      <input type="hidden" id="DesignISOBladeTurning_partDesignTurningHolderForm" value="" class="input" name="DesignISOBladeTurning"/>
      <input type="hidden" id="DesignBladecategoryTurningHolder_partDesignTurningHolderForm" value="" class="input" name="DesignBladecategoryTurningHolder"/>
      <input type="hidden" id="DesignEdgeAngleTurningHolder_partDesignTurningHolderForm" value="" class="input" name="DesignEdgeAngleTurningHolder"/>
      <input type="hidden" id="DesignFeatureTurningHolder_partDesignTurningHolderForm" value="" class="input" name="DesignFeatureTurningHolder"/>
      <input type="hidden" id="DesignCompanyTurningHolder_partDesignTurningHolderForm" value="" class="input" name="DesignCompanyTurningHolder"/>
      <input type="hidden" id="DesignTypeCustomBlade_partDesignTurningHolderForm" value="" class="input" name="DesignTypeCustomBlade"/>
  	
	  <li class="block bor_t">
	    <span id="lititle">part文件</span>
	    <input type="hidden" value="${array_PictureDesignTurningHolder == null ? '' : array_PictureDesignTurningHolder }"  name="array_PictureDesignTurningHolder"/>
    	<input type="hidden" value="${array_PartDesignTurningHolder == null ? '' : array_PartDesignTurningHolder }"  name="array_PartDesignTurningHolder" id = "array_PartDesignTurningHolder"/>
    	<input type="hidden" value="${array_PartDesignTurningHolder_name == null ? '' : array_PartDesignTurningHolder_name }"  name="array_PartDesignTurningHolder_name" id = "array_PartDesignTurningHolder_name"/>
    	<input type="hidden" value="${array_InformDetailDesignTurningHolder == null ? '' : array_InformDetailDesignTurningHolder }"  name="array_InformDetailDesignTurningHolder"/>
    	<input type="hidden" value="${array_InformDetailDesignTurningHolder_name == null ? '' : array_InformDetailDesignTurningHolder_name }"  name="array_InformDetailDesignTurningHolder_name"/>
    	<input type="file" name="PartDesignTurningHolder" id="PartDesignTurningHolder" />
	    <input type="button" value="加载part文件" class="btn" onclick="onSavePartDesignTurningHolderList();"/>
	    <span id="span_PartDesignTurningHolderList">
    	</span>
	  </li>
	</form>
	<!-- 详细图片 end  -->

	<!-- 详细信息 begin  -->
	<form action="/designTurningHolder/saveInformDetailDesignTurningHolder" name="informDetailDesignTurningHolderForm" id="informDetailDesignTurningHolderForm" method="post" enctype="multipart/form-data">
 	  <input name="id_DesignTurningHolder" type="hidden" value="${(designturningHolder.id_DesignTurningHolder == null || designturningHolder.id_DesignTurningHolder == '') ? 0 : designturningHolder.id_DesignTurningHolder}"/>
      <input type="hidden" id="DesignNumberTurningHolder_informDetailDesignTurningHolderForm" value="" class="input" name="DesignNumberTurningHolder"/>
      <input type="hidden" id="DesignNameTurningHolder_informDetailDesignTurningHolderForm" class="input" name="DesignNameTurningHolder"/>
      <input type="hidden" id="DesignTypeTurningHolder_informDetailDesignTurningHolderForm" value="" class="input" name="DesignTypeTurningHolder"/>
      <input type="hidden" id="DesignISOBladeTurning_informDetailDesignTurningHolderForm" value="" class="input" name="DesignISOBladeTurning"/>
      <input type="hidden" id="DesignBladecategoryTurningHolder_informDetailDesignTurningHolderForm" value="" class="input" name="DesignBladecategoryTurningHolder"/>
      <input type="hidden" id="DesignEdgeAngleTurningHolder_informDetailDesignTurningHolderForm" value="" class="input" name="DesignEdgeAngleTurningHolder"/>
      <input type="hidden" id="DesignFeatureTurningHolder_informDetailDesignTurningHolderForm" value="" class="input" name="DesignFeatureTurningHolder"/>
      <input type="hidden" id="DesignCompanyTurningHolder_informDetailDesignTurningHolderForm" value="" class="input" name="DesignCompanyTurningHolder"/>
      <input type="hidden" id="DesignTypeCustomBlade_informDetailDesignTurningHolderForm" value="" class="input" name="DesignTypeCustomBlade"/>
	  	
 	  <li class="block bor_t"> 
 	    <span id="lititle">详细信息</span>
 	    <input type="hidden" value="${array_PictureDesignTurningHolder == null ? '' : array_PictureDesignTurningHolder }"  name="array_PictureDesignTurningHolder"/>
    	<input type="hidden" value="${array_PartDesignTurningHolder == null ? '' : array_PartDesignTurningHolder }"  name="array_PartDesignTurningHolder"/>
    	<input type="hidden" value="${array_PartDesignTurningHolder_name == null ? '' : array_PartDesignTurningHolder_name }"  name="array_PartDesignTurningHolder_name"/>
    	<input type="hidden" value="${array_InformDetailDesignTurningHolder == null ? '' : array_InformDetailDesignTurningHolder }"  name="array_InformDetailDesignTurningHolder" id="array_InformDetailDesignTurningHolder" />
    	<input type="hidden" value="${array_InformDetailDesignTurningHolder_name == null ? '' : array_InformDetailDesignTurningHolder_name }"  name="array_InformDetailDesignTurningHolder_name" id = "array_InformDetailDesignTurningHolder_name" />
	    <input type="file" accept=".pdf" name="InformDetailDesignTurningHolder" id="InformDetailDesignTurningHolder" />
	    <input type="button" value="加载文件" class="btn" onclick="onSaveInformDetailDesignTurningHolderList();"/>
	    <span id="span_InformDetailDesignTurningHolderList">
	    </span>
 	  </li> 
 	</form>
  	<!-- 详细信息 end  -->
	<div class="clear"></div>
    
  </ul>
</div>
<input type = "hidden" value='${isoArray }' id='isoArray'/>
<script type="text/javascript">
    var data = null;

    $(document).ready(function(){

		var isoArray_str = $("#isoArray").val();
		data = eval(JSON.parse(isoArray_str)); 

    	
        $(document).keydown(function(e){
            e = e || window.event;
            var keycode = e.which ? e.which : e.keyCode;
            if(keycode == 38){//up
                if(jQuery.trim($("#append").html())==""){
                    return;
                }
                movePrev();
            }else if(keycode == 40){//down
                if(jQuery.trim($("#append").html())==""){
                    return;
                }
                $("#kw").blur();
                if($(".item").hasClass("addbg")){
                    moveNext();
                }else{
                    $(".item").removeClass('addbg').eq(0).addClass('addbg');
                }

            }else if(keycode == 13){//enter
                dojob();
            }
        });

        var movePrev = function(){
            $("#kw").blur();
            var index = $(".addbg").prevAll().length;
            if(index == 0){
                $(".item").removeClass('addbg').eq($(".item").length-1).addClass('addbg');
            }else{
                $(".item").removeClass('addbg').eq(index-1).addClass('addbg');
            }
        };

        var moveNext = function(){
            var index = $(".addbg").prevAll().length;
            if(index == $(".item").length-1){
                $(".item").removeClass('addbg').eq(0).addClass('addbg');
            }else{
                $(".item").removeClass('addbg').eq(index+1).addClass('addbg');
            }

        };

        var dojob = function(){
            $("#kw").blur();
            var value = $(".addbg").text();
            $("#kw").val(value);
            $("#append").hide().html("");
        }
    });
    function getContent(obj){
        var kw = jQuery.trim($(obj).val());
        if(kw == ""){
            $("#append").hide().html("");
            return false;
        }
        var html = "";
        for (var i = 0; i < data.length; i++) {
            if (data[i].indexOf(kw) >= 0) {
                html = html + "<div class='item' onmouseenter='getFocus(this)' onClick='getCon(this);'>" + data[i] + "</div>"
            }
        }
        if(html != ""){
            $("#append").show().html(html);
        }else{
            $("#append").hide().html("");
        }
    }
    function getFocus(obj){
        $(".item").removeClass("addbg");
        $(obj).addClass("addbg");
    }
    function getCon(obj){
        var value = $(obj).text();
        $("#kw").val(value);
        $("#append").hide().html("");
    }
</script>
</body>
</html>
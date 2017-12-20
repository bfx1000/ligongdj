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
		var array_PictureTurningHolder = $("#array_PictureTurningHolder").val();
		if(array_PictureTurningHolder != null && array_PictureTurningHolder != ''){
			var pictureTurningHolders = array_PictureTurningHolder.split(',');
			var pictureTurningHolders_str = '';
			for(var i = 0; i < pictureTurningHolders.length; i++){
				if(pictureTurningHolders[i] != null && pictureTurningHolders[i] != ''){
					pictureTurningHolders_str = pictureTurningHolders_str + "<div><img name='pictureTurningHolders_img' width='100px' height='100px' src='<%=path%>/goods"+pictureTurningHolders[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureTurningHolderImg(\""+pictureTurningHolders[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureTurningHolderList").html(pictureTurningHolders_str);
		}
		
		//详细图片
		var array_PictureDetailTurningHolder = $("#array_PictureDetailTurningHolder").val();
		if(array_PictureDetailTurningHolder != null && array_PictureDetailTurningHolder != ''){
			var pictureDetailTurningHolders = array_PictureDetailTurningHolder.split(',');
			var pictureDetailTurningHolders_str = '';
			for(var i = 0; i < pictureDetailTurningHolders.length; i++){
				if(pictureDetailTurningHolders[i] != null && pictureDetailTurningHolders[i] != ''){
					pictureDetailTurningHolders_str = pictureDetailTurningHolders_str + "<div><img name='pictureDetailTurningHolders_img' width='100px' height='100px' src='<%=path%>/goods"+pictureDetailTurningHolders[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureDetailTurningHolderImg(\""+pictureDetailTurningHolders[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureDetailTurningHolderList").html(pictureDetailTurningHolders_str);
		}
		
		
		//详细信息
		var array_InformDetailTurningHolder = $("#array_InformDetailTurningHolder").val();
		var array_InformDetailTurningHolder_name = $("#array_InformDetailTurningHolder_name").val();
		if(array_InformDetailTurningHolder != null && array_InformDetailTurningHolder != ''){
			var informDetailTurningHolders = array_InformDetailTurningHolder.split(',');
			var informDetailTurningHolders_name = array_InformDetailTurningHolder_name.split(',');
			var informDetailTurningHolders_str = '';
			for(var i = 0; i < informDetailTurningHolders.length; i++){
				if(informDetailTurningHolders[i] != null && informDetailTurningHolders[i] != ''){
					informDetailTurningHolders_str = informDetailTurningHolders_str + "<div><span name='informDetailTurningHolders_img' url='"+informDetailTurningHolders[i]+"' >"+informDetailTurningHolders_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelInformDetailTurningHolderImg(\""+informDetailTurningHolders[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_InformDetailTurningHolderList").html(informDetailTurningHolders_str);
		}
	});


	//加工类别自定义切换
	function onShowTypeTurningHolderCustom(){
		var TypeTurningHolder = $("#TypeTurningHolder_userForm").val();
		if(TypeTurningHolder == 9){//自定义
			$("#TypeCustomTurningHolder_userForm").show();
		}else{
			$("#TypeCustomTurningHolder_userForm").val('');
			$("#TypeCustomTurningHolder_userForm").hide();
		}
		
	}
	
	//加工刀片类别自定义切换
	function onShowTypeBladeCustom(){
		var TypeBlade = $("#TypeBlade_userForm").val();
		if(TypeBlade == 9){//自定义
			$("#TypeCustomBlade_userForm").show();
		}else{
			$("#TypeCustomBlade_userForm").val('');
			$("#TypeCustomBlade_userForm").hide();
		}
	}
	
	
	//保存
	function save(){
		
		$("#array_PictureTurningHolder_userForm").val($("#array_PictureTurningHolder").val());//刀具图片
		$("#array_PictureDetailTurningHolder_userForm").val($("#array_PictureDetailTurningHolder").val());//详细图片
		$("#array_InformDetailTurningHolder_userForm").val($("#array_InformDetailTurningHolder").val());//应用实例
		$("#array_InformDetailTurningHolder_name_userForm").val($("#array_InformDetailTurningHolder_name").val());//应用实例
		
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
		window.location.href='<%=path%>/turningHolder/queryTurningHolderList';
	}
	
	
	//保存刀柄图片
	function onSavePictureTurningHolderList(){
	    $("#id_TurningHolder_pictureTurningHolderForm").val($("#id_TurningHolder_userForm").val());
	    $("#NumberTurningHolder_pictureTurningHolderForm").val($("#NumberTurningHolder_userForm").val());
	    $("#NameTurningHolder_pictureTurningHolderForm").val($("#NameTurningHolder_userForm").val());
	    $("#TypeTurningHolder_pictureTurningHolderForm").val($("#TypeTurningHolder_userForm").val());
	    $("#TypeCustomTurningHolder_pictureTurningHolderForm").val($("#TypeCustomTurningHolder_userForm").val());
	    $("#ISOBladeTurning_pictureTurningHolderForm").val($("#kw").val());
	    $("#TypeBlade_pictureTurningHolderForm").val($("#TypeBlade_userForm").val());
	    $("#TypeCustomBlade_pictureTurningHolderForm").val($("#TypeCustomBlade_userForm").val());
	    $("#DiameterTurningHolder_pictureTurningHolderForm").val($("#DiameterTurningHolder_userForm").val());
	    $("#CompanyTurningHolder_pictureTurningHolderForm").val($("#CompanyTurningHolder_userForm").val());
	    $("#FeatureTurningHolder_pictureTurningHolderForm").val($("#FeatureTurningHolder_userForm").val());
	    
		$("#pictureTurningHolderForm").submit();
	}
	
	//删除刀具图片
	function onDelPictureTurningHolderImg(url_pictureTurningHolder){
		var array_PictureTurningHolder = $("#array_PictureTurningHolder").val();
		array_PictureTurningHolder = array_PictureTurningHolder.replace(url_pictureTurningHolder,'');
		$("#array_PictureTurningHolder").val(array_PictureTurningHolder);
		var img_array = $("img[name='pictureTurningHolders_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_pictureTurningHolder){
				$(img_array[i]).parent().remove();
			}
		}
	}
	
	
	
	
	
	//保存详细图片
	function onSavePictureDetailTurningHolderList(){
		$("#id_TurningHolder_pictureTurningHolderForm").val($("#id_TurningHolder_userForm").val());
	    $("#NumberTurningHolder_pictureTurningHolderForm").val($("#NumberTurningHolder_userForm").val());
	    $("#NameTurningHolder_pictureTurningHolderForm").val($("#NameTurningHolder_userForm").val());
	    $("#TypeTurningHolder_pictureTurningHolderForm").val($("#TypeTurningHolder_userForm").val());
	    $("#TypeCustomTurningHolder_pictureTurningHolderForm").val($("#TypeCustomTurningHolder_userForm").val());
	    $("#ISOBladeTurning_pictureTurningHolderForm").val($("#kw").val());
	    $("#TypeBlade_pictureTurningHolderForm").val($("#TypeBlade_userForm").val());
	    $("#TypeCustomBlade_pictureTurningHolderForm").val($("#TypeCustomBlade_userForm").val());
	    $("#DiameterTurningHolder_pictureTurningHolderForm").val($("#DiameterTurningHolder_userForm").val());
	    $("#CompanyTurningHolder_pictureTurningHolderForm").val($("#CompanyTurningHolder_userForm").val());
	    $("#FeatureTurningHolder_pictureTurningHolderForm").val($("#FeatureTurningHolder_userForm").val());
	    
		$("#pictureDetailTurningHolderForm").submit();
	}
	
	//删除详细图片
	function onDelPictureDetailTurningHolderImg(url_pictureDetailTurningHolder){
		var array_PictureDetailTurningHolder = $("#array_PictureDetailTurningHolder").val();
		array_PictureDetailTurningHolder = array_PictureDetailTurningHolder.replace(url_pictureDetailTurningHolder,'');
		$("#array_PictureDetailTurningHolder").val(array_PictureDetailTurningHolder);
		var img_array = $("img[name='pictureDetailTurningHolders_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_pictureDetailTurningHolder){
				$(img_array[i]).parent().remove();
			}
		}
	}
	
	
	
	//保存详细信息
	function onSaveInformDetailTurningHolderList(){
		$("#id_TurningHolder_pictureTurningHolderForm").val($("#id_TurningHolder_userForm").val());
	    $("#NumberTurningHolder_pictureTurningHolderForm").val($("#NumberTurningHolder_userForm").val());
	    $("#NameTurningHolder_pictureTurningHolderForm").val($("#NameTurningHolder_userForm").val());
	    $("#TypeTurningHolder_pictureTurningHolderForm").val($("#TypeTurningHolder_userForm").val());
	    $("#TypeCustomTurningHolder_pictureTurningHolderForm").val($("#TypeCustomTurningHolder_userForm").val());
	    $("#ISOBladeTurning_pictureTurningHolderForm").val($("#kw").val());
	    $("#TypeBlade_pictureTurningHolderForm").val($("#TypeBlade_userForm").val());
	    $("#TypeCustomBlade_pictureTurningHolderForm").val($("#TypeCustomBlade_userForm").val());
	    $("#DiameterTurningHolder_pictureTurningHolderForm").val($("#DiameterTurningHolder_userForm").val());
	    $("#CompanyTurningHolder_pictureTurningHolderForm").val($("#CompanyTurningHolder_userForm").val());
	    $("#FeatureTurningHolder_pictureTurningHolderForm").val($("#FeatureTurningHolder_userForm").val());
	    
		$("#informDetailTurningHolderForm").submit();
	}
	
	//删除详细信息
	function onDelInformDetailTurningHolderImg(url_informDetailTurningHolder){
		var array_InformDetailTurningHolder = $("#array_InformDetailTurningHolder").val();
		array_InformDetailTurningHolder = array_InformDetailTurningHolder.replace(url_informDetailTurningHolder,'');
		$("#array_InformDetailTurningHolder").val(array_InformDetailTurningHolder);
		var img_array = $("span[name='informDetailTurningHolders_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_informDetailTurningHolder){
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
    <form action="/turningHolder/saveTurningHolder" name="userForm" id="userForm" method="post">
	  <input type="hidden" id="array_PictureTurningHolder_userForm" name="array_PictureTurningHolder"/>
  	  <input type="hidden" id="array_PictureDetailTurningHolder_userForm" name="array_PictureDetailTurningHolder"/>
  	  <input type="hidden" id="array_InformDetailTurningHolder_userForm" name="array_InformDetailTurningHolder"/>
  	  <input type="hidden" id="array_InformDetailTurningHolder_name_userForm" name="array_InformDetailTurningHolder_name"/>
  	    
	  <input type="hidden" name="id_TurningHolder" id="id_TurningHolder_userForm" value="${(turningHolder.id_TurningHolder == null || turningHolder.id_TurningHolder == '') ? 0 : turningHolder.id_TurningHolder}"/>
	  <li>
	    <span id="lititle">刀柄编号</span>
	    <input name="NumberTurningHolder" id="NumberTurningHolder_userForm" type="text" value="${turningHolder.NumberTurningHolder}" class="input" maxlength="10"/>
	  </li>		
	  <li>
	    <span id="lititle">刀柄名称</span>
	    <input name="NameTurningHolder" id="NameTurningHolder_userForm" type="text" value="${turningHolder.NameTurningHolder}" class="input" maxlength="50"/>
	  </li>
	  <li>
	    <span id="lititle">加工类别</span>
	    <!-- (1 外圆车削 2 内圆车削 3 重型车削 4 断续车削 5 切槽 9 自定义) -->
	    <select name="TypeTurningHolder" id="TypeTurningHolder_userForm" class="select" onChange="onShowTypeTurningHolderCustom();" style="width : 100px;">
		  <option value="1" ${turningHolder.TypeTurningHolder == 1 ? 'selected' : '' }>外圆车削</option>
		  <option value="2" ${turningHolder.TypeTurningHolder == 2 ? 'selected' : '' }>内圆车削</option>
		  <option value="3" ${turningHolder.TypeTurningHolder == 3 ? 'selected' : '' }>重型车削</option>
		  <option value="4" ${turningHolder.TypeTurningHolder == 4 ? 'selected' : '' }>断续车削</option>
		  <option value="5" ${turningHolder.TypeTurningHolder == 5 ? 'selected' : '' }>切槽</option>
		  <option value="9" ${turningHolder.TypeTurningHolder == 9 ? 'selected' : '' }>自定义</option>
	    </select>
	    <c:choose>
	      <c:when test="${turningHolder.TypeBlade == 9}">
	    	<input name="TypeCustomTurningHolder" id="TypeCustomTurningHolder_userForm" type="text" value="${turningHolder.TypeCustomTurningHolder}" class="input" style="width : 80px;" maxlength="200"/>
	      </c:when>
	      <c:otherwise>
	        <input name="TypeCustomTurningHolder" id="TypeCustomTurningHolder_userForm" type="text" value="${turningHolder.TypeCustomTurningHolder}" class="input" style="display: none; width : 80px;" maxlength="200"/>
	      </c:otherwise>
	    </c:choose>
	  </li>
	  <li class="append_wrap">
	    <span id="lititle">ISO基准刀片</span>
	    <div class="first">
	      <input name="ISOBladeTurning" id="kw" onKeyup="getContent(this);" class="input" value="${turningHolder.ISOBladeTurning}" maxlength="250"/>
	    </div>
        <div id="append"></div>
	  </li>
	  <li>
	    <span id="lititle">刀片类别</span>
	    <!-- (1 正前角刀片 2 负前角刀片 3 陶瓷刀片 4 PCBN刀片 9 自定义) -->
	    <select name="TypeBlade" id="TypeBlade_userForm" onChange="onShowTypeBladeCustom();" class="select" style="width : 100px;">
		  <option value="1" ${turningHolder.TypeBlade == 1 ? 'selected' : '' }>正前角刀片</option>
		  <option value="2" ${turningHolder.TypeBlade == 2 ? 'selected' : '' }>负前角刀片</option>
		  <option value="3" ${turningHolder.TypeBlade == 3 ? 'selected' : '' }>陶瓷刀片</option>
		  <option value="4" ${turningHolder.TypeBlade == 4 ? 'selected' : '' }>PCBN刀片</option>
		  <option value="9" ${turningHolder.TypeBlade == 9 ? 'selected' : '' }>自定义</option>
	    </select>
	    <c:choose>
	      <c:when test="${turningHolder.TypeBlade == 9}">
	        <input name="TypeCustomBlade" id="TypeCustomBlade_userForm" type="text" value="${turningHolder.TypeCustomBlade}" class="input" style="width : 80px;" maxlength="200"/>
	      </c:when>
	      <c:otherwise>
		    <input name="TypeCustomBlade" id="TypeCustomBlade_userForm" type="text" value="${turningHolder.TypeCustomBlade}" class="input" style="display: none; width : 80px;" maxlength="200"/>
	      </c:otherwise>
	    </c:choose>
	  </li>
	  <li>
	    <span id="lititle">主偏角</span>
	    <input name="DiameterTurningHolder" id="DiameterTurningHolder_userForm" type="text" value="${turningHolder.DiameterTurningHolder}" class="input" maxlength="250"/>
	  </li>
	  <li>
	    <span id="lititle">生产厂家</span>
	    <input name="CompanyTurningHolder" id="CompanyTurningHolder_userForm" type="text" value="${turningHolder.CompanyTurningHolder}" class="input" maxlength="100"/>
	  </li>
	  <li class="block">
	    <span id="lititle">加工特性简述</span>
	    <textarea name="FeatureTurningHolder" id="FeatureTurningHolder_userForm" cols="" rows="" class="textarea" maxlength="2000">${turningHolder.FeatureTurningHolder}</textarea>
	  </li>
	</form>
	<!-- 刀柄图片 begin  -->
  	<form action="/turningHolder/savePictureTurningHolder" name="pictureTurningHolderForm" id="pictureTurningHolderForm" method="post" enctype="multipart/form-data">
  	
  	  <input name="id_TurningHolder" type="hidden" value="${(turningHolder.id_TurningHolder == null || turningHolder.id_TurningHolder == '') ? 0 : turningHolder.id_TurningHolder}"/>
      <input type="hidden" id="NumberTurningHolder_pictureTurningHolderForm" value="${turningHolder.NumberTurningHolder }" class="input" name="NumberTurningHolder"/>
      <input type="hidden" id="NameTurningHolder_pictureTurningHolderForm" value="${turningHolder.NameTurningHolder }" class="input" name="NameTurningHolder"/>
      <input type="hidden" id="TypeTurningHolder_pictureTurningHolderForm" value="${turningHolder.TypeTurningHolder }" class="input" name="TypeTurningHolder"/>
      <input type="hidden" id="TypeCustomTurningHolder_pictureTurningHolderForm" value="${turningHolder.TypeCustomTurningHolder }" class="input" name="TypeCustomTurningHolder"/>
      <input type="hidden" id="ISOBladeTurning_pictureTurningHolderForm" value="${turningHolder.ISOBladeTurning }" class="input" name="ISOBladeTurning"/>
      <input type="hidden" id="TypeBlade_pictureTurningHolderForm" value="${turningHolder.TypeBlade }" class="input" name="TypeBlade"/>
      <input type="hidden" id="TypeCustomBlade_pictureTurningHolderForm" value="${turningHolder.TypeCustomBlade }" class="input" name="TypeCustomBlade"/>
      <input type="hidden" id="DiameterTurningHolder_pictureTurningHolderForm" value="${turningHolder.DiameterTurningHolder }" class="input" name="DiameterTurningHolder"/>
      <input type="hidden" id="CompanyTurningHolder_pictureTurningHolderForm" value="${turningHolder.CompanyTurningHolder }" class="input" name="CompanyTurningHolder"/>
      <input type="hidden" id="FeatureTurningHolder_pictureTurningHolderForm" value="${turningHolder.FeatureTurningHolder }" class="input" name="FeatureTurningHolder"/>
  	
  	  <li class="block bor_t">
    	<span id="lititle">刀柄图片</span>
    	<input type="hidden" value="${array_PictureTurningHolder == null ? '' : array_PictureTurningHolder }" id="array_PictureTurningHolder" name="array_PictureTurningHolder"/>
    	<input type="hidden" value="${array_PictureDetailTurningHolder == null ? '' : array_PictureDetailTurningHolder }"  name="array_PictureDetailTurningHolder"/>
    	<input type="hidden" value="${array_InformDetailTurningHolder == null ? '' : array_InformDetailTurningHolder }"  name="array_InformDetailTurningHolder"/>
    	<input type="hidden" value="${array_InformDetailTurningHolder_name == null ? '' : array_InformDetailTurningHolder_name }"  name="array_InformDetailTurningHolder_name"/>
    	<input type="file" accept="image/*" name="PictureTurningHolder" id="PictureTurningHolder" />
    	<input type="button" value="加载图片" class="btn" onclick="onSavePictureTurningHolderList();"/>
    	<span id="span_PictureTurningHolderList">
      	  <c:forEach items="${turningHolder.pictureTurningHolderList}" var="var" varStatus="vs">
      		<div>
      		  <img name='pictureTurningHolders_img' width='100px' height='100px' src='<%=path%>/goods${var.url_PictureTurningHolder }' />
      		  <a class="btn btn_shanchu" onclick='onDelPictureTurningHolderImg("${var.url_PictureTurningHolder }");'>删除</a>
      		  <br/>
      		</div>
      	  </c:forEach>
    	</span>
  	  </li>
  	</form>
	<!-- 刀柄图片 end  -->

	<!-- 详细图片 begin  -->
	<form action="/turningHolder/savePictureDetailTurningHolder" name="pictureDetailTurningHolderForm" id="pictureDetailTurningHolderForm" method="post" enctype="multipart/form-data">
  	  <input name="id_TurningHolder" type="hidden" value="${(turningHolder.id_TurningHolder == null || turningHolder.id_TurningHolder == '') ? 0 : turningHolder.id_TurningHolder}"/>
      <input type="hidden" id="NumberTurningHolder_pictureDetailTurningHolderForm" value="${turningHolder.NumberTurningHolder }" class="input" name="NumberTurningHolder"/>
      <input type="hidden" id="NameTurningHolder_pictureDetailTurningHolderForm" value="${turningHolder.NameTurningHolder }" class="input" name="NameTurningHolder"/>
      <input type="hidden" id="TypeTurningHolder_pictureDetailTurningHolderForm" value="${turningHolder.TypeTurningHolder }" class="input" name="TypeTurningHolder"/>
      <input type="hidden" id="TypeCustomTurningHolder_pictureDetailTurningHolderForm" value="${turningHolder.TypeCustomTurningHolder }" class="input" name="TypeCustomTurningHolder"/>
      <input type="hidden" id="ISOBladeTurning_pictureDetailTurningHolderForm" value="${turningHolder.ISOBladeTurning }" class="input" name="ISOBladeTurning"/>
      <input type="hidden" id="TypeBlade_pictureDetailTurningHolderForm" value="${turningHolder.TypeBlade }" class="input" name="TypeBlade"/>
      <input type="hidden" id="TypeCustomBlade_pictureDetailTurningHolderForm" value="${turningHolder.TypeCustomBlade }" class="input" name="TypeCustomBlade"/>
      <input type="hidden" id="DiameterTurningHolder_pictureDetailTurningHolderForm" value="${turningHolder.DiameterTurningHolder }" class="input" name="DiameterTurningHolder"/>
      <input type="hidden" id="CompanyTurningHolder_pictureDetailTurningHolderForm" value="${turningHolder.CompanyTurningHolder }" class="input" name="CompanyTurningHolder"/>
      <input type="hidden" id="FeatureTurningHolder_pictureDetailTurningHolderForm" value="${turningHolder.FeatureTurningHolder }" class="input" name="FeatureTurningHolder"/>
  	
	  <li class="block bor_t">
	    <span id="lititle">详细图片</span>
	    <input type="hidden" value="${array_PictureTurningHolder == null ? '' : array_PictureTurningHolder }"  name="array_PictureTurningHolder"/>
    	<input type="hidden" value="${array_PictureDetailTurningHolder == null ? '' : array_PictureDetailTurningHolder }" id="array_PictureDetailTurningHolder" name="array_PictureDetailTurningHolder"/>
    	<input type="hidden" value="${array_InformDetailTurningHolder == null ? '' : array_InformDetailTurningHolder }"  name="array_InformDetailTurningHolder"/>
    	<input type="hidden" value="${array_InformDetailTurningHolder_name == null ? '' : array_InformDetailTurningHolder_name }"  name="array_InformDetailTurningHolder_name"/>
    	<input type="file" accept="image/*" name="PictureDetailTurningHolder" id="PictureDetailTurningHolder" />
	    <input type="button" value="加载图片" class="btn" onclick="onSavePictureDetailTurningHolderList();"/>
	    <span id="span_PictureDetailTurningHolderList">
      	  <c:forEach items="${turningHolder.pictureDetailTurningHolderList}" var="var" varStatus="vs">
      		<div>
      		  <img name='pictureDetailTurningHolders_img' width='100px' height='100px' src='<%=path%>/goods${var.url_PictureDetailTurningHolder }' />
      		  <a class="btn btn_shanchu" onclick='onDelPictureDetailTurningHolderImg("${var.url_PictureDetailTurningHolder }");'>删除</a>
      		  <br/>
      		</div>
      	  </c:forEach>
    	</span>
	  </li>
	</form>
	<!-- 详细图片 end  -->

	<!-- 详细信息 begin  -->
	<form action="/turningHolder/saveInformDetailTurningHolder" name="informDetailTurningHolderForm" id="informDetailTurningHolderForm" method="post" enctype="multipart/form-data">
 	  <input name="id_TurningHolder" type="hidden" value="${(turningHolder.id_TurningHolder == null || turningHolder.id_TurningHolder == '') ? 0 : turningHolder.id_TurningHolder}"/>
      <input type="hidden" id="NumberTurningHolder_informDetailTurningHolderForm" value="${turningHolder.NumberTurningHolder }" class="input" name="NumberTurningHolder"/>
      <input type="hidden" id="NameTurningHolder_informDetailTurningHolderForm" value="${turningHolder.NameTurningHolder }" class="input" name="NameTurningHolder"/>
      <input type="hidden" id="TypeTurningHolder_informDetailTurningHolderForm" value="${turningHolder.TypeTurningHolder }" class="input" name="TypeTurningHolder"/>
      <input type="hidden" id="TypeCustomTurningHolder_informDetailTurningHolderForm" value="${turningHolder.TypeCustomTurningHolder }" class="input" name="TypeCustomTurningHolder"/>
      <input type="hidden" id="ISOBladeTurning_informDetailTurningHolderForm" value="${turningHolder.ISOBladeTurning }" class="input" name="ISOBladeTurning"/>
      <input type="hidden" id="TypeBlade_informDetailTurningHolderForm" value="${turningHolder.TypeBlade }" class="input" name="TypeBlade"/>
      <input type="hidden" id="TypeCustomBlade_informDetailTurningHolderForm" value="${turningHolder.TypeCustomBlade }" class="input" name="TypeCustomBlade"/>
      <input type="hidden" id="DiameterTurningHolder_informDetailTurningHolderForm" value="${turningHolder.DiameterTurningHolder }" class="input" name="DiameterTurningHolder"/>
      <input type="hidden" id="CompanyTurningHolder_informDetailTurningHolderForm" value="${turningHolder.CompanyTurningHolder }" class="input" name="CompanyTurningHolder"/>
      <input type="hidden" id="FeatureTurningHolder_informDetailTurningHolderForm" value="${turningHolder.FeatureTurningHolder }" class="input" name="FeatureTurningHolder"/>
	  	
 	  <li class="block bor_t"> 
 	    <span id="lititle">详细信息</span>
 	    <input type="hidden" value="${array_PictureTurningHolder == null ? '' : array_PictureTurningHolder }"  name="array_PictureTurningHolder"/>
    	<input type="hidden" value="${array_PictureDetailTurningHolder == null ? '' : array_PictureDetailTurningHolder }" name="array_PictureDetailTurningHolder"/>
    	<input type="hidden" value="${array_InformDetailTurningHolder == null ? '' : array_InformDetailTurningHolder }" id="array_InformDetailTurningHolder"  name="array_InformDetailTurningHolder"/>
    	<input type="hidden" value="${array_InformDetailTurningHolder_name == null ? '' : array_InformDetailTurningHolder_name }" id="array_InformDetailTurningHolder_name"  name="array_InformDetailTurningHolder_name"/>
	    <input type="file" accept=".pdf" name="InformDetailTurningHolder" id="InformDetailTurningHolder" />
	    <input type="button" value="加载文件" class="btn" onclick="onSaveInformDetailTurningHolderList();"/>
	    <span id="span_InformDetailTurningHolderList">
	      <c:forEach items="${turningHolder.informDetailTurningHolderList}" var="var" varStatus="vs">
	      	<div>
	      	  <span name='informDetailTurningHolders_img' >${var.url_InformDetailTurningHolder }</span>
	      	  <a class="btn btn_shanchu" onclick='onDelInformDetailTurningHolderImg("${var.url_InformDetailTurningHolder }");'>删除</a>
	      	  <br/>
	      	</div>
	      </c:forEach>
	    </span>
 	  </li> 
 	</form>
  	<!-- 详细信息 end  -->
	<div class="clear"></div>
    
  </ul>
</div>
<input type ="hidden" value='${isoArray }' id='isoArray'/>
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
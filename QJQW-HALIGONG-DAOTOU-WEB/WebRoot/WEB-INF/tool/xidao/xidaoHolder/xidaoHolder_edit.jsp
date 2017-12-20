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
		var array_PictureXidaoHolder = $("#array_PictureXidaoHolder").val();
		if(array_PictureXidaoHolder != null && array_PictureXidaoHolder != ''){
			var pictureXidaoHolders = array_PictureXidaoHolder.split(',');
			var pictureXidaoHolders_str = '';
			for(var i = 0; i < pictureXidaoHolders.length; i++){
				if(pictureXidaoHolders[i] != null && pictureXidaoHolders[i] != ''){
					pictureXidaoHolders_str = pictureXidaoHolders_str + "<div><img name='pictureXidaoHolders_img' width='100px' height='100px' src='<%=path%>/goods"+pictureXidaoHolders[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureXidaoHolderImg(\""+pictureXidaoHolders[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureXidaoHolderList").html(pictureXidaoHolders_str);
		}
		
		//详细图片
		var array_PictureDetailXidaoHolder = $("#array_PictureDetailXidaoHolder").val();
		if(array_PictureDetailXidaoHolder != null && array_PictureDetailXidaoHolder != ''){
			var pictureDetailXidaoHolders = array_PictureDetailXidaoHolder.split(',');
			var pictureDetailXidaoHolders_str = '';
			for(var i = 0; i < pictureDetailXidaoHolders.length; i++){
				if(pictureDetailXidaoHolders[i] != null && pictureDetailXidaoHolders[i] != ''){
					pictureDetailXidaoHolders_str = pictureDetailXidaoHolders_str + "<div><img name='pictureDetailXidaoHolders_img' width='100px' height='100px' src='<%=path%>/goods"+pictureDetailXidaoHolders[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureDetailXidaoHolderImg(\""+pictureDetailXidaoHolders[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureDetailXidaoHolderList").html(pictureDetailXidaoHolders_str);
		}
		
		
		//详细信息
		var array_InformDetailXidaoHolder = $("#array_InformDetailXidaoHolder").val();
		var array_InformDetailXidaoHolder_Name = $("#array_InformDetailXidaoHolder_Name").val();
		if(array_InformDetailXidaoHolder != null && array_InformDetailXidaoHolder != ''){
			var informDetailXidaoHolders = array_InformDetailXidaoHolder.split(',');
			var informDetailXidaoHolders_name = array_InformDetailXidaoHolder_Name.split(',');
			var informDetailXidaoHolders_str = '';
			for(var i = 0; i < informDetailXidaoHolders.length; i++){
				if(informDetailXidaoHolders[i] != null && informDetailXidaoHolders[i] != ''){
					informDetailXidaoHolders_str = informDetailXidaoHolders_str + "<div><span name='informDetailXidaoHolders_img' url='"+informDetailXidaoHolders[i]+"' >"+informDetailXidaoHolders_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelInformDetailXidaoHolderImg(\""+informDetailXidaoHolders[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_InformDetailXidaoHolderList").html(informDetailXidaoHolders_str);
		}
	});


	//加工类别自定义切换
	function onShowtypeXidaoHolderCustom(){
		var typeXidaoHolder = $("#typeXidaoHolder_userForm").val();
		if(typeXidaoHolder == 9){//自定义
			$("#typeCustomXidaoHolder_userForm").show();
		}else{
			$("#typeCustomXidaoHolder_userForm").val('');
			$("#typeCustomXidaoHolder_userForm").hide();
		}
		
	}
	
	//加工刀片类别自定义切换
	function onShowtypeBladeCustom(){
		var typeBlade = $("#typeBlade_userForm").val();
		if(typeBlade == 9){//自定义
			$("#typeCustomBlade_userForm").show();
		}else{
			$("#typeCustomBlade_userForm").val('');
			$("#typeCustomBlade_userForm").hide();
		}
	}
	
	
	//保存
	function save(){
		
		$("#array_PictureXidaoHolder_userForm").val($("#array_PictureXidaoHolder").val());//刀具图片
		$("#array_PictureDetailXidaoHolder_userForm").val($("#array_PictureDetailXidaoHolder").val());//详细图片
		$("#array_InformDetailXidaoHolder_userForm").val($("#array_InformDetailXidaoHolder").val());//应用实例
		$("#array_InformDetailXidaoHolder_name_userForm").val($("#array_InformDetailXidaoHolder_Name").val());//应用实例
		
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
		window.location.href='<%=path%>/xidaoHolder/queryXidaoHolderList';
	}
	
	
	//保存刀柄图片
	function onSavePictureXidaoHolderList(){
	    $("#id_XidaoHolder_PictureXidaoHolderForm").val($("#id_XidaoHolder_userForm").val());
	    $("#numberXidaoHolder_PictureXidaoHolderForm").val($("#numberXidaoHolder_userForm").val());
	    $("#nameXidaoHolder_PictureXidaoHolderForm").val($("#nameXidaoHolder_userForm").val());
	    $("#typeXidaoHolder_PictureXidaoHolderForm").val($("#typeXidaoHolder_userForm").val());
	    $("#typeCustomXidaoHolder_PictureXidaoHolderForm").val($("#typeCustomXidaoHolder_userForm").val());
	    $("#isoBladeXidao_PictureXidaoHolderForm").val($("#kw").val());
	    $("#typeBlade_PictureXidaoHolderForm").val($("#typeBlade_userForm").val());
	    $("#typeCustomBlade_PictureXidaoHolderForm").val($("#typeCustomBlade_userForm").val());
	    $("#diameterXidaoHolder_PictureXidaoHolderForm").val($("#diameterXidaoHolder_userForm").val());
	    $("#companyXidaoHolder_PictureXidaoHolderForm").val($("#companyXidaoHolder_userForm").val());
	    $("#featureXidaoHolder_PictureXidaoHolderForm").val($("#featureXidaoHolder_userForm").val());
		$("#pictureXidaoHolderForm").submit();
	}
	
	//删除刀具图片
	function onDelPictureXidaoHolderImg(url_pictureXidaoHolder){
		var array_PictureXidaoHolder = $("#array_PictureXidaoHolder").val();
		array_PictureXidaoHolder = array_PictureXidaoHolder.replace(url_pictureXidaoHolder,'');
		$("#array_PictureXidaoHolder").val(array_PictureXidaoHolder);
		var img_array = $("img[name='pictureXidaoHolders_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_pictureXidaoHolder){
				$(img_array[i]).parent().remove();
			}
		}
	}
	
	
	
	
	
	//保存详细图片
	function onSavePictureDetailXidaoHolderList(){
		$("#id_XidaoHolder_PictureXidaoHolderForm").val($("#id_XidaoHolder_userForm").val());
	    $("#numberXidaoHolder_PictureXidaoHolderForm").val($("#numberXidaoHolder_userForm").val());
	    $("#nameXidaoHolder_PictureXidaoHolderForm").val($("#nameXidaoHolder_userForm").val());
	    $("#typeXidaoHolder_PictureXidaoHolderForm").val($("#typeXidaoHolder_userForm").val());
	    $("#typeCustomXidaoHolder_PictureXidaoHolderForm").val($("#typeCustomXidaoHolder_userForm").val());
	    $("#isoBladeXidao_PictureXidaoHolderForm").val($("#kw").val());
	    $("#typeBlade_PictureXidaoHolderForm").val($("#typeBlade_userForm").val());
	    $("#typeCustomBlade_PictureXidaoHolderForm").val($("#typeCustomBlade_userForm").val());
	    $("#diameterXidaoHolder_PictureXidaoHolderForm").val($("#diameterXidaoHolder_userForm").val());
	    $("#companyXidaoHolder_PictureXidaoHolderForm").val($("#companyXidaoHolder_userForm").val());
	    $("#featureXidaoHolder_PictureXidaoHolderForm").val($("#featureXidaoHolder_userForm").val());
		$("#pictureDetailXidaoHolderForm").submit();
	}
	
	//删除详细图片
	function onDelPictureDetailXidaoHolderImg(url_pictureDetailXidaoHolder){
		var array_PictureDetailXidaoHolder = $("#array_PictureDetailXidaoHolder").val();
		array_PictureDetailXidaoHolder = array_PictureDetailXidaoHolder.replace(url_pictureDetailXidaoHolder,'');
		$("#array_PictureDetailXidaoHolder").val(array_PictureDetailXidaoHolder);
		var img_array = $("img[name='pictureDetailXidaoHolders_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_pictureDetailXidaoHolder){
				$(img_array[i]).parent().remove();
			}
		}
	}
	
	
	
	//保存详细信息
	function onSaveInformDetailXidaoHolderList(){
		$("#id_XidaoHolder_PictureXidaoHolderForm").val($("#id_XidaoHolder_userForm").val());
	    $("#numberXidaoHolder_PictureXidaoHolderForm").val($("#numberXidaoHolder_userForm").val());
	    $("#nameXidaoHolder_PictureXidaoHolderForm").val($("#nameXidaoHolder_userForm").val());
	    $("#typeXidaoHolder_PictureXidaoHolderForm").val($("#typeXidaoHolder_userForm").val());
	    $("#typeCustomXidaoHolder_PictureXidaoHolderForm").val($("#typeCustomXidaoHolder_userForm").val());
	    $("#isoBladeXidao_PictureXidaoHolderForm").val($("#kw").val());
	    $("#typeBlade_PictureXidaoHolderForm").val($("#typeBlade_userForm").val());
	    $("#typeCustomBlade_PictureXidaoHolderForm").val($("#typeCustomBlade_userForm").val());
	    $("#diameterXidaoHolder_PictureXidaoHolderForm").val($("#diameterXidaoHolder_userForm").val());
	    $("#companyXidaoHolder_PictureXidaoHolderForm").val($("#companyXidaoHolder_userForm").val());
	    $("#featureXidaoHolder_PictureXidaoHolderForm").val($("#featureXidaoHolder_userForm").val());	    
		$("#informDetailXidaoHolderForm").submit();
	}
	
	//删除详细信息
	function onDelInformDetailXidaoHolderImg(url_informDetailXidaoHolder){
		var array_InformDetailXidaoHolder = $("#array_InformDetailXidaoHolder").val();
		array_InformDetailXidaoHolder = array_InformDetailXidaoHolder.replace(url_informDetailXidaoHolder,'');
		$("#array_InformDetailXidaoHolder").val(array_InformDetailXidaoHolder);
		var img_array = $("span[name='informDetailXidaoHolders_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_informDetailXidaoHolder){
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
    <form action="/xidaoHolder/saveXidaoHolder" name="userForm" id="userForm" method="post">
	  <input type="hidden" id="array_PictureXidaoHolder_userForm" name="array_PictureXidaoHolder"/>
  	  <input type="hidden" id="array_PictureDetailXidaoHolder_userForm" name="array_PictureDetailXidaoHolder"/>
  	  <input type="hidden" id="array_InformDetailXidaoHolder_userForm" name="array_InformDetailXidaoHolder"/>
  	  <input type="hidden" id="array_InformDetailXidaoHolder_name_userForm" name="array_InformDetailXidaoHolder_Name"/>
  	    
	  <input type="hidden" name="id_XidaoHolder" id="id_XidaoHolder_userForm" value="${(xidaoHolder.id_XidaoHolder == null || xidaoHolder.id_XidaoHolder == '') ? 0 : xidaoHolder.id_XidaoHolder}"/>
	  <li>
	    <span id="lititle">刀柄编号</span>
	    <input name="numberXidaoHolder" id="numberXidaoHolder_userForm" type="text" value="${xidaoHolder.numberXidaoHolder}" class="input" maxlength="10"/>
	  </li>		
	  <li>
	    <span id="lititle">刀柄名称</span>
	    <input name="nameXidaoHolder" id="nameXidaoHolder_userForm" type="text" value="${xidaoHolder.nameXidaoHolder}" class="input" maxlength="50"/>
	  </li>
	  <li>
	    <span id="lititle">加工类别</span>
	    <!-- (1 外圆车削 2 内圆车削 3 重型车削 4 断续车削 5 切槽 9 自定义) -->
	    <select name="typeXidaoHolder" id="typeXidaoHolder_userForm" class="select" onChange="onShowtypeXidaoHolderCustom();" style="width : 100px;">
		  <option value="1" ${xidaoHolder.typeXidaoHolder == 1 ? 'selected' : '' }>外圆车削</option>
		  <option value="2" ${xidaoHolder.typeXidaoHolder == 2 ? 'selected' : '' }>内圆车削</option>
		  <option value="3" ${xidaoHolder.typeXidaoHolder == 3 ? 'selected' : '' }>重型车削</option>
		  <option value="4" ${xidaoHolder.typeXidaoHolder == 4 ? 'selected' : '' }>断续车削</option>
		  <option value="5" ${xidaoHolder.typeXidaoHolder == 5 ? 'selected' : '' }>切槽</option>
		  <option value="9" ${xidaoHolder.typeXidaoHolder == 9 ? 'selected' : '' }>自定义</option>
	    </select>
	    <c:choose>
	      <c:when test="${xidaoHolder.typeBlade == 9}">
	    	<input name="typeCustomXidaoHolder" id="typeCustomXidaoHolder_userForm" type="text" value="${xidaoHolder.typeCustomXidaoHolder}" class="input" style="width : 80px;" maxlength="200"/>
	      </c:when>
	      <c:otherwise>
	        <input name="typeCustomXidaoHolder" id="typeCustomXidaoHolder_userForm" type="text" value="${xidaoHolder.typeCustomXidaoHolder}" class="input" style="display: none; width : 80px;" maxlength="200"/>
	      </c:otherwise>
	    </c:choose>
	  </li>
	  <li class="append_wrap">
	    <span id="lititle">ISO基准刀片</span>
	    <div class="first">
	      <input name="isoBladeXidao" id="kw" onKeyup="getContent(this);" class="input" value="${xidaoHolder.isoBladeXidao}" maxlength="250"/>
	    </div>
        <div id="append"></div>
	  </li>
	  <li>
	    <span id="lititle">刀片类别</span>
	    <!-- (1 正前角刀片 2 负前角刀片 3 陶瓷刀片 4 PCBN刀片 9 自定义) -->
	    <select name="typeBlade" id="typeBlade_userForm" onChange="onShowtypeBladeCustom();" class="select" style="width : 100px;">
		  <option value="1" ${xidaoHolder.typeBlade == 1 ? 'selected' : '' }>正前角刀片</option>
		  <option value="2" ${xidaoHolder.typeBlade == 2 ? 'selected' : '' }>负前角刀片</option>
		  <option value="3" ${xidaoHolder.typeBlade == 3 ? 'selected' : '' }>陶瓷刀片</option>
		  <option value="4" ${xidaoHolder.typeBlade == 4 ? 'selected' : '' }>PCBN刀片</option>
		  <option value="9" ${xidaoHolder.typeBlade == 9 ? 'selected' : '' }>自定义</option>
	    </select>
	    <c:choose>
	      <c:when test="${xidaoHolder.typeBlade == 9}">
	        <input name="typeCustomBlade" id="typeCustomBlade_userForm" type="text" value="${xidaoHolder.typeCustomBlade}" class="input" style="width : 80px;" maxlength="200"/>
	      </c:when>
	      <c:otherwise>
		    <input name="typeCustomBlade" id="typeCustomBlade_userForm" type="text" value="${xidaoHolder.typeCustomBlade}" class="input" style="display: none; width : 80px;" maxlength="200"/>
	      </c:otherwise>
	    </c:choose>
	  </li>
	  <li>
	    <span id="lititle">主偏角</span>
	    <input name="diameterXidaoHolder" id="diameterXidaoHolder_userForm" type="text" value="${xidaoHolder.diameterXidaoHolder}" class="input" maxlength="250"/>
	  </li>
	  <li>
	    <span id="lititle">生产厂家</span>
	    <input name="companyXidaoHolder" id="companyXidaoHolder_userForm" type="text" value="${xidaoHolder.companyXidaoHolder}" class="input" maxlength="100"/>
	  </li>
	  <li class="block">
	    <span id="lititle">加工特性简述</span>
	    <textarea name="featureXidaoHolder" id="featureXidaoHolder_userForm" cols="" rows="" class="textarea" maxlength="2000">${xidaoHolder.featureXidaoHolder}</textarea>
	  </li>
	</form>
	<!-- 刀柄图片 begin  -->
  	<form action="/xidaoHolder/savePictureXidaoHolder" name="pictureXidaoHolderForm" id="pictureXidaoHolderForm" method="post" enctype="multipart/form-data">
  	
  	  <input name="id_XidaoHolder" type="hidden" value="${(xidaoHolder.id_XidaoHolder == null || xidaoHolder.id_XidaoHolder == '') ? 0 : xidaoHolder.id_XidaoHolder}"/>
      <input type="hidden" id="numberXidaoHolder_PictureXidaoHolderForm" value="${xidaoHolder.numberXidaoHolder }" class="input" name="numberXidaoHolder"/>
      <input type="hidden" id="nameXidaoHolder_PictureXidaoHolderForm" value="${xidaoHolder.nameXidaoHolder }" class="input" name="nameXidaoHolder"/>
      <input type="hidden" id="typeXidaoHolder_PictureXidaoHolderForm" value="${xidaoHolder.typeXidaoHolder }" class="input" name="typeXidaoHolder"/>
      <input type="hidden" id="typeCustomXidaoHolder_PictureXidaoHolderForm" value="${xidaoHolder.typeCustomXidaoHolder }" class="input" name="typeCustomXidaoHolder"/>
      <input type="hidden" id="isoBladeXidao_PictureXidaoHolderForm" value="${xidaoHolder.isoBladeXidao }" class="input" name="isoBladeXidao"/>
      <input type="hidden" id="typeBlade_PictureXidaoHolderForm" value="${xidaoHolder.typeBlade }" class="input" name="typeBlade"/>
      <input type="hidden" id="typeCustomBlade_PictureXidaoHolderForm" value="${xidaoHolder.typeCustomBlade }" class="input" name="typeCustomBlade"/>
      <input type="hidden" id="diameterXidaoHolder_PictureXidaoHolderForm" value="${xidaoHolder.diameterXidaoHolder }" class="input" name="diameterXidaoHolder"/>
      <input type="hidden" id="companyXidaoHolder_PictureXidaoHolderForm" value="${xidaoHolder.companyXidaoHolder }" class="input" name="companyXidaoHolder"/>
      <input type="hidden" id="featureXidaoHolder_PictureXidaoHolderForm" value="${xidaoHolder.featureXidaoHolder }" class="input" name="featureXidaoHolder"/>
  	
  	<!-- 问题代码 -->
  	  <li class="block bor_t">
    	<span id="lititle">刀柄图片</span>
    	<input type="hidden" value="${array_PictureXidaoHolder == null ? '' : array_PictureXidaoHolder }" id="array_PictureXidaoHolder" name="array_PictureXidaoHolder"/>
    	<input type="hidden" value="${array_PictureDetailXidaoHolder == null ? '' : array_PictureDetailXidaoHolder }"  name="array_PictureDetailXidaoHolder"/>
    	<input type="hidden" value="${array_InformDetailXidaoHolder == null ? '' : array_InformDetailXidaoHolder }"  name="array_InformDetailXidaoHolder"/>
    	<input type="hidden" value="${array_InformDetailXidaoHolder_Name == null ? '' : array_InformDetailXidaoHolder_Name }"  name="array_InformDetailXidaoHolder_Name"/>
    	<input type="file" accept="image/*" name="PictureXidaoHolder" id="PictureXidaoHolder" />
    	<input type="button" value="加载图片" class="btn" onclick="onSavePictureXidaoHolderList();"/>
    	<span id="span_PictureXidaoHolderList">
      	  <c:forEach items="${xidaoHolder.pictureXidaoHolderList}" var="var" varStatus="vs">
      		<div>
      		  <img name='pictureXidaoHolders_img' width='100px' height='100px' src='<%=path%>/goods${var.url_PictureXidaoHolder }' />
      		  <a class="btn btn_shanchu" onclick='onDelPictureXidaoHolderImg("${var.url_PictureXidaoHolder }");'>删除</a>
      		  <br/>
      		</div>
      	  </c:forEach>
    	</span>
  	  </li>
  	</form>
	<!-- 刀柄图片 end  -->

	<!-- 详细图片 begin  -->
	<form action="/xidaoHolder/savePictureDetailXidaoHolder" name="pictureDetailXidaoHolderForm" id="pictureDetailXidaoHolderForm" method="post" enctype="multipart/form-data">
  	  <input name="id_XidaoHolder" type="hidden" value="${(xidaoHolder.id_XidaoHolder == null || xidaoHolder.id_XidaoHolder == '') ? 0 : xidaoHolder.id_XidaoHolder}"/>
      <input type="hidden" id="numberXidaoHolder_pictureDetailXidaoHolderForm" value="${xidaoHolder.numberXidaoHolder }" class="input" name="numberXidaoHolder"/>
      <input type="hidden" id="nameXidaoHolder_pictureDetailXidaoHolderForm" value="${xidaoHolder.nameXidaoHolder }" class="input" name="nameXidaoHolder"/>
      <input type="hidden" id="typeXidaoHolder_pictureDetailXidaoHolderForm" value="${xidaoHolder.typeXidaoHolder }" class="input" name="typeXidaoHolder"/>
      <input type="hidden" id="typeCustomXidaoHolder_pictureDetailXidaoHolderForm" value="${xidaoHolder.typeCustomXidaoHolder }" class="input" name="typeCustomXidaoHolder"/>
      <input type="hidden" id="isoBladeXidao_pictureDetailXidaoHolderForm" value="${xidaoHolder.isoBladeXidao }" class="input" name="isoBladeXidao"/>
      <input type="hidden" id="typeBlade_pictureDetailXidaoHolderForm" value="${xidaoHolder.typeBlade }" class="input" name="typeBlade"/>
      <input type="hidden" id="typeCustomBlade_pictureDetailXidaoHolderForm" value="${xidaoHolder.typeCustomBlade }" class="input" name="typeCustomBlade"/>
      <input type="hidden" id="diameterXidaoHolder_pictureDetailXidaoHolderForm" value="${xidaoHolder.diameterXidaoHolder }" class="input" name="diameterXidaoHolder"/>
      <input type="hidden" id="companyXidaoHolder_pictureDetailXidaoHolderForm" value="${xidaoHolder.companyXidaoHolder }" class="input" name="companyXidaoHolder"/>
      <input type="hidden" id="featureXidaoHolder_pictureDetailXidaoHolderForm" value="${xidaoHolder.featureXidaoHolder }" class="input" name="featureXidaoHolder"/>
  	
	  <li class="block bor_t">
	    <span id="lititle">详细图片</span>
	    <input type="hidden" value="${array_PictureXidaoHolder == null ? '' : array_PictureXidaoHolder }"  name="array_PictureXidaoHolder"/>
    	<input type="hidden" value="${array_PictureDetailXidaoHolder == null ? '' : array_PictureDetailXidaoHolder }" id="array_PictureDetailXidaoHolder" name="array_PictureDetailXidaoHolder"/>
    	<input type="hidden" value="${array_InformDetailXidaoHolder == null ? '' : array_InformDetailXidaoHolder }"  name="array_InformDetailXidaoHolder"/>
    	<input type="hidden" value="${array_InformDetailXidaoHolder_Name == null ? '' : array_InformDetailXidaoHolder_Name }"  name="array_InformDetailXidaoHolder_Name"/>
    	<input type="file" accept="image/*" name="PictureDetailXidaoHolder" id="PictureDetailXidaoHolder" />
	    <input type="button" value="加载图片" class="btn" onclick="onSavePictureDetailXidaoHolderList();"/>
	    <span id="span_PictureDetailXidaoHolderList">
      	  <c:forEach items="${xidaoHolder.pictureDetailXidaoHolderList}" var="var" varStatus="vs">
      		<div>
      		  <img name='pictureDetailXidaoHolders_img' width='100px' height='100px' src='<%=path%>/goods${var.url_PictureDetailXidaoHolder }' />
      		  <a class="btn btn_shanchu" onclick='onDelPictureDetailXidaoHolderImg("${var.url_PictureDetailXidaoHolder }");'>删除</a>
      		  <br/>
      		</div>
      	  </c:forEach>
    	</span>
	  </li>
	</form>
	<!-- 详细图片 end  -->

	<!-- 详细信息 begin  -->
	<form action="/xidaoHolder/saveInformDetailXidaoHolder" name="informDetailXidaoHolderForm" id="informDetailXidaoHolderForm" method="post" enctype="multipart/form-data">
 	  <input name="id_XidaoHolder" type="hidden" value="${(xidaoHolder.id_XidaoHolder == null || xidaoHolder.id_XidaoHolder == '') ? 0 : xidaoHolder.id_XidaoHolder}"/>
      <input type="hidden" id="numberXidaoHolder_InformDetailXidaoHolderForm" value="${xidaoHolder.numberXidaoHolder }" class="input" name="numberXidaoHolder"/>
      <input type="hidden" id="nameXidaoHolder_InformDetailXidaoHolderForm" value="${xidaoHolder.nameXidaoHolder }" class="input" name="nameXidaoHolder"/>
      <input type="hidden" id="typeXidaoHolder_InformDetailXidaoHolderForm" value="${xidaoHolder.typeXidaoHolder }" class="input" name="typeXidaoHolder"/>
      <input type="hidden" id="typeCustomXidaoHolder_InformDetailXidaoHolderForm" value="${xidaoHolder.typeCustomXidaoHolder }" class="input" name="typeCustomXidaoHolder"/>
      <input type="hidden" id="isoBladeXidao_InformDetailXidaoHolderForm" value="${xidaoHolder.isoBladeXidao }" class="input" name="isoBladeXidao"/>
      <input type="hidden" id="typeBlade_InformDetailXidaoHolderForm" value="${xidaoHolder.typeBlade }" class="input" name="typeBlade"/>
      <input type="hidden" id="typeCustomBlade_InformDetailXidaoHolderForm" value="${xidaoHolder.typeCustomBlade }" class="input" name="typeCustomBlade"/>
      <input type="hidden" id="diameterXidaoHolder_InformDetailXidaoHolderForm" value="${xidaoHolder.diameterXidaoHolder }" class="input" name="diameterXidaoHolder"/>
      <input type="hidden" id="companyXidaoHolder_InformDetailXidaoHolderForm" value="${xidaoHolder.companyXidaoHolder }" class="input" name="companyXidaoHolder"/>
      <input type="hidden" id="featureXidaoHolder_InformDetailXidaoHolderForm" value="${xidaoHolder.featureXidaoHolder }" class="input" name="featureXidaoHolder"/>
	  	
 	  <li class="block bor_t"> 
 	    <span id="lititle">详细信息</span>
 	    <input type="hidden" value="${array_PictureXidaoHolder == null ? '' : array_PictureXidaoHolder }"  name="array_PictureXidaoHolder"/>
    	<input type="hidden" value="${array_PictureDetailXidaoHolder == null ? '' : array_PictureDetailXidaoHolder }" name="array_PictureDetailXidaoHolder"/>
    	<input type="hidden" value="${array_InformDetailXidaoHolder == null ? '' : array_InformDetailXidaoHolder }" id="array_InformDetailXidaoHolder"  name="array_InformDetailXidaoHolder"/>
    	<input type="hidden" value="${array_InformDetailXidaoHolder_Name == null ? '' : array_InformDetailXidaoHolder_Name }" id="array_InformDetailXidaoHolder_Name"  name="array_InformDetailXidaoHolder_Name"/>
	    <input type="file" accept=".pdf" name="informDetailXidaoHolder" id="informDetailXidaoHolder" />
	    <input type="button" value="加载PDF文件" class="btn" onclick="onSaveInformDetailXidaoHolderList();"/>
	    <span id="span_InformDetailXidaoHolderList">
	      <c:forEach items="${xidaoHolder.informDetailXidaoHolderList}" var="var" varStatus="vs">
	      	<div>
	      	  <span name='informDetailXidaoHolders_img' >${var.url_InformDetailXidaoHolder }</span>
	      	  <a class="btn btn_shanchu" onclick='onDelInformDetailXidaoHolderImg("${var.url_InformDetailXidaoHolder }");'>删除</a>
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
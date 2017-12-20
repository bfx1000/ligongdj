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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="images/dt2.ico">
	<title>哈理工刀头</title>
    <meta name="description" content="哈理工刀头,专业打造各种类型机械刀头,产品类型齐全,质量放心有保障,联合祈福科技公司打造专业的刀头网站。" />
    <meta name="keywords" content="哈理工刀头,刀头,刀具,切断切槽,仿形切削,外圆切槽刀,内圆切槽刀,端面切槽。" />
	
<link href="<%=path%>/resources/css/index/style_a.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/js/jquery-1.7.2.js"></script>
<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>

<script type="text/JavaScript">
	<!--
	function MM_jumpMenu(targ,selObj,restore){ //v3.0
	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	  if (restore) selObj.selectedIndex=0;
	}
	//-->
	
	$(document).ready(function(){
		//刀具图片
		var array_PictureBladeTurning = $("#array_PictureBladeTurning").val();
		if(array_PictureBladeTurning != null && array_PictureBladeTurning != ''){
			var pictureBladeTurnings = array_PictureBladeTurning.split(',');
			var pictureBladeTurnings_str = '';
			for(var i = 0; i < pictureBladeTurnings.length; i++){
				if(pictureBladeTurnings[i] != null && pictureBladeTurnings[i] != ''){
					pictureBladeTurnings_str = pictureBladeTurnings_str + "<div><img name='pictureBladeTurnings_img' width='100px' height='100px' src='<%=path%>/goods"+pictureBladeTurnings[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureBladeTurningImg(\""+pictureBladeTurnings[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureBladeTurningList").html(pictureBladeTurnings_str);
		}
		
		//详细图片
		var array_PictureDetailBladeTurning = $("#array_PictureDetailBladeTurning").val();
		if(array_PictureDetailBladeTurning != null && array_PictureDetailBladeTurning != ''){
			var pictureDetailBladeTurnings = array_PictureDetailBladeTurning.split(',');
			var pictureDetailBladeTurnings_str = '';
			for(var i = 0; i < pictureDetailBladeTurnings.length; i++){
				if(pictureDetailBladeTurnings[i] != null && pictureDetailBladeTurnings[i] != ''){
					pictureDetailBladeTurnings_str = pictureDetailBladeTurnings_str + "<div><img name='pictureDetailBladeTurnings_img' width='100px' height='100px' src='<%=path%>/goods"+pictureDetailBladeTurnings[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureDetailBladeTurningImg(\""+pictureDetailBladeTurnings[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureDetailBladeTurningList").html(pictureDetailBladeTurnings_str);
		}
		
		
		//应用实例
		var array_ApplicationBladeTurning = $("#array_ApplicationBladeTurning").val();
		var array_ApplicationBladeTurning_name = $("#array_ApplicationBladeTurning_name").val();
		if(array_ApplicationBladeTurning != null && array_ApplicationBladeTurning != ''){
			var applicationBladeTurnings = array_ApplicationBladeTurning.split(',');
			var applicationBladeTurnings_name = array_ApplicationBladeTurning_name.split(',');
			var applicationBladeTurnings_str = '';
			for(var i = 0; i < applicationBladeTurnings.length; i++){
				if(applicationBladeTurnings[i] != null && applicationBladeTurnings[i] != ''){
					applicationBladeTurnings_str = applicationBladeTurnings_str + "<div><span name='applicationBladeTurnings_img' url='"+applicationBladeTurnings[i]+"' >"+applicationBladeTurnings_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelApplicationBladeTurningImg(\""+applicationBladeTurnings[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ApplicationBladeTurningList").html(applicationBladeTurnings_str);
		}
		
		
		//详细信息
		var array_InformDetailBladeTurning = $("#array_InformDetailBladeTurning").val();
		var array_InformDetailBladeTurning_name = $("#array_InformDetailBladeTurning_name").val();
		if(array_InformDetailBladeTurning != null && array_InformDetailBladeTurning != ''){
			var informDetailBladeTurnings = array_InformDetailBladeTurning.split(',');
			var informDetailBladeTurnings_name = array_InformDetailBladeTurning_name.split(',');
			var informDetailBladeTurnings_str = '';
			for(var i = 0; i < informDetailBladeTurnings.length; i++){
				if(informDetailBladeTurnings[i] != null && informDetailBladeTurnings[i] != ''){
					informDetailBladeTurnings_str = informDetailBladeTurnings_str + "<div><span name='informDetailBladeTurnings_img' url='"+informDetailBladeTurnings[i]+"' >" + informDetailBladeTurnings_name[i] + "</span><a class='btn btn_shanchu' onclick='onDelInformDetailBladeTurningImg(\""+informDetailBladeTurnings[i]+"\");'>删除</a><br/></div>";
					
				}
			}
			$("#span_InformDetailBladeTurningList").html(informDetailBladeTurnings_str);
		}
		
		var isPMKNS_text = $("#isPMKNS_text").val();

		if(isPMKNS_text.indexOf('P')==-1?false:true){//包含
			$("#div_ISOPTextBladeTurning").show();
		}
		if(isPMKNS_text.indexOf('M')==-1?false:true){//包含
			$("#div_ISOMTextBladeTurning").show();
		}
		if(isPMKNS_text.indexOf('K')==-1?false:true){//包含
			$("#div_ISOKTextBladeTurning").show();
		}
		if(isPMKNS_text.indexOf('N')==-1?false:true){//包含
			$("#div_ISONTextBladeTurning").show();
		}
		if(isPMKNS_text.indexOf('S')==-1?false:true){//包含
			$("#div_ISOSTextBladeTurning").show();
		}
		
	});
	
	
	//保存
	function save(){
		
		$("#isPMKNS_userForm").val($("#isPMKNS_text").val());
	
		$("#ISOPTextBladeTurning_userForm").val($("#ISOPTextBladeTurning").val());
		$("#ISOMTextBladeTurning_userForm").val($("#ISOMTextBladeTurning").val());
		$("#ISOKTextBladeTurning_userForm").val($("#ISOKTextBladeTurning").val());
		$("#ISONTextBladeTurning_userForm").val($("#ISONTextBladeTurning").val());
		$("#ISOSTextBladeTurning_userForm").val($("#ISOSTextBladeTurning").val());
		
		$("#array_PictureBladeTurning_userForm").val($("#array_PictureBladeTurning").val());//刀具图片
		$("#array_PictureDetailBladeTurning_userForm").val($("#array_PictureDetailBladeTurning").val());//详细图片
		$("#array_ApplicationBladeTurning_userForm").val($("#array_ApplicationBladeTurning").val());//应用实例
		$("#array_ApplicationBladeTurning_name_userForm").val($("#array_ApplicationBladeTurning_name").val());//应用实例
		$("#array_InformDetailBladeTurning_userForm").val($("#array_InformDetailBladeTurning").val());//详细信息
		$("#array_InformDetailBladeTurning_name_userForm").val($("#array_InformDetailBladeTurning_name").val());//详细信息
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
		window.location.href='<%=path%>/turningBlade/queryTurningBladeList';
	}
	
	//保存刀具图片
	function onSavePictureBladeTurningList(){
		$("#isPMKNS_pictureBladeTurningForm").val($("#isPMKNS_text").val());
		$("#ISOPTextBladeTurning_pictureBladeTurningForm").val($("#ISOPTextBladeTurning").val());
		$("#ISOMTextBladeTurning_pictureBladeTurningForm").val($("#ISOMTextBladeTurning").val());
		$("#ISOKTextBladeTurning_pictureBladeTurningForm").val($("#ISOKTextBladeTurning").val());
		$("#ISONTextBladeTurning_pictureBladeTurningForm").val($("#ISONTextBladeTurning").val());
		$("#ISOSTextBladeTurning_pictureBladeTurningForm").val($("#ISOSTextBladeTurning").val());
	
		$("#id_TurningBlade_pictureBladeTurningForm").val($("#id_TurningBlade_userForm").val());
		$("#NumberTurningBlade_pictureBladeTurningForm").val($("#NumberTurningBlade_userForm").val());
		$("#TypeBTADrill_pictureBladeTurningForm").val($("#TypeBTADrill_userForm").val());
		$("#NameTurningBlade_pictureBladeTurningForm").val($("#NameTurningBlade_userForm").val());
		$("#ISOBladeTurning_pictureBladeTurningForm").val($("#ISOBladeTurning_userForm").val());
		$("#ToolCoatBladeTurning_pictureBladeTurningForm").val($("#ToolCoatBladeTurning_userForm").val());
		$("#ToolMaterialBladeTurning_pictureBladeTurningForm").val($("#ToolMaterialBladeTurning_userForm").val());
		$("#MachiningTypeBladeTurning_pictureBladeTurningForm").val($("#MachiningTypeBladeTurning_userForm").val());
		$("#ToolBladeFeatureTurning_pictureBladeTurningForm").val($("#ToolBladeFeatureTurning_userForm").val());
		$("#CompanyTurningBlade_pictureBladeTurningForm").val($("#CompanyTurningBlade_userForm").val());
		$("#QianjiaoBladeTurning_pictureBladeTurningForm").val($("#QianjiaoBladeTurning_userForm").val());
		$("#HoujiaoBladeTurning_pictureBladeTurningForm").val($("#HoujiaoBladeTurning_userForm").val());
		$("#HoujisojiaoBladeTurning_pictureBladeTurningForm").val($("#HoujisojiaoBladeTurning_userForm").val());
		$("#NoseRadiusTurning_pictureBladeTurningForm").val($("#NoseRadiusTurning_userForm").val());
		$("#BreakerBladeTurning_pictureBladeTurningForm").val($("#BreakerBladeTurning_userForm").val());
		$("#MateriaBladeTurning_pictureBladeTurningForm").val($("#MateriaBladeTurning_userForm").val());
	    
		$("#pictureBladeTurningForm").submit();
	}
	
	//删除刀具图片
	function onDelPictureBladeTurningImg(url_pictureBladeTurning){
		var array_PictureBladeTurning = $("#array_PictureBladeTurning").val();
		array_PictureBladeTurning = array_PictureBladeTurning.replace(url_pictureBladeTurning,'');
		$("#array_PictureBladeTurning").val(array_PictureBladeTurning);
		var img_array = $("img[name='pictureBladeTurnings_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_pictureBladeTurning){
				$(img_array[i]).parent().remove();
			}
		}
	}
	
	//保存详细图片
	function onSavePictureDetailBladeTurningList(){
		$("#isPMKNS_pictureDetailBladeTurningForm").val($("#isPMKNS_text").val());
		$("#ISOPTextBladeTurning_pictureDetailBladeTurningForm").val($("#ISOPTextBladeTurning").val());
		$("#ISOMTextBladeTurning_pictureDetailBladeTurningForm").val($("#ISOMTextBladeTurning").val());
		$("#ISOKTextBladeTurning_pictureDetailBladeTurningForm").val($("#ISOKTextBladeTurning").val());
		$("#ISONTextBladeTurning_pictureDetailBladeTurningForm").val($("#ISONTextBladeTurning").val());
		$("#ISOSTextBladeTurning_pictureDetailBladeTurningForm").val($("#ISOSTextBladeTurning").val());
	
		$("#id_TurningBlade_pictureDetailBladeTurningForm").val($("#id_TurningBlade_userForm").val());
		$("#NumberTurningBlade_pictureDetailBladeTurningForm").val($("#NumberTurningBlade_userForm").val());
		$("#TypeBTADrill_pictureDetailBladeTurningForm").val($("#TypeBTADrill_userForm").val());
		$("#NameTurningBlade_pictureDetailBladeTurningForm").val($("#NameTurningBlade_userForm").val());
		$("#ISOBladeTurning_pictureDetailBladeTurningForm").val($("#ISOBladeTurning_userForm").val());
		$("#ToolCoatBladeTurning_pictureDetailBladeTurningForm").val($("#ToolCoatBladeTurning_userForm").val());
		$("#ToolMaterialBladeTurning_pictureDetailBladeTurningForm").val($("#ToolMaterialBladeTurning_userForm").val());
		$("#MachiningTypeBladeTurning_pictureDetailBladeTurningForm").val($("#MachiningTypeBladeTurning_userForm").val());
		$("#ToolBladeFeatureTurning_pictureDetailBladeTurningForm").val($("#ToolBladeFeatureTurning_userForm").val());
		$("#CompanyTurningBlade_pictureDetailBladeTurningForm").val($("#CompanyTurningBlade_userForm").val());
		$("#QianjiaoBladeTurning_pictureDetailBladeTurningForm").val($("#QianjiaoBladeTurning_userForm").val());
		$("#HoujiaoBladeTurning_pictureDetailBladeTurningForm").val($("#HoujiaoBladeTurning_userForm").val());
		$("#HoujisojiaoBladeTurning_pictureDetailBladeTurningForm").val($("#HoujisojiaoBladeTurning_userForm").val());
		$("#NoseRadiusTurning_pictureDetailBladeTurningForm").val($("#NoseRadiusTurning_userForm").val());
		$("#BreakerBladeTurning_pictureDetailBladeTurningForm").val($("#BreakerBladeTurning_userForm").val());
		$("#MateriaBladeTurning_pictureDetailBladeTurningForm").val($("#MateriaBladeTurning_userForm").val());
	    
		$("#pictureDetailBladeTurningForm").submit();
	}
	
	//删除详细图片
	function onDelPictureDetailBladeTurningImg(url_pictureDetailBladeTurning){
		var array_PictureDetailBladeTurning = $("#array_PictureDetailBladeTurning").val();
		array_PictureDetailBladeTurning = array_PictureDetailBladeTurning.replace(url_pictureDetailBladeTurning,'');
		$("#array_PictureDetailBladeTurning").val(array_PictureDetailBladeTurning);
		var img_array = $("img[name='pictureDetailBladeTurnings_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_pictureDetailBladeTurning){
				$(img_array[i]).parent().remove();
			}
		}
	}
	
	//保存应用实例
	function onSaveApplicationBladeTurningList(){
		$("#isPMKNS_applicationBladeTurningForm").val($("#isPMKNS_text").val());
		$("#ISOPTextBladeTurning_applicationBladeTurningForm").val($("#ISOPTextBladeTurning").val());
		$("#ISOMTextBladeTurning_applicationBladeTurningForm").val($("#ISOMTextBladeTurning").val());
		$("#ISOKTextBladeTurning_applicationBladeTurningForm").val($("#ISOKTextBladeTurning").val());
		$("#ISONTextBladeTurning_applicationBladeTurningForm").val($("#ISONTextBladeTurning").val());
		$("#ISOSTextBladeTurning_applicationBladeTurningForm").val($("#ISOSTextBladeTurning").val());
	
		$("#id_TurningBlade_applicationBladeTurningForm").val($("#id_TurningBlade_userForm").val());
		$("#NumberTurningBlade_applicationBladeTurningForm").val($("#NumberTurningBlade_userForm").val());
		$("#TypeBTADrill_applicationBladeTurningForm").val($("#TypeBTADrill_userForm").val());
		$("#NameTurningBlade_applicationBladeTurningForm").val($("#NameTurningBlade_userForm").val());
		$("#ISOBladeTurning_applicationBladeTurningForm").val($("#ISOBladeTurning_userForm").val());
		$("#ToolCoatBladeTurning_applicationBladeTurningForm").val($("#ToolCoatBladeTurning_userForm").val());
		$("#ToolMaterialBladeTurning_applicationBladeTurningForm").val($("#ToolMaterialBladeTurning_userForm").val());
		$("#MachiningTypeBladeTurning_applicationBladeTurningForm").val($("#MachiningTypeBladeTurning_userForm").val());
		$("#ToolBladeFeatureTurning_applicationBladeTurningForm").val($("#ToolBladeFeatureTurning_userForm").val());
		$("#CompanyTurningBlade_applicationBladeTurningForm").val($("#CompanyTurningBlade_userForm").val());
		$("#QianjiaoBladeTurning_applicationBladeTurningForm").val($("#QianjiaoBladeTurning_userForm").val());
		$("#HoujiaoBladeTurning_applicationBladeTurningForm").val($("#HoujiaoBladeTurning_userForm").val());
		$("#HoujisojiaoBladeTurning_applicationBladeTurningForm").val($("#HoujisojiaoBladeTurning_userForm").val());
		$("#NoseRadiusTurning_applicationBladeTurningForm").val($("#NoseRadiusTurning_userForm").val());
		$("#BreakerBladeTurning_applicationBladeTurningForm").val($("#BreakerBladeTurning_userForm").val());
		$("#MateriaBladeTurning_applicationBladeTurningForm").val($("#MateriaBladeTurning_userForm").val());
	    
		$("#applicationBladeTurningForm").submit();
	}
	
	//删除应用实例
	function onDelApplicationBladeTurningImg(url_applicationBladeTurning){
	
		var array_ApplicationBladeTurning = $("#array_ApplicationBladeTurning").val();
		array_ApplicationBladeTurning = array_ApplicationBladeTurning.replace(url_applicationBladeTurning,'');
		$("#array_ApplicationBladeTurning").val(array_ApplicationBladeTurning);
		var img_array = $("span[name='applicationBladeTurnings_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_applicationBladeTurning){
				$(img_array[i]).parent().remove();
			}
		}
	}
	
	//保存详细信息
	function onSaveInformDetailBladeTurningList(){
		$("#isPMKNS_informDetailBladeTurningForm").val($("#isPMKNS_text").val());
		$("#ISOPTextBladeTurning_informDetailBladeTurningForm").val($("#ISOPTextBladeTurning").val());
		$("#ISOMTextBladeTurning_informDetailBladeTurningForm").val($("#ISOMTextBladeTurning").val());
		$("#ISOKTextBladeTurning_informDetailBladeTurningForm").val($("#ISOKTextBladeTurning").val());
		$("#ISONTextBladeTurning_informDetailBladeTurningForm").val($("#ISONTextBladeTurning").val());
		$("#ISOSTextBladeTurning_informDetailBladeTurningForm").val($("#ISOSTextBladeTurning").val());
	
		$("#id_TurningBlade_informDetailBladeTurningForm").val($("#id_TurningBlade_userForm").val());
		$("#NumberTurningBlade_informDetailBladeTurningForm").val($("#NumberTurningBlade_userForm").val());
		$("#TypeBTADrill_informDetailBladeTurningForm").val($("#TypeBTADrill_userForm").val());
		$("#NameTurningBlade_informDetailBladeTurningForm").val($("#NameTurningBlade_userForm").val());
		$("#ISOBladeTurning_informDetailBladeTurningForm").val($("#ISOBladeTurning_userForm").val());
		$("#ToolCoatBladeTurning_informDetailBladeTurningForm").val($("#ToolCoatBladeTurning_userForm").val());
		$("#ToolMaterialBladeTurning_informDetailBladeTurningForm").val($("#ToolMaterialBladeTurning_userForm").val());
		$("#MachiningTypeBladeTurning_informDetailBladeTurningForm").val($("#MachiningTypeBladeTurning_userForm").val());
		$("#ToolBladeFeatureTurning_informDetailBladeTurningForm").val($("#ToolBladeFeatureTurning_userForm").val());
		$("#CompanyTurningBlade_informDetailBladeTurningForm").val($("#CompanyTurningBlade_userForm").val());
		$("#QianjiaoBladeTurning_informDetailBladeTurningForm").val($("#QianjiaoBladeTurning_userForm").val());
		$("#HoujiaoBladeTurning_informDetailBladeTurningForm").val($("#HoujiaoBladeTurning_userForm").val());
		$("#HoujisojiaoBladeTurning_informDetailBladeTurningForm").val($("#HoujisojiaoBladeTurning_userForm").val());
		$("#NoseRadiusTurning_informDetailBladeTurningForm").val($("#NoseRadiusTurning_userForm").val());
		$("#BreakerBladeTurning_informDetailBladeTurningForm").val($("#BreakerBladeTurning_userForm").val());
		$("#MateriaBladeTurning_informDetailBladeTurningForm").val($("#MateriaBladeTurning_userForm").val());
	    
		$("#informDetailBladeTurningForm").submit();
	}
	
	//删除详细信息
	function onDelInformDetailBladeTurningImg(url_informDetailBladeTurning){
		var array_InformDetailBladeTurning = $("#array_InformDetailBladeTurning").val();
		array_InformDetailBladeTurning = array_InformDetailBladeTurning.replace(url_informDetailBladeTurning,'');
		$("#array_InformDetailBladeTurning").val(array_InformDetailBladeTurning);
		var img_array = $("span[name='informDetailBladeTurnings_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_informDetailBladeTurning){
				$(img_array[i]).parent().remove();
			}
		}
	}
	

	//增加ISO材料加工信息
	function addPMKNS(){
		var isPMKNS = $("#isPMKNS").val();	
		$("#div_ISO" + isPMKNS + "TextBladeTurning").show();
		var isPMKNS_text = $("#isPMKNS_text").val();
		var iscontaintest = isPMKNS_text.indexOf(isPMKNS)==-1?false:true;

		if(!iscontaintest){//包含
			if(isPMKNS_text != null && isPMKNS_text != ''){
				$("#isPMKNS_text").val($("#isPMKNS_text").val() + "," + isPMKNS);
			}else{
				$("#isPMKNS_text").val(isPMKNS);
			}
		}
	}
	function delPMKNS(val){
		var isPMKNS_text = $("#isPMKNS_text").val();
		isPMKNS_text = isPMKNS_text.replace(val,'');
		$("#isPMKNS_text").val(isPMKNS_text);
		$("#div_ISO" + val + "TextBladeTurning").hide();
	}
</script>
</head>
<body style="background:#fff;">
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text">
	<form action="/turningBlade/saveTurningBlade" name="userForm" id="userForm" method="post">
	  <input type="hidden" id="array_PictureBladeTurning_userForm" name="array_PictureBladeTurning"/>
      <input type="hidden" id="array_PictureDetailBladeTurning_userForm" name="array_PictureDetailBladeTurning"/>
      <input type="hidden" id="array_ApplicationBladeTurning_userForm" name="array_ApplicationBladeTurning"/>
      <input type="hidden" id="array_ApplicationBladeTurning_name_userForm" name="array_ApplicationBladeTurning_name"/>
      <input type="hidden" id="array_InformDetailBladeTurning_userForm" name="array_InformDetailBladeTurning"/>
      <input type="hidden" id="array_InformDetailBladeTurning_name_userForm" name="array_InformDetailBladeTurning_name"/>
    

      <input type="hidden" id="isPMKNS_userForm" name="isPMKNS"/>
      <input type="hidden" id="ISOPTextBladeTurning_userForm" name="ISOPTextBladeTurning"/>
      <input type="hidden" id="ISOMTextBladeTurning_userForm" name="ISOMTextBladeTurning"/>
      <input type="hidden" id="ISOKTextBladeTurning_userForm" name="ISOKTextBladeTurning"/>
      <input type="hidden" id="ISONTextBladeTurning_userForm" name="ISONTextBladeTurning"/>
      <input type="hidden" id="ISOSTextBladeTurning_userForm" name="ISOSTextBladeTurning"/>
	  
	  <input type="hidden" name="id_TurningBlade" id="id_TurningBlade_userForm" value="${(turningBlade.id_TurningBlade == null || turningBlade.id_TurningBlade == '') ? 0 : turningBlade.id_TurningBlade}"/>
	  <li>
	    <span id="lititle">刀片编号</span>
	    <input name="NumberTurningBlade" id="NumberTurningBlade_userForm" type="text" value="${turningBlade.NumberTurningBlade }" class="input" maxlength="10" />
	  </li>
	  <li>
	    <span id="lititle">刀片类型</span>
	    <!-- 刀片类型(1 外圆切削 2 内孔切削 3 超硬刀具 4 重型加工刀片)  -->
		<select name="TypeBTADrill" id="TypeBTADrill_userForm" onChange="" class="select">
		  <option value="1" ${turningBlade.TypeBTADrill == 1 ? 'selected' : '' }>外圆切削</option>
		  <option value="2" ${turningBlade.TypeBTADrill == 2 ? 'selected' : '' }>内孔切削</option>
		  <option value="3" ${turningBlade.TypeBTADrill == 3 ? 'selected' : '' }>超硬刀具</option>
		  <option value="4" ${turningBlade.TypeBTADrill == 4 ? 'selected' : '' }>重型加工刀片</option>
		</select>
	  </li>
	  <li>
	    <span id="lititle">刀片名称</span>
	    <input name="NameTurningBlade" id="NameTurningBlade_userForm" type="text" value="${turningBlade.NameTurningBlade }" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">ISO基准刀片</span>
	    <input name="ISOBladeTurning" id="ISOBladeTurning_userForm" type="text" value="${turningBlade.ISOBladeTurning }" class="input" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">刀片涂层</span>
	    <input name="ToolCoatBladeTurning" id="ToolCoatBladeTurning_userForm" type="text" value="${turningBlade.ToolCoatBladeTurning }" class="input" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">刀具材料</span>
	    <input name="ToolMaterialBladeTurning" id="ToolMaterialBladeTurning_userForm" type="text" value="${turningBlade.ToolMaterialBladeTurning }" class="input" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">加工类别</span>
	    <!-- 加工类别(1 精加工 2 粗加工 3 半精加工) -->
		<select name="MachiningTypeBladeTurning" id="MachiningTypeBladeTurning_userForm" class="select">
		  <option value="1" ${turningBlade.MachiningTypeBladeTurning == 1 ? 'selected' : '' }>精加工</option>
		  <option value="2" ${turningBlade.MachiningTypeBladeTurning == 2 ? 'selected' : '' }>粗加工</option>
		  <option value="3" ${turningBlade.MachiningTypeBladeTurning == 3 ? 'selected' : '' }>半精加工</option>
		</select>
	  </li>
	  <li>
	    <span id="lititle">刀片加工特点</span>
	    <input name="ToolBladeFeatureTurning" id="ToolBladeFeatureTurning_userForm" type="text" value="${turningBlade.ToolBladeFeatureTurning }" class="input" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">刀片厂商</span>
	    <input name="CompanyTurningBlade" id="CompanyTurningBlade_userForm" type="text" value="${turningBlade.CompanyTurningBlade }" class="input" maxlength="250"/>
	  </li>
	   <li>
	    <span id="lititle">刀柄</span>
	    <input name="HolderInfo" id="HolderInfo_userForm" type="text" value="${turningBlade.HolderInfo }" class="input" maxlength="250"/>
	  </li>
	  <li class="block">
	    <span id="lititle">刀片角度信息：</span>
	    <div class="clear"></div>
	  </li>
	  <li>
	    <span id="lititle">前角</span>
	    <input name="QianjiaoBladeTurning" id="QianjiaoBladeTurning_userForm" type="text" value="${turningBlade.QianjiaoBladeTurning }" class="input"
	    onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" maxlength="10"/>
	  </li>
	  <li>
	    <span id="lititle">后角</span>
	    <input name="HoujiaoBladeTurning" id="HoujiaoBladeTurning_userForm" type="text" value="${turningBlade.HoujiaoBladeTurning }" class="input"
	    	   onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" maxlength="10"/>
	  </li>
	  <li>
	    <span id="lititle">刃倾角</span>
	    <input name="HoujisojiaoBladeTurning" id="HoujisojiaoBladeTurning_userForm" type="text" value="${turningBlade.HoujisojiaoBladeTurning }" class="input"
	    	   onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" maxlength="10"/>
	  </li>
	  <li>
	    <span id="lititle">刀尖圆弧半径</span>
	    <input name="NoseRadiusTurning" id="NoseRadiusTurning_userForm" type="text" value="${turningBlade.NoseRadiusTurning }" class="input"
	    	   onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" maxlength="10"/>
	  </li>
	  <li>
	    <span id="lititle">断屑槽类型</span>
	    <input name="BreakerBladeTurning" id="BreakerBladeTurning_userForm" type="text" value="${turningBlade.BreakerBladeTurning }" class="input" maxlength="100"/>
	    <div class="clear"></div>
	  </li>
	  <li>
	    <span id="lititle">加工材料</span>
	    <input name="MateriaBladeTurning" id="MateriaBladeTurning_userForm" type="text" value="${turningBlade.MateriaBladeTurning }" class="input" maxlength="500"/>
	    <div class="clear"></div>
	  </li>
	</form>
	<!-- 刀具图片 begin  -->
	  	<form action="/turningBlade/savePictureBladeTurning" name="pictureBladeTurningForm" id="pictureBladeTurningForm" method="post" enctype="multipart/form-data">
	  	
	  	<input type="hidden" id="isPMKNS_pictureBladeTurningForm" name="isPMKNS"/>
  	    <input type="hidden" id="ISOPTextBladeTurning_pictureBladeTurningForm" name="ISOPTextBladeTurning"/>
  	    <input type="hidden" id="ISOMTextBladeTurning_pictureBladeTurningForm" name="ISOMTextBladeTurning"/>
  	    <input type="hidden" id="ISOKTextBladeTurning_pictureBladeTurningForm" name="ISOKTextBladeTurning"/>
  	    <input type="hidden" id="ISONTextBladeTurning_pictureBladeTurningForm" name="ISONTextBladeTurning"/>
  	    <input type="hidden" id="ISOSTextBladeTurning_pictureBladeTurningForm" name="ISOSTextBladeTurning"/>
	  	    
	  	<input name="id_TurningBlade" type="hidden" value="${(turningBlade.id_TurningBlade == null || turningBlade.id_TurningBlade == '') ? 0 : turningBlade.id_TurningBlade}"/>
	    <input type="hidden" id="NumberTurningBlade_pictureBladeTurningForm" value="${turningBlade.NumberTurningBlade }" class="input" name="NumberTurningBlade"/>
	    <input type="hidden" id="TypeBTADrill_pictureBladeTurningForm" value="${turningBlade.TypeBTADrill }" class="input" name="TypeBTADrill"/>
	    <input type="hidden" id="NameTurningBlade_pictureBladeTurningForm" value="${turningBlade.NameTurningBlade }" class="input" name="NameTurningBlade"/>
	    <input type="hidden" id="ISOBladeTurning_pictureBladeTurningForm" value="${turningBlade.ISOBladeTurning }" class="input" name="ISOBladeTurning"/>
	    <input type="hidden" id="ToolCoatBladeTurning_pictureBladeTurningForm" value="${turningBlade.ToolCoatBladeTurning }" class="input" name="ToolCoatBladeTurning"/>
	    <input type="hidden" id="ToolMaterialBladeTurning_pictureBladeTurningForm" value="${turningBlade.ToolMaterialBladeTurning }" class="input" name="ToolMaterialBladeTurning"/>
	    <input type="hidden" id="MachiningTypeBladeTurning_pictureBladeTurningForm" value="${turningBlade.MachiningTypeBladeTurning }" class="input" name="MachiningTypeBladeTurning"/>
	    <input type="hidden" id="ToolBladeFeatureTurning_pictureBladeTurningForm" value="${turningBlade.ToolBladeFeatureTurning }" class="input" name="ToolBladeFeatureTurning"/>
	    <input type="hidden" id="CompanyTurningBlade_pictureBladeTurningForm" value="${turningBlade.CompanyTurningBlade }" class="input" name="CompanyTurningBlade"/>
	    <input type="hidden" id="QianjiaoBladeTurning_pictureBladeTurningForm" value="${turningBlade.QianjiaoBladeTurning }" class="input" name="QianjiaoBladeTurning"/>
	    <input type="hidden" id="HoujiaoBladeTurning_pictureBladeTurningForm" value="${turningBlade.HoujiaoBladeTurning }" class="input" name="HoujiaoBladeTurning"/>
	    <input type="hidden" id="HoujisojiaoBladeTurning_pictureBladeTurningForm" value="${turningBlade.HoujisojiaoBladeTurning }" class="input" name="HoujisojiaoBladeTurning"/>
	    <input type="hidden" id="NoseRadiusTurning_pictureBladeTurningForm" value="${turningBlade.NoseRadiusTurning }" class="input" name="NoseRadiusTurning"/>
	    <input type="hidden" id="BreakerBladeTurning_pictureBladeTurningForm" value="${turningBlade.BreakerBladeTurning }" class="input" name="BreakerBladeTurning"/>
	    <input type="hidden" id="MateriaBladeTurning_pictureBladeTurningForm" value="${turningBlade.MateriaBladeTurning }" class="input" name="MateriaBladeTurning"/>
	  	
	  <li class="block bor_t">
	    <span id="lititle">刀具图片</span>
	    <input type="hidden" value="${array_PictureBladeTurning == null ? '' : array_PictureBladeTurning }" id="array_PictureBladeTurning" name="array_PictureBladeTurning"/>
	    <input type="hidden" value="${array_PictureDetailBladeTurning == null ? '' : array_PictureDetailBladeTurning }"  name="array_PictureDetailBladeTurning"/>
	    <input type="hidden" value="${array_ApplicationBladeTurning == null ? '' : array_ApplicationBladeTurning }"  name="array_ApplicationBladeTurning"/>
	    <input type="hidden" value="${array_ApplicationBladeTurning_name == null ? '' : array_ApplicationBladeTurning_name }"  name="array_ApplicationBladeTurning_name"/>
	    <input type="hidden" value="${array_InformDetailBladeTurning == null ? '' : array_InformDetailBladeTurning }"  name="array_InformDetailBladeTurning"/>
	    <input type="hidden" value="${array_InformDetailBladeTurning_name == null ? '' : array_InformDetailBladeTurning_name }"  name="array_InformDetailBladeTurning_name"/>
	    <input type="file" accept="image/*" name="PictureBladeTurning" id="PictureBladeTurning" />
	    <input type="button" value="加载图片" class="btn" onclick="onSavePictureBladeTurningList();"/>
	    <span id="span_PictureBladeTurningList">
	      <c:forEach items="${turningBlade.pictureBladeTurningList}" var="var" varStatus="vs">
	      	<div><img name='pictureBladeTurnings_img' width='100px' height='100px' src='<%=path%>/goods${var.url_PictureBladeTurning }' /><a class="btn btn_shanchu" onclick='onDelPictureBladeTurningImg("${var.url_PictureBladeTurning }");'>删除</a><br/></div>
	      </c:forEach>
	    </span>
	  </li>
	  </form>
	  <!-- 刀具图片 end  -->
	  <!-- 详细图片 begin  -->
	  <form action="/turningBlade/savePictureDetailBladeTurning" name="pictureDetailBladeTurningForm" id="pictureDetailBladeTurningForm" method="post" enctype="multipart/form-data">
	  	<input type="hidden" id="isPMKNS_pictureDetailBladeTurningForm" name="isPMKNS"/>
  	    <input type="hidden" id="ISOPTextBladeTurning_pictureDetailBladeTurningForm" name="ISOPTextBladeTurning"/>
  	    <input type="hidden" id="ISOMTextBladeTurning_pictureDetailBladeTurningForm" name="ISOMTextBladeTurning"/>
  	    <input type="hidden" id="ISOKTextBladeTurning_pictureDetailBladeTurningForm" name="ISOKTextBladeTurning"/>
  	    <input type="hidden" id="ISONTextBladeTurning_pictureDetailBladeTurningForm" name="ISONTextBladeTurning"/>
  	    <input type="hidden" id="ISOSTextBladeTurning_pictureDetailBladeTurningForm" name="ISOSTextBladeTurning"/>
	  	    
	  	<input name="id_TurningBlade" type="hidden" value="${(turningBlade.id_TurningBlade == null || turningBlade.id_TurningBlade == '') ? 0 : turningBlade.id_TurningBlade}"/>
	    <input type="hidden" id="NumberTurningBlade_pictureDetailBladeTurningForm" value="${turningBlade.NumberTurningBlade }" class="input" name="NumberTurningBlade"/>
	    <input type="hidden" id="TypeBTADrill_pictureDetailBladeTurningForm" value="${turningBlade.TypeBTADrill }" class="input" name="TypeBTADrill"/>
	    <input type="hidden" id="NameTurningBlade_pictureDetailBladeTurningForm" value="${turningBlade.NameTurningBlade }" class="input" name="NameTurningBlade"/>
	    <input type="hidden" id="ISOBladeTurning_pictureDetailBladeTurningForm" value="${turningBlade.ISOBladeTurning }" class="input" name="ISOBladeTurning"/>
	    <input type="hidden" id="ToolCoatBladeTurning_pictureDetailBladeTurningForm" value="${turningBlade.ToolCoatBladeTurning }" class="input" name="ToolCoatBladeTurning"/>
	    <input type="hidden" id="ToolMaterialBladeTurning_pictureDetailBladeTurningForm" value="${turningBlade.ToolMaterialBladeTurning }" class="input" name="ToolMaterialBladeTurning"/>
	    <input type="hidden" id="MachiningTypeBladeTurning_pictureDetailBladeTurningForm" value="${turningBlade.MachiningTypeBladeTurning }" class="input" name="MachiningTypeBladeTurning"/>
	    <input type="hidden" id="ToolBladeFeatureTurning_pictureDetailBladeTurningForm" value="${turningBlade.ToolBladeFeatureTurning }" class="input" name="ToolBladeFeatureTurning"/>
	    <input type="hidden" id="CompanyTurningBlade_pictureDetailBladeTurningForm" value="${turningBlade.CompanyTurningBlade }" class="input" name="CompanyTurningBlade"/>
	    <input type="hidden" id="QianjiaoBladeTurning_pictureDetailBladeTurningForm" value="${turningBlade.QianjiaoBladeTurning }" class="input" name="QianjiaoBladeTurning"/>
	    <input type="hidden" id="HoujiaoBladeTurning_pictureDetailBladeTurningForm" value="${turningBlade.HoujiaoBladeTurning }" class="input" name="HoujiaoBladeTurning"/>
	    <input type="hidden" id="HoujisojiaoBladeTurning_pictureDetailBladeTurningForm" value="${turningBlade.HoujisojiaoBladeTurning }" class="input" name="HoujisojiaoBladeTurning"/>
	    <input type="hidden" id="NoseRadiusTurning_pictureDetailBladeTurningForm" value="${turningBlade.NoseRadiusTurning }" class="input" name="NoseRadiusTurning"/>
	    <input type="hidden" id="BreakerBladeTurning_pictureDetailBladeTurningForm" value="${turningBlade.BreakerBladeTurning }" class="input" name="BreakerBladeTurning"/>
	    <input type="hidden" id="MateriaBladeTurning_pictureDetailBladeTurningForm" value="${turningBlade.MateriaBladeTurning }" class="input" name="MateriaBladeTurning"/>
	  	
	  <li class="block bor_t">
	    <span id="lititle">详细图片</span>
	    <input type="hidden" value="${array_PictureBladeTurning == null ? '' : array_PictureBladeTurning }"  name="array_PictureBladeTurning"/>
	    <input type="hidden" value="${array_PictureDetailBladeTurning == null ? '' : array_PictureDetailBladeTurning }" id="array_PictureDetailBladeTurning" name="array_PictureDetailBladeTurning"/>
	    <input type="hidden" value="${array_ApplicationBladeTurning == null ? '' : array_ApplicationBladeTurning }"  name="array_ApplicationBladeTurning"/>
	    <input type="hidden" value="${array_ApplicationBladeTurning_name == null ? '' : array_ApplicationBladeTurning_name }"  name="array_ApplicationBladeTurning_name"/>
	    <input type="hidden" value="${array_InformDetailBladeTurning == null ? '' : array_InformDetailBladeTurning }"  name="array_InformDetailBladeTurning"/>
	    <input type="hidden" value="${array_InformDetailBladeTurning_name == null ? '' : array_InformDetailBladeTurning_name }"  name="array_InformDetailBladeTurning_name"/>
	    
	    <input type="file" accept="image/*" name="PictureDetailBladeTurning" id="PictureDetailBladeTurning" />
	    <input type="button" value="加载图片" class="btn" onclick="onSavePictureDetailBladeTurningList();"/>
	    <span id="span_PictureDetailBladeTurningList">
	      <c:forEach items="${turningBlade.pictureDetailBladeTurningList}" var="var" varStatus="vs">
	      	<div><img name='pictureDetailBladeTurnings_img' width='100px' height='100px' src='<%=path%>/goods${var.url_PictureDetailBladeTurning }' />
	      	<a onclick='onDelPictureDetailBladeTurningImg("${var.url_PictureDetailBladeTurning }");'>删除</a><br/></div>
	      </c:forEach>
	    </span>
	  </li>
	  </form>
	  <!-- 详细图片 end  -->
	  <!-- 详细信息 begin  -->
	  <form action="/turningBlade/saveInformDetailBladeTurning" name="informDetailBladeTurningForm" id="informDetailBladeTurningForm" method="post" enctype="multipart/form-data">
	  	<input type="hidden" id="isPMKNS_informDetailBladeTurningForm" name="isPMKNS"/>
  	    <input type="hidden" id="ISOPTextBladeTurning_informDetailBladeTurningForm" name="ISOPTextBladeTurning"/>
  	    <input type="hidden" id="ISOMTextBladeTurning_informDetailBladeTurningForm" name="ISOMTextBladeTurning"/>
  	    <input type="hidden" id="ISOKTextBladeTurning_informDetailBladeTurningForm" name="ISOKTextBladeTurning"/>
  	    <input type="hidden" id="ISONTextBladeTurning_informDetailBladeTurningForm" name="ISONTextBladeTurning"/>
  	    <input type="hidden" id="ISOSTextBladeTurning_informDetailBladeTurningForm" name="ISOSTextBladeTurning"/>
	  	    
	  	<input name="id_TurningBlade" type="hidden" value="${(turningBlade.id_TurningBlade == null || turningBlade.id_TurningBlade == '') ? 0 : turningBlade.id_TurningBlade}"/>
	    <input type="hidden" id="NumberTurningBlade_informDetailBladeTurningForm" value="${turningBlade.NumberTurningBlade }" class="input" name="NumberTurningBlade"/>
	    <input type="hidden" id="TypeBTADrill_informDetailBladeTurningForm" value="${turningBlade.TypeBTADrill }" class="input" name="TypeBTADrill"/>
	    <input type="hidden" id="NameTurningBlade_informDetailBladeTurningForm" value="${turningBlade.NameTurningBlade }" class="input" name="NameTurningBlade"/>
	    <input type="hidden" id="ISOBladeTurning_informDetailBladeTurningForm" value="${turningBlade.ISOBladeTurning }" class="input" name="ISOBladeTurning"/>
	    <input type="hidden" id="ToolCoatBladeTurning_informDetailBladeTurningForm" value="${turningBlade.ToolCoatBladeTurning }" class="input" name="ToolCoatBladeTurning"/>
	    <input type="hidden" id="ToolMaterialBladeTurning_informDetailBladeTurningForm" value="${turningBlade.ToolMaterialBladeTurning }" class="input" name="ToolMaterialBladeTurning"/>
	    <input type="hidden" id="MachiningTypeBladeTurning_informDetailBladeTurningForm" value="${turningBlade.MachiningTypeBladeTurning }" class="input" name="MachiningTypeBladeTurning"/>
	    <input type="hidden" id="ToolBladeFeatureTurning_informDetailBladeTurningForm" value="${turningBlade.ToolBladeFeatureTurning }" class="input" name="ToolBladeFeatureTurning"/>
	    <input type="hidden" id="CompanyTurningBlade_informDetailBladeTurningForm" value="${turningBlade.CompanyTurningBlade }" class="input" name="CompanyTurningBlade"/>
	    <input type="hidden" id="QianjiaoBladeTurning_informDetailBladeTurningForm" value="${turningBlade.QianjiaoBladeTurning }" class="input" name="QianjiaoBladeTurning"/>
	    <input type="hidden" id="HoujiaoBladeTurning_informDetailBladeTurningForm" value="${turningBlade.HoujiaoBladeTurning }" class="input" name="HoujiaoBladeTurning"/>
	    <input type="hidden" id="HoujisojiaoBladeTurning_informDetailBladeTurningForm" value="${turningBlade.HoujisojiaoBladeTurning }" class="input" name="HoujisojiaoBladeTurning"/>
	    <input type="hidden" id="NoseRadiusTurning_informDetailBladeTurningForm" value="${turningBlade.NoseRadiusTurning }" class="input" name="NoseRadiusTurning"/>
	    <input type="hidden" id="BreakerBladeTurning_informDetailBladeTurningForm" value="${turningBlade.BreakerBladeTurning }" class="input" name="BreakerBladeTurning"/>
	    <input type="hidden" id="MateriaBladeTurning_informDetailBladeTurningForm" value="${turningBlade.MateriaBladeTurning }" class="input" name="MateriaBladeTurning"/>
	  	
 	  <li class="block bor_t"> 
 	    <span id="lititle">详细信息</span>
 	    <input type="hidden" value="${array_PictureBladeTurning == null ? '' : array_PictureBladeTurning }"  name="array_PictureBladeTurning"/>
	    <input type="hidden" value="${array_PictureDetailBladeTurning == null ? '' : array_PictureDetailBladeTurning }"  name="array_PictureDetailBladeTurning"/>
	    <input type="hidden" value="${array_ApplicationBladeTurning == null ? '' : array_ApplicationBladeTurning }"  name="array_ApplicationBladeTurning"/>
	    <input type="hidden" value="${array_ApplicationBladeTurning_name == null ? '' : array_ApplicationBladeTurning_name }"  name="array_ApplicationBladeTurning_name"/>
	    <input type="hidden" value="${array_InformDetailBladeTurning == null ? '' : array_InformDetailBladeTurning }" id="array_InformDetailBladeTurning" name="array_InformDetailBladeTurning"/>
	    <input type="hidden" value="${array_InformDetailBladeTurning_name == null ? '' : array_InformDetailBladeTurning_name }" id="array_InformDetailBladeTurning_name" name="array_InformDetailBladeTurning_name"/>
	    
 	    
	    <input type="file" accept=".pdf" name="InformDetailBladeTurning" id="InformDetailBladeTurning" />
	    <input type="button" value="加载文件" class="btn" onclick="onSaveInformDetailBladeTurningList();"/>
	    <span id="span_InformDetailBladeTurningList">
	      <c:forEach items="${turningBlade.informDetailBladeTurningList}" var="var" varStatus="vs">
	      	      	<div><span name='informDetailBladeTurnings_img' >${var.url_InformDetailBladeTurning }</span><a class="btn btn_shanchu" onclick='onDelInformDetailBladeTurningImg("${var.url_InformDetailBladeTurning }");'>删除</a><br/></div>
	      </c:forEach>
	    </span>
 	  </li> 
 	  </form>
 	  <!-- 详细信息 end  -->
 	  <!-- 应用实例 begin  -->
 	  <form action="/turningBlade/saveApplicationBladeTurning" name="applicationBladeTurningForm" id="applicationBladeTurningForm" method="post" enctype="multipart/form-data">
 	  	<input type="hidden" id="isPMKNS_applicationBladeTurningForm" name="isPMKNS"/>
  	    <input type="hidden" id="ISOPTextBladeTurning_applicationBladeTurningForm" name="ISOPTextBladeTurning"/>
  	    <input type="hidden" id="ISOMTextBladeTurning_applicationBladeTurningForm" name="ISOMTextBladeTurning"/>
  	    <input type="hidden" id="ISOKTextBladeTurning_applicationBladeTurningForm" name="ISOKTextBladeTurning"/>
  	    <input type="hidden" id="ISONTextBladeTurning_applicationBladeTurningForm" name="ISONTextBladeTurning"/>
  	    <input type="hidden" id="ISOSTextBladeTurning_applicationBladeTurningForm" name="ISOSTextBladeTurning"/>
	  	    
	  	<input name="id_TurningBlade" type="hidden" value="${(turningBlade.id_TurningBlade == null || turningBlade.id_TurningBlade == '') ? 0 : turningBlade.id_TurningBlade}"/>
	    <input type="hidden" id="NumberTurningBlade_applicationBladeTurningForm" value="${turningBlade.NumberTurningBlade }" class="input" name="NumberTurningBlade"/>
	    <input type="hidden" id="TypeBTADrill_applicationBladeTurningForm" value="${turningBlade.TypeBTADrill }" class="input" name="TypeBTADrill"/>
	    <input type="hidden" id="NameTurningBlade_applicationBladeTurningForm" value="${turningBlade.NameTurningBlade }" class="input" name="NameTurningBlade"/>
	    <input type="hidden" id="ISOBladeTurning_applicationBladeTurningForm" value="${turningBlade.ISOBladeTurning }" class="input" name="ISOBladeTurning"/>
	    <input type="hidden" id="ToolCoatBladeTurning_applicationBladeTurningForm" value="${turningBlade.ToolCoatBladeTurning }" class="input" name="ToolCoatBladeTurning"/>
	    <input type="hidden" id="ToolMaterialBladeTurning_applicationBladeTurningForm" value="${turningBlade.ToolMaterialBladeTurning }" class="input" name="ToolMaterialBladeTurning"/>
	    <input type="hidden" id="MachiningTypeBladeTurning_applicationBladeTurningForm" value="${turningBlade.MachiningTypeBladeTurning }" class="input" name="MachiningTypeBladeTurning"/>
	    <input type="hidden" id="ToolBladeFeatureTurning_applicationBladeTurningForm" value="${turningBlade.ToolBladeFeatureTurning }" class="input" name="ToolBladeFeatureTurning"/>
	    <input type="hidden" id="CompanyTurningBlade_applicationBladeTurningForm" value="${turningBlade.CompanyTurningBlade }" class="input" name="CompanyTurningBlade"/>
	    <input type="hidden" id="QianjiaoBladeTurning_applicationBladeTurningForm" value="${turningBlade.QianjiaoBladeTurning }" class="input" name="QianjiaoBladeTurning"/>
	    <input type="hidden" id="HoujiaoBladeTurning_applicationBladeTurningForm" value="${turningBlade.HoujiaoBladeTurning }" class="input" name="HoujiaoBladeTurning"/>
	    <input type="hidden" id="HoujisojiaoBladeTurning_applicationBladeTurningForm" value="${turningBlade.HoujisojiaoBladeTurning }" class="input" name="HoujisojiaoBladeTurning"/>
	    <input type="hidden" id="NoseRadiusTurning_applicationBladeTurningForm" value="${turningBlade.NoseRadiusTurning }" class="input" name="NoseRadiusTurning"/>
	    <input type="hidden" id="BreakerBladeTurning_applicationBladeTurningForm" value="${turningBlade.BreakerBladeTurning }" class="input" name="BreakerBladeTurning"/>
	    <input type="hidden" id="MateriaBladeTurning_applicationBladeTurningForm" value="${turningBlade.MateriaBladeTurning }" class="input" name="MateriaBladeTurning"/>
	  	
 	  <li class="block bor_t"> 
 	    <span id="lititle">应用实例</span>
 	    <input type="hidden" value="${array_PictureBladeTurning == null ? '' : array_PictureBladeTurning }"  name="array_PictureBladeTurning"/>
	    <input type="hidden" value="${array_PictureDetailBladeTurning == null ? '' : array_PictureDetailBladeTurning }"  name="array_PictureDetailBladeTurning"/>
	    <input type="hidden" value="${array_ApplicationBladeTurning == null ? '' : array_ApplicationBladeTurning }" id="array_ApplicationBladeTurning" name="array_ApplicationBladeTurning"/>
	    <input type="hidden" value="${array_ApplicationBladeTurning_name == null ? '' : array_ApplicationBladeTurning_name }" id="array_ApplicationBladeTurning_name" name="array_ApplicationBladeTurning_name"/>
	    <input type="hidden" value="${array_InformDetailBladeTurning == null ? '' : array_InformDetailBladeTurning }"  name="array_InformDetailBladeTurning"/>
	    <input type="hidden" value="${array_InformDetailBladeTurning_name == null ? '' : array_InformDetailBladeTurning_name }"  name="array_InformDetailBladeTurning_name"/>
 	    
	    <input type="file" accept=".pdf" name="ApplicationBladeTurning" id="ApplicationBladeTurning" />
	    <input type="button" value="加载文件" class="btn" onclick="onSaveApplicationBladeTurningList();"/>
	    <span id="span_ApplicationBladeTurningList">
	      <c:forEach items="${turningBlade.applicationBladeTurningList}" var="var" varStatus="vs">
	      	<div><span name='applicationBladeTurnings_img' >${var.url_ApplicationBladeTurning }</span><a class="btn btn_shanchu" onclick='onDelApplicationBladeTurningImg("${var.url_ApplicationBladeTurning }");'>删除</a><br/></div>
	      
	      </c:forEach>
	    </span>
 	  </li> 
 	  </form>
 	  <!-- 应用实例 end  -->  
	  
	  <li class="block bor_t">
	    <span id="lititle">ISO材料加工信息</span>
	    <input name="isPMKNS" id="isPMKNS_text" type="hidden" value="${turningBlade.isPMKNS }" />
	    <select id="isPMKNS" class="select"> 
          <option>P</option>
          <option>M</option>
          <option>K</option>
          <option>N</option>
          <option>S</option>
        </select>
        <span class="iso_infor_btn" onclick="addPMKNS();">添加</span>
	  </li>
	  <li class="block bor_t   iso_wrap">
	  	<div id="div_ISOPTextBladeTurning" class="iso_infor" style="display: none;">
	  		<span id="lititle_ISOPTextBladeTurning">加工P参数</span>
	    	<textarea  cols="" rows="" class="textarea" id="ISOPTextBladeTurning" >${turningBlade.ISOPTextBladeTurning }</textarea>
	    	<a class="btn_shanc" onclick="delPMKNS('P');">删除</a>
	  	</div> 
	  	<div id="div_ISOMTextBladeTurning" class="iso_infor" style="display: none;">
	  		<span id="lititle_ISOMTextBladeTurning">加工M参数</span>
	    	<textarea  cols="" rows="" class="textarea" id="ISOMTextBladeTurning" >${turningBlade.ISOMTextBladeTurning }</textarea>
	    	<a class="btn_shanc" onclick="delPMKNS('M');">删除</a>
	  	</div> 
	  	<div id="div_ISOKTextBladeTurning" class="iso_infor" style="display: none;">
	  		<span id="lititle_ISOKTextBladeTurning">加工K参数</span>
	    	<textarea  cols="" rows="" class="textarea" id="ISOKTextBladeTurning" >${turningBlade.ISOKTextBladeTurning }</textarea>
	    	<a class="btn_shanc" onclick="delPMKNS('K');">删除</a>
	  	</div> 
	  	<div id="div_ISONTextBladeTurning" class="iso_infor" style="display: none;">
	  		<span id="lititle_ISONTextBladeTurning">加工N参数</span>
	    	<textarea  cols="" rows="" class="textarea" id="ISONTextBladeTurning" >${turningBlade.ISONTextBladeTurning }</textarea>
	    	<a class="btn_shanc" onclick="delPMKNS('N');">删除</a>
	  	</div> 
	  	<div id="div_ISOSTextBladeTurning" class="iso_infor" style="display: none;">
	  		<span id="lititle_ISOSTextBladeTurning">加工S参数</span>
	    	<textarea  cols="" rows="" class="textarea" id="ISOSTextBladeTurning" >${turningBlade.ISOSTextBladeTurning }</textarea>
	    	<a class="btn_shanc" onclick="delPMKNS('S');">删除</a>
	  	</div> 
	    <input type="hidden" name="ISOPTextBladeTurning" value="${turningBlade.ISOPTextBladeTurning }" id="ISOPTextBladeTurning"/> 
	    <input type="hidden" name="ISOMTextBladeTurning" value="${turningBlade.ISOMTextBladeTurning }" id="ISOMTextBladeTurning"/> 
	    <input type="hidden" name="ISOKTextBladeTurning" value="${turningBlade.ISOKTextBladeTurning }" id="ISOKTextBladeTurning"/> 
	    <input type="hidden" name="ISONTextBladeTurning" value="${turningBlade.ISONTextBladeTurning }" id="ISONTextBladeTurning"/> 
	    <input type="hidden" name="ISOSTextBladeTurning" value="${turningBlade.ISOSTextBladeTurning }" id="ISOSTextBladeTurning"/> 
	  </li>
	</ul>
</div>

</body>
</html>
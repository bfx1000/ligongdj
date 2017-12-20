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
		var array_PictureBladeXidao = $("#array_PictureBladeXidao").val();
		if(array_PictureBladeXidao != null && array_PictureBladeXidao != ''){
			var pictureBladeXidaos = array_PictureBladeXidao.split(',');
			var pictureBladeXidaos_str = '';
			for(var i = 0; i < pictureBladeXidaos.length; i++){
				if(pictureBladeXidaos[i] != null && pictureBladeXidaos[i] != ''){
					pictureBladeXidaos_str = pictureBladeXidaos_str + "<div><img name='pictureBladeXidaos_img' width='100px' height='100px' src='<%=path%>/goods"+pictureBladeXidaos[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureBladeXidaoImg(\""+pictureBladeXidaos[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureBladeXidaoList").html(pictureBladeXidaos_str);
		}
		
		//详细图片
		var array_PictureDetailBladeXidao = $("#array_PictureDetailBladeXidao").val();
		if(array_PictureDetailBladeXidao != null && array_PictureDetailBladeXidao != ''){
			var pictureDetailBladeXidaos = array_PictureDetailBladeXidao.split(',');
			var pictureDetailBladeXidaos_str = '';
			for(var i = 0; i < pictureDetailBladeXidaos.length; i++){
				if(pictureDetailBladeXidaos[i] != null && pictureDetailBladeXidaos[i] != ''){
					pictureDetailBladeXidaos_str = pictureDetailBladeXidaos_str + "<div><img name='pictureDetailBladeXidaos_img' width='100px' height='100px' src='<%=path%>/goods"+pictureDetailBladeXidaos[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureDetailBladeXidaoImg(\""+pictureDetailBladeXidaos[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureDetailBladeXidaoList").html(pictureDetailBladeXidaos_str);
		}
		
		
		//应用实例
		var array_ApplicationBladeXidao = $("#array_ApplicationBladeXidao").val();
		var array_ApplicationBladeXidao_name = $("#array_ApplicationBladeXidao_name").val();
		if(array_ApplicationBladeXidao != null && array_ApplicationBladeXidao != ''){
			var applicationBladeXidaos = array_ApplicationBladeXidao.split(',');
			var applicationBladeXidaos_name = array_ApplicationBladeXidao_name.split(',');
			var applicationBladeXidaos_str = '';
			for(var i = 0; i < applicationBladeXidaos.length; i++){
				if(applicationBladeXidaos[i] != null && applicationBladeXidaos[i] != ''){
					applicationBladeXidaos_str = applicationBladeXidaos_str + "<div><span name='applicationBladeXidaos_img' url='"+applicationBladeXidaos[i]+"' >"+applicationBladeXidaos_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelApplicationBladeXidaoImg(\""+applicationBladeXidaos[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ApplicationBladeXidaoList").html(applicationBladeXidaos_str);
		}
		
		
		//详细信息
		var array_InformDetailBladeXidao = $("#array_InformDetailBladeXidao").val();
		var array_InformDetailBladeXidao_name = $("#array_InformDetailBladeXidao_name").val();
		if(array_InformDetailBladeXidao != null && array_InformDetailBladeXidao != ''){
			var informDetailBladeXidaos = array_InformDetailBladeXidao.split(',');
			var informDetailBladeXidaos_name = array_InformDetailBladeXidao_name.split(',');
			var informDetailBladeXidaos_str = '';
			for(var i = 0; i < informDetailBladeXidaos.length; i++){
				if(informDetailBladeXidaos[i] != null && informDetailBladeXidaos[i] != ''){
					informDetailBladeXidaos_str = informDetailBladeXidaos_str + "<div><span name='informDetailBladeXidaos_img' url='"+informDetailBladeXidaos[i]+"' >" + informDetailBladeXidaos_name[i] + "</span><a class='btn btn_shanchu' onclick='onDelInformDetailBladeXidaoImg(\""+informDetailBladeXidaos[i]+"\");'>删除</a><br/></div>";
					
				}
			}
			$("#span_InformDetailBladeXidaoList").html(informDetailBladeXidaos_str);
		}
		
		var isPMKNS_text = $("#isPMKNS_text").val();

		if(isPMKNS_text.indexOf('P')==-1?false:true){//包含
			$("#div_ISOPTextBladeXidao").show();
		}
		if(isPMKNS_text.indexOf('M')==-1?false:true){//包含
			$("#div_ISOMTextBladeXidao").show();
		}
		if(isPMKNS_text.indexOf('K')==-1?false:true){//包含
			$("#div_ISOKTextBladeXidao").show();
		}
		if(isPMKNS_text.indexOf('N')==-1?false:true){//包含
			$("#div_ISONTextBladeXidao").show();
		}
		if(isPMKNS_text.indexOf('S')==-1?false:true){//包含
			$("#div_ISOSTextBladeXidao").show();
		}
		
	});
	
	
	//保存
	function save(){
		
		$("#isPMKNS_userForm").val($("#isPMKNS_text").val());
	
		$("#ISOPTextBladeXidao_userForm").val($("#ISOPTextBladeXidao").val());
		$("#ISOMTextBladeXidao_userForm").val($("#ISOMTextBladeXidao").val());
		$("#ISOKTextBladeXidao_userForm").val($("#ISOKTextBladeXidao").val());
		$("#ISONTextBladeXidao_userForm").val($("#ISONTextBladeXidao").val());
		$("#ISOSTextBladeXidao_userForm").val($("#ISOSTextBladeXidao").val());
		
		$("#array_PictureBladeXidao_userForm").val($("#array_PictureBladeXidao").val());//刀具图片
		$("#array_PictureDetailBladeXidao_userForm").val($("#array_PictureDetailBladeXidao").val());//详细图片
		$("#array_ApplicationBladeXidao_userForm").val($("#array_ApplicationBladeXidao").val());//应用实例
		$("#array_ApplicationBladeXidao_name_userForm").val($("#array_ApplicationBladeXidao_name").val());//应用实例
		$("#array_InformDetailBladeXidao_userForm").val($("#array_InformDetailBladeXidao").val());//详细信息
		$("#array_InformDetailBladeXidao_name_userForm").val($("#array_InformDetailBladeXidao_name").val());//详细信息
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
		window.location.href='<%=path%>/xidaoBlade/queryXidaoBladeList';
	}
	
	//保存刀具图片
	function onSavePictureBladeXidaoList(){
		$("#isPMKNS_pictureBladeXidaoForm").val($("#isPMKNS_text").val());
		$("#ISOPTextBladeXidao_pictureBladeXidaoForm").val($("#ISOPTextBladeXidao").val());
		$("#ISOMTextBladeXidao_pictureBladeXidaoForm").val($("#ISOMTextBladeXidao").val());
		$("#ISOKTextBladeXidao_pictureBladeXidaoForm").val($("#ISOKTextBladeXidao").val());
		$("#ISONTextBladeXidao_pictureBladeXidaoForm").val($("#ISONTextBladeXidao").val());
		$("#ISOSTextBladeXidao_pictureBladeXidaoForm").val($("#ISOSTextBladeXidao").val());
	
		$("#id_XidaoBlade_pictureBladeXidaoForm").val($("#id_XidaoBlade_userForm").val());
		$("#NumberXidaoBlade_pictureBladeXidaoForm").val($("#NumberXidaoBlade_userForm").val());
		$("#TypeBTADrill_pictureBladeXidaoForm").val($("#TypeBTADrill_userForm").val());
		$("#NameXidaoBlade_pictureBladeXidaoForm").val($("#NameXidaoBlade_userForm").val());
		$("#ISOBladeXidao_pictureBladeXidaoForm").val($("#ISOBladeXidao_userForm").val());
		$("#ToolCoatBladeXidao_pictureBladeXidaoForm").val($("#ToolCoatBladeXidao_userForm").val());
		$("#ToolMaterialBladeXidao_pictureBladeXidaoForm").val($("#ToolMaterialBladeXidao_userForm").val());
		$("#MachiningTypeBladeXidao_pictureBladeXidaoForm").val($("#MachiningTypeBladeXidao_userForm").val());
		$("#ToolBladeFeatureXidao_pictureBladeXidaoForm").val($("#ToolBladeFeatureXidao_userForm").val());
		$("#CompanyXidaoBlade_pictureBladeXidaoForm").val($("#CompanyXidaoBlade_userForm").val());
		$("#QianjiaoBladeXidao_pictureBladeXidaoForm").val($("#QianjiaoBladeXidao_userForm").val());
		$("#HoujiaoBladeXidao_pictureBladeXidaoForm").val($("#HoujiaoBladeXidao_userForm").val());
		$("#HoujisojiaoBladeXidao_pictureBladeXidaoForm").val($("#HoujisojiaoBladeXidao_userForm").val());
		$("#NoseRadiusXidao_pictureBladeXidaoForm").val($("#NoseRadiusXidao_userForm").val());
		$("#BreakerBladeXidao_pictureBladeXidaoForm").val($("#BreakerBladeXidao_userForm").val());
		$("#MateriaBladeXidao_pictureBladeXidaoForm").val($("#MateriaBladeXidao_userForm").val());
	    
		$("#pictureBladeXidaoForm").submit();
	}
	
	//删除刀具图片
	function onDelPictureBladeXidaoImg(url_pictureBladeXidao){
		var array_PictureBladeXidao = $("#array_PictureBladeXidao").val();
		array_PictureBladeXidao = array_PictureBladeXidao.replace(url_pictureBladeXidao,'');
		$("#array_PictureBladeXidao").val(array_PictureBladeXidao);
		var img_array = $("img[name='pictureBladeXidaos_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_pictureBladeXidao){
				$(img_array[i]).parent().remove();
			}
		}
	}
	
	//保存详细图片
	function onSavePictureDetailBladeXidaoList(){
		$("#isPMKNS_pictureDetailBladeXidaoForm").val($("#isPMKNS_text").val());
		$("#ISOPTextBladeXidao_pictureDetailBladeXidaoForm").val($("#ISOPTextBladeXidao").val());
		$("#ISOMTextBladeXidao_pictureDetailBladeXidaoForm").val($("#ISOMTextBladeXidao").val());
		$("#ISOKTextBladeXidao_pictureDetailBladeXidaoForm").val($("#ISOKTextBladeXidao").val());
		$("#ISONTextBladeXidao_pictureDetailBladeXidaoForm").val($("#ISONTextBladeXidao").val());
		$("#ISOSTextBladeXidao_pictureDetailBladeXidaoForm").val($("#ISOSTextBladeXidao").val());
	
		$("#id_XidaoBlade_pictureDetailBladeXidaoForm").val($("#id_XidaoBlade_userForm").val());
		$("#NumberXidaoBlade_pictureDetailBladeXidaoForm").val($("#NumberXidaoBlade_userForm").val());
		$("#TypeBTADrill_pictureDetailBladeXidaoForm").val($("#TypeBTADrill_userForm").val());
		$("#NameXidaoBlade_pictureDetailBladeXidaoForm").val($("#NameXidaoBlade_userForm").val());
		$("#ISOBladeXidao_pictureDetailBladeXidaoForm").val($("#ISOBladeXidao_userForm").val());
		$("#ToolCoatBladeXidao_pictureDetailBladeXidaoForm").val($("#ToolCoatBladeXidao_userForm").val());
		$("#ToolMaterialBladeXidao_pictureDetailBladeXidaoForm").val($("#ToolMaterialBladeXidao_userForm").val());
		$("#MachiningTypeBladeXidao_pictureDetailBladeXidaoForm").val($("#MachiningTypeBladeXidao_userForm").val());
		$("#ToolBladeFeatureXidao_pictureDetailBladeXidaoForm").val($("#ToolBladeFeatureXidao_userForm").val());
		$("#CompanyXidaoBlade_pictureDetailBladeXidaoForm").val($("#CompanyXidaoBlade_userForm").val());
		$("#QianjiaoBladeXidao_pictureDetailBladeXidaoForm").val($("#QianjiaoBladeXidao_userForm").val());
		$("#HoujiaoBladeXidao_pictureDetailBladeXidaoForm").val($("#HoujiaoBladeXidao_userForm").val());
		$("#HoujisojiaoBladeXidao_pictureDetailBladeXidaoForm").val($("#HoujisojiaoBladeXidao_userForm").val());
		$("#NoseRadiusXidao_pictureDetailBladeXidaoForm").val($("#NoseRadiusXidao_userForm").val());
		$("#BreakerBladeXidao_pictureDetailBladeXidaoForm").val($("#BreakerBladeXidao_userForm").val());
		$("#MateriaBladeXidao_pictureDetailBladeXidaoForm").val($("#MateriaBladeXidao_userForm").val());
	    
		$("#pictureDetailBladeXidaoForm").submit();
	}
	
	//删除详细图片
	function onDelPictureDetailBladeXidaoImg(url_pictureDetailBladeXidao){
		var array_PictureDetailBladeXidao = $("#array_PictureDetailBladeXidao").val();
		array_PictureDetailBladeXidao = array_PictureDetailBladeXidao.replace(url_pictureDetailBladeXidao,'');
		$("#array_PictureDetailBladeXidao").val(array_PictureDetailBladeXidao);
		var img_array = $("img[name='pictureDetailBladeXidaos_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_pictureDetailBladeXidao){
				$(img_array[i]).parent().remove();
			}
		}
	}
	
	//保存应用实例
	function onSaveApplicationBladeXidaoList(){
		$("#isPMKNS_applicationBladeXidaoForm").val($("#isPMKNS_text").val());
		$("#ISOPTextBladeXidao_applicationBladeXidaoForm").val($("#ISOPTextBladeXidao").val());
		$("#ISOMTextBladeXidao_applicationBladeXidaoForm").val($("#ISOMTextBladeXidao").val());
		$("#ISOKTextBladeXidao_applicationBladeXidaoForm").val($("#ISOKTextBladeXidao").val());
		$("#ISONTextBladeXidao_applicationBladeXidaoForm").val($("#ISONTextBladeXidao").val());
		$("#ISOSTextBladeXidao_applicationBladeXidaoForm").val($("#ISOSTextBladeXidao").val());
	
		$("#id_XidaoBlade_applicationBladeXidaoForm").val($("#id_XidaoBlade_userForm").val());
		$("#NumberXidaoBlade_applicationBladeXidaoForm").val($("#NumberXidaoBlade_userForm").val());
		$("#TypeBTADrill_applicationBladeXidaoForm").val($("#TypeBTADrill_userForm").val());
		$("#NameXidaoBlade_applicationBladeXidaoForm").val($("#NameXidaoBlade_userForm").val());
		$("#ISOBladeXidao_applicationBladeXidaoForm").val($("#ISOBladeXidao_userForm").val());
		$("#ToolCoatBladeXidao_applicationBladeXidaoForm").val($("#ToolCoatBladeXidao_userForm").val());
		$("#ToolMaterialBladeXidao_applicationBladeXidaoForm").val($("#ToolMaterialBladeXidao_userForm").val());
		$("#MachiningTypeBladeXidao_applicationBladeXidaoForm").val($("#MachiningTypeBladeXidao_userForm").val());
		$("#ToolBladeFeatureXidao_applicationBladeXidaoForm").val($("#ToolBladeFeatureXidao_userForm").val());
		$("#CompanyXidaoBlade_applicationBladeXidaoForm").val($("#CompanyXidaoBlade_userForm").val());
		$("#QianjiaoBladeXidao_applicationBladeXidaoForm").val($("#QianjiaoBladeXidao_userForm").val());
		$("#HoujiaoBladeXidao_applicationBladeXidaoForm").val($("#HoujiaoBladeXidao_userForm").val());
		$("#HoujisojiaoBladeXidao_applicationBladeXidaoForm").val($("#HoujisojiaoBladeXidao_userForm").val());
		$("#NoseRadiusXidao_applicationBladeXidaoForm").val($("#NoseRadiusXidao_userForm").val());
		$("#BreakerBladeXidao_applicationBladeXidaoForm").val($("#BreakerBladeXidao_userForm").val());
		$("#MateriaBladeXidao_applicationBladeXidaoForm").val($("#MateriaBladeXidao_userForm").val());
	    
		$("#applicationBladeXidaoForm").submit();
	}
	
	//删除应用实例
	function onDelApplicationBladeXidaoImg(url_applicationBladeXidao){
	
		var array_ApplicationBladeXidao = $("#array_ApplicationBladeXidao").val();
		array_ApplicationBladeXidao = array_ApplicationBladeXidao.replace(url_applicationBladeXidao,'');
		$("#array_ApplicationBladeXidao").val(array_ApplicationBladeXidao);
		var img_array = $("span[name='applicationBladeXidaos_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_applicationBladeXidao){
				$(img_array[i]).parent().remove();
			}
		}
	}
	
	//保存详细信息
	function onSaveInformDetailBladeXidaoList(){
		$("#isPMKNS_informDetailBladeXidaoForm").val($("#isPMKNS_text").val());
		$("#ISOPTextBladeXidao_informDetailBladeXidaoForm").val($("#ISOPTextBladeXidao").val());
		$("#ISOMTextBladeXidao_informDetailBladeXidaoForm").val($("#ISOMTextBladeXidao").val());
		$("#ISOKTextBladeXidao_informDetailBladeXidaoForm").val($("#ISOKTextBladeXidao").val());
		$("#ISONTextBladeXidao_informDetailBladeXidaoForm").val($("#ISONTextBladeXidao").val());
		$("#ISOSTextBladeXidao_informDetailBladeXidaoForm").val($("#ISOSTextBladeXidao").val());
	
		$("#id_XidaoBlade_informDetailBladeXidaoForm").val($("#id_XidaoBlade_userForm").val());
		$("#NumberXidaoBlade_informDetailBladeXidaoForm").val($("#NumberXidaoBlade_userForm").val());
		$("#TypeBTADrill_informDetailBladeXidaoForm").val($("#TypeBTADrill_userForm").val());
		$("#NameXidaoBlade_informDetailBladeXidaoForm").val($("#NameXidaoBlade_userForm").val());
		$("#ISOBladeXidao_informDetailBladeXidaoForm").val($("#ISOBladeXidao_userForm").val());
		$("#ToolCoatBladeXidao_informDetailBladeXidaoForm").val($("#ToolCoatBladeXidao_userForm").val());
		$("#ToolMaterialBladeXidao_informDetailBladeXidaoForm").val($("#ToolMaterialBladeXidao_userForm").val());
		$("#MachiningTypeBladeXidao_informDetailBladeXidaoForm").val($("#MachiningTypeBladeXidao_userForm").val());
		$("#ToolBladeFeatureXidao_informDetailBladeXidaoForm").val($("#ToolBladeFeatureXidao_userForm").val());
		$("#CompanyXidaoBlade_informDetailBladeXidaoForm").val($("#CompanyXidaoBlade_userForm").val());
		$("#QianjiaoBladeXidao_informDetailBladeXidaoForm").val($("#QianjiaoBladeXidao_userForm").val());
		$("#HoujiaoBladeXidao_informDetailBladeXidaoForm").val($("#HoujiaoBladeXidao_userForm").val());
		$("#HoujisojiaoBladeXidao_informDetailBladeXidaoForm").val($("#HoujisojiaoBladeXidao_userForm").val());
		$("#NoseRadiusXidao_informDetailBladeXidaoForm").val($("#NoseRadiusXidao_userForm").val());
		$("#BreakerBladeXidao_informDetailBladeXidaoForm").val($("#BreakerBladeXidao_userForm").val());
		$("#MateriaBladeXidao_informDetailBladeXidaoForm").val($("#MateriaBladeXidao_userForm").val());
	    
		$("#informDetailBladeXidaoForm").submit();
	}
	
	//删除详细信息
	function onDelInformDetailBladeXidaoImg(url_informDetailBladeXidao){
		var array_InformDetailBladeXidao = $("#array_InformDetailBladeXidao").val();
		array_InformDetailBladeXidao = array_InformDetailBladeXidao.replace(url_informDetailBladeXidao,'');
		$("#array_InformDetailBladeXidao").val(array_InformDetailBladeXidao);
		var img_array = $("span[name='informDetailBladeXidaos_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_informDetailBladeXidao){
				$(img_array[i]).parent().remove();
			}
		}
	}
	

	//增加ISO材料加工信息
	function addPMKNS(){
		var isPMKNS = $("#isPMKNS").val();	
		$("#div_ISO" + isPMKNS + "TextBladeXidao").show();
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
		$("#div_ISO" + val + "TextBladeXidao").hide();
	}
</script>
</head>
<body style="background:#fff;">
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text">
	<form action="/xidaoBlade/saveXidaoBlade" name="userForm" id="userForm" method="post">
	  <input type="hidden" id="array_PictureBladeXidao_userForm" name="array_PictureBladeXidao"/>
      <input type="hidden" id="array_PictureDetailBladeXidao_userForm" name="array_PictureDetailBladeXidao"/>
      <input type="hidden" id="array_ApplicationBladeXidao_userForm" name="array_ApplicationBladeXidao"/>
      <input type="hidden" id="array_ApplicationBladeXidao_name_userForm" name="array_ApplicationBladeXidao_name"/>
      <input type="hidden" id="array_InformDetailBladeXidao_userForm" name="array_InformDetailBladeXidao"/>
      <input type="hidden" id="array_InformDetailBladeXidao_name_userForm" name="array_InformDetailBladeXidao_name"/>
    

      <input type="hidden" id="isPMKNS_userForm" name="isPMKNS"/>
      <input type="hidden" id="ISOPTextBladeXidao_userForm" name="ISOPTextBladeXidao"/>
      <input type="hidden" id="ISOMTextBladeXidao_userForm" name="ISOMTextBladeXidao"/>
      <input type="hidden" id="ISOKTextBladeXidao_userForm" name="ISOKTextBladeXidao"/>
      <input type="hidden" id="ISONTextBladeXidao_userForm" name="ISONTextBladeXidao"/>
      <input type="hidden" id="ISOSTextBladeXidao_userForm" name="ISOSTextBladeXidao"/>
	  
	  <input type="hidden" name="id_XidaoBlade" id="id_XidaoBlade_userForm" value="${(xidaoBlade.id_XidaoBlade == null || xidaoBlade.id_XidaoBlade == '') ? 0 : xidaoBlade.id_XidaoBlade}"/>
	  <li>
	    <span id="lititle">刀片编号</span>
	    <input name="NumberXidaoBlade" id="NumberXidaoBlade_userForm" type="text" value="${xidaoBlade.NumberXidaoBlade }" class="input" maxlength="10" />
	  </li>
	  <li>
	    <span id="lititle">刀片类型</span>
	    <!-- 刀片类型(1 外圆切削 2 内孔切削 3 超硬刀具 4 重型加工刀片)  -->
		<select name="TypeBTADrill" id="TypeBTADrill_userForm" onChange="" class="select">
		  <option value="1" ${xidaoBlade.TypeBTADrill == 1 ? 'selected' : '' }>外圆切削</option>
		  <option value="2" ${xidaoBlade.TypeBTADrill == 2 ? 'selected' : '' }>内孔切削</option>
		  <option value="3" ${xidaoBlade.TypeBTADrill == 3 ? 'selected' : '' }>超硬刀具</option>
		  <option value="4" ${xidaoBlade.TypeBTADrill == 4 ? 'selected' : '' }>重型加工刀片</option>
		</select>
	  </li>
	  <li>
	    <span id="lititle">刀片名称</span>
	    <input name="NameXidaoBlade" id="NameXidaoBlade_userForm" type="text" value="${xidaoBlade.NameXidaoBlade }" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">ISO基准刀片</span>
	    <input name="ISOBladeXidao" id="ISOBladeXidao_userForm" type="text" value="${xidaoBlade.ISOBladeXidao }" class="input" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">刀片涂层</span>
	    <input name="ToolCoatBladeXidao" id="ToolCoatBladeXidao_userForm" type="text" value="${xidaoBlade.ToolCoatBladeXidao }" class="input" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">刀具材料</span>
	    <input name="ToolMaterialBladeXidao" id="ToolMaterialBladeXidao_userForm" type="text" value="${xidaoBlade.ToolMaterialBladeXidao }" class="input" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">加工类别</span>
	    <!-- 加工类别(1 精加工 2 粗加工 3 半精加工) -->
		<select name="MachiningTypeBladeXidao" id="MachiningTypeBladeXidao_userForm" class="select">
		  <option value="1" ${xidaoBlade.MachiningTypeBladeXidao == 1 ? 'selected' : '' }>精加工</option>
		  <option value="2" ${xidaoBlade.MachiningTypeBladeXidao == 2 ? 'selected' : '' }>粗加工</option>
		  <option value="3" ${xidaoBlade.MachiningTypeBladeXidao == 3 ? 'selected' : '' }>半精加工</option>
		</select>
	  </li>
	  <li>
	    <span id="lititle">刀片加工特点</span>
	    <input name="ToolBladeFeatureXidao" id="ToolBladeFeatureXidao_userForm" type="text" value="${xidaoBlade.ToolBladeFeatureXidao }" class="input" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">刀片厂商</span>
	    <input name="CompanyXidaoBlade" id="CompanyXidaoBlade_userForm" type="text" value="${xidaoBlade.CompanyXidaoBlade }" class="input" maxlength="250"/>
	  </li>
	   <li>
	    <span id="lititle">刀柄</span>
	    <input name="HolderInfo" id="HolderInfo_userForm" type="text" value="${xidaoBlade.HolderInfo }" class="input" maxlength="250"/>
	  </li>
	  <li class="block">
	    <span id="lititle">刀片角度信息：</span>
	    <div class="clear"></div>
	  </li>
	  <li>
	    <span id="lititle">前角</span>
	    <input name="QianjiaoBladeXidao" id="QianjiaoBladeXidao_userForm" type="text" value="${xidaoBlade.QianjiaoBladeXidao }" class="input"
	    onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" maxlength="10"/>
	  </li>
	  <li>
	    <span id="lititle">后角</span>
	    <input name="HoujiaoBladeXidao" id="HoujiaoBladeXidao_userForm" type="text" value="${xidaoBlade.HoujiaoBladeXidao }" class="input"
	    	   onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" maxlength="10"/>
	  </li>
	  <li>
	    <span id="lititle">刃倾角</span>
	    <input name="HoujisojiaoBladeXidao" id="HoujisojiaoBladeXidao_userForm" type="text" value="${xidaoBlade.HoujisojiaoBladeXidao }" class="input"
	    	   onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" maxlength="10"/>
	  </li>
	  <li>
	    <span id="lititle">刀尖圆弧半径</span>
	    <input name="NoseRadiusXidao" id="NoseRadiusXidao_userForm" type="text" value="${xidaoBlade.NoseRadiusXidao }" class="input"
	    	   onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" maxlength="10"/>
	  </li>
	  <li>
	    <span id="lititle">断屑槽类型</span>
	    <input name="BreakerBladeXidao" id="BreakerBladeXidao_userForm" type="text" value="${xidaoBlade.BreakerBladeXidao }" class="input" maxlength="100"/>
	    <div class="clear"></div>
	  </li>
	  <li>
	    <span id="lititle">加工材料</span>
	    <input name="MateriaBladeXidao" id="MateriaBladeXidao_userForm" type="text" value="${xidaoBlade.MateriaBladeXidao }" class="input" maxlength="500"/>
	    <div class="clear"></div>
	  </li>
	</form>
	<!-- 刀具图片 begin  -->
	  	<form action="/xidaoBlade/savePictureBladeXidao" name="pictureBladeXidaoForm" id="pictureBladeXidaoForm" method="post" enctype="multipart/form-data">
	  	
	  	<input type="hidden" id="isPMKNS_pictureBladeXidaoForm" name="isPMKNS"/>
  	    <input type="hidden" id="ISOPTextBladeXidao_pictureBladeXidaoForm" name="ISOPTextBladeXidao"/>
  	    <input type="hidden" id="ISOMTextBladeXidao_pictureBladeXidaoForm" name="ISOMTextBladeXidao"/>
  	    <input type="hidden" id="ISOKTextBladeXidao_pictureBladeXidaoForm" name="ISOKTextBladeXidao"/>
  	    <input type="hidden" id="ISONTextBladeXidao_pictureBladeXidaoForm" name="ISONTextBladeXidao"/>
  	    <input type="hidden" id="ISOSTextBladeXidao_pictureBladeXidaoForm" name="ISOSTextBladeXidao"/>
	  	    
	  	<input name="id_XidaoBlade" type="hidden" value="${(xidaoBlade.id_XidaoBlade == null || xidaoBlade.id_XidaoBlade == '') ? 0 : xidaoBlade.id_XidaoBlade}"/>
	    <input type="hidden" id="NumberXidaoBlade_pictureBladeXidaoForm" value="${xidaoBlade.NumberXidaoBlade }" class="input" name="NumberXidaoBlade"/>
	    <input type="hidden" id="TypeBTADrill_pictureBladeXidaoForm" value="${xidaoBlade.TypeBTADrill }" class="input" name="TypeBTADrill"/>
	    <input type="hidden" id="NameXidaoBlade_pictureBladeXidaoForm" value="${xidaoBlade.NameXidaoBlade }" class="input" name="NameXidaoBlade"/>
	    <input type="hidden" id="ISOBladeXidao_pictureBladeXidaoForm" value="${xidaoBlade.ISOBladeXidao }" class="input" name="ISOBladeXidao"/>
	    <input type="hidden" id="ToolCoatBladeXidao_pictureBladeXidaoForm" value="${xidaoBlade.ToolCoatBladeXidao }" class="input" name="ToolCoatBladeXidao"/>
	    <input type="hidden" id="ToolMaterialBladeXidao_pictureBladeXidaoForm" value="${xidaoBlade.ToolMaterialBladeXidao }" class="input" name="ToolMaterialBladeXidao"/>
	    <input type="hidden" id="MachiningTypeBladeXidao_pictureBladeXidaoForm" value="${xidaoBlade.MachiningTypeBladeXidao }" class="input" name="MachiningTypeBladeXidao"/>
	    <input type="hidden" id="ToolBladeFeatureXidao_pictureBladeXidaoForm" value="${xidaoBlade.ToolBladeFeatureXidao }" class="input" name="ToolBladeFeatureXidao"/>
	    <input type="hidden" id="CompanyXidaoBlade_pictureBladeXidaoForm" value="${xidaoBlade.CompanyXidaoBlade }" class="input" name="CompanyXidaoBlade"/>
	    <input type="hidden" id="QianjiaoBladeXidao_pictureBladeXidaoForm" value="${xidaoBlade.QianjiaoBladeXidao }" class="input" name="QianjiaoBladeXidao"/>
	    <input type="hidden" id="HoujiaoBladeXidao_pictureBladeXidaoForm" value="${xidaoBlade.HoujiaoBladeXidao }" class="input" name="HoujiaoBladeXidao"/>
	    <input type="hidden" id="HoujisojiaoBladeXidao_pictureBladeXidaoForm" value="${xidaoBlade.HoujisojiaoBladeXidao }" class="input" name="HoujisojiaoBladeXidao"/>
	    <input type="hidden" id="NoseRadiusXidao_pictureBladeXidaoForm" value="${xidaoBlade.NoseRadiusXidao }" class="input" name="NoseRadiusXidao"/>
	    <input type="hidden" id="BreakerBladeXidao_pictureBladeXidaoForm" value="${xidaoBlade.BreakerBladeXidao }" class="input" name="BreakerBladeXidao"/>
	    <input type="hidden" id="MateriaBladeXidao_pictureBladeXidaoForm" value="${xidaoBlade.MateriaBladeXidao }" class="input" name="MateriaBladeXidao"/>
	  	
	  <li class="block bor_t">
	    <span id="lititle">刀具图片</span>
	    <input type="hidden" value="${array_PictureBladeXidao == null ? '' : array_PictureBladeXidao }" id="array_PictureBladeXidao" name="array_PictureBladeXidao"/>
	    <input type="hidden" value="${array_PictureDetailBladeXidao == null ? '' : array_PictureDetailBladeXidao }"  name="array_PictureDetailBladeXidao"/>
	    <input type="hidden" value="${array_ApplicationBladeXidao == null ? '' : array_ApplicationBladeXidao }"  name="array_ApplicationBladeXidao"/>
	    <input type="hidden" value="${array_ApplicationBladeXidao_name == null ? '' : array_ApplicationBladeXidao_name }"  name="array_ApplicationBladeXidao_name"/>
	    <input type="hidden" value="${array_InformDetailBladeXidao == null ? '' : array_InformDetailBladeXidao }"  name="array_InformDetailBladeXidao"/>
	    <input type="hidden" value="${array_InformDetailBladeXidao_name == null ? '' : array_InformDetailBladeXidao_name }"  name="array_InformDetailBladeXidao_name"/>
	    <input type="file" accept="image/*" name="PictureBladeXidao" id="PictureBladeXidao" />
	    <input type="button" value="加载图片" class="btn" onclick="onSavePictureBladeXidaoList();"/>
	    <span id="span_PictureBladeXidaoList">
	      <c:forEach items="${xidaoBlade.pictureBladeXidaoList}" var="var" varStatus="vs">
	      	<div><img name='pictureBladeXidaos_img' width='100px' height='100px' src='<%=path%>/goods${var.url_PictureBladeXidao }' /><a class="btn btn_shanchu" onclick='onDelPictureBladeXidaoImg("${var.url_PictureBladeXidao }");'>删除</a><br/></div>
	      </c:forEach>
	    </span>
	  </li>
	  </form>
	  <!-- 刀具图片 end  -->
	  <!-- 详细图片 begin  -->
	  <form action="/xidaoBlade/savePictureDetailBladeXidao" name="pictureDetailBladeXidaoForm" id="pictureDetailBladeXidaoForm" method="post" enctype="multipart/form-data">
	  	<input type="hidden" id="isPMKNS_pictureDetailBladeXidaoForm" name="isPMKNS"/>
  	    <input type="hidden" id="ISOPTextBladeXidao_pictureDetailBladeXidaoForm" name="ISOPTextBladeXidao"/>
  	    <input type="hidden" id="ISOMTextBladeXidao_pictureDetailBladeXidaoForm" name="ISOMTextBladeXidao"/>
  	    <input type="hidden" id="ISOKTextBladeXidao_pictureDetailBladeXidaoForm" name="ISOKTextBladeXidao"/>
  	    <input type="hidden" id="ISONTextBladeXidao_pictureDetailBladeXidaoForm" name="ISONTextBladeXidao"/>
  	    <input type="hidden" id="ISOSTextBladeXidao_pictureDetailBladeXidaoForm" name="ISOSTextBladeXidao"/>
	  	    
	  	<input name="id_XidaoBlade" type="hidden" value="${(xidaoBlade.id_XidaoBlade == null || xidaoBlade.id_XidaoBlade == '') ? 0 : xidaoBlade.id_XidaoBlade}"/>
	    <input type="hidden" id="NumberXidaoBlade_pictureDetailBladeXidaoForm" value="${xidaoBlade.NumberXidaoBlade }" class="input" name="NumberXidaoBlade"/>
	    <input type="hidden" id="TypeBTADrill_pictureDetailBladeXidaoForm" value="${xidaoBlade.TypeBTADrill }" class="input" name="TypeBTADrill"/>
	    <input type="hidden" id="NameXidaoBlade_pictureDetailBladeXidaoForm" value="${xidaoBlade.NameXidaoBlade }" class="input" name="NameXidaoBlade"/>
	    <input type="hidden" id="ISOBladeXidao_pictureDetailBladeXidaoForm" value="${xidaoBlade.ISOBladeXidao }" class="input" name="ISOBladeXidao"/>
	    <input type="hidden" id="ToolCoatBladeXidao_pictureDetailBladeXidaoForm" value="${xidaoBlade.ToolCoatBladeXidao }" class="input" name="ToolCoatBladeXidao"/>
	    <input type="hidden" id="ToolMaterialBladeXidao_pictureDetailBladeXidaoForm" value="${xidaoBlade.ToolMaterialBladeXidao }" class="input" name="ToolMaterialBladeXidao"/>
	    <input type="hidden" id="MachiningTypeBladeXidao_pictureDetailBladeXidaoForm" value="${xidaoBlade.MachiningTypeBladeXidao }" class="input" name="MachiningTypeBladeXidao"/>
	    <input type="hidden" id="ToolBladeFeatureXidao_pictureDetailBladeXidaoForm" value="${xidaoBlade.ToolBladeFeatureXidao }" class="input" name="ToolBladeFeatureXidao"/>
	    <input type="hidden" id="CompanyXidaoBlade_pictureDetailBladeXidaoForm" value="${xidaoBlade.CompanyXidaoBlade }" class="input" name="CompanyXidaoBlade"/>
	    <input type="hidden" id="QianjiaoBladeXidao_pictureDetailBladeXidaoForm" value="${xidaoBlade.QianjiaoBladeXidao }" class="input" name="QianjiaoBladeXidao"/>
	    <input type="hidden" id="HoujiaoBladeXidao_pictureDetailBladeXidaoForm" value="${xidaoBlade.HoujiaoBladeXidao }" class="input" name="HoujiaoBladeXidao"/>
	    <input type="hidden" id="HoujisojiaoBladeXidao_pictureDetailBladeXidaoForm" value="${xidaoBlade.HoujisojiaoBladeXidao }" class="input" name="HoujisojiaoBladeXidao"/>
	    <input type="hidden" id="NoseRadiusXidao_pictureDetailBladeXidaoForm" value="${xidaoBlade.NoseRadiusXidao }" class="input" name="NoseRadiusXidao"/>
	    <input type="hidden" id="BreakerBladeXidao_pictureDetailBladeXidaoForm" value="${xidaoBlade.BreakerBladeXidao }" class="input" name="BreakerBladeXidao"/>
	    <input type="hidden" id="MateriaBladeXidao_pictureDetailBladeXidaoForm" value="${xidaoBlade.MateriaBladeXidao }" class="input" name="MateriaBladeXidao"/>
	  	
	  <li class="block bor_t">
	    <span id="lititle">详细图片</span>
	    <input type="hidden" value="${array_PictureBladeXidao == null ? '' : array_PictureBladeXidao }"  name="array_PictureBladeXidao"/>
	    <input type="hidden" value="${array_PictureDetailBladeXidao == null ? '' : array_PictureDetailBladeXidao }" id="array_PictureDetailBladeXidao" name="array_PictureDetailBladeXidao"/>
	    <input type="hidden" value="${array_ApplicationBladeXidao == null ? '' : array_ApplicationBladeXidao }"  name="array_ApplicationBladeXidao"/>
	    <input type="hidden" value="${array_ApplicationBladeXidao_name == null ? '' : array_ApplicationBladeXidao_name }"  name="array_ApplicationBladeXidao_name"/>
	    <input type="hidden" value="${array_InformDetailBladeXidao == null ? '' : array_InformDetailBladeXidao }"  name="array_InformDetailBladeXidao"/>
	    <input type="hidden" value="${array_InformDetailBladeXidao_name == null ? '' : array_InformDetailBladeXidao_name }"  name="array_InformDetailBladeXidao_name"/>
	    
	    <input type="file" accept="image/*" name="PictureDetailBladeXidao" id="PictureDetailBladeXidao" />
	    <input type="button" value="加载图片" class="btn" onclick="onSavePictureDetailBladeXidaoList();"/>
	    <span id="span_PictureDetailBladeXidaoList">
	      <c:forEach items="${xidaoBlade.pictureDetailBladeXidaoList}" var="var" varStatus="vs">
	      	<div><img name='pictureDetailBladeXidaos_img' width='100px' height='100px' src='<%=path%>/goods${var.url_PictureDetailBladeXidao }' />
	      	<a onclick='onDelPictureDetailBladeXidaoImg("${var.url_PictureDetailBladeXidao }");'>删除</a><br/></div>
	      </c:forEach>
	    </span>
	  </li>
	  </form>
	  <!-- 详细图片 end  -->
	  <!-- 详细信息 begin  -->
	  <form action="/xidaoBlade/saveInformDetailBladeXidao" name="informDetailBladeXidaoForm" id="informDetailBladeXidaoForm" method="post" enctype="multipart/form-data">
	  	<input type="hidden" id="isPMKNS_informDetailBladeXidaoForm" name="isPMKNS"/>
  	    <input type="hidden" id="ISOPTextBladeXidao_informDetailBladeXidaoForm" name="ISOPTextBladeXidao"/>
  	    <input type="hidden" id="ISOMTextBladeXidao_informDetailBladeXidaoForm" name="ISOMTextBladeXidao"/>
  	    <input type="hidden" id="ISOKTextBladeXidao_informDetailBladeXidaoForm" name="ISOKTextBladeXidao"/>
  	    <input type="hidden" id="ISONTextBladeXidao_informDetailBladeXidaoForm" name="ISONTextBladeXidao"/>
  	    <input type="hidden" id="ISOSTextBladeXidao_informDetailBladeXidaoForm" name="ISOSTextBladeXidao"/>
	  	    
	  	<input name="id_XidaoBlade" type="hidden" value="${(xidaoBlade.id_XidaoBlade == null || xidaoBlade.id_XidaoBlade == '') ? 0 : xidaoBlade.id_XidaoBlade}"/>
	    <input type="hidden" id="NumberXidaoBlade_informDetailBladeXidaoForm" value="${xidaoBlade.NumberXidaoBlade }" class="input" name="NumberXidaoBlade"/>
	    <input type="hidden" id="TypeBTADrill_informDetailBladeXidaoForm" value="${xidaoBlade.TypeBTADrill }" class="input" name="TypeBTADrill"/>
	    <input type="hidden" id="NameXidaoBlade_informDetailBladeXidaoForm" value="${xidaoBlade.NameXidaoBlade }" class="input" name="NameXidaoBlade"/>
	    <input type="hidden" id="ISOBladeXidao_informDetailBladeXidaoForm" value="${xidaoBlade.ISOBladeXidao }" class="input" name="ISOBladeXidao"/>
	    <input type="hidden" id="ToolCoatBladeXidao_informDetailBladeXidaoForm" value="${xidaoBlade.ToolCoatBladeXidao }" class="input" name="ToolCoatBladeXidao"/>
	    <input type="hidden" id="ToolMaterialBladeXidao_informDetailBladeXidaoForm" value="${xidaoBlade.ToolMaterialBladeXidao }" class="input" name="ToolMaterialBladeXidao"/>
	    <input type="hidden" id="MachiningTypeBladeXidao_informDetailBladeXidaoForm" value="${xidaoBlade.MachiningTypeBladeXidao }" class="input" name="MachiningTypeBladeXidao"/>
	    <input type="hidden" id="ToolBladeFeatureXidao_informDetailBladeXidaoForm" value="${xidaoBlade.ToolBladeFeatureXidao }" class="input" name="ToolBladeFeatureXidao"/>
	    <input type="hidden" id="CompanyXidaoBlade_informDetailBladeXidaoForm" value="${xidaoBlade.CompanyXidaoBlade }" class="input" name="CompanyXidaoBlade"/>
	    <input type="hidden" id="QianjiaoBladeXidao_informDetailBladeXidaoForm" value="${xidaoBlade.QianjiaoBladeXidao }" class="input" name="QianjiaoBladeXidao"/>
	    <input type="hidden" id="HoujiaoBladeXidao_informDetailBladeXidaoForm" value="${xidaoBlade.HoujiaoBladeXidao }" class="input" name="HoujiaoBladeXidao"/>
	    <input type="hidden" id="HoujisojiaoBladeXidao_informDetailBladeXidaoForm" value="${xidaoBlade.HoujisojiaoBladeXidao }" class="input" name="HoujisojiaoBladeXidao"/>
	    <input type="hidden" id="NoseRadiusXidao_informDetailBladeXidaoForm" value="${xidaoBlade.NoseRadiusXidao }" class="input" name="NoseRadiusXidao"/>
	    <input type="hidden" id="BreakerBladeXidao_informDetailBladeXidaoForm" value="${xidaoBlade.BreakerBladeXidao }" class="input" name="BreakerBladeXidao"/>
	    <input type="hidden" id="MateriaBladeXidao_informDetailBladeXidaoForm" value="${xidaoBlade.MateriaBladeXidao }" class="input" name="MateriaBladeXidao"/>
	  	
 	  <li class="block bor_t"> 
 	    <span id="lititle">详细信息</span>
 	    <input type="hidden" value="${array_PictureBladeXidao == null ? '' : array_PictureBladeXidao }"  name="array_PictureBladeXidao"/>
	    <input type="hidden" value="${array_PictureDetailBladeXidao == null ? '' : array_PictureDetailBladeXidao }"  name="array_PictureDetailBladeXidao"/>
	    <input type="hidden" value="${array_ApplicationBladeXidao == null ? '' : array_ApplicationBladeXidao }"  name="array_ApplicationBladeXidao"/>
	    <input type="hidden" value="${array_ApplicationBladeXidao_name == null ? '' : array_ApplicationBladeXidao_name }"  name="array_ApplicationBladeXidao_name"/>
	    <input type="hidden" value="${array_InformDetailBladeXidao == null ? '' : array_InformDetailBladeXidao }" id="array_InformDetailBladeXidao" name="array_InformDetailBladeXidao"/>
	    <input type="hidden" value="${array_InformDetailBladeXidao_name == null ? '' : array_InformDetailBladeXidao_name }" id="array_InformDetailBladeXidao_name" name="array_InformDetailBladeXidao_name"/>
	    
 	    
	    <input type="file" accept=".pdf" name="InformDetailBladeXidao" id="InformDetailBladeXidao" />
	    <input type="button" value="加载文件" class="btn" onclick="onSaveInformDetailBladeXidaoList();"/>
	    <span id="span_InformDetailBladeXidaoList">
	      <c:forEach items="${xidaoBlade.informDetailBladeXidaoList}" var="var" varStatus="vs">
	      	      	<div><span name='informDetailBladeXidaos_img' >${var.url_InformDetailBladeXidao }</span><a class="btn btn_shanchu" onclick='onDelInformDetailBladeXidaoImg("${var.url_InformDetailBladeXidao }");'>删除</a><br/></div>
	      </c:forEach>
	    </span>
 	  </li> 
 	  </form>
 	  <!-- 详细信息 end  -->
 	  <!-- 应用实例 begin  -->
 	  <form action="/xidaoBlade/saveApplicationBladeXidao" name="applicationBladeXidaoForm" id="applicationBladeXidaoForm" method="post" enctype="multipart/form-data">
 	  	<input type="hidden" id="isPMKNS_applicationBladeXidaoForm" name="isPMKNS"/>
  	    <input type="hidden" id="ISOPTextBladeXidao_applicationBladeXidaoForm" name="ISOPTextBladeXidao"/>
  	    <input type="hidden" id="ISOMTextBladeXidao_applicationBladeXidaoForm" name="ISOMTextBladeXidao"/>
  	    <input type="hidden" id="ISOKTextBladeXidao_applicationBladeXidaoForm" name="ISOKTextBladeXidao"/>
  	    <input type="hidden" id="ISONTextBladeXidao_applicationBladeXidaoForm" name="ISONTextBladeXidao"/>
  	    <input type="hidden" id="ISOSTextBladeXidao_applicationBladeXidaoForm" name="ISOSTextBladeXidao"/>
	  	    
	  	<input name="id_XidaoBlade" type="hidden" value="${(xidaoBlade.id_XidaoBlade == null || xidaoBlade.id_XidaoBlade == '') ? 0 : xidaoBlade.id_XidaoBlade}"/>
	    <input type="hidden" id="NumberXidaoBlade_applicationBladeXidaoForm" value="${xidaoBlade.NumberXidaoBlade }" class="input" name="NumberXidaoBlade"/>
	    <input type="hidden" id="TypeBTADrill_applicationBladeXidaoForm" value="${xidaoBlade.TypeBTADrill }" class="input" name="TypeBTADrill"/>
	    <input type="hidden" id="NameXidaoBlade_applicationBladeXidaoForm" value="${xidaoBlade.NameXidaoBlade }" class="input" name="NameXidaoBlade"/>
	    <input type="hidden" id="ISOBladeXidao_applicationBladeXidaoForm" value="${xidaoBlade.ISOBladeXidao }" class="input" name="ISOBladeXidao"/>
	    <input type="hidden" id="ToolCoatBladeXidao_applicationBladeXidaoForm" value="${xidaoBlade.ToolCoatBladeXidao }" class="input" name="ToolCoatBladeXidao"/>
	    <input type="hidden" id="ToolMaterialBladeXidao_applicationBladeXidaoForm" value="${xidaoBlade.ToolMaterialBladeXidao }" class="input" name="ToolMaterialBladeXidao"/>
	    <input type="hidden" id="MachiningTypeBladeXidao_applicationBladeXidaoForm" value="${xidaoBlade.MachiningTypeBladeXidao }" class="input" name="MachiningTypeBladeXidao"/>
	    <input type="hidden" id="ToolBladeFeatureXidao_applicationBladeXidaoForm" value="${xidaoBlade.ToolBladeFeatureXidao }" class="input" name="ToolBladeFeatureXidao"/>
	    <input type="hidden" id="CompanyXidaoBlade_applicationBladeXidaoForm" value="${xidaoBlade.CompanyXidaoBlade }" class="input" name="CompanyXidaoBlade"/>
	    <input type="hidden" id="QianjiaoBladeXidao_applicationBladeXidaoForm" value="${xidaoBlade.QianjiaoBladeXidao }" class="input" name="QianjiaoBladeXidao"/>
	    <input type="hidden" id="HoujiaoBladeXidao_applicationBladeXidaoForm" value="${xidaoBlade.HoujiaoBladeXidao }" class="input" name="HoujiaoBladeXidao"/>
	    <input type="hidden" id="HoujisojiaoBladeXidao_applicationBladeXidaoForm" value="${xidaoBlade.HoujisojiaoBladeXidao }" class="input" name="HoujisojiaoBladeXidao"/>
	    <input type="hidden" id="NoseRadiusXidao_applicationBladeXidaoForm" value="${xidaoBlade.NoseRadiusXidao }" class="input" name="NoseRadiusXidao"/>
	    <input type="hidden" id="BreakerBladeXidao_applicationBladeXidaoForm" value="${xidaoBlade.BreakerBladeXidao }" class="input" name="BreakerBladeXidao"/>
	    <input type="hidden" id="MateriaBladeXidao_applicationBladeXidaoForm" value="${xidaoBlade.MateriaBladeXidao }" class="input" name="MateriaBladeXidao"/>
	  	
 	  <li class="block bor_t"> 
 	    <span id="lititle">应用实例</span>
 	    <input type="hidden" value="${array_PictureBladeXidao == null ? '' : array_PictureBladeXidao }"  name="array_PictureBladeXidao"/>
	    <input type="hidden" value="${array_PictureDetailBladeXidao == null ? '' : array_PictureDetailBladeXidao }"  name="array_PictureDetailBladeXidao"/>
	    <input type="hidden" value="${array_ApplicationBladeXidao == null ? '' : array_ApplicationBladeXidao }" id="array_ApplicationBladeXidao" name="array_ApplicationBladeXidao"/>
	    <input type="hidden" value="${array_ApplicationBladeXidao_name == null ? '' : array_ApplicationBladeXidao_name }" id="array_ApplicationBladeXidao_name" name="array_ApplicationBladeXidao_name"/>
	    <input type="hidden" value="${array_InformDetailBladeXidao == null ? '' : array_InformDetailBladeXidao }"  name="array_InformDetailBladeXidao"/>
	    <input type="hidden" value="${array_InformDetailBladeXidao_name == null ? '' : array_InformDetailBladeXidao_name }"  name="array_InformDetailBladeXidao_name"/>
 	    
	    <input type="file" accept=".pdf" name="ApplicationBladeXidao" id="ApplicationBladeXidao" />
	    <input type="button" value="加载文件" class="btn" onclick="onSaveApplicationBladeXidaoList();"/>
	    <span id="span_ApplicationBladeXidaoList">
	      <c:forEach items="${xidaoBlade.applicationBladeXidaoList}" var="var" varStatus="vs">
	      	<div><span name='applicationBladeXidaos_img' >${var.url_ApplicationBladeXidao }</span><a class="btn btn_shanchu" onclick='onDelApplicationBladeXidaoImg("${var.url_ApplicationBladeXidao }");'>删除</a><br/></div>
	      
	      </c:forEach>
	    </span>
 	  </li> 
 	  </form>
 	  <!-- 应用实例 end  -->  
	  
	  <li class="block bor_t">
	    <span id="lititle">ISO材料加工信息</span>
	    <input name="isPMKNS" id="isPMKNS_text" type="hidden" value="${xidaoBlade.isPMKNS }" />
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
	  	<div id="div_ISOPTextBladeXidao" class="iso_infor" style="display: none;">
	  		<span id="lititle_ISOPTextBladeXidao">加工P参数</span>
	    	<textarea  cols="" rows="" class="textarea" id="ISOPTextBladeXidao" >${xidaoBlade.ISOPTextBladeXidao }</textarea>
	    	<a class="btn_shanc" onclick="delPMKNS('P');">删除</a>
	  	</div> 
	  	<div id="div_ISOMTextBladeXidao" class="iso_infor" style="display: none;">
	  		<span id="lititle_ISOMTextBladeXidao">加工M参数</span>
	    	<textarea  cols="" rows="" class="textarea" id="ISOMTextBladeXidao" >${xidaoBlade.ISOMTextBladeXidao }</textarea>
	    	<a class="btn_shanc" onclick="delPMKNS('M');">删除</a>
	  	</div> 
	  	<div id="div_ISOKTextBladeXidao" class="iso_infor" style="display: none;">
	  		<span id="lititle_ISOKTextBladeXidao">加工K参数</span>
	    	<textarea  cols="" rows="" class="textarea" id="ISOKTextBladeXidao" >${xidaoBlade.ISOKTextBladeXidao }</textarea>
	    	<a class="btn_shanc" onclick="delPMKNS('K');">删除</a>
	  	</div> 
	  	<div id="div_ISONTextBladeXidao" class="iso_infor" style="display: none;">
	  		<span id="lititle_ISONTextBladeXidao">加工N参数</span>
	    	<textarea  cols="" rows="" class="textarea" id="ISONTextBladeXidao" >${xidaoBlade.ISONTextBladeXidao }</textarea>
	    	<a class="btn_shanc" onclick="delPMKNS('N');">删除</a>
	  	</div> 
	  	<div id="div_ISOSTextBladeXidao" class="iso_infor" style="display: none;">
	  		<span id="lititle_ISOSTextBladeXidao">加工S参数</span>
	    	<textarea  cols="" rows="" class="textarea" id="ISOSTextBladeXidao" >${xidaoBlade.ISOSTextBladeXidao }</textarea>
	    	<a class="btn_shanc" onclick="delPMKNS('S');">删除</a>
	  	</div> 
	    <input type="hidden" name="ISOPTextBladeXidao" value="${xidaoBlade.ISOPTextBladeXidao }" id="ISOPTextBladeXidao"/> 
	    <input type="hidden" name="ISOMTextBladeXidao" value="${xidaoBlade.ISOMTextBladeXidao }" id="ISOMTextBladeXidao"/> 
	    <input type="hidden" name="ISOKTextBladeXidao" value="${xidaoBlade.ISOKTextBladeXidao }" id="ISOKTextBladeXidao"/> 
	    <input type="hidden" name="ISONTextBladeXidao" value="${xidaoBlade.ISONTextBladeXidao }" id="ISONTextBladeXidao"/> 
	    <input type="hidden" name="ISOSTextBladeXidao" value="${xidaoBlade.ISOSTextBladeXidao }" id="ISOSTextBladeXidao"/> 
	  </li>
	</ul>
</div>

</body>
</html>
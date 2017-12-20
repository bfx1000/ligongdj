<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Long date = System.currentTimeMillis();
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title></title>
	<meta name="description" content="overview & stats" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link href="<%=path%>/resources/css/index/style_a.css?v=<%=date%>" rel="stylesheet" type="text/css" />
	
	<!--[if IE 7]><link rel="stylesheet" href="/resources/css/font-awesome-ie7.min.css" /><![endif]-->
	<!--[if lt IE 9]><link rel="stylesheet" href="/resources/css/ace-ie.min.css" /><![endif]-->
	
	<script type="text/javascript" src="/resources/js/jquery-1.7.2.js"></script>
	<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
	
	<!--提示框-->
	<script type="text/javascript" src="/resources/js/jquery.tips.js"></script>
			
	<script type="text/javascript">
	// 	$(window.parent.hangge());
		$(document).ready(function(){
			//刀具图片
			var array_PictureBTADrill = $("#array_PictureBTADrill").val();
			if(array_PictureBTADrill != null && array_PictureBTADrill != ''){
				var pictureBTADrills = array_PictureBTADrill.split(',');
				var pictureBTADrills_str = '';
				for(var i = 0; i < pictureBTADrills.length; i++){
					if(pictureBTADrills[i] != null && pictureBTADrills[i] != ''){
						pictureBTADrills_str = pictureBTADrills_str + "<div><img name='pictureBTADrills_img' width='100px' height='100px' src='<%=path%>/goods"+pictureBTADrills[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureBTADrillImg(\""+pictureBTADrills[i]+"\");'>删除</a><br/></div>";
					}
				}
				$("#span_PictureBTADrillList").html(pictureBTADrills_str);
			}
			
			//详细图片
			var array_PictureDetailBTADrill = $("#array_PictureDetailBTADrill").val();
			if(array_PictureDetailBTADrill != null && array_PictureDetailBTADrill != ''){
				var pictureDetailBTADrills = array_PictureDetailBTADrill.split(',');
				var pictureDetailBTADrills_str = '';
				for(var i = 0; i < pictureDetailBTADrills.length; i++){
					if(pictureDetailBTADrills[i] != null && pictureDetailBTADrills[i] != ''){
						pictureDetailBTADrills_str = pictureDetailBTADrills_str + "<div><img name='pictureDetailBTADrills_img' width='100px' height='100px' src='<%=path%>/goods"+pictureDetailBTADrills[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureDetailBTADrillImg(\""+pictureDetailBTADrills[i]+"\");'>删除</a><br/></div>";
					}
				}
				$("#span_PictureDetailBTADrillList").html(pictureDetailBTADrills_str);
			}
			
			
			//应用实例
			var array_ApplicationBTADrill = $("#array_ApplicationBTADrill").val();
			var array_ApplicationBTADrill_name = $("#array_ApplicationBTADrill_name").val();
			if(array_ApplicationBTADrill != null && array_ApplicationBTADrill != ''){
				var applicationBTADrills = array_ApplicationBTADrill.split(',');
				var applicationBTADrills_name = array_ApplicationBTADrill_name.split(',');
				var applicationBTADrills_str = '';
				for(var i = 0; i < applicationBTADrills.length; i++){
					if(applicationBTADrills[i] != null && applicationBTADrills[i] != ''){
						applicationBTADrills_str = applicationBTADrills_str + "<div><span name='applicationBTADrills_img' url='"+applicationBTADrills[i]+"' >"+applicationBTADrills_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelApplicationBTADrillImg(\""+applicationBTADrills[i]+"\");'>删除</a><br/></div>";
					}
				}
				$("#span_ApplicationBTADrillList").html(applicationBTADrills_str);
			}
			
			
			//详细信息
			var array_InformDetailBTADrill = $("#array_InformDetailBTADrill").val();
			var array_InformDetailBTADrill_name = $("#array_InformDetailBTADrill_name").val();
			if(array_InformDetailBTADrill != null && array_InformDetailBTADrill != ''){
				var informDetailBTADrills = array_InformDetailBTADrill.split(',');
				var informDetailBTADrills_name = array_InformDetailBTADrill_name.split(',');
				var informDetailBTADrills_str = '';
	// 			var informDetailBTADrills_name_str = '';
				for(var i = 0; i < informDetailBTADrills.length; i++){
					if(informDetailBTADrills[i] != null && informDetailBTADrills[i] != ''){
						informDetailBTADrills_str = informDetailBTADrills_str + "<div><span name='informDetailBTADrills_img' url='"+informDetailBTADrills[i]+"' >" + informDetailBTADrills_name[i] + "</span><a class='btn btn_shanchu' onclick='onDelInformDetailBTADrillImg(\""+informDetailBTADrills[i]+"\");'>删除</a><br/></div>";
						
					}
				}
				$("#span_InformDetailBTADrillList").html(informDetailBTADrills_str);
			}
			
			var isPMKNS_text = $("#isPMKNS_text").val();

			if(isPMKNS_text.indexOf('P')==-1?false:true){//包含
				$("#div_ISOPTextBTADrill").show();
			}
			if(isPMKNS_text.indexOf('M')==-1?false:true){//包含
				$("#div_ISOMTextBTADrill").show();
			}
			if(isPMKNS_text.indexOf('K')==-1?false:true){//包含
				$("#div_ISOKTextBTADrill").show();
			}
			if(isPMKNS_text.indexOf('N')==-1?false:true){//包含
				$("#div_ISONTextBTADrill").show();
			}
			if(isPMKNS_text.indexOf('S')==-1?false:true){//包含
				$("#div_ISOSTextBTADrill").show();
			}
			
		});
		
		//保存
		function save(){
			
			$("#isPMKNS_userForm").val($("#isPMKNS_text").val());
		
			$("#ISOPTextBTADrill_userForm").val($("#ISOPTextBTADrill").val());
			$("#ISOMTextBTADrill_userForm").val($("#ISOMTextBTADrill").val());
			$("#ISOKTextBTADrill_userForm").val($("#ISOKTextBTADrill").val());
			$("#ISONTextBTADrill_userForm").val($("#ISONTextBTADrill").val());
			$("#ISOSTextBTADrill_userForm").val($("#ISOSTextBTADrill").val());
			
			$("#array_PictureBTADrill_userForm").val($("#array_PictureBTADrill").val());//刀具图片
			$("#array_PictureDetailBTADrill_userForm").val($("#array_PictureDetailBTADrill").val());//详细图片
			$("#array_ApplicationBTADrill_userForm").val($("#array_ApplicationBTADrill").val());//应用实例
			$("#array_ApplicationBTADrill_name_userForm").val($("#array_ApplicationBTADrill_name").val());//应用实例
			$("#array_InformDetailBTADrill_userForm").val($("#array_InformDetailBTADrill").val());//详细信息
			$("#array_InformDetailBTADrill_name_userForm").val($("#array_InformDetailBTADrill_name").val());//详细信息
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
			window.location.href='<%=path%>/toolBTAdrill/queryToolBTAdrillList';
		}
		
		//保存刀具图片
		function onSavePictureBTADrillList(){
			$("#isPMKNS_pictureBTADrillForm").val($("#isPMKNS_text").val());
			$("#ISOPTextBTADrill_pictureBTADrillForm").val($("#ISOPTextBTADrill").val());
			$("#ISOMTextBTADrill_pictureBTADrillForm").val($("#ISOMTextBTADrill").val());
			$("#ISOKTextBTADrill_pictureBTADrillForm").val($("#ISOKTextBTADrill").val());
			$("#ISONTextBTADrill_pictureBTADrillForm").val($("#ISONTextBTADrill").val());
			$("#ISOSTextBTADrill_pictureBTADrillForm").val($("#ISOSTextBTADrill").val());
			  	
		    $("#id_BTADrill_pictureBTADrillForm").val($("#id_BTADrill_userForm").val());
		    $("#NumberBTADrill_pictureBTADrillForm").val($("#NumberBTADrill_userForm").val());
		    $("#TypeBTADrill_pictureBTADrillForm").val($("#TypeBTADrill_userForm").val());
		    $("#NameBTADrill_pictureBTADrillForm").val($("#NameBTADrill_userForm").val());
		    $("#DiameterBTADrill_pictureBTADrillForm").val($("#DiameterBTADrill_userForm").val());
		    $("#MateriaBTAlDrill_pictureBTADrillForm").val($("#MateriaBTAlDrill_userForm").val());
		    $("#ToolMaterialBTADrill_pictureBTADrillForm").val($("#ToolMaterialBTADrill_userForm").val());
		    $("#ToolCoatBTADrill_pictureBTADrillForm").val($("#ToolCoatBTADrill_userForm").val());
		    $("#BreakerBTADrill_pictureBTADrillForm").val($("#BreakerBTADrill_userForm").val());
		    $("#CompanyBTADrill_pictureBTADrillForm").val($("#CompanyBTADrill_userForm").val());
		    
			$("#pictureBTADrillForm").submit();
		}
		
		//删除刀具图片
		function onDelPictureBTADrillImg(url_pictureBTADrill){
			var array_PictureBTADrill = $("#array_PictureBTADrill").val();
			array_PictureBTADrill = array_PictureBTADrill.replace(url_pictureBTADrill,'');
			$("#array_PictureBTADrill").val(array_PictureBTADrill);
			var img_array = $("img[name='pictureBTADrills_img']");
			for(var i=0;i<img_array.length;i++){
				if($(img_array[i]).attr("src") == "/goods" + url_pictureBTADrill){
					$(img_array[i]).parent().remove();
				}
			}
		}
		
		//保存详细图片
		function onSavePictureDetailBTADrillList(){
			$("#isPMKNS_pictureDetailBTADrillForm").val($("#isPMKNS_text").val());
			$("#ISOPTextBTADrill_pictureDetailBTADrillForm").val($("#ISOPTextBTADrill").val());
			$("#ISOMTextBTADrill_pictureDetailBTADrillForm").val($("#ISOMTextBTADrill").val());
			$("#ISOKTextBTADrill_pictureDetailBTADrillForm").val($("#ISOKTextBTADrill").val());
			$("#ISONTextBTADrill_pictureDetailBTADrillForm").val($("#ISONTextBTADrill").val());
			$("#ISOSTextBTADrill_pictureDetailBTADrillForm").val($("#ISOSTextBTADrill").val());
			  	
		    $("#id_BTADrill_pictureDetailBTADrillForm").val($("#id_BTADrill_userForm").val());
		    $("#NumberBTADrill_pictureDetailBTADrillForm").val($("#NumberBTADrill_userForm").val());
		    $("#TypeBTADrill_pictureDetailBTADrillForm").val($("#TypeBTADrill_userForm").val());
		    $("#NameBTADrill_pictureDetailBTADrillForm").val($("#NameBTADrill_userForm").val());
		    $("#DiameterBTADrill_pictureDetailBTADrillForm").val($("#DiameterBTADrill_userForm").val());
		    $("#MateriaBTAlDrill_pictureDetailBTADrillForm").val($("#MateriaBTAlDrill_userForm").val());
		    $("#ToolMaterialBTADrill_pictureDetailBTADrillForm").val($("#ToolMaterialBTADrill_userForm").val());
		    $("#ToolCoatBTADrill_pictureDetailBTADrillForm").val($("#ToolCoatBTADrill_userForm").val());
		    $("#BreakerBTADrill_pictureDetailBTADrillForm").val($("#BreakerBTADrill_userForm").val());
		    $("#CompanyBTADrill_pictureDetailBTADrillForm").val($("#CompanyBTADrill_userForm").val());
		    
			$("#pictureDetailBTADrillForm").submit();
		}
		
		//删除详细图片
		function onDelPictureDetailBTADrillImg(url_pictureDetailBTADrill){
			var array_PictureDetailBTADrill = $("#array_PictureDetailBTADrill").val();
			array_PictureDetailBTADrill = array_PictureDetailBTADrill.replace(url_pictureDetailBTADrill,'');
			$("#array_PictureDetailBTADrill").val(array_PictureDetailBTADrill);
			var img_array = $("img[name='pictureDetailBTADrills_img']");
			for(var i=0;i<img_array.length;i++){
				if($(img_array[i]).attr("src") == "/goods" + url_pictureDetailBTADrill){
					$(img_array[i]).parent().remove();
				}
			}
		}
		
		//保存应用实例
		function onSaveApplicationBTADrillList(){
			$("#isPMKNS_applicationBTADrillForm").val($("#isPMKNS_text").val());
			$("#ISOPTextBTADrill_applicationBTADrillForm").val($("#ISOPTextBTADrill").val());
			$("#ISOMTextBTADrill_applicationBTADrillForm").val($("#ISOMTextBTADrill").val());
			$("#ISOKTextBTADrill_applicationBTADrillForm").val($("#ISOKTextBTADrill").val());
			$("#ISONTextBTADrill_applicationBTADrillForm").val($("#ISONTextBTADrill").val());
			$("#ISOSTextBTADrill_applicationBTADrillForm").val($("#ISOSTextBTADrill").val());
			  	
		    $("#id_BTADrill_applicationBTADrillForm").val($("#id_BTADrill_userForm").val());
		    $("#NumberBTADrill_applicationBTADrillForm").val($("#NumberBTADrill_userForm").val());
		    $("#TypeBTADrill_applicationBTADrillForm").val($("#TypeBTADrill_userForm").val());
		    $("#NameBTADrill_applicationBTADrillForm").val($("#NameBTADrill_userForm").val());
		    $("#DiameterBTADrill_applicationBTADrillForm").val($("#DiameterBTADrill_userForm").val());
		    $("#MateriaBTAlDrill_applicationBTADrillForm").val($("#MateriaBTAlDrill_userForm").val());
		    $("#ToolMaterialBTADrill_applicationBTADrillForm").val($("#ToolMaterialBTADrill_userForm").val());
		    $("#ToolCoatBTADrill_applicationBTADrillForm").val($("#ToolCoatBTADrill_userForm").val());
		    $("#BreakerBTADrill_applicationBTADrillForm").val($("#BreakerBTADrill_userForm").val());
		    $("#CompanyBTADrill_applicationBTADrillForm").val($("#CompanyBTADrill_userForm").val());
		    
			$("#applicationBTADrillForm").submit();
		}
		
		//删除应用实例
		function onDelApplicationBTADrillImg(url_applicationBTADrill){
		
			var array_ApplicationBTADrill = $("#array_ApplicationBTADrill").val();
			array_ApplicationBTADrill = array_ApplicationBTADrill.replace(url_applicationBTADrill,'');
			$("#array_ApplicationBTADrill").val(array_ApplicationBTADrill);
			var img_array = $("span[name='applicationBTADrills_img']");
			for(var i=0;i<img_array.length;i++){
				if($(img_array[i]).attr("url") == url_applicationBTADrill){
					$(img_array[i]).parent().remove();
				}
			}
		}
		
		//保存详细信息
		function onSaveInformDetailBTADrillList(){
			$("#isPMKNS_informDetailBTADrillForm").val($("#isPMKNS_text").val());
			$("#ISOPTextBTADrill_informDetailBTADrillForm").val($("#ISOPTextBTADrill").val());
			$("#ISOMTextBTADrill_informDetailBTADrillForm").val($("#ISOMTextBTADrill").val());
			$("#ISOKTextBTADrill_informDetailBTADrillForm").val($("#ISOKTextBTADrill").val());
			$("#ISONTextBTADrill_informDetailBTADrillForm").val($("#ISONTextBTADrill").val());
			$("#ISOSTextBTADrill_informDetailBTADrillForm").val($("#ISOSTextBTADrill").val());
			  	
		    $("#id_BTADrill_informDetailBTADrillForm").val($("#id_BTADrill_userForm").val());
		    $("#NumberBTADrill_informDetailBTADrillForm").val($("#NumberBTADrill_userForm").val());
		    $("#TypeBTADrill_informDetailBTADrillForm").val($("#TypeBTADrill_userForm").val());
		    $("#NameBTADrill_informDetailBTADrillForm").val($("#NameBTADrill_userForm").val());
		    $("#DiameterBTADrill_informDetailBTADrillForm").val($("#DiameterBTADrill_userForm").val());
		    $("#MateriaBTAlDrill_informDetailBTADrillForm").val($("#MateriaBTAlDrill_userForm").val());
		    $("#ToolMaterialBTADrill_informDetailBTADrillForm").val($("#ToolMaterialBTADrill_userForm").val());
		    $("#ToolCoatBTADrill_informDetailBTADrillForm").val($("#ToolCoatBTADrill_userForm").val());
		    $("#BreakerBTADrill_informDetailBTADrillForm").val($("#BreakerBTADrill_userForm").val());
		    $("#CompanyBTADrill_informDetailBTADrillForm").val($("#CompanyBTADrill_userForm").val());
		    
			$("#informDetailBTADrillForm").submit();
		}
		
		//删除详细信息
		function onDelInformDetailBTADrillImg(url_informDetailBTADrill){
			var array_InformDetailBTADrill = $("#array_InformDetailBTADrill").val();
			array_InformDetailBTADrill = array_InformDetailBTADrill.replace(url_informDetailBTADrill,'');
			$("#array_InformDetailBTADrill").val(array_InformDetailBTADrill);
			var img_array = $("span[name='informDetailBTADrills_img']");
			for(var i=0;i<img_array.length;i++){
				if($(img_array[i]).attr("url") == url_informDetailBTADrill){
					$(img_array[i]).parent().remove();
				}
			}
		}
		
		//增加ISO材料加工信息
		function addPMKNS(){
			var isPMKNS = $("#isPMKNS").val();	
			$("#div_ISO" + isPMKNS + "TextBTADrill").show();
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
		
		
		//更改ISO材料加工信息
		function onChangePMKNS(){
			
			
			/* var isPMKNS = $("#isPMKNS").val(); */
			/* $("#lititle_ISOTextBTADrill").text("加工" + isPMKNS + "参数"); */
					
		}
		
	</script>
</head>
<body>
	<a class="btn" onclick="save();">保存</a>
	<a class="btn" onclick="onClose();">返回</a>
	<input type="hidden" id="turn_url_id" value="${turn_url}"/>

  
  <div class="content_box_text">
	<ul class="box_text">
	<form action="/toolBTAdrill/saveToolBTAdrill" name="userForm" id="userForm" method="post">
	  	    <input type="hidden" id="array_PictureBTADrill_userForm" name="array_PictureBTADrill"/>
	  	    <input type="hidden" id="array_PictureDetailBTADrill_userForm" name="array_PictureDetailBTADrill"/>
	  	    <input type="hidden" id="array_ApplicationBTADrill_userForm" name="array_ApplicationBTADrill"/>
	  	    <input type="hidden" id="array_ApplicationBTADrill_name_userForm" name="array_ApplicationBTADrill_name"/>
	  	    <input type="hidden" id="array_InformDetailBTADrill_userForm" name="array_InformDetailBTADrill"/>
	  	    <input type="hidden" id="array_InformDetailBTADrill_name_userForm" name="array_InformDetailBTADrill_name"/>
	  	    
		
	  	    <input type="hidden" id="isPMKNS_userForm" name="isPMKNS"/>
	  	    <input type="hidden" id="ISOPTextBTADrill_userForm" name="ISOPTextBTADrill"/>
	  	    <input type="hidden" id="ISOMTextBTADrill_userForm" name="ISOMTextBTADrill"/>
	  	    <input type="hidden" id="ISOKTextBTADrill_userForm" name="ISOKTextBTADrill"/>
	  	    <input type="hidden" id="ISONTextBTADrill_userForm" name="ISONTextBTADrill"/>
	  	    <input type="hidden" id="ISOSTextBTADrill_userForm" name="ISOSTextBTADrill"/>
	  
	  <input type="hidden" name="id_BTADrill" id="id_BTADrill_userForm" value="${(toolBTAdrill.id_BTADrill == null || toolBTAdrill.id_BTADrill == '') ? 0 : toolBTAdrill.id_BTADrill}"/>
	  <li>
	    <span id="lititle">钻头编号</span>
	    <input type="text" id="NumberBTADrill_userForm" value="${toolBTAdrill.NumberBTADrill }" class="input" name="NumberBTADrill" maxlength="100" />
	  </li>
	  <li><span id="lititle">钻头类型</span>
		<select name="TypeBTADrill" onChange="" class="select" id="TypeBTADrill_userForm" >
		  <option value="1" ${toolBTAdrill.TypeBTADrill == 1 ? 'selected' : '' }>焊接钻头</option>
		  <option value="2" ${toolBTAdrill.TypeBTADrill == 2 ? 'selected' : '' }>可转位钻头</option>
		</select>
	  </li>
	  <li>
	    <span id="lititle">钻头名称</span>
	    <input type="text" id="NameBTADrill_userForm" value="${toolBTAdrill.NameBTADrill}" class="input" name="NameBTADrill" maxlength="50" />
	  </li>
	  <li>
	    <span id="lititle">加工直径</span>
	    <input type="text" id="DiameterBTADrill_userForm" value="${toolBTAdrill.DiameterBTADrill}" class="input" name="DiameterBTADrill"
	    	   maxlength="100" />
	  </li>
	  <li>
	    <span id="lititle">加工材料</span>
	    <input type="text" id="MateriaBTAlDrill_userForm" value="${toolBTAdrill.MateriaBTAlDrill}" class="input" name="MateriaBTAlDrill" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">刀具材料</span>
	    <input type="text" id="ToolMaterialBTADrill_userForm" value="${toolBTAdrill.ToolMaterialBTADrill}" class="input" name="ToolMaterialBTADrill" maxlength="250"/>
	  </li>
	  <li>
	    <span id="lititle">刀具涂层</span>
	    <input type="text" id="ToolCoatBTADrill_userForm" value="${toolBTAdrill.ToolCoatBTADrill}" class="input" name="ToolCoatBTADrill" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">断屑槽类型</span>
	    <input type="text" id="BreakerBTADrill_userForm" value="${toolBTAdrill.BreakerBTADrill}" class="input" name="BreakerBTADrill" maxlength="250"/>
	  </li>
	  <li>
	    <span id="lititle">生产厂家</span>
	    <input type="text" id="CompanyBTADrill_userForm" value="${toolBTAdrill.CompanyBTADrill}" class="input" name="CompanyBTADrill" maxlength="100"/>
	  </li>
	  	</form>
	  	<!-- 刀具图片 begin  -->
	  	<form action="/toolBTAdrill/savePictureBTADrill" name="pictureBTADrillForm" id="pictureBTADrillForm" method="post" enctype="multipart/form-data">
	  	
	  	<input type="hidden" id="isPMKNS_pictureBTADrillForm" name="isPMKNS"/>
  	    <input type="hidden" id="ISOPTextBTADrill_pictureBTADrillForm" name="ISOPTextBTADrill"/>
  	    <input type="hidden" id="ISOMTextBTADrill_pictureBTADrillForm" name="ISOMTextBTADrill"/>
  	    <input type="hidden" id="ISOKTextBTADrill_pictureBTADrillForm" name="ISOKTextBTADrill"/>
  	    <input type="hidden" id="ISONTextBTADrill_pictureBTADrillForm" name="ISONTextBTADrill"/>
  	    <input type="hidden" id="ISOSTextBTADrill_pictureBTADrillForm" name="ISOSTextBTADrill"/>
	  	    
	  	<input name="id_BTADrill" type="hidden" value="${(toolBTAdrill.id_BTADrill == null || toolBTAdrill.id_BTADrill == '') ? 0 : toolBTAdrill.id_BTADrill}"/>
	    <input type="hidden" id="NumberBTADrill_pictureBTADrillForm" value="${toolBTAdrill.NumberBTADrill }" class="input" name="NumberBTADrill"/>
	    <input type="hidden" id="TypeBTADrill_pictureBTADrillForm" value="${toolBTAdrill.TypeBTADrill }" class="input" name="TypeBTADrill"/>
	    <input type="hidden" id="NameBTADrill_pictureBTADrillForm" value="${toolBTAdrill.NameBTADrill}" class="input" name="NameBTADrill"/>
	    <input type="hidden" id="DiameterBTADrill_pictureBTADrillForm" value="${toolBTAdrill.DiameterBTADrill}" class="input" name="DiameterBTADrill"/>
	    <input type="hidden" id="MateriaBTAlDrill_pictureBTADrillForm" value="${toolBTAdrill.MateriaBTAlDrill}" class="input" name="MateriaBTAlDrill"/>
	    <input type="hidden" id="ToolMaterialBTADrill_pictureBTADrillForm" value="${toolBTAdrill.ToolMaterialBTADrill}" class="input" name="ToolMaterialBTADrill"/>
	    <input type="hidden" id="ToolCoatBTADrill_pictureBTADrillForm" value="${toolBTAdrill.ToolCoatBTADrill}" class="input" name="ToolCoatBTADrill"/>
	    <input type="hidden" id="BreakerBTADrill_pictureBTADrillForm" value="${toolBTAdrill.BreakerBTADrill}" class="input" name="BreakerBTADrill"/>
	    <input type="hidden" id="CompanyBTADrill_pictureBTADrillForm" value="${toolBTAdrill.CompanyBTADrill}" class="input" name="CompanyBTADrill"/>
	  	
	  <li class="block bor_t">
	    <span id="lititle">刀具图片</span>
	    <input type="hidden" value="${array_PictureBTADrill == null ? '' : array_PictureBTADrill }" id="array_PictureBTADrill" name="array_PictureBTADrill"/>
	    <input type="hidden" value="${array_PictureDetailBTADrill == null ? '' : array_PictureDetailBTADrill }"  name="array_PictureDetailBTADrill"/>
	    <input type="hidden" value="${array_ApplicationBTADrill == null ? '' : array_ApplicationBTADrill }"  name="array_ApplicationBTADrill"/>
	    <input type="hidden" value="${array_ApplicationBTADrill_name == null ? '' : array_ApplicationBTADrill_name }"  name="array_ApplicationBTADrill_name"/>
	    <input type="hidden" value="${array_InformDetailBTADrill == null ? '' : array_InformDetailBTADrill }"  name="array_InformDetailBTADrill"/>
	    <input type="hidden" value="${array_InformDetailBTADrill_name == null ? '' : array_InformDetailBTADrill_name }"  name="array_InformDetailBTADrill_name"/>
	    <input type="file" accept="image/*" name="PictureBTADrill" id="PictureBTADrill" />
	    <input type="button" value="加载图片" class="btn" onclick="onSavePictureBTADrillList();"/>
	    <span id="span_PictureBTADrillList">
	      <c:forEach items="${toolBTAdrill.pictureBTADrillList}" var="var" varStatus="vs">
	      	<div><img name='pictureBTADrills_img' width='100px' height='100px' src='<%=path%>/goods${var.url_PictureBTADrill }' /><a class="btn btn_shanchu" onclick='onDelPictureBTADrillImg("${var.url_PictureBTADrill }");'>删除</a><br/></div>
	      </c:forEach>
	    </span>
	  </li>
	  </form>
	  <!-- 刀具图片 end  -->
	  <!-- 详细图片 begin  -->
	  <form action="/toolBTAdrill/savePictureDetailBTADrill" name="pictureDetailBTADrillForm" id="pictureDetailBTADrillForm" method="post" enctype="multipart/form-data">
	  	<input type="hidden" id="isPMKNS_pictureDetailBTADrillForm" name="isPMKNS"/>
  	    <input type="hidden" id="ISOPTextBTADrill_pictureDetailBTADrillForm" name="ISOPTextBTADrill"/>
  	    <input type="hidden" id="ISOMTextBTADrill_pictureDetailBTADrillForm" name="ISOMTextBTADrill"/>
  	    <input type="hidden" id="ISOKTextBTADrill_pictureDetailBTADrillForm" name="ISOKTextBTADrill"/>
  	    <input type="hidden" id="ISONTextBTADrill_pictureDetailBTADrillForm" name="ISONTextBTADrill"/>
  	    <input type="hidden" id="ISOSTextBTADrill_pictureDetailBTADrillForm" name="ISOSTextBTADrill"/>
  	    
	  	<input name="id_BTADrill" type="hidden" value="${(toolBTAdrill.id_BTADrill == null || toolBTAdrill.id_BTADrill == '') ? 0 : toolBTAdrill.id_BTADrill}"/>
	    <input type="hidden" id="NumberBTADrill_pictureDetailBTADrillForm" value="${toolBTAdrill.NumberBTADrill }" class="input" name="NumberBTADrill"/>
	    <input type="hidden" id="TypeBTADrill_pictureDetailBTADrillForm" value="${toolBTAdrill.TypeBTADrill }" class="input" name="TypeBTADrill"/>
	    <input type="hidden" id="NameBTADrill_pictureDetailBTADrillForm" value="${toolBTAdrill.NameBTADrill}" class="input" name="NameBTADrill"/>
	    <input type="hidden" id="DiameterBTADrill_pictureDetailBTADrillForm" value="${toolBTAdrill.DiameterBTADrill}" class="input" name="DiameterBTADrill"/>
	    <input type="hidden" id="MateriaBTAlDrill_pictureDetailBTADrillForm" value="${toolBTAdrill.MateriaBTAlDrill}" class="input" name="MateriaBTAlDrill"/>
	    <input type="hidden" id="ToolMaterialBTADrill_pictureDetailBTADrillForm" value="${toolBTAdrill.ToolMaterialBTADrill}" class="input" name="ToolMaterialBTADrill"/>
	    <input type="hidden" id="ToolCoatBTADrill_pictureDetailBTADrillForm" value="${toolBTAdrill.ToolCoatBTADrill}" class="input" name="ToolCoatBTADrill"/>
	    <input type="hidden" id="BreakerBTADrill_pictureDetailBTADrillForm" value="${toolBTAdrill.BreakerBTADrill}" class="input" name="BreakerBTADrill"/>
	    <input type="hidden" id="CompanyBTADrill_pictureDetailBTADrillForm" value="${toolBTAdrill.CompanyBTADrill}" class="input" name="CompanyBTADrill"/>
	  	
	  <li class="block bor_t">
	    <span id="lititle">详细图片</span>
	    <input type="hidden" value="${array_PictureBTADrill == null ? '' : array_PictureBTADrill }"  name="array_PictureBTADrill"/>
	    <input type="hidden" value="${array_PictureDetailBTADrill == null ? '' : array_PictureDetailBTADrill }" id="array_PictureDetailBTADrill" name="array_PictureDetailBTADrill"/>
	    <input type="hidden" value="${array_ApplicationBTADrill == null ? '' : array_ApplicationBTADrill }"  name="array_ApplicationBTADrill"/>
	    <input type="hidden" value="${array_ApplicationBTADrill_name == null ? '' : array_ApplicationBTADrill_name }"  name="array_ApplicationBTADrill_name"/>
	    <input type="hidden" value="${array_InformDetailBTADrill == null ? '' : array_InformDetailBTADrill }"  name="array_InformDetailBTADrill"/>
	    <input type="hidden" value="${array_InformDetailBTADrill == null_name ? '' : array_InformDetailBTADrill_name }"  name="array_InformDetailBTADrill_name"/>
	    <input type="file" accept="image/*" name="PictureDetailBTADrill" id="PictureDetailBTADrill" />
	    <input type="button" value="加载图片" class="btn" onclick="onSavePictureDetailBTADrillList();"/>
	    <span id="span_PictureDetailBTADrillList">
	      <c:forEach items="${toolBTAdrill.pictureDetailBTADrillList}" var="var" varStatus="vs">
	      	<div><img name='pictureDetailBTADrills_img' width='100px' height='100px' src='<%=path%>/goods${var.url_PictureDetailBTADrill }' />
	      	<a onclick='onDelPictureDetailBTADrillImg("${var.url_PictureDetailBTADrill }");'>删除</a><br/></div>
	      </c:forEach>
	    </span>
	  </li>
	  </form>
	  <!-- 详细图片 end  -->
	  <!-- 详细信息 begin  -->
	  <form action="/toolBTAdrill/saveInformDetailBTADrill" name="informDetailBTADrillForm" id="informDetailBTADrillForm" method="post" enctype="multipart/form-data">
	  	<input type="hidden" id="isPMKNS_informDetailBTADrillForm" name="isPMKNS"/>
  	    <input type="hidden" id="ISOPTextBTADrill_informDetailBTADrillForm" name="ISOPTextBTADrill"/>
  	    <input type="hidden" id="ISOMTextBTADrill_informDetailBTADrillForm" name="ISOMTextBTADrill"/>
  	    <input type="hidden" id="ISOKTextBTADrill_informDetailBTADrillForm" name="ISOKTextBTADrill"/>
  	    <input type="hidden" id="ISONTextBTADrill_informDetailBTADrillForm" name="ISONTextBTADrill"/>
  	    <input type="hidden" id="ISOSTextBTADrill_informDetailBTADrillForm" name="ISOSTextBTADrill"/>
  	    
 	  	<input name="id_BTADrill" type="hidden" value="${(toolBTAdrill.id_BTADrill == null || toolBTAdrill.id_BTADrill == '') ? 0 : toolBTAdrill.id_BTADrill}"/>
	    <input type="hidden" id="NumberBTADrill_informDetailBTADrillForm" value="${toolBTAdrill.NumberBTADrill }" class="input" name="NumberBTADrill"/>
	    <input type="hidden" id="TypeBTADrill_informDetailBTADrillForm" value="${toolBTAdrill.TypeBTADrill }" class="input" name="TypeBTADrill"/>
	    <input type="hidden" id="NameBTADrill_informDetailBTADrillForm" value="${toolBTAdrill.NameBTADrill}" class="input" name="NameBTADrill"/>
	    <input type="hidden" id="DiameterBTADrill_informDetailBTADrillForm" value="${toolBTAdrill.DiameterBTADrill}" class="input" name="DiameterBTADrill"/>
	    <input type="hidden" id="MateriaBTAlDrill_informDetailBTADrillForm" value="${toolBTAdrill.MateriaBTAlDrill}" class="input" name="MateriaBTAlDrill"/>
	    <input type="hidden" id="ToolMaterialBTADrill_informDetailBTADrillForm" value="${toolBTAdrill.ToolMaterialBTADrill}" class="input" name="ToolMaterialBTADrill"/>
	    <input type="hidden" id="ToolCoatBTADrill_informDetailBTADrillForm" value="${toolBTAdrill.ToolCoatBTADrill}" class="input" name="ToolCoatBTADrill"/>
	    <input type="hidden" id="BreakerBTADrill_informDetailBTADrillForm" value="${toolBTAdrill.BreakerBTADrill}" class="input" name="BreakerBTADrill"/>
	    <input type="hidden" id="CompanyBTADrill_informDetailBTADrillForm" value="${toolBTAdrill.CompanyBTADrill}" class="input" name="CompanyBTADrill"/>
	  	
 	  <li class="block bor_t"> 
 	    <span id="lititle">详细信息</span>
 	    <input type="hidden" value="${array_PictureBTADrill == null ? '' : array_PictureBTADrill }"  name="array_PictureBTADrill"/>
	    <input type="hidden" value="${array_PictureDetailBTADrill == null ? '' : array_PictureDetailBTADrill }"  name="array_PictureDetailBTADrill"/>
	    <input type="hidden" value="${array_ApplicationBTADrill == null ? '' : array_ApplicationBTADrill }" id="array_ApplicationBTADrill" name="array_ApplicationBTADrill"/>
	    <input type="hidden" value="${array_ApplicationBTADrill_name == null ? '' : array_ApplicationBTADrill_name }" id="array_ApplicationBTADrill_name" name="array_ApplicationBTADrill_name"/>
	    <input type="hidden" value="${array_InformDetailBTADrill == null ? '' : array_InformDetailBTADrill }"  name="array_InformDetailBTADrill"/>
	    <input type="hidden" value="${array_InformDetailBTADrill_name == null ? '' : array_InformDetailBTADrill_name }"  name="array_InformDetailBTADrill_name"/>
	    <input type="file" accept=".pdf" name="InformDetailBTADrill" id="InformDetailBTADrill" />
	    <input type="button" value="加载文件" class="btn" onclick="onSaveInformDetailBTADrillList();"/>
	    <span id="span_InformDetailBTADrillList">
	      <c:forEach items="${toolBTAdrill.informDetailBTADrillList}" var="var" varStatus="vs">
	      	      	<div><span name='informDetailBTADrills_img' >${var.url_InformDetailBTADrill }</span><a class="btn btn_shanchu" onclick='onDelInformDetailBTADrillImg("${var.url_InformDetailBTADrill }");'>删除</a><br/></div>
	      
<!-- 	      	<div><img name='informDetailBTADrills_img' width='100px' height='100px' src='<%=path%>/goods${var.url_InformDetailBTADrill }' /><a onclick='onDelInformDetailBTADrillImg("${var.url_InformDetailBTADrill }");'>删除<a/><br/></div> -->
	      </c:forEach>
	    </span>
 	  </li> 
 	  </form>
 	  <!-- 详细信息 end  -->
 	  <!-- 应用实例 begin  -->
 	  <form action="/toolBTAdrill/saveApplicationBTADrill" name="applicationBTADrillForm" id="applicationBTADrillForm" method="post" enctype="multipart/form-data">
 	  	<input type="hidden" id="isPMKNS_applicationBTADrillForm" name="isPMKNS"/>
  	    <input type="hidden" id="ISOPTextBTADrill_applicationBTADrillForm" name="ISOPTextBTADrill"/>
  	    <input type="hidden" id="ISOMTextBTADrill_applicationBTADrillForm" name="ISOMTextBTADrill"/>
  	    <input type="hidden" id="ISOKTextBTADrill_applicationBTADrillForm" name="ISOKTextBTADrill"/>
  	    <input type="hidden" id="ISONTextBTADrill_applicationBTADrillForm" name="ISONTextBTADrill"/>
  	    <input type="hidden" id="ISOSTextBTADrill_applicationBTADrillForm" name="ISOSTextBTADrill"/>
  	    
 	  	<input name="id_BTADrill" type="hidden" value="${(toolBTAdrill.id_BTADrill == null || toolBTAdrill.id_BTADrill == '') ? 0 : toolBTAdrill.id_BTADrill}"/>
	    <input type="hidden" id="NumberBTADrill_applicationBTADrillForm" value="${toolBTAdrill.NumberBTADrill }" class="input" name="NumberBTADrill"/>
	    <input type="hidden" id="TypeBTADrill_applicationBTADrillForm" value="${toolBTAdrill.TypeBTADrill }" class="input" name="TypeBTADrill"/>
	    <input type="hidden" id="NameBTADrill_applicationBTADrillForm" value="${toolBTAdrill.NameBTADrill}" class="input" name="NameBTADrill"/>
	    <input type="hidden" id="DiameterBTADrill_applicationBTADrillForm" value="${toolBTAdrill.DiameterBTADrill}" class="input" name="DiameterBTADrill"/>
	    <input type="hidden" id="MateriaBTAlDrill_applicationBTADrillForm" value="${toolBTAdrill.MateriaBTAlDrill}" class="input" name="MateriaBTAlDrill"/>
	    <input type="hidden" id="ToolMaterialBTADrill_applicationBTADrillForm" value="${toolBTAdrill.ToolMaterialBTADrill}" class="input" name="ToolMaterialBTADrill"/>
	    <input type="hidden" id="ToolCoatBTADrill_applicationBTADrillForm" value="${toolBTAdrill.ToolCoatBTADrill}" class="input" name="ToolCoatBTADrill"/>
	    <input type="hidden" id="BreakerBTADrill_applicationBTADrillForm" value="${toolBTAdrill.BreakerBTADrill}" class="input" name="BreakerBTADrill"/>
	    <input type="hidden" id="CompanyBTADrill_applicationBTADrillForm" value="${toolBTAdrill.CompanyBTADrill}" class="input" name="CompanyBTADrill"/>
	  	
 	  <li class="block bor_t"> 
 	    <span id="lititle">应用实例</span>
 	    <input type="hidden" value="${array_PictureBTADrill == null ? '' : array_PictureBTADrill }"  name="array_PictureBTADrill"/>
	    <input type="hidden" value="${array_PictureDetailBTADrill == null ? '' : array_PictureDetailBTADrill }"  name="array_PictureDetailBTADrill"/>
	    <input type="hidden" value="${array_ApplicationBTADrill == null ? '' : array_ApplicationBTADrill }"  name="array_ApplicationBTADrill"/>
	    <input type="hidden" value="${array_ApplicationBTADrill_name == null ? '' : array_ApplicationBTADrill_name }"  name="array_ApplicationBTADrill_name"/>
	    <input type="hidden" value="${array_InformDetailBTADrill == null ? '' : array_InformDetailBTADrill }" id="array_InformDetailBTADrill" name="array_InformDetailBTADrill"/>
	    <input type="hidden" value="${array_InformDetailBTADrill_name == null ? '' : array_InformDetailBTADrill_name }" id="array_InformDetailBTADrill_name" name="array_InformDetailBTADrill_name"/>
	    <input type="file" accept=".pdf" name="ApplicationBTADrill" id="ApplicationBTADrill" />
	    <input type="button" value="加载文件" class="btn" onclick="onSaveApplicationBTADrillList();"/>
	    <span id="span_ApplicationBTADrillList">
	      <c:forEach items="${toolBTAdrill.applicationBTADrillList}" var="var" varStatus="vs">
	      	<div><span name='applicationBTADrills_img' >${var.url_ApplicationBTADrill }</span><a class="btn btn_shanchu" onclick='onDelApplicationBTADrillImg("${var.url_ApplicationBTADrill }");'>删除</a><br/></div>
	      
	      </c:forEach>
	    </span>
 	  </li> 
 	  </form>
 	  <!-- 应用实例 end  -->
	  <li class="block bor_t">
	    <span id="lititle">ISO材料加工信息</span>
	    <input name="isPMKNS" id="isPMKNS_text" type="hidden" value="${toolBTAdrill.isPMKNS }" />
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
	  	<div id="div_ISOPTextBTADrill" class="iso_infor" style="display: none;">
	  		<span id="lititle_ISOPTextBTADrill">加工P参数</span>
	    	<textarea  cols="" rows="" class="textarea" id="ISOPTextBTADrill" >${toolBTAdrill.ISOPTextBTADrill }</textarea>
	    	<a class="btn_shanc" onclick="delPMKNS('P');">删除</a>
	  	</div> 
	  	<div id="div_ISOMTextBTADrill" class="iso_infor" style="display: none;">
	  		<span id="lititle_ISOMTextBTADrill">加工M参数</span>
	    	<textarea  cols="" rows="" class="textarea" id="ISOMTextBTADrill" >${toolBTAdrill.ISOMTextBTADrill }</textarea>
	    	<a class="btn_shanc" onclick="delPMKNS('M');">删除</a>
	  	</div> 
	  	<div id="div_ISOKTextBTADrill" class="iso_infor" style="display: none;">
	  		<span id="lititle_ISOKTextBTADrill">加工K参数</span>
	    	<textarea  cols="" rows="" class="textarea" id="ISOKTextBTADrill" >${toolBTAdrill.ISOKTextBTADrill }</textarea>
	    	<a class="btn_shanc" onclick="delPMKNS('K');">删除</a>
	  	</div> 
	  	<div id="div_ISONTextBTADrill" class="iso_infor" style="display: none;">
	  		<span id="lititle_ISONTextBTADrill">加工N参数</span>
	    	<textarea  cols="" rows="" class="textarea" id="ISONTextBTADrill" >${toolBTAdrill.ISONTextBTADrill }</textarea>
	    	<a class="btn_shanc" onclick="delPMKNS('N');">删除</a>
	  	</div> 
	  	<div id="div_ISOSTextBTADrill" class="iso_infor" style="display: none;">
	  		<span id="lititle_ISOSTextBTADrill">加工S参数</span>
	    	<textarea  cols="" rows="" class="textarea" id="ISOSTextBTADrill" >${toolBTAdrill.ISOSTextBTADrill }</textarea>
	    	<a class="btn_shanc" onclick="delPMKNS('S');">删除</a>
	  	</div> 
	    <input type="hidden" name="ISOPTextBTADrill" value="${toolBTAdrill.ISOPTextBTADrill }" id="ISOPTextBTADrill"/> 
	    <input type="hidden" name="ISOMTextBTADrill" value="${toolBTAdrill.ISOMTextBTADrill }" id="ISOMTextBTADrill"/> 
	    <input type="hidden" name="ISOKTextBTADrill" value="${toolBTAdrill.ISOKTextBTADrill }" id="ISOKTextBTADrill"/> 
	    <input type="hidden" name="ISONTextBTADrill" value="${toolBTAdrill.ISONTextBTADrill }" id="ISONTextBTADrill"/> 
	    <input type="hidden" name="ISOSTextBTADrill" value="${toolBTAdrill.ISOSTextBTADrill }" id="ISOSTextBTADrill"/> 
	  </li>
	  
	  
	  
	  
	  
	  

	  <div class="clear"></div>

  </ul>
  
  
  
</div>
</form>
 		
<script type="text/javascript">
		
	$(function() {
		//单选框
		$(".chzn-select").chosen(); 
		$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
		//日期框
		$('.date-picker').datepicker();
	});
	function delPMKNS(val){
		var isPMKNS_text = $("#isPMKNS_text").val();
		isPMKNS_text = isPMKNS_text.replace(val,'');
		$("#isPMKNS_text").val(isPMKNS_text);
		$("#div_ISO" + val + "TextBTADrill").hide();
	}
</script>
	
</body>
</html>
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
	
	$(document).ready(function(){
		//刀具图片
		var array_PictureDesignTurningBlade = $("#array_PictureDesignTurningBlade").val();
		if(array_PictureDesignTurningBlade != null && array_PictureDesignTurningBlade != ''){
			var PictureDesignTurningBlades = array_PictureDesignTurningBlade.split(',');
			var PictureDesignTurningBlades_str = '';
			for(var i = 0; i < PictureDesignTurningBlades.length; i++){
				if(PictureDesignTurningBlades[i] != null && PictureDesignTurningBlades[i] != ''){
					PictureDesignTurningBlades_str = PictureDesignTurningBlades_str + "<div><img name='pictureDesignTurningBlades_img' width='100px' height='100px' src='<%=path%>/goods"+PictureDesignTurningBlades[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureDesignTurningBladeImg(\""+PictureDesignTurningBlades[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureDesignTurningBladeList").html(PictureDesignTurningBlades_str);
		}
		
		//Part
		var array_PartDesignTurningBlade = $("#array_PartDesignTurningBlade").val();
		var array_PartDesignTurningBlade_name = $("#array_PartDesignTurningBlade_name").val();
		if(array_PartDesignTurningBlade != null && array_PartDesignTurningBlade != ''){
			var PartDesignTurningBlades = array_PartDesignTurningBlade.split(',');
			var PartDesignTurningBlades_name = array_PartDesignTurningBlade_name.split(',');
			var PartDesignTurningBlades_str = '';
			for(var i = 0; i < PartDesignTurningBlades.length; i++){
				if(PartDesignTurningBlades[i] != null && PartDesignTurningBlades[i] != ''){
					PartDesignTurningBlades_str = PartDesignTurningBlades_str + "<div><span name='partDesignTurningBlades_img' url='"+PartDesignTurningBlades[i]+"' >"+PartDesignTurningBlades_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelPartDesignTurningBladeImg(\""+PartDesignTurningBlades[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PartDesignTurningBladeList").html(PartDesignTurningBlades_str);
		}
		
		//详细信息
		var array_InformDetailDesignTurningBlade = $("#array_InformDetailDesignTurningBlade").val();
		var array_InformDetailDesignTurningBlade_name = $("#array_InformDetailDesignTurningBlade_name").val();
		if(array_InformDetailDesignTurningBlade != null && array_InformDetailDesignTurningBlade != ''){
			var InformDetailDesignTurningBlades = array_InformDetailDesignTurningBlade.split(',');
			var InformDetailDesignTurningBlades_name = array_InformDetailDesignTurningBlade_name.split(',');
			var InformDetailDesignTurningBlades_str = '';
			for(var i = 0; i < InformDetailDesignTurningBlades.length; i++){
				if(InformDetailDesignTurningBlades[i] != null && InformDetailDesignTurningBlades[i] != ''){
					InformDetailDesignTurningBlades_str = InformDetailDesignTurningBlades_str + "<div><span name='informDetailDesignTurningBlades_img' url='"+InformDetailDesignTurningBlades[i]+"' >" + InformDetailDesignTurningBlades_name[i] + "</span><a class='btn btn_shanchu' onclick='onDelInformDetailDesignTurningBladeImg(\""+InformDetailDesignTurningBlades[i]+"\");'>删除</a><br/></div>";
					
				}
			}
			$("#span_InformDetailDesignTurningBladeList").html(InformDetailDesignTurningBlades_str);
		}
		
	});
	
	
	//保存
	function save(){
		
		
		$("#array_PictureDesignTurningBlade_userForm").val($("#array_PictureDesignTurningBlade").val());//刀具图片
		$("#array_InformDetailDesignTurningBlade_userForm").val($("#array_InformDetailDesignTurningBlade").val());//应用实例
		$("#array_InformDetailDesignTurningBlade_name_userForm").val($("#array_InformDetailDesignTurningBlade_name").val());//应用实例
		$("#array_PartDesignTurningBlade_userForm").val($("#array_PartDesignTurningBlade").val());//详细信息
		$("#array_PartDesignTurningBlade_name_userForm").val($("#array_PartDesignTurningBlade_name").val());//详细信息
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
		window.location.href='<%=path%>/designTurningBlade/queryDesignTurningBladeList';
	}
	
	//保存刀具图片
	function onSavePictureDesignTurningBladeList(){
	
		$("#id_DesignTurningBlade_pictureDesignTurningBladeForm").val($("#id_DesignTurningBlade_userForm").val());
		$("#DesignNumberTurningBlade_pictureDesignTurningBladeForm").val($("#DesignNumberTurningBlade_userForm").val());
		$("#DesignNameTurningBlade_pictureDesignTurningBladeForm").val($("#DesignNameTurningBlade_userForm").val());
		$("#DesignTypeBTADrill_pictureDesignTurningBladeForm").val($("#DesignTypeBTADrill_userForm").val());
		$("#DesignISOBladeTurning_pictureDesignTurningBladeForm").val($("#kw").val());
		$("#DesignMachiningTypeBladeTurning_pictureDesignTurningBladeForm").val($("#DesignMachiningTypeBladeTurning_userForm").val());
		$("#DesignCompanyTurningBlade_pictureDesignTurningBladeForm").val($("#DesignCompanyTurningBlade_userForm").val());
		$("#DesignToolBladeFeatureTurning_pictureDesignTurningBladeForm").val($("#DesignToolBladeFeatureTurning_userForm").val());
		$("#DesignQianjiaoBladeTurning_pictureDesignTurningBladeForm").val($("#DesignQianjiaoBladeTurning_userForm").val());
		$("#DesignHoujiaoBladeTurning_pictureDesignTurningBladeForm").val($("#DesignHoujiaoBladeTurning_userForm").val());
		$("#DesignRenqingjiaoBladeTurning_pictureDesignTurningBladeForm").val($("#DesignRenqingjiaoBladeTurning_userForm").val());
		$("#DesignNoseRadiusTurning_pictureDesignTurningBladeForm").val($("#DesignNoseRadiusTurning_userForm").val());
		$("#DesignBreakerBladeTurning_pictureDesignTurningBladeForm").val($("#DesignBreakerBladeTurning_userForm").val());
	    
		$("#PictureDesignTurningBladeForm").submit();
	}
	
	//删除刀具图片
	function onDelPictureDesignTurningBladeImg(url_PictureDesignTurningBlade){
		var array_PictureDesignTurningBlade = $("#array_PictureDesignTurningBlade").val();
		array_PictureDesignTurningBlade = array_PictureDesignTurningBlade.replace(url_PictureDesignTurningBlade,'');
		$("#array_PictureDesignTurningBlade").val(array_PictureDesignTurningBlade);
		var img_array = $("img[name='pictureDesignTurningBlades_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_PictureDesignTurningBlade){
				$(img_array[i]).parent().remove();
			}
		}
	}
	
	
	//保存应用实例
	function onSavePartDesignTurningBladeList(){
		
		$("#id_DesignTurningBlade_partDesignTurningBladeForm").val($("#id_DesignTurningBlade_userForm").val());
		$("#DesignNumberTurningBlade_partDesignTurningBladeForm").val($("#DesignNumberTurningBlade_userForm").val());
		$("#DesignNameTurningBlade_partDesignTurningBladeForm").val($("#DesignNameTurningBlade_userForm").val());
		$("#DesignTypeBTADrill_partDesignTurningBladeForm").val($("#DesignTypeBTADrill_userForm").val());
		$("#DesignISOBladeTurning_partDesignTurningBladeForm").val($("#kw").val());
		$("#DesignMachiningTypeBladeTurning_partDesignTurningBladeForm").val($("#DesignMachiningTypeBladeTurning_userForm").val());
		$("#DesignCompanyTurningBlade_partDesignTurningBladeForm").val($("#DesignCompanyTurningBlade_userForm").val());
		$("#DesignToolBladeFeatureTurning_partDesignTurningBladeForm").val($("#DesignToolBladeFeatureTurning_userForm").val());
		$("#DesignQianjiaoBladeTurning_partDesignTurningBladeForm").val($("#DesignQianjiaoBladeTurning_userForm").val());
		$("#DesignHoujiaoBladeTurning_partDesignTurningBladeForm").val($("#DesignHoujiaoBladeTurning_userForm").val());
		$("#DesignRenqingjiaoBladeTurning_partDesignTurningBladeForm").val($("#DesignRenqingjiaoBladeTurning_userForm").val());
		$("#DesignNoseRadiusTurning_partDesignTurningBladeForm").val($("#DesignNoseRadiusTurning_userForm").val());
		$("#DesignBreakerBladeTurning_partDesignTurningBladeForm").val($("#DesignBreakerBladeTurning_userForm").val());
	    
		$("#PartDesignTurningBladeForm").submit();
	}
	
	//删除应用实例
	function onDelPartDesignTurningBladeImg(url_PartDesignTurningBlade){
	
		var array_PartDesignTurningBlade = $("#array_PartDesignTurningBlade").val();
		array_PartDesignTurningBlade = array_PartDesignTurningBlade.replace(url_PartDesignTurningBlade,'');
		$("#array_PartDesignTurningBlade").val(array_PartDesignTurningBlade);
		var img_array = $("span[name='partDesignTurningBlades_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_PartDesignTurningBlade){
				$(img_array[i]).parent().remove();
			}
		}
	}
	
	//保存详细信息
	function onSaveInformDetailDesignTurningBladeList(){
	
		$("#id_DesignTurningBlade_informDetailDesignTurningBladeForm").val($("#id_DesignTurningBlade_userForm").val());
		$("#DesignNumberTurningBlade_informDetailDesignTurningBladeForm").val($("#DesignNumberTurningBlade_userForm").val());
		$("#DesignNameTurningBlade_informDetailDesignTurningBladeForm").val($("#DesignNameTurningBlade_userForm").val());
		$("#DesignTypeBTADrill_informDetailDesignTurningBladeForm").val($("#DesignTypeBTADrill_userForm").val());
		$("#DesignISOBladeTurning_informDetailDesignTurningBladeForm").val($("#kw").val());
		$("#DesignMachiningTypeBladeTurning_informDetailDesignTurningBladeForm").val($("#DesignMachiningTypeBladeTurning_userForm").val());
		$("#DesignCompanyTurningBlade_informDetailDesignTurningBladeForm").val($("#DesignCompanyTurningBlade_userForm").val());
		$("#DesignToolBladeFeatureTurning_informDetailDesignTurningBladeForm").val($("#DesignToolBladeFeatureTurning_userForm").val());
		$("#DesignQianjiaoBladeTurning_informDetailDesignTurningBladeForm").val($("#DesignQianjiaoBladeTurning_userForm").val());
		$("#DesignHoujiaoBladeTurning_informDetailDesignTurningBladeForm").val($("#DesignHoujiaoBladeTurning_userForm").val());
		$("#DesignRenqingjiaoBladeTurning_informDetailDesignTurningBladeForm").val($("#DesignRenqingjiaoBladeTurning_userForm").val());
		$("#DesignNoseRadiusTurning_informDetailDesignTurningBladeForm").val($("#DesignNoseRadiusTurning_userForm").val());
		$("#DesignBreakerBladeTurning_informDetailDesignTurningBladeForm").val($("#DesignBreakerBladeTurning_userForm").val());
	    
		$("#InformDetailDesignTurningBladeForm").submit();
	}
	
	//删除详细信息
	function onDelInformDetailDesignTurningBladeImg(url_InformDetailDesignTurningBlade){
		var array_InformDetailDesignTurningBlade = $("#array_InformDetailDesignTurningBlade").val();
		array_InformDetailDesignTurningBlade = array_InformDetailDesignTurningBlade.replace(url_InformDetailDesignTurningBlade,'');
		$("#array_InformDetailDesignTurningBlade").val(array_InformDetailDesignTurningBlade);
		var img_array = $("span[name='informDetailDesignTurningBlades_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_InformDetailDesignTurningBlade){
				$(img_array[i]).parent().remove();
			}
		}
	}
	

</script>
</head>
<body style="background:#fff;">
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text">
	<form action="/designTurningBlade/saveDesignTurningBlade" name="userForm" id="userForm" method="post">
	  <input type="hidden" id="array_PictureDesignTurningBlade_userForm" name="array_PictureDesignTurningBlade"/>
      <input type="hidden" id="array_InformDetailDesignTurningBlade_userForm" name="array_InformDetailDesignTurningBlade"/>
      <input type="hidden" id="array_InformDetailDesignTurningBlade_name_userForm" name="array_InformDetailDesignTurningBlade_name"/>
      <input type="hidden" id="array_PartDesignTurningBlade_userForm" name="array_PartDesignTurningBlade"/>
      <input type="hidden" id="array_PartDesignTurningBlade_name_userForm" name="array_PartDesignTurningBlade_name"/>
    
	  <input type="hidden" name="id_DesignTurningBlade" id="id_DesignTurningBlade_userForm" value="${designturningBlade.id_DesignTurningBlade}"/>
	  <li>
	    <span id="lititle">刀片编号</span>
	    <input name="DesignNumberTurningBlade" id="DesignNumberTurningBlade_userForm" type="text" value="${designturningBlade.DesignNumberTurningBlade }" class="input" maxlength="10" />
	  </li>
	  <li>
	    <span id="lititle">刀片类型</span>
	    <!-- 刀片类型(1 外圆切削 2 内孔切削 3 超硬刀具 4 重型加工刀片)  -->
		<select name="DesignTypeBTADrill" id="DesignTypeBTADrill_userForm" class="select">
		  <option value="1" ${designturningBlade.DesignTypeBTADrill == 1 ? 'selected' : '' }>外圆切削</option>
		  <option value="2" ${designturningBlade.DesignTypeBTADrill == 2 ? 'selected' : '' }>内孔切削</option>
		  <option value="3" ${designturningBlade.DesignTypeBTADrill == 3 ? 'selected' : '' }>超硬刀具</option>
		  <option value="4" ${designturningBlade.DesignTypeBTADrill == 4 ? 'selected' : '' }>重型加工刀片</option>
		</select>
	  </li>
	  <li>
	    <span id="lititle">刀片名称</span>
	    <input name="DesignNameTurningBlade" id="DesignNameTurningBlade_userForm" type="text" value="${designturningBlade.DesignNameTurningBlade }" class="input" maxlength="100"/>
	  </li>
	  <li class="append_wrap">
	    <span id="lititle">ISO基准刀片</span>
	    <div class="first">
	    	<input name="DesignISOBladeTurning" id="kw" onKeyup="getContent(this);" type="text" value="${designturningBlade.DesignISOBladeTurning }" class="input" maxlength="250" />
	  	</div>
	  <div id="append"></div>
	  </li>
	  <li>
	    <span id="lititle">加工类别</span>
	    <!-- 加工类别(1 精加工 2 粗加工 3 半精加工) -->
		<select name="DesignMachiningTypeBladeTurning" id="DesignMachiningTypeBladeTurning_userForm" class="select">
		  <option value="1" ${designturningBlade.DesignMachiningTypeBladeTurning == 1 ? 'selected' : '' }>精加工</option>
		  <option value="2" ${designturningBlade.DesignMachiningTypeBladeTurning == 2 ? 'selected' : '' }>粗加工</option>
		  <option value="3" ${designturningBlade.DesignMachiningTypeBladeTurning == 3 ? 'selected' : '' }>半精加工</option>
		</select>
	  </li>
	  <li>
	    <span id="lititle">刀片特点</span>
	    <input name="DesignToolBladeFeatureTurning" id="DesignToolBladeFeatureTurning_userForm" type="text" value="${designturningBlade.DesignToolBladeFeatureTurning }" class="input" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">刀片设计厂商</span>
	    <input name="DesignCompanyTurningBlade" id="DesignCompanyTurningBlade_userForm" type="text" value="${designturningBlade.DesignCompanyTurningBlade }" class="input" maxlength="250"/>
	  </li>
	   <li>
	    <span id="lititle">刀柄</span>
	    <input name="DesignHolderInfo" id="DesignHolderInfo_userForm" type="text" value="${designturningBlade.DesignHolderInfo }" class="input" maxlength="250"/>
	  </li>
	  <li class="block">
	    <span id="lititle">刀片角度信息：</span>
	    <div class="clear"></div>
	  </li>
	  <li>
	    <span id="lititle">前角</span>
	    <input name="DesignQianjiaoBladeTurning" id="DesignQianjiaoBladeTurning_userForm" type="text" value="${designturningBlade.DesignQianjiaoBladeTurning }" class="input"
	    onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" maxlength="10"/>
	  </li>
	  <li>
	    <span id="lititle">后角</span>
	    <input name="DesignHoujiaoBladeTurning" id="DesignHoujiaoBladeTurning_userForm" type="text" value="${designturningBlade.DesignHoujiaoBladeTurning }" class="input"
	    	   onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" maxlength="10"/>
	  </li>
	  <li>
	    <span id="lititle">刃倾角</span>
	    <input name="DesignRenqingjiaoBladeTurning" id="DesignRenqingjiaoBladeTurning_userForm" type="text" value="${designturningBlade.DesignRenqingjiaoBladeTurning }" class="input"
	    	   onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" maxlength="10"/>
	  </li>
	  <li>
	    <span id="lititle">刀尖圆弧半径</span>
	    <input name="DesignNoseRadiusTurning" id="DesignNoseRadiusTurning_userForm" type="text" value="${designturningBlade.DesignNoseRadiusTurning }" class="input"
	    	   onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" maxlength="10"/>
	  </li>
	  <li>
	    <span id="lititle">断屑槽类型</span>
	    <input name="DesignBreakerBladeTurning" id="DesignBreakerBladeTurning_userForm" type="text" value="${designturningBlade.DesignBreakerBladeTurning }" class="input" maxlength="100"/>
	    <div class="clear"></div>
	  </li>
	</form>
	<!-- 刀具图片 begin  -->
	  	<form action="/designTurningBlade/savePictureDesignTurningBlade" name="PictureDesignTurningBladeForm" id="PictureDesignTurningBladeForm" method="post" enctype="multipart/form-data">
	  	
	  	<input name="id_DesignTurningBlade" type="hidden" value="${(designturningBlade.id_DesignTurningBlade == null || designturningBlade.id_DesignTurningBlade == '') ? 0 : designturningBlade.id_DesignTurningBlade}"/>
	    <input type="hidden" id="DesignNumberTurningBlade_pictureDesignTurningBladeForm" value="" class="input" name="DesignNumberTurningBlade"/>
	    <input type="hidden" id="DesignNameTurningBlade_pictureDesignTurningBladeForm" value="" class="input" name="DesignNameTurningBlade"/>
	    <input type="hidden" id="DesignTypeBTADrill_pictureDesignTurningBladeForm" value="" class="input" name="DesignTypeBTADrill"/>
	    <input type="hidden" id="DesignISOBladeTurning_pictureDesignTurningBladeForm" value="" class="input" name="DesignISOBladeTurning"/>
	    <input type="hidden" id="DesignMachiningTypeBladeTurning_pictureDesignTurningBladeForm" value="" class="input" name="DesignMachiningTypeBladeTurning"/>
	    <input type="hidden" id="DesignCompanyTurningBlade_pictureDesignTurningBladeForm" value="" class="input" name="DesignCompanyTurningBlade"/>
	    <input type="hidden" id="DesignToolBladeFeatureTurning_pictureDesignTurningBladeForm" value="" class="input" name="DesignToolBladeFeatureTurning"/>
	    <input type="hidden" id="DesignQianjiaoBladeTurning_pictureDesignTurningBladeForm" value="" class="input" name="DesignQianjiaoBladeTurning"/>
	    <input type="hidden" id="DesignHoujiaoBladeTurning_pictureDesignTurningBladeForm" value="" class="input" name="DesignHoujiaoBladeTurning"/>
	    <input type="hidden" id="DesignRenqingjiaoBladeTurning_pictureDesignTurningBladeForm" value="" class="input" name="DesignRenqingjiaoBladeTurning"/>
	    <input type="hidden" id="DesignNoseRadiusTurning_pictureDesignTurningBladeForm" value="" class="input" name="DesignNoseRadiusTurning"/>
	    <input type="hidden" id="DesignBreakerBladeTurning_pictureDesignTurningBladeForm" value="" class="input" name="DesignBreakerBladeTurning"/>
	  	
	  <li class="block bor_t">
	    <span id="lititle">刀具图片</span>
	    <input type="hidden" value="${array_PictureDesignTurningBlade == null ? '' : array_PictureDesignTurningBlade }" id="array_PictureDesignTurningBlade" name="array_PictureDesignTurningBlade"/>
	    <input type="hidden" value="${array_PartDesignTurningBlade == null ? '' : array_PartDesignTurningBlade }"  name="array_PartDesignTurningBlade"/>
	    <input type="hidden" value="${array_PartDesignTurningBlade_name == null ? '' : array_PartDesignTurningBlade_name }"  name="array_PartDesignTurningBlade_name"/>
	    <input type="hidden" value="${array_InformDetailDesignTurningBlade == null ? '' : array_InformDetailDesignTurningBlade }"  name="array_InformDetailDesignTurningBlade"/>
	    <input type="hidden" value="${array_InformDetailDesignTurningBlade_name == null ? '' : array_InformDetailDesignTurningBlade_name }"  name="array_InformDetailDesignTurningBlade_name"/>
	    <input type="file" accept="image/*" name="PictureDesignTurningBlade" id="PictureDesignTurningBlade" />
	    <input type="button" value="加载图片" class="btn" onclick="onSavePictureDesignTurningBladeList();"/>
	    <span id="span_PictureDesignTurningBladeList">
	    </span>
	  </li>
	  </form>
	  <!-- 刀具图片 end  -->
	  <!-- 详细信息 begin  -->
	  <form action="/designTurningBlade/saveInformDetailDesignTurningBlade" name="InformDetailDesignTurningBladeForm" id="InformDetailDesignTurningBladeForm" method="post" enctype="multipart/form-data">
	  	    
	  	<input name="id_DesignTurningBlade" type="hidden" value="${(designturningBlade.id_DesignTurningBlade == null || designturningBlade.id_DesignTurningBlade == '') ? 0 : designturningBlade.id_DesignTurningBlade}"/>
	    <input type="hidden" id="DesignNumberTurningBlade_informDetailDesignTurningBladeForm" value="" class="input" name="DesignNumberTurningBlade"/>
	    <input type="hidden" id="DesignNameTurningBlade_informDetailDesignTurningBladeForm" value="" class="input" name="DesignNameTurningBlade"/>
	    <input type="hidden" id="DesignTypeBTADrill_informDetailDesignTurningBladeForm" value="" class="input" name="DesignTypeBTADrill"/>
	    <input type="hidden" id="DesignISOBladeTurning_informDetailDesignTurningBladeForm" value="" class="input" name="DesignISOBladeTurning"/>
	    <input type="hidden" id="DesignMachiningTypeBladeTurning_informDetailDesignTurningBladeForm" value="" class="input" name="DesignMachiningTypeBladeTurning"/>
	    <input type="hidden" id="DesignCompanyTurningBlade_informDetailDesignTurningBladeForm" value="" class="input" name="DesignCompanyTurningBlade"/>
	    <input type="hidden" id="DesignToolBladeFeatureTurning_informDetailDesignTurningBladeForm" value="" class="input" name="DesignToolBladeFeatureTurning"/>
	    <input type="hidden" id="DesignQianjiaoBladeTurning_informDetailDesignTurningBladeForm" value="" class="input" name="DesignQianjiaoBladeTurning"/>
	    <input type="hidden" id="DesignHoujiaoBladeTurning_informDetailDesignTurningBladeForm" value="" class="input" name="DesignHoujiaoBladeTurning"/>
	    <input type="hidden" id="DesignRenqingjiaoBladeTurning_informDetailDesignTurningBladeForm" value="" class="input" name="DesignRenqingjiaoBladeTurning"/>
	    <input type="hidden" id="DesignNoseRadiusTurning_informDetailDesignTurningBladeForm" value="" class="input" name="DesignNoseRadiusTurning"/>
	    <input type="hidden" id="DesignBreakerBladeTurning_informDetailDesignTurningBladeForm" value="" class="input" name="DesignBreakerBladeTurning"/>
	  	
 	  <li class="block bor_t"> 
 	  	<span id="lititle">详细信息</span>
 	    <input type="hidden" value="${array_PictureDesignTurningBlade == null ? '' : array_PictureDesignTurningBlade }" name="array_PictureDesignTurningBlade"/>
	    <input type="hidden" value="${array_PartDesignTurningBlade == null ? '' : array_PartDesignTurningBlade }"  name="array_PartDesignTurningBlade"/>
	    <input type="hidden" value="${array_PartDesignTurningBlade_name == null ? '' : array_PartDesignTurningBlade_name }"  name="array_PartDesignTurningBlade_name"/>
	    <input type="hidden" value="${array_InformDetailDesignTurningBlade == null ? '' : array_InformDetailDesignTurningBlade }"  name="array_InformDetailDesignTurningBlade" id="array_InformDetailDesignTurningBlade" />
	    <input type="hidden" value="${array_InformDetailDesignTurningBlade_name == null ? '' : array_InformDetailDesignTurningBlade_name }"  name="array_InformDetailDesignTurningBlade_name" id="array_InformDetailDesignTurningBlade_name" />
	    <input type="file" accept=".pdf" name="InformDetailDesignTurningBlade" id="InformDetailDesignTurningBlade" />
	    <input type="button" value="加载文件" class="btn" onclick="onSaveInformDetailDesignTurningBladeList();"/>
	    <span id="span_InformDetailDesignTurningBladeList">
	    </span>
 	  </li> 
 	  </form>
 	  <!-- 详细信息 end  -->
 	  <!-- 应用实例 begin  -->
 	  <form action="/designTurningBlade/savePartDesignTurningBlade" name="PartDesignTurningBladeForm" id="PartDesignTurningBladeForm" method="post" enctype="multipart/form-data">
	  	    
	  	<input name="id_DesignTurningBlade" type="hidden" value="${(designturningBlade.id_DesignTurningBlade == null || designturningBlade.id_DesignTurningBlade == '') ? 0 : designturningBlade.id_DesignTurningBlade}"/>
	    <input type="hidden" id="DesignNumberTurningBlade_partDesignTurningBladeForm" value="" class="input" name="DesignNumberTurningBlade"/>
	    <input type="hidden" id="DesignNameTurningBlade_partDesignTurningBladeForm" value="" class="input" name="DesignNameTurningBlade"/>
	    <input type="hidden" id="DesignTypeBTADrill_partDesignTurningBladeForm" value="" class="input" name="DesignTypeBTADrill"/>
	    <input type="hidden" id="DesignISOBladeTurning_partDesignTurningBladeForm" value="" class="input" name="DesignISOBladeTurning"/>
	    <input type="hidden" id="DesignMachiningTypeBladeTurning_partDesignTurningBladeForm" value="" class="input" name="DesignMachiningTypeBladeTurning"/>
	    <input type="hidden" id="DesignCompanyTurningBlade_partDesignTurningBladeForm" value="" class="input" name="DesignCompanyTurningBlade"/>
	    <input type="hidden" id="DesignToolBladeFeatureTurning_partDesignTurningBladeForm" value="" class="input" name="DesignToolBladeFeatureTurning"/>
	    <input type="hidden" id="DesignQianjiaoBladeTurning_partDesignTurningBladeForm" value="" class="input" name="DesignQianjiaoBladeTurning"/>
	    <input type="hidden" id="DesignHoujiaoBladeTurning_partDesignTurningBladeForm" value="" class="input" name="DesignHoujiaoBladeTurning"/>
	    <input type="hidden" id="DesignRenqingjiaoBladeTurning_partDesignTurningBladeForm" value="" class="input" name="DesignRenqingjiaoBladeTurning"/>
	    <input type="hidden" id="DesignNoseRadiusTurning_partDesignTurningBladeForm" value="" class="input" name="DesignNoseRadiusTurning"/>
	    <input type="hidden" id="DesignBreakerBladeTurning_partDesignTurningBladeForm" value="" class="input" name="DesignBreakerBladeTurning"/>
	  	
 	  <li class="block bor_t"> 
 	    <span id="lititle">part文件</span>
 	    <input type="hidden" value="${array_PictureDesignTurningBlade == null ? '' : array_PictureDesignTurningBlade }" name="array_PictureDesignTurningBlade"/>
	    <input type="hidden" value="${array_PartDesignTurningBlade == null ? '' : array_PartDesignTurningBlade }"  name="array_PartDesignTurningBlade" id="array_PartDesignTurningBlade" />
	    <input type="hidden" value="${array_PartDesignTurningBlade_name == null ? '' : array_PartDesignTurningBlade_name }"  name="array_PartDesignTurningBlade_name" id="array_PartDesignTurningBlade_name" />
	    <input type="hidden" value="${array_InformDetailDesignTurningBlade == null ? '' : array_InformDetailDesignTurningBlade }"  name="array_InformDetailDesignTurningBlade" />
	    <input type="hidden" value="${array_InformDetailDesignTurningBlade_name == null ? '' : array_InformDetailDesignTurningBlade_name }"  name="array_InformDetailDesignTurningBlade_name" />
	    <input type="file" name="PartDesignTurningBlade" id="PartDesignTurningBlade" />
	    <input type="button" value="加载文件" class="btn" onclick="onSavePartDesignTurningBladeList();"/>
	    <span id="span_PartDesignTurningBladeList">
	    </span>
 	  </li> 
 	  </form>
 	  <!-- 应用实例 end  -->  
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
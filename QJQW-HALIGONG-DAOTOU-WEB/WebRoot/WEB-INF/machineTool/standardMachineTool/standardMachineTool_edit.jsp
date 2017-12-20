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
		changeValue();
		
		//机床图片
		var array_PictureMachineInform = $("#array_PictureMachineInform").val();
		if(array_PictureMachineInform != null && array_PictureMachineInform != ''){
			var pictureMachineInforms = array_PictureMachineInform.split(',');
			var pictureMachineInforms_str = '';
			for(var i = 0; i < pictureMachineInforms.length; i++){
				if(pictureMachineInforms[i] != null && pictureMachineInforms[i] != ''){
					pictureMachineInforms_str = pictureMachineInforms_str + "<div><img name='pictureMachineInforms_img' width='100px' height='100px' src='<%=path%>/goods"+pictureMachineInforms[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureMachineInformImg(\""+pictureMachineInforms[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureMachineInformList").html(pictureMachineInforms_str);
		}
		
		
		//详细信息
		var array_InformDetailMachineInform = $("#array_InformDetailMachineInform").val();
		var array_InformDetailMachineInform_name = $("#array_InformDetailMachineInform_name").val();
		if(array_InformDetailMachineInform != null && array_InformDetailMachineInform != ''){
			var informDetailMachineInforms = array_InformDetailMachineInform.split(',');
			var informDetailMachineInforms_name = array_InformDetailMachineInform_name.split(',');
			var informDetailMachineInforms_str = '';
			for(var i = 0; i < informDetailMachineInforms.length; i++){
				if(informDetailMachineInforms[i] != null && informDetailMachineInforms[i] != ''){
					informDetailMachineInforms_str = informDetailMachineInforms_str + "<div><span name='informDetailMachineInforms_img' url='"+informDetailMachineInforms[i]+"' >"+informDetailMachineInforms_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelInformDetailMachineInformImg(\""+informDetailMachineInforms[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_InformDetailMachineInformList").html(informDetailMachineInforms_str);
		}
	});


	//类别自定义切换
	function onShowTypeMachineInformCustom(){
		var TypeMachine = $("#TypeMachine_userForm").val();
		if(TypeMachine == 9){//自定义
			$("#TypeCustomMachineInform_userForm").show();
		}else{
			$("#TypeCustomMachineInform_userForm").val('');
			$("#TypeCustomMachineInform_userForm").hide();
		}
		
	}
	
	//保存
	function save(){
		
		$("#array_PictureMachineInform_userForm").val($("#array_PictureMachineInform").val());//机床图片
		$("#array_InformDetailMachineInform_userForm").val($("#array_InformDetailMachineInform").val());//应用实例
		$("#array_InformDetailMachineInform_name_userForm").val($("#array_InformDetailMachineInform_name").val());//应用实例
		
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
		window.location.href='<%=path%>/standarMachine/queryStandarMachineList';
	}
	
	
	//保存机床图片
	function onSavePictureMachineInformList(){
	    $("#id_TurningHolder_pictureMachineInformForm").val($("#id_MachineInform_userForm").val());
	    $("#NumberMachine_pictureMachineInformForm").val($("#NumberMachine_userForm").val());
	    $("#NameMachine_pictureMachineInformForm").val($("#NameMachine_userForm").val());
	    $("#TypeMachine_pictureMachineInformForm").val($("#TypeMachine_userForm").val());
	    $("#ControlSystemMachine_pictureMachineInformForm").val($("#ControlSystemMachine_userForm").val());
	    $("#SpindleSpeedMachine_pictureMachineInformForm").val($("#SpindleSpeedMachine_userForm").val());
	    $("#CompanyMachine_pictureMachineInformForm").val($("#CompanyMachine_userForm").val());
	    $("#CuttingDiameterMachine_pictureMachineInformForm").val($("#CuttingDiameterMachine_userForm").val());
	    $("#MaxweightMachine_pictureMachineInformForm").val($("#MaxweightMachine_userForm").val());
	    $("#TypeTurningHolderMachine_pictureMachineInformForm").val($("#TypeTurningHolderMachine_userForm").val());
	    
		$("#pictureMachineInformForm").submit();
	}
	
	//删除机床图片
	function onDelPictureMachineInformImg(url_pictureMachineInform){
		var array_PictureMachineInform = $("#array_PictureMachineInform").val();
		array_PictureMachineInform = array_PictureMachineInform.replace(url_pictureMachineInform,'');
		$("#array_PictureMachineInform").val(array_PictureMachineInform);
		var img_array = $("img[name='pictureMachineInforms_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_pictureMachineInform){
				$(img_array[i]).parent().remove();
			}
		}
	}
	
	
	
	//保存详细信息
	function onSaveInformDetailMachineInformList(){
		$("#id_TurningHolder_pictureTurningHolderForm").val($("#id_MachineInform_userForm").val());
	    $("#NumberMachine_informMachineInformForm").val($("#NumberMachine_userForm").val());
	    $("#NameMachine_informMachineInformForm").val($("#NameMachine_userForm").val());
	    $("#TypeMachine_informMachineInformForm").val($("#TypeMachine_userForm").val());
	    $("#ControlSystemMachine_informMachineInformForm").val($("#ControlSystemMachine_userForm").val());
	    $("#SpindleSpeedMachine_informMachineInformForm").val($("#SpindleSpeedMachine_userForm").val());
	    $("#CompanyMachine_informMachineInformForm").val($("#CompanyMachine_userForm").val());
	    $("#CuttingDiameterMachine_informMachineInformForm").val($("#CuttingDiameterMachine_userForm").val());
	    $("#MaxweightMachine_informMachineInformForm").val($("#MaxweightMachine_userForm").val());
	    $("#TypeTurningHolderMachine_informMachineInformForm").val($("#TypeTurningHolderMachine_userForm").val());
	    
		$("#informDetailMachineInformForm").submit();
	}
	
	//删除详细信息
	function onDelInformDetailMachineInformImg(url_informDetailMachineInform){
		var array_InformDetailMachineInform = $("#array_InformDetailMachineInform").val();
		array_InformDetailMachineInform = array_InformDetailMachineInform.replace(url_informDetailMachineInform,'');
		$("#array_InformDetailMachineInform").val(array_InformDetailMachineInform);
		var img_array = $("span[name='informDetailMachineInforms_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_informDetailMachineInform){
				$(img_array[i]).parent().remove();
			}
		}
	}
	
	function changeValue(){
		document.getElementById('id_CategoryToolCoating_userForm').value=document.getElementById('selectWrap').options[document.getElementById('selectWrap').selectedIndex].text;
	}
</script>
</head>
<body>
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text">
    <form action="/standarMachine/saveMachineInform" name="userForm" id="userForm" method="post">
	  <input type="hidden" id="array_PictureMachineInform_userForm" name="array_PictureMachineInform"/>
  	  <input type="hidden" id="array_InformDetailMachineInform_userForm" name="array_InformDetailMachineInform"/>
  	  <input type="hidden" id="array_InformDetailMachineInform_name_userForm" name="array_InformDetailMachineInform_name"/>
  	    
	  <input type="hidden" name="id_MachineInform" id="id_MachineInform_userForm" value="${(MachineInform.id_MachineInform == null || MachineInform.id_MachineInform == '') ? 0 : MachineInform.id_MachineInform}"/>
	  <li>
	    <span id="lititle">机床型号</span>
	    <input name="NumberMachine" id="NumberMachine_userForm" type="text" value="${MachineInform.NumberMachine}" class="input" maxlength="10"/>
	  </li>		
	  <li>
	    <span id="lititle">机床名称</span>
	    <input name="NameMachine" id="NameMachine_userForm" type="text" value="${MachineInform.NameMachine}" class="input" maxlength="50"/>
	  </li>
	  <li>
	    <span id="lititle">机床类别</span>
	   		<span class="select_wrap">
				<span class="edit_select">
					<select  name="selectWrap"  id="selectWrap" onChange="changeValue();" class="select" contenteditable="true">
						<c:forEach items="${categoryMachineInform}" var="var" varStatus="vs">
							<option value="${var.id_CategoryMachineInform }" ${MachineInform.TypeMachine == var.id_CategoryMachineInform ? 'selected' : '' }>${var.name_CategoryMachineInform }</option>	
						</c:forEach>
					</select>
				</span>
				<span class="input_select">
					<input type="text" name=TypeMachine id="id_CategoryToolCoating_userForm" value="">
				</span>
			</span>
	  </li>
	  <li>
	    <span id="lititle">数控系统</span>
	    <input name="ControlSystemMachine" id="ControlSystemMachine_userForm" type="text" value="${MachineInform.ControlSystemMachine}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">主轴最大转速</span>
	    <input name="SpindleSpeedMachine" id="SpindleSpeedMachine_userForm" type="text" value="${MachineInform.SpindleSpeedMachine}" class="input" onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" maxlength="10"/>r/min
	  </li>
	  <li class="block">
	    <span id="lititle">生产厂家</span>
	    <input name="CompanyMachine" id="CompanyMachine_userForm" type="text" value="${MachineInform.CompanyMachine}" class="input" maxlength="100"/>
	  </li>
	  <li class="block">
	    <span id="lititle">最大切削直径</span>
	    <input name="CuttingDiameterMachine" id="CuttingDiameterMachine_userForm" type="text" value="${MachineInform.CuttingDiameterMachine}" class="input" maxlength="100"/>mm
	  </li>
	  <li class="block">
	    <span id="lititle">最大承重</span>
	    <input name="MaxweightMachine" id="MaxweightMachine_userForm" type="text" value="${MachineInform.MaxweightMachine}" class="input" maxlength="100"/>KG
	  </li>
	   <li class="block">
	    <span id="lititle">工作台尺寸</span>
	    <input name="TypeTurningHolderMachine" id="TypeTurningHolderMachine_userForm" type="text" value="${MachineInform.TypeTurningHolderMachine}" class="input" maxlength="100"/>(长X宽X高)mm
	  </li>
	</form>
	<!-- 机床图片 begin  -->
  	<form action="/standarMachine/savePictureMachineInform" name="pictureMachineInformForm" id="pictureMachineInformForm" method="post" enctype="multipart/form-data">
  	
  	  <input name="id_MachineInform" type="hidden" value="${(MachineInform.id_MachineInform == null || MachineInform.id_MachineInform == '') ? 0 : MachineInform.id_MachineInform}"/>
      <input type="hidden" id="NumberMachine_pictureMachineInformForm" value="${MachineInform.NumberMachine }" class="input" name="NumberMachine"/>
      <input type="hidden" id="NameMachine_pictureMachineInformForm" value="${MachineInform.NameMachine }" class="input" name="NameMachine"/>
      <input type="hidden" id="TypeMachine_pictureMachineInformForm" value="${MachineInform.TypeMachine }" class="input" name="TypeMachine"/>
      <input type="hidden" id="ControlSystemMachine_pictureMachineInformForm" value="${MachineInform.ControlSystemMachine }" class="input" name="ControlSystemMachine"/>
      <input type="hidden" id="SpindleSpeedMachine_pictureMachineInformForm" value="${MachineInform.SpindleSpeedMachine }" class="input" name="SpindleSpeedMachine"/>
      <input type="hidden" id="CompanyMachine_pictureMachineInformForm" value="${MachineInform.CompanyMachine }" class="input" name="CompanyMachine"/>
      <input type="hidden" id="CuttingDiameterMachine_pictureMachineInformForm" value="${MachineInform.CuttingDiameterMachine }" class="input" name="CuttingDiameterMachine"/>
      <input type="hidden" id="MaxweightMachine_pictureMachineInformForm" value="${MachineInform.MaxweightMachine }" class="input" name="MaxweightMachine"/>
      <input type="hidden" id="TypeTurningHolderMachine_pictureMachineInformForm" value="${MachineInform.TypeTurningHolderMachine }" class="input" name="TypeTurningHolderMachine"/>
  	
  	  <li class="block bor_t">
    	<span id="lititle">机床图片</span>
    	<input type="hidden" value="${array_PictureMachineInform == null ? '' : array_PictureMachineInform }" id="array_PictureMachineInform" name="array_PictureMachineInform"/>
    	<input type="hidden" value="${array_InformDetailMachineInform == null ? '' : array_InformDetailMachineInform }"  name="array_InformDetailMachineInform"/>
    	<input type="hidden" value="${array_InformDetailMachineInform_name == null ? '' : array_InformDetailMachineInform_name }"  name="array_InformDetailMachineInform_name"/>
    	<input type="file" accept="image/*" name="PictureMachineInform" id="PictureMachineInform" />
    	<input type="button" value="加载图片" class="btn" onclick="onSavePictureMachineInformList();"/>
    	<span id="span_PictureMachineInformList">
      	  <c:forEach items="${MachineInform.pictureMachineInformList}" var="var" varStatus="vs">
      		<div>
      		  <img name='pictureMachineInforms_img' width='100px' height='100px' src='<%=path%>/goods${var.url_PictureMachineInform }' />
      		  <a class="btn btn_shanchu" onclick='onDelPictureMachineInformImg("${var.url_PictureMachineInform }");'>删除</a>
      		  <br/>
      		</div>
      	  </c:forEach>
    	</span>
  	  </li>
  	</form>
	<!-- 机床图片 end  -->

	<!-- 详细信息 begin  -->
	<form action="/standarMachine/saveInformDetailMachineInform" name="informDetailMachineInformForm" id="informDetailMachineInformForm" method="post" enctype="multipart/form-data">
 	  <input name="id_MachineInform" type="hidden" value="${(turningHolder.id_MachineInform == null || turningHolder.id_MachineInform == '') ? 0 : turningHolder.id_MachineInform}"/>
      <input type="hidden" id="NumberMachine_informMachineInformForm" value="${turningHolder.NumberMachine }" class="input" name="NumberMachine"/>
      <input type="hidden" id="NameMachine_informMachineInformForm" value="${turningHolder.NameMachine }" class="input" name="NameMachine"/>
      <input type="hidden" id="TypeMachine_informMachineInformForm" value="${turningHolder.TypeMachine }" class="input" name="TypeMachine"/>
      <input type="hidden" id="ControlSystemMachine_informMachineInformForm" value="${turningHolder.ControlSystemMachine }" class="input" name="ControlSystemMachine"/>
      <input type="hidden" id="SpindleSpeedMachine_informMachineInformForm" value="${turningHolder.SpindleSpeedMachine }" class="input" name="SpindleSpeedMachine"/>
      <input type="hidden" id="CompanyMachine_informMachineInformForm" value="${turningHolder.CompanyMachine }" class="input" name="CompanyMachine"/>
      <input type="hidden" id="CuttingDiameterMachine_informMachineInformForm" value="${turningHolder.CuttingDiameterMachine }" class="input" name="CuttingDiameterMachine"/>
      <input type="hidden" id="MaxweightMachine_informMachineInformForm" value="${turningHolder.MaxweightMachine }" class="input" name="MaxweightMachine"/>
      <input type="hidden" id="TypeTurningHolderMachine_informMachineInformForm" value="${turningHolder.TypeTurningHolderMachine }" class="input" name="TypeTurningHolderMachine"/>
	  	
 	  <li class="block bor_t"> 
 	    <span id="lititle">详细信息</span>
    	<input type="hidden" value="${array_PictureMachineInform == null ? '' : array_PictureMachineInform }" name="array_PictureMachineInform"/>
    	<input type="hidden" value="${array_InformDetailMachineInform == null ? '' : array_InformDetailMachineInform }" id="array_InformDetailMachineInform" name="array_InformDetailMachineInform"/>
    	<input type="hidden" value="${array_InformDetailMachineInform_name == null ? '' : array_InformDetailMachineInform_name }" id="array_InformDetailMachineInform_name" name="array_InformDetailMachineInform_name"/>
	    
	    <input type="file" accept=".pdf" name="InformDetailMachineInform" id="InformDetailMachineInform" />
	    <input type="button" value="加载文件" class="btn" onclick="onSaveInformDetailMachineInformList();"/>
	    <span id="span_InformDetailMachineInformList">
	      <c:forEach items="${MachineInform.informDetailMachineInformList}" var="var" varStatus="vs">
	      	<div>
	      	  <span name='informDetailMachineInforms_img' >${var.name_InformDetailMachineInform }</span>
	      	  <a class="btn btn_shanchu" onclick='onDelInformDetailMachineInformImg("${var.url_InformDetailMachineInform }");'>删除</a>
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

</body>
</html>
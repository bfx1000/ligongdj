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
		<!--
		function MM_jumpMenu(targ,selObj,restore){ //v3.0
		  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
		  if (restore) selObj.selectedIndex=0;
		}
		//-->
		
		$(document).ready(function(){
			changeValue();
					
			
			//材料图片
			var array_PictureCoatingMaterial = $("#array_PictureCoatingMaterial").val();
			if(array_PictureCoatingMaterial != null && array_PictureCoatingMaterial != ''){
				var pictureMaterials = array_PictureCoatingMaterial.split(',');
				var pictureMaterials_str = '';
				for(var i = 0; i < pictureMaterials.length; i++){
					if(pictureMaterials[i] != null && pictureMaterials[i] != ''){
						pictureMaterials_str = pictureMaterials_str + "<div><img name='pictureCoatingMaterials_img' width='100px' height='100px' src='<%=path%>/goods"+pictureMaterials[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureMaterialImg(\""+pictureMaterials[i]+"\");'>删除</a><br/></div>";
					}
				}
				$("#span_PictureCoatingMaterial").html(pictureMaterials_str);
			}
			
			//详细信息
			var array_InformDetailCoatingMaterial = $("#array_InformDetailCoatingMaterial").val();
			var array_InformDetailCoatingMaterial_name = $("#array_InformDetailCoatingMaterial_name").val();
			if(array_InformDetailCoatingMaterial != null && array_InformDetailCoatingMaterial != ''){
				var informDetailCoatingMaterials = array_InformDetailCoatingMaterial.split(',');
				var informDetailCoatingMaterials_name = array_InformDetailCoatingMaterial_name.split(',');
				var informDetailCoatingMaterials_str = '';
				for(var i = 0; i < informDetailCoatingMaterials.length; i++){
					if(informDetailCoatingMaterials[i] != null && informDetailCoatingMaterials[i] != ''){
						informDetailCoatingMaterials_str = informDetailCoatingMaterials_str + "<div><span name='informDetailCoatingMaterials_img' url='"+informDetailCoatingMaterials[i]+"' >"+informDetailCoatingMaterials_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelInformDetailMaterialImg(\""+informDetailCoatingMaterials[i]+"\");'>删除</a><br/></div>";
					}
				}
				$("#span_InformDetailCoatingMaterialList").html(informDetailCoatingMaterials_str);
			}
			
			
			
			
			//应用实例
			var array_ApplicationCoatingMaterial = $("#array_ApplicationCoatingMaterial").val();
			var array_ApplicationCoatingMaterial_name = $("#array_ApplicationCoatingMaterial_name").val();
			if(array_ApplicationCoatingMaterial != null && array_ApplicationCoatingMaterial != ''){
				var applicationCoatingMaterials = array_ApplicationCoatingMaterial.split(',');
				var applicationCoatingMaterials_name = array_ApplicationCoatingMaterial_name.split(',');
				var applicationCoatingMaterials_str = '';
				for(var i = 0; i < applicationCoatingMaterials.length; i++){
					if(applicationCoatingMaterials[i] != null && applicationCoatingMaterials[i] != ''){
						applicationCoatingMaterials_str = applicationCoatingMaterials_str + "<div><span name='applicationCoatingMaterials_img' url='"+applicationCoatingMaterials[i]+"' >"+applicationCoatingMaterials_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelApplicationMaterialImg(\""+applicationCoatingMaterials[i]+"\");'>删除</a><br/></div>";
					}
				}
				$("#span_ApplicationCoatingMaterialList").html(applicationCoatingMaterials_str);
			}
			
		});
		
		
		//保存
		function save(){
	  
			$("#ISOToolCoating_userForm_1").val($("#ISOToolCoating_userForm").val());
			$("#CharacterToolCoating_userForm_1").val($("#CharacterToolCoating_userForm").val());
			
			$("#array_PictureCoatingMaterial_userForm").val($("#array_PictureCoatingMaterial").val());
			$("#array_InformDetailCoatingMaterial_userForm").val($("#array_InformDetailCoatingMaterial").val());
			$("#array_InformDetailCoatingMaterial_name_userForm").val($("#array_InformDetailCoatingMaterial_name").val());
			$("#array_ApplicationCoatingMaterial_userForm").val($("#array_ApplicationCoatingMaterial").val());
			$("#array_ApplicationCoatingMaterial_name_userForm").val($("#array_ApplicationCoatingMaterial_name").val());
		
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
			window.location.href='<%=path%>/CoatingMaterial/queryCoatingMaterialList';
		}
		
		//保存材料图片
		function onSavePictureMaterialList(){
		
			$("#NameToolCoating_pictureCoatingMaterialForm").val($("#NameToolCoating_userForm").val());
			$("#NumberToolCoating_pictureCoatingMaterialForm").val($("#NumberToolCoating_userForm").val());
			$("#CategoryToolCoating_pictureCoatingMaterialForm").val($("#id_CategoryToolCoating_userForm").val());
			$("#ProcessingToolCoating_pictureCoatingMaterialForm").val($("#ProcessingToolCoating_userForm").val());
			$("#CompanyToolCoating_pictureCoatingMaterialForm").val($("#CompanyToolCoating_userForm").val());
			$("#ISOToolCoating_pictureCoatingMaterialForm").val($("#ISOToolCoating_userForm").val());
			$("#ColourToolCoating_pictureCoatingMaterialForm").val($("#ColourToolCoating_userForm").val());
			$("#HardnessToolCoating_pictureCoatingMaterialForm").val($("#HardnessToolCoating_userForm").val());
			$("#ThicknessToolCoating_pictureCoatingMaterialForm").val($("#ThicknessToolCoating_userForm").val());
			$("#FrictionToolCoating_pictureCoatingMaterialForm").val($("#FrictionToolCoating_userForm").val());
			$("#TemperatureToolCoating_pictureCoatingMaterialForm").val($("#TemperatureToolCoating_userForm").val());
			$("#CharacterToolCoating_pictureCoatingMaterialForm").val($("#CharacterToolCoating_userForm").val());
		    
			$("#PictureCoatingMaterialForm").submit();
		}
		
		//删除材料图片
		function onDelPictureMaterialImg(url_PictureToolCoating){
			var array_PictureCoatingMaterial = $("#array_PictureCoatingMaterial").val();
			array_PictureCoatingMaterial = array_PictureCoatingMaterial.replace(url_PictureToolCoating,'');
			$("#array_PictureCoatingMaterial").val(array_PictureCoatingMaterial);
			var img_array = $("img[name='pictureCoatingMaterials_img']");
			for(var i=0;i<img_array.length;i++){
				if($(img_array[i]).attr("src") == "/goods" + url_PictureToolCoating){
					$(img_array[i]).parent().remove();
				}
			}
		}
		
		//保存详细信息
		function onSaveInformDetailMaterialList(){
			$("#NameToolCoating_informDetailCoatingMaterialForm").val($("#NameToolCoating_userForm").val());
			$("#NumberToolCoating_informDetailCoatingMaterialForm").val($("#NumberToolCoating_userForm").val());
			$("#CategoryToolCoating_informDetailCoatingMaterialForm").val($("#id_CategoryToolCoating_userForm").val());
			$("#ProcessingToolCoating_informDetailCoatingMaterialForm").val($("#ProcessingToolCoating_userForm").val());
			$("#CompanyToolCoating_informDetailCoatingMaterialForm").val($("#CompanyToolCoating_userForm").val());
			$("#ISOToolCoating_informDetailCoatingMaterialForm").val($("#ISOToolCoating_userForm").val());
			$("#ColourToolCoating_informDetailCoatingMaterialForm").val($("#ColourToolCoating_userForm").val());
			$("#HardnessToolCoating_informDetailCoatingMaterialForm").val($("#HardnessToolCoating_userForm").val());
			$("#ThicknessToolCoating_informDetailCoatingMaterialForm").val($("#ThicknessToolCoating_userForm").val());
			$("#FrictionToolCoating_informDetailCoatingMaterialForm").val($("#FrictionToolCoating_userForm").val());
			$("#TemperatureToolCoating_informDetailCoatingMaterialForm").val($("#TemperatureToolCoating_userForm").val());
			$("#CharacterToolCoating_informDetailCoatingMaterialForm").val($("#CharacterToolCoating_userForm").val());
		    
			$("#informDetailCoatingMaterialForm").submit();
		}
		
		//删除详细信息
		function onDelInformDetailMaterialImg(url_informDetailCoatingMaterial){
		
			var array_InformDetailCoatingMaterial = $("#array_InformDetailCoatingMaterial").val();
			array_InformDetailCoatingMaterial = array_InformDetailCoatingMaterial.replace(url_informDetailCoatingMaterial,'');
			$("#array_InformDetailCoatingMaterial").val(array_InformDetailCoatingMaterial);
			var img_array = $("span[name='informDetailCoatingMaterials_img']");
			for(var i=0;i<img_array.length;i++){
				if($(img_array[i]).attr("url") == url_informDetailCoatingMaterial){
					$(img_array[i]).parent().remove();
				}
			}
		}
		
		
		//保存应用实例
		function onSaveApplicationMaterialList(){
			$("#NameToolCoating_applicationCoatingMaterialForm").val($("#NameToolCoating_userForm").val());
			$("#NumberToolCoating_applicationCoatingMaterialForm").val($("#NumberToolCoating_userForm").val());
			$("#CategoryToolCoating_applicationCoatingMaterialForm").val($("#id_CategoryToolCoating_userForm").val());
			$("#ProcessingToolCoating_applicationCoatingMaterialForm").val($("#ProcessingToolCoating_userForm").val());
			$("#CompanyToolCoating_applicationCoatingMaterialForm").val($("#CompanyToolCoating_userForm").val());
			$("#ISOToolCoating_applicationCoatingMaterialForm").val($("#ISOToolCoating_userForm").val());
			$("#ColourToolCoating_applicationCoatingMaterialForm").val($("#ColourToolCoating_userForm").val());
			$("#HardnessToolCoating_applicationCoatingMaterialForm").val($("#HardnessToolCoating_userForm").val());
			$("#ThicknessToolCoating_applicationCoatingMaterialForm").val($("#ThicknessToolCoating_userForm").val());
			$("#FrictionToolCoating_applicationCoatingMaterialForm").val($("#FrictionToolCoating_userForm").val());
			$("#TemperatureToolCoating_applicationCoatingMaterialForm").val($("#TemperatureToolCoating_userForm").val());
			$("#CharacterToolCoating_applicationCoatingMaterialForm").val($("#CharacterToolCoating_userForm").val());
		    
			$("#applicationCoatingMaterialForm").submit();
		}
		
		//删除应用实例
		function onDelApplicationMaterialImg(url_applicationCoatingMaterial){
		
			var array_ApplicationCoatingMaterial = $("#array_ApplicationCoatingMaterial").val();
			array_ApplicationCoatingMaterial = array_ApplicationCoatingMaterial.replace(url_applicationCoatingMaterial,'');
			$("#array_ApplicationCoatingMaterial").val(array_ApplicationCoatingMaterial);
			var img_array = $("span[name='applicationCoatingMaterials_img']");
			for(var i=0;i<img_array.length;i++){
				if($(img_array[i]).attr("url") == url_applicationCoatingMaterial){
					$(img_array[i]).parent().remove();
				}
			}
		}
		
		function changeValue(){
			document.getElementById('id_CategoryToolCoating_userForm').value=document.getElementById('selectWrap').options[document.getElementById('selectWrap').selectedIndex].text;
		}
    </script>
</head>
<body style="background:#fff;">
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">

	<ul class="box_text">
	<form action="/CoatingMaterial/saveCoatingMaterial" name="userForm" id="userForm" method="post">
	  <input type="hidden" id="array_PictureCoatingMaterial_userForm" name="array_PictureCoatingMaterial"/>
	  <input type="hidden" id="array_InformDetailCoatingMaterial_userForm" name="array_InformDetailCoatingMaterial"/>
	  <input type="hidden" id="array_InformDetailCoatingMaterial_name_userForm" name="array_InformDetailCoatingMaterial_name"/>
	  <input type="hidden" id="array_ApplicationCoatingMaterial_userForm" name="array_ApplicationCoatingMaterial"/>
	  <input type="hidden" id="array_ApplicationCoatingMaterial_name_userForm" name="array_ApplicationCoatingMaterial_name"/>
		
	  <input type="hidden" id="ISOToolCoating_userForm_1" name="ISOToolCoating"/>
	  <input type="hidden" id="CharacterToolCoating_userForm_1" name="CharacterToolCoating"/>
	  
	  <input type="hidden" name="id_ToolCoatingMaterial" id="id_ToolCoatingMaterial_userForm" value="${(CoatingMaterial.id_ToolCoatingMaterial == null || CoatingMaterial.id_ToolCoatingMaterial == '') ? 0 : CoatingMaterial.id_ToolCoatingMaterial}"/>
		<li>
		  <span id="lititle">涂层名称</span>
		  <input type="text" name="NameToolCoating" id="NameToolCoating_userForm" value="${CoatingMaterial.NameToolCoating }" class="input"/>
		</li>
		<li>
		  <span id="lititle">涂层编号</span>
		  <input type="text" name="NumberToolCoating" id="NumberToolCoating_userForm" value="${CoatingMaterial.NumberToolCoating }" class="input"/>
		</li>
		<li>
			<span id="lititle">涂层类别</span>
			<span class="select_wrap">
				<span class="edit_select">
					<select  name="selectWrap"  id="selectWrap" onChange="changeValue();" class="select" contenteditable="true">
						<c:forEach items="${categoryToolCoatingList}" var="var" varStatus="vs">
							<option value="${var.id_CategoryToolCoating }" ${CoatingMaterial.CategoryToolCoating == var.id_CategoryToolCoating ? 'selected' : '' }>${var.name_CategoryToolCoating }</option>	
						</c:forEach>
					</select>
				</span>
				<span class="input_select">
					<input type="text" name=CategoryToolCoating id="id_CategoryToolCoating_userForm" value="">
				</span>
			</span>
		</li>
		<li>
		  <span id="lititle">涂层工艺</span>
		  <select name="ProcessingToolCoating" id="ProcessingToolCoating_userForm" class="select">
			<option value="1" ${CoatingMaterial.ProcessingToolCoating == '1' ? 'selected' : '' }>PVD物理涂层</option>
			<option value="2" ${CoatingMaterial.ProcessingToolCoating == '2' ? 'selected' : '' }>CVD化学涂层</option>
		  </select>
		</li>
		<li>
		  <span id="lititle">供应商</span>
		  <input type="text" name="CompanyToolCoating" id="CompanyToolCoating_userForm" value="${CoatingMaterial.CompanyToolCoating }" class="input"/>
		</li>
		
		
		<li>
		  
		  <span id="lititle">涂层颜色</span>
		  <input type="text" name="ColourToolCoating" id="ColourToolCoating_userForm" value="${CoatingMaterial.ColourToolCoating }" class="input" />
		</li>
		<li>
		  
		  <span id="lititle">涂层硬度</span>
		  <input type="text" name="HardnessToolCoating" id="HardnessToolCoating_userForm" value="${CoatingMaterial.HardnessToolCoating }" class="input" />
		</li>
		<li>
		  
		  <span id="lititle">涂层厚度</span>
		  <input type="text" name="ThicknessToolCoating" id="ThicknessToolCoating_userForm" value="${CoatingMaterial.ThicknessToolCoating }" class="input" />
		</li>
		<li>
		  
		  <span id="lititle">摩擦系数</span>
		  <input type="text" name="FrictionToolCoating" id="FrictionToolCoating_userForm" value="${CoatingMaterial.FrictionToolCoating }" class="input" />
		</li>
		<li>
		  
		  <span id="lititle">使用温度</span>
		  <input type="text" name="TemperatureToolCoating" id="TemperatureToolCoating_userForm" value="${CoatingMaterial.TemperatureToolCoating }" class="input" />
		</li>
		<div class="clear"></div>
		
		
		</form>
		
		
		
		
		<li class="block nobor">
			<input type="hidden" name="ISOToolCoating" id="ISOToolCoating_userForm" value="${CoatingMaterial.ISOToolCoating }" /> 
			<span id="lititle">涂层主要成分</span>
			<input type="button" value="点击输入" class="btn_add" id="ISOToolCoating_btn" data-name="0" onclick="editCl(this);"><!-- data-name : 值为0时对应的状态为“点击输入”  ， 值为1时对应的状态为“保存”-->
			&nbsp;
			<input type="button" value="添加" class="btn_add" id="btn_add_ISOToolCoating"  onclick="addCl(this);" style="display: none;"/>
		</li>


		<li class="block nobor">
			<!--  材料表格  -->
			<table border="1" class="li_table box_table"  id="clTable">
			  <tr class="cl_tr_0">
			    <th class="th">元素</th>
			    <c:forEach items="${CoatingMaterial.ISOToolCoatingList}" var="var" varStatus="vs">
			    	<td class="td edit_1" id="cl_tr0_td${vs.index }">${var.yuansu }</td>
			    </c:forEach>
			  </tr>
			  <tr class="cl_tr_1">
			    <th class="th">百分比</th>
			    <c:forEach items="${CoatingMaterial.ISOToolCoatingList}" var="var" varStatus="vs">
			    	<td class="td edit_2" id="cl_tr1_td${vs.index }">${var.baifenbi }</td>
			    </c:forEach>
			  </tr>
			  <tr class="cl_tr_2">
			    <th class="th">操作</th>
			    <c:forEach items="${CoatingMaterial.ISOToolCoatingList}" var="var" varStatus="vs">
			     	<td class="td" id="cl_tr2_td${vs.index }"><a class="btn btn_bg_orange b_block" onclick="delCl(${vs.index })">删除</a></td>
			    </c:forEach>
			  </tr>
			</table>
		</li>
		
		
		
		

		<li class="block nobor">
		  <span id="lititle">涂层特点</span> &nbsp; 
		</li>
		<li class="block">
		  <textarea id="CharacterToolCoating_userForm" name="CharacterToolCoating" cols="" rows="" class="textarea textarea_block">${CoatingMaterial.CharacterToolCoating }</textarea>
		</li>
		
		<form action="/CoatingMaterial/savePictureCoatingMaterial" name="PictureCoatingMaterialForm" id="PictureCoatingMaterialForm" method="post" enctype="multipart/form-data">
		  
		  
		  <input name="id_ToolCoatingMaterial" type="hidden" value="${(CoatingMaterial.id_ToolCoatingMaterial == null || CoatingMaterial.id_ToolCoatingMaterial == '') ? 0 : CoatingMaterial.id_ToolCoatingMaterial}"/>
		  
		  <input type="hidden" id="NameToolCoating_pictureCoatingMaterialForm" value="${CoatingMaterial.NameToolCoating }" class="input" name="NameToolCoating"/>
		  <input type="hidden" id="NumberToolCoating_pictureCoatingMaterialForm" value="${CoatingMaterial.NumberToolCoating }" class="input" name="NumberToolCoating"/>
		  <input type="hidden" id="CategoryToolCoating_pictureCoatingMaterialForm" value="${CoatingMaterial.CategoryToolCoating }" class="input" name="CategoryToolCoating"/>
		  <input type="hidden" id="ProcessingToolCoating_pictureCoatingMaterialForm" value="${CoatingMaterial.ProcessingToolCoating }" class="input" name="ProcessingToolCoating"/>
		  <input type="hidden" id="CompanyToolCoating_pictureCoatingMaterialForm" value="${CoatingMaterial.CompanyToolCoating }" class="input" name="CompanyToolCoating"/>
		  <input type="hidden" id="ISOToolCoating_pictureCoatingMaterialForm" value="${CoatingMaterial.ISOToolCoating }" class="input" name="ISOToolCoating"/>
		  <input type="hidden" id="ColourToolCoating_pictureCoatingMaterialForm" value="${CoatingMaterial.ColourToolCoating }" class="input" name="ColourToolCoating"/>
		  <input type="hidden" id="HardnessToolCoating_pictureCoatingMaterialForm" value="${CoatingMaterial.HardnessToolCoating }" class="input" name="HardnessToolCoating"/>
		  <input type="hidden" id="ThicknessToolCoating_pictureCoatingMaterialForm" value="${CoatingMaterial.ThicknessToolCoating }" class="input" name="ThicknessToolCoating"/>
		  <input type="hidden" id="FrictionToolCoating_pictureCoatingMaterialForm" value="${CoatingMaterial.FrictionToolCoating }" class="input" name="FrictionToolCoating"/>
		  <input type="hidden" id="TemperatureToolCoating_pictureCoatingMaterialForm" value="${CoatingMaterial.TemperatureToolCoating }" class="input" name="TemperatureToolCoating"/>
		  <input type="hidden" id="CharacterToolCoating_pictureCoatingMaterialForm" value="${CoatingMaterial.CharacterToolCoating }" class="input" name="CharacterToolCoating"/>
		  
		  <li class="block">
		    <span id="lititle">图片</span>
		    <input type="hidden" value="${array_PictureCoatingMaterial == null ? '' : array_PictureCoatingMaterial }" id="array_PictureCoatingMaterial" name="array_PictureCoatingMaterial"/>
		    <input type="hidden" value="${array_InformDetailCoatingMaterial == null ? '' : array_InformDetailCoatingMaterial }" name="array_InformDetailCoatingMaterial"/>
		    <input type="hidden" value="${array_InformDetailCoatingMaterial_name == null ? '' : array_InformDetailCoatingMaterial_name }" name="array_InformDetailCoatingMaterial_name"/>
		    <input type="hidden" value="${array_ApplicationCoatingMaterial == null ? '' : array_ApplicationCoatingMaterial }" name="array_ApplicationCoatingMaterial"/>
		    <input type="hidden" value="${array_ApplicationCoatingMaterial_name == null ? '' : array_ApplicationCoatingMaterial_name }" name="array_ApplicationCoatingMaterial_name"/>
		    <input type="file" accept="image/*" name="PictureCoatingMaterial" id="PictureCoatingMaterial" />
		    <input type="button" value="加载图片" class="btn" onclick="onSavePictureMaterialList();"/>
		    <span id="span_PictureCoatingMaterial">
		      <c:forEach items="${CoatingMaterial.pictureCoatingMaterialList}" var="var" varStatus="vs">
		      	<div><img name='pictureCoatingMaterials_img' width='100px' height='100px' src='<%=path%>/goods${var.url_PictureToolCoating }' /><a class="btn btn_shanchu" onclick='onDelPictureMaterialImg("${var.url_PictureToolCoating }");'>删除</a><br/></div>
		      </c:forEach>
		    </span>
		  </li>
		  
		</form>
		
		
		
		
		
		<form action="/CoatingMaterial/saveInformDetailCoatingMaterial" name="informDetailCoatingMaterialForm" id="informDetailCoatingMaterialForm" method="post" enctype="multipart/form-data">
		 
		  <input name="id_ToolCoatingMaterial" type="hidden" value="${(CoatingMaterial.id_ToolCoatingMaterial == null || CoatingMaterial.id_ToolCoatingMaterial == '') ? 0 : CoatingMaterial.id_ToolCoatingMaterial}"/>
		  
		  <input type="hidden" id="NameToolCoating_informDetailCoatingMaterialForm" value="${CoatingMaterial.NameToolCoating }" class="input" name="NameToolCoating"/>
		  <input type="hidden" id="NumberToolCoating_informDetailCoatingMaterialForm" value="${CoatingMaterial.NumberToolCoating }" class="input" name="NumberToolCoating"/>
		  <input type="hidden" id="CategoryToolCoating_informDetailCoatingMaterialForm" value="${CoatingMaterial.CategoryToolCoating }" class="input" name="CategoryToolCoating"/>
		  <input type="hidden" id="ProcessingToolCoating_informDetailCoatingMaterialForm" value="${CoatingMaterial.ProcessingToolCoating }" class="input" name="ProcessingToolCoating"/>
		  <input type="hidden" id="CompanyToolCoating_informDetailCoatingMaterialForm" value="${CoatingMaterial.CompanyToolCoating }" class="input" name="CompanyToolCoating"/>
		  <input type="hidden" id="ISOToolCoating_informDetailCoatingMaterialForm" value="${CoatingMaterial.ISOToolCoating }" class="input" name="ISOToolCoating"/>
		  <input type="hidden" id="ColourToolCoating_informDetailCoatingMaterialForm" value="${CoatingMaterial.ColourToolCoating }" class="input" name="ColourToolCoating"/>
		  <input type="hidden" id="HardnessToolCoating_informDetailCoatingMaterialForm" value="${CoatingMaterial.HardnessToolCoating }" class="input" name="HardnessToolCoating"/>
		  <input type="hidden" id="ThicknessToolCoating_informDetailCoatingMaterialForm" value="${CoatingMaterial.ThicknessToolCoating }" class="input" name="ThicknessToolCoating"/>
		  <input type="hidden" id="FrictionToolCoating_informDetailCoatingMaterialForm" value="${CoatingMaterial.FrictionToolCoating }" class="input" name="FrictionToolCoating"/>
		  <input type="hidden" id="TemperatureToolCoating_informDetailCoatingMaterialForm" value="${CoatingMaterial.TemperatureToolCoating }" class="input" name="TemperatureToolCoating"/>
		  <input type="hidden" id="CharacterToolCoating_informDetailCoatingMaterialForm" value="${CoatingMaterial.CharacterToolCoating }" class="input" name="CharacterToolCoating"/>
		  
		
		<li class="block">
		  <span id="lititle">详细信息</span>
		  <input type="hidden" value="${array_PictureCoatingMaterial == null ? '' : array_PictureCoatingMaterial }"  name="array_PictureCoatingMaterial"/>
		    <input type="hidden" value="${array_InformDetailCoatingMaterial == null ? '' : array_InformDetailCoatingMaterial }" id="array_InformDetailCoatingMaterial" name="array_InformDetailCoatingMaterial"/>
		    <input type="hidden" value="${array_InformDetailCoatingMaterial_name == null ? '' : array_InformDetailCoatingMaterial_name }" id="array_InformDetailCoatingMaterial_name" name="array_InformDetailCoatingMaterial_name"/>
		    <input type="hidden" value="${array_ApplicationCoatingMaterial == null ? '' : array_ApplicationCoatingMaterial }" name="array_ApplicationCoatingMaterial"/>
		    <input type="hidden" value="${array_ApplicationCoatingMaterial_name == null ? '' : array_ApplicationCoatingMaterial_name }" name="array_ApplicationCoatingMaterial_name"/>
		    <input type="file" accept=".pdf" name="InformDetailCoatingMaterial" id="InformDetailCoatingMaterial" />
	    	<input type="button" value="加载文档" class="btn" onclick="onSaveInformDetailMaterialList();"/>
		  <span id="span_InformDetailCoatingMaterialList">
	      <c:forEach items="${CoatingMaterial.informDetailCoatingMaterialList}" var="var" varStatus="vs">
	      	<div><span name='informDetailCoatingMaterials_img' >${var.url_InformDetailToolCoating }</span><a class="btn btn_shanchu" onclick='onDelInformDetailMaterialImg("${var.url_InformDetailToolCoating }");'>删除</a><br/></div>
	      
	      </c:forEach>
	    </span>
		</li>
		</form>
		
		
		
		<form action="/CoatingMaterial/saveApplicationCoatingMaterial" name="applicationCoatingMaterialForm" id="applicationCoatingMaterialForm" method="post" enctype="multipart/form-data">
		
	 	  <input name="id_ToolCoatingMaterial" type="hidden" value="${(CoatingMaterial.id_ToolCoatingMaterial == null || CoatingMaterial.id_ToolCoatingMaterial == '') ? 0 : CoatingMaterial.id_ToolCoatingMaterial}"/>
		  
		  <input type="hidden" id="NameToolCoating_applicationCoatingMaterialForm" value="${CoatingMaterial.NameToolCoating }" class="input" name="NameToolCoating"/>
		  <input type="hidden" id="NumberToolCoating_applicationCoatingMaterialForm" value="${CoatingMaterial.NumberToolCoating }" class="input" name="NumberToolCoating"/>
		  <input type="hidden" id="CategoryToolCoating_applicationCoatingMaterialForm" value="${CoatingMaterial.CategoryToolCoating }" class="input" name="CategoryToolCoating"/>
		  <input type="hidden" id="ProcessingToolCoating_applicationCoatingMaterialForm" value="${CoatingMaterial.ProcessingToolCoating }" class="input" name="ProcessingToolCoating"/>
		  <input type="hidden" id="CompanyToolCoating_applicationCoatingMaterialForm" value="${CoatingMaterial.CompanyToolCoating }" class="input" name="CompanyToolCoating"/>
		  <input type="hidden" id="ISOToolCoating_applicationCoatingMaterialForm" value="${CoatingMaterial.ISOToolCoating }" class="input" name="ISOToolCoating"/>
		  <input type="hidden" id="ColourToolCoating_applicationCoatingMaterialForm" value="${CoatingMaterial.ColourToolCoating }" class="input" name="ColourToolCoating"/>
		  <input type="hidden" id="HardnessToolCoating_applicationCoatingMaterialForm" value="${CoatingMaterial.HardnessToolCoating }" class="input" name="HardnessToolCoating"/>
		  <input type="hidden" id="ThicknessToolCoating_applicationCoatingMaterialForm" value="${CoatingMaterial.ThicknessToolCoating }" class="input" name="ThicknessToolCoating"/>
		  <input type="hidden" id="FrictionToolCoating_applicationCoatingMaterialForm" value="${CoatingMaterial.FrictionToolCoating }" class="input" name="FrictionToolCoating"/>
		  <input type="hidden" id="TemperatureToolCoating_applicationCoatingMaterialForm" value="${CoatingMaterial.TemperatureToolCoating }" class="input" name="TemperatureToolCoating"/>
		  <input type="hidden" id="CharacterToolCoating_applicationCoatingMaterialForm" value="${CoatingMaterial.CharacterToolCoating }" class="input" name="CharacterToolCoating"/>		
		  
		
		<li class="block">
		  <span id="lititle">应用实例</span>
		  <input type="hidden" value="${array_PictureCoatingMaterial == null ? '' : array_PictureCoatingMaterial }"  name="array_PictureCoatingMaterial"/>
		    <input type="hidden" value="${array_InformDetailCoatingMaterial == null ? '' : array_InformDetailCoatingMaterial }" name="array_InformDetailCoatingMaterial"/>
		    <input type="hidden" value="${array_InformDetailCoatingMaterial_name == null ? '' : array_InformDetailCoatingMaterial_name }" name="array_InformDetailCoatingMaterial_name"/>
		    <input type="hidden" value="${array_ApplicationCoatingMaterial == null ? '' : array_ApplicationCoatingMaterial }" id = "array_ApplicationCoatingMaterial" name="array_ApplicationCoatingMaterial"/>
		    <input type="hidden" value="${array_ApplicationCoatingMaterial_name == null ? '' : array_ApplicationCoatingMaterial_name }" id = "array_ApplicationCoatingMaterial_name" name="array_ApplicationCoatingMaterial_name"/>
		    <input type="file" accept=".pdf" name="ApplicationCoatingMaterial" id="ApplicationCoatingMaterial" />
	    	<input type="button" value="加载文档" class="btn" onclick="onSaveApplicationMaterialList();"/>
			<span id="span_ApplicationCoatingMaterialList">
	      <c:forEach items="${CoatingMaterial.applicationCoatingMaterialList}" var="var" varStatus="vs">
	      	<div><span name='applicationCoatingMaterials_img' >${var.url_ApplicationToolCoating }</span><a class="btn btn_shanchu" onclick='onDelApplicationMaterialImg("${var.url_ApplicationToolCoating }");'>删除</a><br/></div>
	      
	      </c:forEach>
		</li>
		</form>
		
	
	</ul>
</div>


<script>

	//点击输入材料
	function editCl(id){
		var clTdLength = $("#clTable td").length;//table列数
		var dataName = $(id).attr("data-name");
		if(dataName == 0){//点击的之前是编辑状态，需变为“保存”
			$("#btn_add_ISOToolCoating").show();
			$(id).attr("data-name","1");
				$(id).val("保存");
		}else{
			$("#btn_add_ISOToolCoating").hide();
			$(id).attr("data-name","0");
				$(id).val("点击输入");
		}
		if(clTdLength != 0) {
			
			
			if(dataName == 0){//点击的之前是编辑状态，需变为“保存”
				
				htmlInput = '<input type="text" />';
				var inputs1 = $("#clTable td.edit_1");
				var inputs2 = $("#clTable td.edit_2");
				for(var i = 0;i<inputs1.length;i++){
					$(inputs1[i]).html('<input type="text" value="'+$(inputs1[i]).text()+'" />');
					$(inputs2[i]).html('<input type="text" value="'+$(inputs2[i]).text()+'" />');
					
				}
				
			}else{
				var ISOToolCoating_str = '';
				
				//执行保存事件
				var inputs1 = $("#clTable td.edit_1");
				var inputs2 = $("#clTable td.edit_2");
				for(var i = 0;i<inputs1.length;i++){
					ISOToolCoating_str = ISOToolCoating_str + ($(inputs1[i]).children('input').val()==""?" ":$(inputs1[i]).children('input').val()) + "-" + ($(inputs2[i]).children('input').val()==""?" ":$(inputs2[i]).children('input').val()) + ",";
					$("#ISOToolCoating_userForm").val(ISOToolCoating_str);
					$(inputs1[i]).html($(inputs1[i]).children('input').val());
					$(inputs2[i]).html($(inputs2[i]).children('input').val());
				}
				$("#clTable td.edit input").remove();//td变为不可编辑
				
			}
		}
	}

	//添加材料
	function addCl(id){
		var dataName = $(id).attr("data-name");
		
		var clTdLength = document.getElementById("clTable").rows.item(0).cells.length;//材料table列数
		
		
		var addTrId = $("#clTable tr.cl_tr_0 td").eq(clTdLength-2).attr("id");//获取table表格最后一列的td的ID
		
		
		if(addTrId != undefined || addTrId != null){
			addTrIdNum = parseInt(addTrId.substring(addTrId.lastIndexOf("td")+2));
			
		
			var clTrLength = $("#clTable tr").length;//材料table行数

			var htmlTr = new Array();
	
			htmlTr[0] = '<td class="td edit_1" id="cl_tr0_td' + (addTrIdNum+1)  +'"><input type="text" value=" " /></td>';
			htmlTr[1] = '<td class="td edit_2" id="cl_tr1_td' + (addTrIdNum+1)  +'"><input type="text" value=" " /></td>';
			htmlTr[2] = '<td class="td" id="cl_tr2_td' + (addTrIdNum+1)  +'"><a class="btn btn_bg_orange b_block" onclick="delCl(' + (addTrIdNum+1) + ')">删除</a></td>';
			for(var i=0;i<clTrLength;i++){
				$(".cl_tr_" + i).append(htmlTr[i]);
			}
	
		}else{
		
			var clTrLength = $("#clTable tr").length;//材料table行数

			var htmlTr = new Array();
	
			htmlTr[0] = '<td class="td edit_1" id="cl_tr0_td' + (clTdLength-1)  +'"><input type="text" value=" " /></td>';
			htmlTr[1] = '<td class="td edit_2" id="cl_tr1_td' + (clTdLength-1)  +'"><input type="text" value=" " /></td>';
			htmlTr[2] = '<td class="td" id="cl_tr2_td' + (clTdLength-1)  +'"><a class="btn btn_bg_orange b_block" onclick="delCl(' + (clTdLength-1) + ')">删除</a></td>';
			for(var i=0;i<clTrLength;i++){
				$(".cl_tr_" + i).append(htmlTr[i]);
			}
		
		
		}
	}

	//删除材料整列
	function delCl(id){
		var dataName = $("#ISOToolCoating_btn").attr("data-name");
		var str = '';
		if(dataName == 0){//保存
			str = str + $("#cl_tr" + 0 + "_td" + id ).html() + "-";
			str = str + $("#cl_tr" + 1 + "_td" + id ).html() + ",";
		}else{//点击输入
			str = str + $("#cl_tr" + 0 + "_td" + id + " input").val() + "-";
			str = str + $("#cl_tr" + 1 + "_td" + id + " input").val() + ",";
		}
		
		if(confirm("确定要删除吗?")){
			var clTrLength = $("#clTable tr").length;//材料table行数
			for(var i=0;i<clTrLength;i++){
				$("#cl_tr" + i + "_td" + id).remove();
				var ISOToolCoating = $("#ISOToolCoating_userForm").val();
				ISOToolCoating = ISOToolCoating.replace(str, '');
				$("#ISOToolCoating_userForm").val(ISOToolCoating);
			}
		}
	}
</script>
</body>
</html>
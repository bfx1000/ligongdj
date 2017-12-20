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
		
		//图片
		var array_PictureManufRS = $("#array_PictureManufRS").val();
		if(array_PictureManufRS != null && array_PictureManufRS != ''){
			var PictureManufRSs = array_PictureManufRS.split(',');
			var PictureManufRSs_str = '';
			for(var i = 0; i < PictureManufRSs.length; i++){
				if(PictureManufRSs[i] != null && PictureManufRSs[i] != ''){
					PictureManufRSs_str = PictureManufRSs_str + "<div><img name='PictureManufRSs_img' width='100px' height='100px' src='<%=path%>/goods"+PictureManufRSs[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureManufRSImg(\""+PictureManufRSs[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureManufRSList").html(PictureManufRSs_str);
		}
		
		//图片
		var array_PictureToolWearManufRS = $("#array_PictureToolWearManufRS").val();
		if(array_PictureToolWearManufRS != null && array_PictureToolWearManufRS != ''){
			var PictureToolWearManufRSs = array_PictureToolWearManufRS.split(',');
			var PictureToolWearManufRSs_str = '';
			for(var i = 0; i < PictureToolWearManufRSs.length; i++){
				if(PictureToolWearManufRSs[i] != null && PictureToolWearManufRSs[i] != ''){
					PictureToolWearManufRSs_str = PictureToolWearManufRSs_str + "<div><img name='PictureToolWearManufRSs_img' width='100px' height='100px' src='<%=path%>/goods"+PictureToolWearManufRSs[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureToolWearManufRSImg(\""+PictureToolWearManufRSs[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureToolWearManufRSList").html(PictureToolWearManufRSs_str);
		}
		
		
		
		var array_SurfaceRoughnessFileManufRS = $("#array_SurfaceRoughnessFileManufRS").val();
		var array_SurfaceRoughnessFileManufRS_name = $("#array_SurfaceRoughnessFileManufRS_name").val();
		if(array_SurfaceRoughnessFileManufRS != null && array_SurfaceRoughnessFileManufRS != ''){
			var SurfaceRoughnessFileManufRSs= array_SurfaceRoughnessFileManufRS.split(',');
			var SurfaceRoughnessFileManufRSs_name = array_SurfaceRoughnessFileManufRS_name.split(',');
			var SurfaceRoughnessFileManufRSs_str = '';
			for(var i = 0; i < SurfaceRoughnessFileManufRSs.length; i++){
				if(SurfaceRoughnessFileManufRSs[i] != null && SurfaceRoughnessFileManufRSs[i] != ''){
					SurfaceRoughnessFileManufRSs_str = SurfaceRoughnessFileManufRSs_str + "<div><span name='SurfaceRoughnessFileManufRSs_img' url='"+SurfaceRoughnessFileManufRSs[i]+"' >"+SurfaceRoughnessFileManufRSs_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelSurfaceRoughnessFileManufRSImg(\""+SurfaceRoughnessFileManufRSs[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_SurfaceRoughnessFileManufRSList").html(SurfaceRoughnessFileManufRSs_str);
		}
		
		var array_SurfaceHardnessFileManufRS = $("#array_SurfaceHardnessFileManufRS").val();
		var array_SurfaceHardnessFileManufRS_name = $("#array_SurfaceHardnessFileManufRS_name").val();
		if(array_SurfaceHardnessFileManufRS != null && array_SurfaceHardnessFileManufRS != ''){
			var SurfaceHardnessFileManufRSs= array_SurfaceHardnessFileManufRS.split(',');
			var SurfaceHardnessFileManufRSs_name = array_SurfaceHardnessFileManufRS_name.split(',');
			var SurfaceHardnessFileManufRSs_str = '';
			for(var i = 0; i < SurfaceHardnessFileManufRSs.length; i++){
				if(SurfaceHardnessFileManufRSs[i] != null && SurfaceHardnessFileManufRSs[i] != ''){
					SurfaceHardnessFileManufRSs_str = SurfaceHardnessFileManufRSs_str + "<div><span name='SurfaceHardnessFileManufRSs_img' url='"+SurfaceHardnessFileManufRSs[i]+"' >"+SurfaceHardnessFileManufRSs_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelSurfaceHardnessFileManufRSImg(\""+SurfaceHardnessFileManufRSs[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_SurfaceHardnessFileManufRSList").html(SurfaceHardnessFileManufRSs_str);
		}
		
		var array_SurfaceStressFileManufRS = $("#array_SurfaceStressFileManufRS").val();
		var array_SurfaceStressFileManufRS_name = $("#array_SurfaceStressFileManufRS_name").val();
		if(array_SurfaceStressFileManufRS != null && array_SurfaceStressFileManufRS != ''){
			var SurfaceStressFileManufRSs= array_SurfaceStressFileManufRS.split(',');
			var SurfaceStressFileManufRSs_name = array_SurfaceStressFileManufRS_name.split(',');
			var SurfaceStressFileManufRSs_str = '';
			for(var i = 0; i < SurfaceStressFileManufRSs.length; i++){
				if(SurfaceStressFileManufRSs[i] != null && SurfaceStressFileManufRSs[i] != ''){
					SurfaceStressFileManufRSs_str = SurfaceStressFileManufRSs_str + "<div><span name='SurfaceStressFileManufRSs_img' url='"+SurfaceStressFileManufRSs[i]+"' >"+SurfaceStressFileManufRSs_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelSurfaceStressFileManufRSImg(\""+SurfaceStressFileManufRSs[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_SurfaceStressFileManufRSList").html(SurfaceStressFileManufRSs_str);
		}
		
		var array_SurfaceMorphologyFileManufRS = $("#array_SurfaceMorphologyFileManufRS").val();
		var array_SurfaceMorphologyFileManufRS_name = $("#array_SurfaceMorphologyFileManufRS_name").val();
		if(array_SurfaceMorphologyFileManufRS != null && array_SurfaceMorphologyFileManufRS != ''){
			var SurfaceMorphologyFileManufRSs= array_SurfaceMorphologyFileManufRS.split(',');
			var SurfaceMorphologyFileManufRSs_name = array_SurfaceMorphologyFileManufRS_name.split(',');
			var SurfaceMorphologyFileManufRSs_str = '';
			for(var i = 0; i < SurfaceMorphologyFileManufRSs.length; i++){
				if(SurfaceMorphologyFileManufRSs[i] != null && SurfaceMorphologyFileManufRSs[i] != ''){
					SurfaceMorphologyFileManufRSs_str = SurfaceMorphologyFileManufRSs_str + "<div><span name='SurfaceMorphologyFileManufRSs_img' url='"+SurfaceMorphologyFileManufRSs[i]+"' >"+SurfaceMorphologyFileManufRSs_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelSurfaceMorphologyFileManufRSImg(\""+SurfaceMorphologyFileManufRSs[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_SurfaceMorphologyFileManufRSList").html(SurfaceMorphologyFileManufRSs_str);
		}
		
		var array_ChipShapeFileManufRS = $("#array_ChipShapeFileManufRS").val();
		var array_ChipShapeFileManufRS_name = $("#array_ChipShapeFileManufRS_name").val();
		if(array_ChipShapeFileManufRS != null && array_ChipShapeFileManufRS != ''){
			var ChipShapeFileManufRSs= array_ChipShapeFileManufRS.split(',');
			var ChipShapeFileManufRSs_name = array_ChipShapeFileManufRS_name.split(',');
			var ChipShapeFileManufRSs_str = '';
			for(var i = 0; i < ChipShapeFileManufRSs.length; i++){
				if(ChipShapeFileManufRSs[i] != null && ChipShapeFileManufRSs[i] != ''){
					ChipShapeFileManufRSs_str = ChipShapeFileManufRSs_str + "<div><span name='ChipShapeFileManufRSs_img' url='"+ChipShapeFileManufRSs[i]+"' >"+ChipShapeFileManufRSs_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelChipShapeFileManufRSImg(\""+ChipShapeFileManufRSs[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ChipShapeFileManufRSList").html(ChipShapeFileManufRSs_str);
		}
		
		var array_ManufRSDefined1File = $("#array_ManufRSDefined1File").val();
		var array_ManufRSDefined1File_name = $("#array_ManufRSDefined1File_name").val();
		if(array_ManufRSDefined1File != null && array_ManufRSDefined1File != ''){
			var ManufRSDefined1Files= array_ManufRSDefined1File.split(',');
			var ManufRSDefined1Files_name = array_ManufRSDefined1File_name.split(',');
			var ManufRSDefined1Files_str = '';
			for(var i = 0; i < ManufRSDefined1Files.length; i++){
				if(ManufRSDefined1Files[i] != null && ManufRSDefined1Files[i] != ''){
					ManufRSDefined1Files_str = ManufRSDefined1Files_str + "<div><span name='ManufRSDefined1Files_img' url='"+ManufRSDefined1Files[i]+"' >"+ManufRSDefined1Files_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelManufRSDefined1FileImg(\""+ManufRSDefined1Files[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ManufRSDefined1FileList").html(ManufRSDefined1Files_str);
		}
		
		var array_ManufRSDefined2File = $("#array_ManufRSDefined2File").val();
		var array_ManufRSDefined2File_name = $("#array_ManufRSDefined2File_name").val();
		if(array_ManufRSDefined2File != null && array_ManufRSDefined2File != ''){
			var ManufRSDefined2Files= array_ManufRSDefined2File.split(',');
			var ManufRSDefined2Files_name = array_ManufRSDefined2File_name.split(',');
			var ManufRSDefined2Files_str = '';
			for(var i = 0; i < ManufRSDefined2Files.length; i++){
				if(ManufRSDefined2Files[i] != null && ManufRSDefined2Files[i] != ''){
					ManufRSDefined2Files_str = ManufRSDefined2Files_str + "<div><span name='ManufRSDefined2Files_img' url='"+ManufRSDefined2Files[i]+"' >"+ManufRSDefined2Files_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelManufRSDefined2FileImg(\""+ManufRSDefined2Files[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ManufRSDefined2FileList").html(ManufRSDefined2Files_str);
		}
		
		var array_ManufRSDefined3File = $("#array_ManufRSDefined3File").val();
		var array_ManufRSDefined3File_name = $("#array_ManufRSDefined3File_name").val();
		if(array_ManufRSDefined3File != null && array_ManufRSDefined3File != ''){
			var ManufRSDefined3Files= array_ManufRSDefined3File.split(',');
			var ManufRSDefined3Files_name = array_ManufRSDefined3File_name.split(',');
			var ManufRSDefined3Files_str = '';
			for(var i = 0; i < ManufRSDefined3Files.length; i++){
				if(ManufRSDefined3Files[i] != null && ManufRSDefined3Files[i] != ''){
					ManufRSDefined3Files_str = ManufRSDefined3Files_str + "<div><span name='ManufRSDefined3Files_img' url='"+ManufRSDefined3Files[i]+"' >"+ManufRSDefined3Files_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelManufRSDefined3FileImg(\""+ManufRSDefined3Files[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ManufRSDefined3FileList").html(ManufRSDefined3Files_str);
		}
		
	});
		
	function onSavePictureManufRSList(){
		 var formDate = new FormData();  
		 formDate.append("PictureManufactureResultChild",$("#PictureManufRS").get(0).files[0]);
	     $.ajax({  
	          url: '/ManufactureResultChild/savePictureManufactureResultChild' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (url) {  
	              if(url!=""){
	            	  $("#span_PictureManufRSList").append("<div><img name='PictureManufRSs_img' width='100px' height='100px' src='<%=path%>/goods"+url+"' /><a class='btn btn_shanchu' onclick='onDelPictureManufRSImg(\""+url+"\");'>删除</a><br/></div>");
	            	  $("#PictureManufRS").remove();
	            	  $("#PictureManuf").html('<input type="file" accept="image/*" name="PictureManufRS" id="PictureManufRS" />');
	            	  var array_PictureManufRS = $("#array_PictureManufRS").val();
	            	  array_PictureManufRS = array_PictureManufRS + url + "," ;
	            	  $("#array_PictureManufRS").val(array_PictureManufRS);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	function onDelPictureManufRSImg(url_PictureManufRS){
		
		var img_array = $("img[name='PictureManufRSs_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_PictureManufRS){
				$(img_array[i]).parent().remove();
				var array_PictureManufRS = $("#array_PictureManufRS").val();
				array_PictureManufRS = array_PictureManufRS.replace(url_PictureManufRS,'');
				$("#array_PictureManufRS").val(array_PictureManufRS);
			}
		}
	}
	
	function onSavePictureToolWearManufRSList(){
		 var formDate = new FormData();  
		 formDate.append("PictureManufactureResultChild",$("#PictureToolWearManufRS").get(0).files[0]);
	     $.ajax({  
	          url: '/ManufactureResultChild/savePictureManufactureResultChild' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (url) {  
	              if(url!=""){
	            	  $("#span_PictureToolWearManufRSList").append("<div><img name='PictureToolWearManufRSs_img' width='100px' height='100px' src='<%=path%>/goods"+url+"' /><a class='btn btn_shanchu' onclick='onDelPictureToolWearManufRSImg(\""+url+"\");'>删除</a><br/></div>");
	            	  $("#PictureToolWearManufRS").remove();
	            	  $("#PictureToolWearManuf").html('<input type="file" accept="image/*" name="PictureToolWearManufRS" id="PictureToolWearManufRS" />');
	            	  var array_PictureToolWearManufRS = $("#array_PictureToolWearManufRS").val();
	            	  array_PictureToolWearManufRS = array_PictureToolWearManufRS + url + "," ;
	            	  $("#array_PictureToolWearManufRS").val(array_PictureToolWearManufRS);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	function onDelPictureToolWearManufRSImg(url_PictureToolWearManufRS){
		
		var img_array = $("img[name='PictureToolWearManufRSs_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_PictureToolWearManufRS){
				$(img_array[i]).parent().remove();
				var array_PictureToolWearManufRS = $("#array_PictureToolWearManufRS").val();
				array_PictureToolWearManufRS = array_PictureToolWearManufRS.replace(url_PictureToolWearManufRS,'');
				$("#array_PictureToolWearManufRS").val(array_PictureToolWearManufRS);
			}
		}
	}
	
	function onSaveSurfaceRoughnessFileManufRSList(){
		var formDate = new FormData();
		formDate.append("FileManufactureResultChild",$("#SurfaceRoughnessFileManufRS").get(0).files[0]);
	     $.ajax({  
	          url: '/ManufactureResultChild/saveFileManufactureResultChild' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  $("#span_SurfaceRoughnessFileManufRSList").append("<div><span name='SurfaceRoughnessFileManufRSs_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelSurfaceRoughnessFileManufRSImg(\""+data.url+"\");'>删除</a><br/></div>");
	            	  $("#SurfaceRoughnessFileManufRS").remove();
	            	  $("#SurfaceRoughnessFileManuf").html('<input type="file" accept=".pdf" name="SurfaceRoughnessFileManufRS" id="SurfaceRoughnessFileManufRS" />');
	            	  var array_SurfaceRoughnessFileManufRS = $("#array_SurfaceRoughnessFileManufRS").val();
	            	  var array_SurfaceRoughnessFileManufRS_name = $("#array_SurfaceRoughnessFileManufRS_name").val();
	            	  array_SurfaceRoughnessFileManufRS_name = array_SurfaceRoughnessFileManufRS_name + data.fileName + ",";
	            	  array_SurfaceRoughnessFileManufRS = array_SurfaceRoughnessFileManufRS + data.url + "," ;
	            	  $("#array_SurfaceRoughnessFileManufRS").val(array_SurfaceRoughnessFileManufRS);
	            	  $("#array_SurfaceRoughnessFileManufRS_name").val(array_SurfaceRoughnessFileManufRS_name);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	function onDelSurfaceRoughnessFileManufRSImg(url_SurfaceRoughnessFileManufRS){
		var img_array = $("span[name='SurfaceRoughnessFileManufRSs_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_SurfaceRoughnessFileManufRS){
				$(img_array[i]).parent().remove();
				var array_SurfaceRoughnessFileManufRS = $("#array_SurfaceRoughnessFileManufRS").val();
				array_SurfaceRoughnessFileManufRS = array_SurfaceRoughnessFileManufRS.replace(url_SurfaceRoughnessFileManufRS,'');
				$("#array_SurfaceRoughnessFileManufRS").val(array_SurfaceRoughnessFileManufRS);
				
			}
		}
	}
	
	//保存详细信息
	function onSaveSurfaceHardnessFileManufRSList(){
		var formDate = new FormData();  
		formDate.append("FileManufactureResultChild",$("#SurfaceHardnessFileManufRS").get(0).files[0]);
	     $.ajax({  
	          url: '/ManufactureResultChild/saveFileManufactureResultChild' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  $("#span_SurfaceHardnessFileManufRSList").append("<div><span name='SurfaceHardnessFileManufRSs_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelSurfaceHardnessFileManufRSImg(\""+data.url+"\");'>删除</a><br/></div>");
	            	  $("#SurfaceHardnessFileManufRS").remove();
	            	  $("#SurfaceHardnessFileManuf").html('<input type="file" accept=".pdf" name="SurfaceHardnessFileManufRS" id="SurfaceHardnessFileManufRS" />');
	            	  var array_SurfaceHardnessFileManufRS = $("#array_SurfaceHardnessFileManufRS").val();
	            	  var array_SurfaceHardnessFileManufRS_name = $("#array_SurfaceHardnessFileManufRS_name").val();
	            	  array_SurfaceHardnessFileManufRS_name = array_SurfaceHardnessFileManufRS_name + data.fileName + ",";
	            	  array_SurfaceHardnessFileManufRS = array_SurfaceHardnessFileManufRS + data.url + "," ;
	            	  $("#array_SurfaceHardnessFileManufRS").val(array_SurfaceHardnessFileManufRS);
	            	  $("#array_SurfaceHardnessFileManufRS_name").val(array_SurfaceHardnessFileManufRS_name);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除详细信息
	function onDelSurfaceHardnessFileManufRSImg(url_SurfaceHardnessFileManufRS){
		var img_array = $("span[name='SurfaceHardnessFileManufRSs_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_SurfaceHardnessFileManufRS){
				$(img_array[i]).parent().remove();
				var array_SurfaceHardnessFileManufRS = $("#array_SurfaceHardnessFileManufRS").val();
				array_SurfaceHardnessFileManufRS = array_SurfaceHardnessFileManufRS.replace(url_SurfaceHardnessFileManufRS,'');
				$("#array_SurfaceHardnessFileManufRS").val(array_SurfaceHardnessFileManufRS);
				
			}
		}
	}
	
	//保存详细信息
	function onSaveSurfaceStressFileManufRSList(){
		var formDate = new FormData();
		formDate.append("FileManufactureResultChild",$("#SurfaceStressFileManufRS").get(0).files[0]);
	     $.ajax({  
	          url: '/ManufactureResultChild/saveFileManufactureResultChild' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  $("#span_SurfaceStressFileManufRSList").append("<div><span name='SurfaceStressFileManufRSs_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelSurfaceStressFileManufRSImg(\""+data.url+"\");'>删除</a><br/></div>");
	            	  $("#SurfaceStressFileManufRS").remove();
	            	  $("#SurfaceStressFileManuf").html('<input type="file" accept=".pdf" name="SurfaceStressFileManufRS" id="SurfaceStressFileManufRS" />');
	            	  var array_SurfaceStressFileManufRS = $("#array_SurfaceStressFileManufRS").val();
	            	  var array_SurfaceStressFileManufRS_name = $("#array_SurfaceStressFileManufRS_name").val();
	            	  array_SurfaceStressFileManufRS_name = array_SurfaceStressFileManufRS_name + data.fileName + ",";
	            	  array_SurfaceStressFileManufRS = array_SurfaceStressFileManufRS + data.url + "," ;
	            	  $("#array_SurfaceStressFileManufRS").val(array_SurfaceStressFileManufRS);
	            	  $("#array_SurfaceStressFileManufRS_name").val(array_SurfaceStressFileManufRS_name);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除详细信息
	function onDelSurfaceStressFileManufRSImg(url_SurfaceStressFileManufRS){
		var img_array = $("span[name='SurfaceStressFileManufRSs_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_SurfaceStressFileManufRS){
				$(img_array[i]).parent().remove();
				var array_SurfaceStressFileManufRS = $("#array_SurfaceStressFileManufRS").val();
				array_SurfaceStressFileManufRS = array_SurfaceStressFileManufRS.replace(url_SurfaceStressFileManufRS,'');
				$("#array_SurfaceStressFileManufRS").val(array_SurfaceStressFileManufRS);
				
			}
		}
	}
	
	//保存详细信息
	function onSaveSurfaceMorphologyFileManufRSList(){
		var formDate = new FormData();  
		formDate.append("FileManufactureResultChild",$("#SurfaceMorphologyFileManufRS").get(0).files[0]);
	     $.ajax({  
	          url: '/ManufactureResultChild/saveFileManufactureResultChild' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  $("#span_SurfaceMorphologyFileManufRSList").append("<div><span name='SurfaceMorphologyFileManufRSs_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelSurfaceMorphologyFileManufRSImg(\""+data.url+"\");'>删除</a><br/></div>");
	            	  $("#SurfaceMorphologyFileManufRS").remove();
	            	  $("#SurfaceMorphologyFileManuf").html('<input type="file" accept=".pdf" name="SurfaceMorphologyFileManufRS" id="SurfaceMorphologyFileManufRS" />');
	            	  var array_SurfaceMorphologyFileManufRS = $("#array_SurfaceMorphologyFileManufRS").val();
	            	  var array_SurfaceMorphologyFileManufRS_name = $("#array_SurfaceMorphologyFileManufRS_name").val();
	            	  array_SurfaceMorphologyFileManufRS_name = array_SurfaceMorphologyFileManufRS_name + data.fileName + ",";
	            	  array_SurfaceMorphologyFileManufRS = array_SurfaceMorphologyFileManufRS + data.url + "," ;
	            	  $("#array_SurfaceMorphologyFileManufRS").val(array_SurfaceMorphologyFileManufRS);
	            	  $("#array_SurfaceMorphologyFileManufRS_name").val(array_SurfaceMorphologyFileManufRS_name);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除详细信息
	function onDelSurfaceMorphologyFileManufRSImg(url_SurfaceMorphologyFileManufRS){
		var img_array = $("span[name='SurfaceMorphologyFileManufRSs_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_SurfaceMorphologyFileManufRS){
				$(img_array[i]).parent().remove();
				var array_SurfaceMorphologyFileManufRS = $("#array_SurfaceMorphologyFileManufRS").val();
				array_SurfaceMorphologyFileManufRS = array_SurfaceMorphologyFileManufRS.replace(url_SurfaceMorphologyFileManufRS,'');
				$("#array_SurfaceMorphologyFileManufRS").val(array_SurfaceMorphologyFileManufRS);
				
			}
		}
	}
	//保存详细信息
	function onSaveChipShapeFileManufRSList(){
		var formDate = new FormData();  
		formDate.append("FileManufactureResultChild",$("#ChipShapeFileManufRS").get(0).files[0]);
	     $.ajax({  
	          url: '/ManufactureResultChild/saveFileManufactureResultChild' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  $("#span_ChipShapeFileManufRSList").append("<div><span name='ChipShapeFileManufRSs_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelChipShapeFileManufRSImg(\""+data.url+"\");'>删除</a><br/></div>");
	            	  $("#ChipShapeFileManufRS").remove();
	            	  $("#ChipShapeFileManuf").html('<input type="file" accept=".pdf" name="ChipShapeFileManufRS" id="ChipShapeFileManufRS" />');
	            	  var array_ChipShapeFileManufRS = $("#array_ChipShapeFileManufRS").val();
	            	  var array_ChipShapeFileManufRS_name = $("#array_ChipShapeFileManufRS_name").val();
	            	  array_ChipShapeFileManufRS_name = array_ChipShapeFileManufRS_name + data.fileName + ",";
	            	  array_ChipShapeFileManufRS = array_ChipShapeFileManufRS + data.url + "," ;
	            	  $("#array_ChipShapeFileManufRS").val(array_ChipShapeFileManufRS);
	            	  $("#array_ChipShapeFileManufRS_name").val(array_ChipShapeFileManufRS_name);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除详细信息
	function onDelChipShapeFileManufRSImg(url_ChipShapeFileManufRS){
		var img_array = $("span[name='ChipShapeFileManufRSs_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_ChipShapeFileManufRS){
				$(img_array[i]).parent().remove();
				var array_ChipShapeFileManufRS = $("#array_ChipShapeFileManufRS").val();
				array_ChipShapeFileManufRS = array_ChipShapeFileManufRS.replace(url_ChipShapeFileManufRS,'');
				$("#array_ChipShapeFileManufRS").val(array_ChipShapeFileManufRS);
				
			}
		}
	}
	
	//保存详细信息
	function onSaveManufRSDefined1FileList(){
		var formDate = new FormData();
		formDate.append("FileManufactureResultChild",$("#ManufRSDefined1File").get(0).files[0]);
	     $.ajax({  
	          url: '/ManufactureResultChild/saveFileManufactureResultChild' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  $("#span_ManufRSDefined1FileList").append("<div><span name='ManufRSDefined1Files_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelManufRSDefined1FileImg(\""+data.url+"\");'>删除</a><br/></div>");
	            	  $("#ManufRSDefined1File").remove();
	            	  $("#ManufRSDefined1F").html('<input type="file" accept=".pdf" name="ManufRSDefined1File" id="ManufRSDefined1File" />');
	            	  var array_ManufRSDefined1File = $("#array_ManufRSDefined1File").val();
	            	  var array_ManufRSDefined1File_name = $("#array_ManufRSDefined1File_name").val();
	            	  array_ManufRSDefined1File_name = array_ManufRSDefined1File_name + data.fileName + ",";
	            	  array_ManufRSDefined1File = array_ManufRSDefined1File + data.url + "," ;
	            	  $("#array_ManufRSDefined1File").val(array_ManufRSDefined1File);
	            	  $("#array_ManufRSDefined1File_name").val(array_ManufRSDefined1File_name);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除详细信息
	function onDelManufRSDefined1FileImg(url_ManufRSDefined1File){
		var img_array = $("span[name='ManufRSDefined1Files_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_ManufRSDefined1File){
				$(img_array[i]).parent().remove();
				var array_ManufRSDefined1File = $("#array_ManufRSDefined1File").val();
				array_ManufRSDefined1File = array_ManufRSDefined1File.replace(url_ManufRSDefined1File,'');
				$("#array_ManufRSDefined1File").val(array_ManufRSDefined1File);
				
			}
		}
	}
	
	//保存详细信息
	function onSaveManufRSDefined2FileList(){
		var formDate = new FormData();  
		formDate.append("FileManufactureResultChild",$("#ManufRSDefined2File").get(0).files[0]);
	     $.ajax({  
	          url: '/ManufactureResultChild/saveFileManufactureResultChild' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  $("#span_ManufRSDefined2FileList").append("<div><span name='ManufRSDefined2Files_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelManufRSDefined2FileImg(\""+data.url+"\");'>删除</a><br/></div>");
	            	  $("#ManufRSDefined2File").remove();
	            	  $("#ManufRSDefined2F").html('<input type="file" accept=".pdf" name="ManufRSDefined2File" id="ManufRSDefined2File" />');
	            	  var array_ManufRSDefined2File = $("#array_ManufRSDefined2File").val();
	            	  var array_ManufRSDefined2File_name = $("#array_ManufRSDefined2File_name").val();
	            	  array_ManufRSDefined2File_name = array_ManufRSDefined2File_name + data.fileName + ",";
	            	  array_ManufRSDefined2File = array_ManufRSDefined2File + data.url + "," ;
	            	  $("#array_ManufRSDefined2File").val(array_ManufRSDefined2File);
	            	  $("#array_ManufRSDefined2File_name").val(array_ManufRSDefined2File_name);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除详细信息
	function onDelManufRSDefined2FileImg(url_ManufRSDefined2File){
		var img_array = $("span[name='ManufRSDefined2Files_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_ManufRSDefined2File){
				$(img_array[i]).parent().remove();
				var array_ManufRSDefined2File = $("#array_ManufRSDefined2File").val();
				array_ManufRSDefined2File = array_ManufRSDefined2File.replace(url_ManufRSDefined2File,'');
				$("#array_ManufRSDefined2File").val(array_ManufRSDefined2File);
				
			}
		}
	}
	
	//保存详细信息
	function onSaveManufRSDefined3FileList(){
		var formDate = new FormData();
		formDate.append("FileManufactureResultChild",$("#ManufRSDefined3File").get(0).files[0]);
	     $.ajax({  
	          url: '/ManufactureResultChild/saveFileManufactureResultChild' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  $("#span_ManufRSDefined3FileList").append("<div><span name='ManufRSDefined3Files_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelManufRSDefined3FileImg(\""+data.url+"\");'>删除</a><br/></div>");
	            	  $("#ManufRSDefined3File").remove();
	            	  $("#ManufRSDefined3F").html('<input type="file" accept=".pdf" name="ManufRSDefined3File" id="ManufRSDefined3File" />');
	            	  var array_ManufRSDefined3File = $("#array_ManufRSDefined3File").val();
	            	  var array_ManufRSDefined3File_name = $("#array_ManufRSDefined3File_name").val();
	            	  array_ManufRSDefined3File_name = array_ManufRSDefined3File_name + data.fileName + ",";
	            	  array_ManufRSDefined3File = array_ManufRSDefined3File + data.url + "," ;
	            	  $("#array_ManufRSDefined3File").val(array_ManufRSDefined3File);
	            	  $("#array_ManufRSDefined3File_name").val(array_ManufRSDefined3File_name);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除详细信息
	function onDelManufRSDefined3FileImg(url_ManufRSDefined3File){
		var img_array = $("span[name='ManufRSDefined3Files_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_ManufRSDefined3File){
				$(img_array[i]).parent().remove();
				var array_ManufRSDefined3File = $("#array_ManufRSDefined3File").val();
				array_ManufRSDefined3File = array_ManufRSDefined3File.replace(url_ManufRSDefined3File,'');
				$("#array_ManufRSDefined3File").val(array_ManufRSDefined3File);
				
			}
		}
	}

	//取消
	function onClose(){
		window.location.href='<%=path%>/ManufactureResultChild/ManufactureResultChildList';
	}
	
	//保存
	function save(){
		
		$("#ToollifeManufRS").val($("#ToollifeManufRS_userForm").val());
		$("#ToolWearManufRS").val($("#ToolWearManufRS_userForm").val());
		$("#RemovalRateManufRS").val($("#RemovalRateManufRS_userForm").val());
		$("#MachiningSize").val($("#MachiningSize_userForm").val());
		$("#SizePrecision").val($("#SizePrecision_userForm").val());
		$("#MachiningTime").val($("#MachiningTime_userForm").val());
		$("#SurfaceRoughnessManufRS").val($("#SurfaceRoughnessManufRS_userForm").val());
		$("#SurfaceHardnessManufRS").val($("#SurfaceHardnessManufRS_userForm").val());
		$("#SurfaceStressManufRS").val($("#SurfaceStressManufRS_userForm").val());
		$("#SurfaceMorphologyManufRS").val($("#SurfaceMorphologyManufRS_userForm").val());
		$("#ChipShapeManufRS").val($("#ChipShapeManufRS_userForm").val());
		$("#ManufRSDefined1").val($("#ManufRSDefined1_userForm").val());
		$("#ManufRSDefined1Value").val($("#ManufRSDefined1Value_userForm").val());
		$("#ManufRSDefined2").val($("#ManufRSDefined2_userForm").val());
		$("#ManufRSDefined2Value").val($("#ManufRSDefined2Value_userForm").val());
		$("#ManufRSDefined3").val($("#ManufRSDefined3_userForm").val());
		$("#ManufRSDefined3Value").val($("#ManufRSDefined3Value_userForm").val());
		$("#array_PictureManufRS_userForm").val($("#array_PictureManufRS").val());
		$("#array_PictureToolWearManufRS_userForm").val($("#array_PictureToolWearManufRS").val());
		$("#array_SurfaceRoughnessFileManufRS_userForm").val($("#array_SurfaceRoughnessFileManufRS").val());
		$("#array_SurfaceRoughnessFileManufRS_name_userForm").val($("#array_SurfaceRoughnessFileManufRS_name").val());
		$("#array_SurfaceHardnessFileManufRS_userForm").val($("#array_SurfaceHardnessFileManufRS").val());
		$("#array_SurfaceHardnessFileManufRS_name_userForm").val($("#array_SurfaceHardnessFileManufRS_name").val());
		$("#array_SurfaceStressFileManufRS_userForm").val($("#array_SurfaceStressFileManufRS").val());
		$("#array_SurfaceStressFileManufRS_name_userForm").val($("#array_SurfaceStressFileManufRS_name").val());
		$("#array_SurfaceMorphologyFileManufRS_userForm").val($("#array_SurfaceMorphologyFileManufRS").val());
		$("#array_SurfaceMorphologyFileManufRS_name_userForm").val($("#array_SurfaceMorphologyFileManufRS_name").val());
		$("#array_ChipShapeFileManufRS_userForm").val($("#array_ChipShapeFileManufRS").val());
		$("#array_ChipShapeFileManufRS_name_userForm").val($("#array_ChipShapeFileManufRS_name").val());
		$("#array_ManufRSDefined1File_userForm").val($("#array_ManufRSDefined1File").val());
		$("#array_ManufRSDefined1File_name_userForm").val($("#array_ManufRSDefined1File_name").val());
		$("#array_ManufRSDefined2File_userForm").val($("#array_ManufRSDefined2File").val());
		$("#array_ManufRSDefined2File_name_userForm").val($("#array_ManufRSDefined2File_name").val());
		$("#array_ManufRSDefined3File_userForm").val($("#array_ManufRSDefined3File").val());
		$("#array_ManufRSDefined3File_name_userForm").val($("#array_ManufRSDefined3File_name").val());
		
		$("#userForm").ajaxSubmit(function(result){
			if(result == 1){
				alert('操作成功！');
				onClose();
			}else{
				alert('操作失败，请联系管理员！');
			}
		});
	}
	//加载各种信息
	function jz(){
		var html = '<iframe name="content_iframe" class="content_iframe" id="content_iframe" frameborder="0" src="/ManufactureResultChild/loading" style="width:100%;height:100%;"></iframe>';
		$("#div").html(html);
	}
	function close(){
		$("#div").html("");
	}
	
	
	function opt(){
		$("#div").html("");
		$("#NoManufRS_userForm").val(arguments[0]);
		$("#DateStartManufRS_userForm").val(arguments[2]);
		$("#DateFinishManufRS_userForm").val(arguments[3]);
		$("#RemarkManufRS_userForm").val(arguments[4]);
		$("#PartNoManufRS_userForm").val(arguments[5]);
		$("#NameManufRS_userForm").val(arguments[6]);
		$("#NumberMaterialManufRS_userForm").val(arguments[7]);
		$("#CategoryMaterialManufRS_userForm").val(arguments[8]);
		$("#DeviceManufRS_userForm").val(arguments[9]);
		$("#IDDeviceManufRS_userForm").val(arguments[10]);
		$("#NoProcessManufRS_userForm").val(arguments[11]);
		$("#NameProcessManufRS_userForm").val(arguments[12]);
		$("#NoProcessStepManufRS_userForm").val(arguments[13]);
		$("#NameProcessStepManufRS_userForm").val(arguments[14]);
		$("#MachiningTypeManufRS_userForm").val(arguments[15]);
		$("#MachiningLevelManufRS_userForm").val(arguments[16]);
		$("#CuttingFluidManufRS_userForm").val(arguments[17]);
		$("#CutterSpeedManufRS_userForm").val(arguments[18]);
		$("#SpindleSpeedManufRS_userForm").val(arguments[19]);
		$("#FeedManufRS_userForm").val(arguments[20]);
		$("#CuttingDepthManufRS_userForm").val(arguments[21]);
		$("#CuttingWidthManufRS_userForm").val(arguments[22]);
		$("#FeedSpeedManufRS_userForm").val(arguments[23]);
		$("#ToolHolderManufRS_userForm").val(arguments[24]);
		$("#ToolbladeManufRS_userForm").val(arguments[25]);
		$("#ToolMaterialManufRS_userForm").val(arguments[26]);
		$("#CutterManufRS_userForm").val(arguments[27]);
		
	}
	
</script>
</head>
<body>
<div id="div">
</div>
<div></div>
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text">
    <form action="/ManufactureResultChild/saveManufactureResultChild" name="userForm" id="userForm" method="post">
	 
	 <input type="hidden" name="ToollifeManufRS" id="ToollifeManufRS" value=""/>
	 <input type="hidden" name="ToolWearManufRS" id="ToolWearManufRS" value=""/>
	 <input type="hidden" name="RemovalRateManufRS" id="RemovalRateManufRS" value=""/>
	 <input type="hidden" name="MachiningSize" id="MachiningSize" value=""/>
	 <input type="hidden" name="SizePrecision" id="SizePrecision" value=""/>
	 <input type="hidden" name="MachiningTime" id="MachiningTime" value=""/>
	 <input type="hidden" name="SurfaceRoughnessManufRS" id="SurfaceRoughnessManufRS" value=""/>
	 <input type="hidden" name="SurfaceHardnessManufRS" id="SurfaceHardnessManufRS" value=""/>
	 <input type="hidden" name="SurfaceStressManufRS" id="SurfaceStressManufRS" value=""/>
	 <input type="hidden" name="SurfaceMorphologyManufRS" id="SurfaceMorphologyManufRS" value=""/>
	 <input type="hidden" name="ChipShapeManufRS" id="ChipShapeManufRS" value=""/>
	 <input type="hidden" name="ManufRSDefined1" id="ManufRSDefined1" value=""/>
	 <input type="hidden" name="ManufRSDefined1Value" id="ManufRSDefined1Value" value=""/>
	 <input type="hidden" name="ManufRSDefined2" id="ManufRSDefined2" value=""/>
	 <input type="hidden" name="ManufRSDefined2Value" id="ManufRSDefined2Value" value=""/>
	 <input type="hidden" name="ManufRSDefined3" id="ManufRSDefined3" value=""/>
	 <input type="hidden" name="ManufRSDefined3Value" id="ManufRSDefined3Value" value=""/>
	 
	 <input type="hidden" name="array_PictureManufRS" id="array_PictureManufRS_userForm" value=""/>
	 <input type="hidden" name="array_PictureToolWearManufRS" id="array_PictureToolWearManufRS_userForm" value=""/>
	 <input type="hidden" name="array_SurfaceRoughnessFileManufRS" id="array_SurfaceRoughnessFileManufRS_userForm" value=""/>
	 <input type="hidden" name="array_SurfaceRoughnessFileManufRS_name" id="array_SurfaceRoughnessFileManufRS_name_userForm" value=""/>
	 <input type="hidden" name="array_SurfaceHardnessFileManufRS" id="array_SurfaceHardnessFileManufRS_userForm" value=""/>
	 <input type="hidden" name="array_SurfaceHardnessFileManufRS_name" id="array_SurfaceHardnessFileManufRS_name_userForm" value=""/>
	 <input type="hidden" name="array_SurfaceStressFileManufRS" id="array_SurfaceStressFileManufRS_userForm" value=""/>
	 <input type="hidden" name="array_SurfaceStressFileManufRS_name" id="array_SurfaceStressFileManufRS_name_userForm" value=""/>
	 <input type="hidden" name="array_SurfaceMorphologyFileManufRS" id="array_SurfaceMorphologyFileManufRS_userForm" value=""/>
	 <input type="hidden" name="array_SurfaceMorphologyFileManufRS_name" id="array_SurfaceMorphologyFileManufRS_name_userForm" value=""/>
	 <input type="hidden" name="array_ChipShapeFileManufRS" id="array_ChipShapeFileManufRS_userForm" value=""/>
	 <input type="hidden" name="array_ChipShapeFileManufRS_name" id="array_ChipShapeFileManufRS_name_userForm" value=""/>
	 <input type="hidden" name="array_ManufRSDefined1File" id="array_ManufRSDefined1File_userForm" value=""/>
	 <input type="hidden" name="array_ManufRSDefined1File_name" id="array_ManufRSDefined1File_name_userForm" value=""/>
	 <input type="hidden" name="array_ManufRSDefined2File" id="array_ManufRSDefined2File_userForm" value=""/>
	 <input type="hidden" name="array_ManufRSDefined2File_name" id="array_ManufRSDefined2File_name_userForm" value=""/>
	 <input type="hidden" name="array_ManufRSDefined3File" id="array_ManufRSDefined3File_userForm" value=""/>
	 <input type="hidden" name="array_ManufRSDefined3File_name" id="array_ManufRSDefined3File_name_userForm" value=""/>
	 
	  <input type="hidden" name="id_ManufactureResultChild" id="id_ManufactureResultChild_userForm" value="${(ManufactureResultChild.id_ManufactureResultChild == null || ManufactureResultChild.id_ManufactureResultChild == '') ? 0 : ManufactureResultChild.id_ManufactureResultChild}"/>
	  
	  <li>
	  <span style="color:#217fe1;"><h3>加工信息：</h3></span>
	  </li>
	  <li>
  		<input type="button" value="加载生产计划" class="btn" onclick="jz();"/>
 	  </li>
	  <li>
	    <span id="lititle">生产编号</span>
	    <input name="NoManufRS" id="NoManufRS_userForm" type="text" value="${ManufactureResultChild.NoManufRS}" class="input"/>
	  </li>		
	  <li>
	    <span id="lititle">生产序号ID</span>
	    <input name="QuantityManufRS" id="QuantityManufRS_userForm" type="text" value="${ManufactureResultChild.QuantityManufRS}" class="input"  />
	  </li>
	  <li>
	    <span id="lititle">生产日期</span>
	    <input name="DateStartManufRS" id="DateStartManufRS_userForm" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"  type="text" value="${ManufactureResultChild.DateStartManufRS}" class="input"  />
	  </li>
	  <li>
	    <span id="lititle">完成日期</span>
	    <input name="DateFinishManufRS" id="DateFinishManufRS_userForm" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"  type="text" value="${ManufactureResultChild.DateFinishManufRS}" class="input"  />
	  </li>
	  <li>
	    <span id="lititle">备注</span>
	    <input name="RemarkManufRS" id="RemarkManufRS_userForm" type="text" value="${ManufactureResultChild.RemarkManufRS}" class="input"  />
	  </li>
	  <li>&nbsp;</li>
	  <li>
		<span style="color:#217fe1;"><h3>零件信息及设备：</h3></span>
	  </li>
	  <li>
	 	&nbsp;
	  </li>
	  <li>
	    <span id="lititle">零件编号</span>
	    <input name="PartNoManufRS" id="PartNoManufRS_userForm" type="text" value="${ManufactureResultChild.PartNoManufRS}" class="input"  />
	  </li>
	  
	  <li>
	    <span id="lititle">零件名称</span>
	    <input name="NameManufRS" id="NameManufRS_userForm" type="text" value="${ManufactureResultChild.NameManufRS}" class="input"  />
	  </li>
	  
	  <li>
	    <span id="lititle">材料牌号</span>
	    <input name="NumberMaterialManufRS" id="NumberMaterialManufRS_userForm" type="text" value="${ManufactureResultChild.NumberMaterialManufRS }" class="input"  />
	  </li>
	  
	  <li>
	    <span id="lititle">材料类别</span>
	    <input name="CategoryMaterialManufRS" id="CategoryMaterialManufRS_userForm" type="text" value="${ManufactureResultChild.CategoryMaterialManufRS }" class="input"  />
	  </li>
	  
	  <li>
	    <span id="lititle">设备编号</span>
	    <input name="DeviceManufRS" id="DeviceManufRS_userForm" type="text" value="${ManufactureResultChild.DeviceManufRS }" class="input"  />
	  </li>
	  
	  <li>
	    <span id="lititle">节点设备编号</span>
	    <input name="IDDeviceManufRS" id="IDDeviceManufRS_userForm" type="text" value="${ManufactureResultChild.IDDeviceManufRS}" class="input"  />
	  </li>
	  
	 <div class="clear"></div>
	  
	  
	  <div class="box_xiangxi zhedie">
		<div class="box_zhedie">
			<span class="a_zhedie1" id = "zd1" onclick = "zd(1);" style="display:block;">工艺信息</span>
			<span class="a_zhedie2" id = "zd11" onclick = "zd1(1);" style="display:none;">工艺信息</span>
		</div>
		<div class="box_u1" id="box_clcs1" style="display:none">
			
			<ul class="box_text">
			  <li>
			  	<span style="color:#217fe1;"><h3>工序信息：</h3></span>
			  </li>
			  <li>
		  		&nbsp;
		 	  </li>
			  <li>
			    <span id="lititle">工序编号</span>
			    <input name="NoProcessManufRS" id="NoProcessManufRS_userForm" type="text" value="${ManufactureResultChild.NoProcessManufRS }" class="input"  />
			  </li>
			  
			  <li>
			    <span id="lititle">工序名称</span>
			    <input name="NameProcessManufRS" id="NameProcessManufRS_userForm" type="text" value="${ManufactureResultChild.NameProcessManufRS}" class="input"  />
			  </li>
			  
			   <li>
			  	<span style="color:#217fe1;"><h3>工步信息：</h3></span>
			  </li>
			  <li>
		  		&nbsp;
		 	  </li>
		 	  
			   <li>
			    <span id="lititle">工步编号</span>
			    <input name="NoProcessStepManufRS" id="NoProcessStepManufRS_userForm" type="text" value="${ManufactureResultChild.NoProcessStepManufRS}" class="input"  />
			  </li>
			  
			  <li>
			    <span id="lititle">工步名称</span>
			    <input name="NameProcessStepManufRS" id="NameProcessStepManufRS_userForm" type="text" value="${ManufactureResultChild.NameProcessStepManufRS}" class="input"  />
			  </li>
			  
			   <li>
			    <span id="lititle">加工类别</span>
			    <input name="MachiningTypeManufRS" id="MachiningTypeManufRS_userForm" type="text" value="${ManufactureResultChild.MachiningTypeManufRS }" class="input"  />
			  </li>
			  
			  <li>
			    <span id="lititle">加工级别</span>
			    <input name="MachiningLevelManufRS" id="MachiningLevelManufRS_userForm" type="text" value="${ManufactureResultChild.MachiningLevelManufRS }" class="input"  />
			  </li>
			  
			  <li>
			    <span id="lititle">切削液</span>
			    <input name="CuttingFluidManufRS" id="CuttingFluidManufRS_userForm" type="text" value="${ManufactureResultChild.CuttingFluidManufRS}" class="input" />
			  </li>		
			  <li>
			    <span id="lititle">切削速度</span>
			    <input name="CutterSpeedManufRS" id="CutterSpeedManufRS_userForm" type="text" value="${ManufactureResultChild.CutterSpeedManufRS}" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">主轴转速</span>
			    <input name="SpindleSpeedManufRS" id="SpindleSpeedManufRS_userForm" type="text" value="${ManufactureResultChild.SpindleSpeedManufRS}" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">每齿进给量</span>
			    <input name="FeedManufRS" id="FeedManufRS_userForm" type="text" value="${ManufactureResultChild.FeedManufRS}" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">切削深度</span>
			    <input name="CuttingDepthManufRS" id="CuttingDepthManufRS_userForm" type="text" value="${ManufactureResultChild.CuttingDepthManufRS}" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">切削宽度</span>
			    <input name="CuttingWidthManufRS" id="CuttingWidthManufRS_userForm" type="text" value="${ManufactureResultChild.CuttingWidthManufRS}" class="input" />
			  </li>		
			  <li>
			    <span id="lititle">进给速度</span>
			    <input name="FeedSpeedManufRS" id="FeedSpeedManufRS_userForm" type="text" value="${ManufactureResultChild.FeedSpeedManufRS}" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">刀柄</span>
			    <input name="ToolHolderManufRS" id="ToolHolderManufRS_userForm" type="text" value="${ManufactureResultChild.ToolHolderManufRS}" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">刀片</span>
			    <input name="ToolbladeManufRS" id="ToolbladeManufRS_userForm" type="text" value="${ManufactureResultChild.ToolbladeManufRS}" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">刀片/刀具材料</span>
			    <input name="ToolMaterialManufRS" id="ToolMaterialManufRS_userForm" type="text" value="${ManufactureResultChild.ToolMaterialManufRS}" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">刀具</span>
			    <input name="CutterManufRS" id="CutterManufRS_userForm" type="text" value="${ManufactureResultChild.CutterManufRS}" class="input" />
			  </li>
			  </form>
			  </ul>
		</div>
		<div class="clear"></div>
	</div>

	<div class="box_xiangxi zhedie">
		<div class="box_zhedie">
			<span class="a_zhedie1" id = "zd2" onclick = "zd(2);" style="display:block;">生产结果</span>
			<span class="a_zhedie2" id = "zd12" onclick = "zd1(2);" style="display:none;">生产结果</span>
		</div>
		<div class="box_u1" id="box_clcs2" style="display:none">
			
			<ul class="box_text">
			  <li>
			    <span id="lititle">刀具寿命</span>
			    <input name="ToollifeManufRS" id="ToollifeManufRS_userForm" type="text" value="${ManufactureResultChild.ToollifeManufRS }" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">刀具磨损量</span>
			    <input name="ToolWearManufRS" id="ToolWearManufRS_userForm" type="text" value="${ManufactureResultChild.ToolWearManufRS}" class="input"  />
			  </li>
			   <li>
			    <span id="lititle">材料去除率</span>
			    <input name="RemovalRateManufRS" id="RemovalRateManufRS_userForm" type="text" value="${ManufactureResultChild.RemovalRateManufRS }" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">加工尺寸</span>
			    <input name="MachiningSize" id="MachiningSize_userForm" type="text" value="${ManufactureResultChild.MachiningSize}" class="input"  />
			  </li>
			   <li>
			    <span id="lititle">尺寸精度</span>
			    <input name="SizePrecision" id="SizePrecision_userForm" type="text" value="${ManufactureResultChild.SizePrecision }" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">加工时间</span>
			    <input name="MachiningTime" id="MachiningTime_userForm" type="text" value="${ManufactureResultChild.MachiningTime}" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">表面粗糙度</span>
			    <input name="SurfaceRoughnessManufRS" id="SurfaceRoughnessManufRS_userForm" type="text" value="${ManufactureResultChild.SurfaceRoughnessManufRS}" class="input"  />
			  </li>
			  <li class="block"> 
		 	  	<form id = "SurfaceRoughnessFileManufRSForm">
			 	    <span id="lititle">表面粗糙度文件</span>
			 	    <input type ="hidden" id = "array_SurfaceRoughnessFileManufRS" value = "${array_SurfaceRoughnessFileManufRS }"/>
			 	    <input type ="hidden" id = "array_SurfaceRoughnessFileManufRS_name" value = "${array_SurfaceRoughnessFileManufRS_name }"/>
				    <span id = "SurfaceRoughnessFileManuf">  
				    	<input type="file" accept=".pdf" name="SurfaceRoughnessFileManufRS" id="SurfaceRoughnessFileManufRS" />
				    </span>
				    <input type="button" value="加载文件" class="btn" onclick="onSaveSurfaceRoughnessFileManufRSList();"/>
				    <div class="clear"></div>
				    <span id="span_SurfaceRoughnessFileManufRSList">
				    </span>
			    </form>
		 	  </li> 
		 	  
		 	  <li>
			    <span id="lititle">表面硬度</span>
			    <input name="SurfaceHardnessManufRS" id="SurfaceHardnessManufRS_userForm" type="text" value="${ManufactureResultChild.SurfaceHardnessManufRS}" class="input"  />
			  </li>
			  <li class="block"> 
		 	  	<form id = "SurfaceHardnessFileManufRSForm">
			 	    <span id="lititle">表面硬度文件</span>
			 	    <input type ="hidden" id = "array_SurfaceHardnessFileManufRS" value = "${array_SurfaceHardnessFileManufRS }"/>
			 	    <input type ="hidden" id = "array_SurfaceHardnessFileManufRS_name" value = "${array_SurfaceHardnessFileManufRS_name }"/>
				    <span id = "SurfaceHardnessFileManuf">  
				    	<input type="file" accept=".pdf" name="SurfaceHardnessFileManufRS" id="SurfaceHardnessFileManufRS" />
				    </span>
				    <input type="button" value="加载文件" class="btn" onclick="onSaveSurfaceHardnessFileManufRSList();"/>
				    <div class="clear"></div>
				    <span id="span_SurfaceHardnessFileManufRSList">
				    </span>
			    </form>
		 	  </li> 
		 	  
		 	  
		 	  <li>
			    <span id="lititle">表面残余应力</span>
			    <input name="SurfaceStressManufRS" id="SurfaceStressManufRS_userForm" type="text" value="${ManufactureResultChild.SurfaceStressManufRS}" class="input"  />
			  </li>
			  <li class="block"> 
		 	  	<form id = "SurfaceStressFileManufRSForm">
			 	    <span id="lititle">表面参与文件</span>
			 	    <input type ="hidden" id = "array_SurfaceStressFileManufRS" value = "${array_SurfaceStressFileManufRS }"/>
			 	    <input type ="hidden" id = "array_SurfaceStressFileManufRS_name" value = "${array_SurfaceStressFileManufRS_name }"/>
				    <span id = "SurfaceStressFileManuf">  
				    	<input type="file" accept=".pdf" name="SurfaceStressFileManufRS" id="SurfaceStressFileManufRS" />
				    </span>
				    <input type="button" value="加载文件" class="btn" onclick="onSaveSurfaceStressFileManufRSList();"/>
				    <div class="clear"></div>
				    <span id="span_SurfaceStressFileManufRSList">
				    </span>
			    </form>
		 	  </li> 
		 	  
		 	  
		 	  <li>
			    <span id="lititle">加工表面形态</span>
			    <input name="SurfaceMorphologyManufRS" id="SurfaceMorphologyManufRS_userForm" type="text" value="${ManufactureResultChild.SurfaceMorphologyManufRS}" class="input"  />
			  </li>
			  <li class="block"> 
		 	  	<form id = "SurfaceMorphologyFileManufRSForm">
			 	    <span id="lititle">表面文件</span>
			 	    <input type ="hidden" id = "array_SurfaceMorphologyFileManufRS" value = "${array_SurfaceMorphologyFileManufRS }"/>
			 	    <input type ="hidden" id = "array_SurfaceMorphologyFileManufRS_name" value = "${array_SurfaceMorphologyFileManufRS_name }"/>
				    <span id = "SurfaceMorphologyFileManuf">  
				    	<input type="file" accept=".pdf" name="SurfaceMorphologyFileManufRS" id="SurfaceMorphologyFileManufRS" />
				    </span>
				    <input type="button" value="加载文件" class="btn" onclick="onSaveSurfaceMorphologyFileManufRSList();"/>
				    <div class="clear"></div>
				    <span id="span_SurfaceMorphologyFileManufRSList">
				    </span>
			    </form>
		 	  </li> 
		 	  
		 	  
		 	  <li>
			    <span id="lititle">切屑形态</span>
			    <input name="ChipShapeManufRS" id="ChipShapeManufRS_userForm" type="text" value="${ManufactureResultChild.ChipShapeManufRS}" class="input"  />
			  </li>
			  <li class="block"> 
		 	  	<form id = "ChipShapeFileManufRSForm">
			 	    <span id="lititle">切屑形态文件</span>
			 	    <input type ="hidden" id = "array_ChipShapeFileManufRS" value = "${array_ChipShapeFileManufRS }"/>
			 	    <input type ="hidden" id = "array_ChipShapeFileManufRS_name" value = "${array_ChipShapeFileManufRS_name }"/>
				    <span id = "ChipShapeFileManuf">  
				    	<input type="file" accept=".pdf" name="ChipShapeFileManufRS" id="ChipShapeFileManufRS" />
				    </span>
				    <input type="button" value="加载文件" class="btn" onclick="onSaveChipShapeFileManufRSList();"/>
				    <div class="clear"></div>
				    <span id="span_ChipShapeFileManufRSList">
				    </span>
			    </form>
		 	  </li> 
			 	  <li class="block bor_t">
			  	  	<form id="PictureManufRSForm">
				    	<span id="lititle">加工结果图片</span>
				    	<input type ="hidden" id = "array_PictureManufRS" value = "${array_PictureManufRS }"/>
				    	<span id = "PictureManuf">  	
				    		<input type="file" accept="image/*" name="PictureManufRS" id="PictureManufRS" />
				    	</span>  
				    	<input type="button" value="加载图片" class="btn" onclick="onSavePictureManufRSList();"/>
				    	<div class="clear"></div>
				    	<span id="span_PictureManufRSList">
				    	</span>
				    </form>
			  	  </li>
			  	  <li class="block bor_t">
			  	  	<form id="PictureToolWearManufRSForm">
				    	<span id="lititle">刀具磨损图片</span>
				    	<input type ="hidden" id = "array_PictureToolWearManufRS" value = "${array_PictureToolWearManufRS }"/>
				    	<span id = "PictureToolWearManuf">  	
				    		<input type="file" accept="image/*" name="PictureToolWearManufRS" id="PictureToolWearManufRS" />
				    	</span>  
				    	<input type="button" value="加载图片" class="btn" onclick="onSavePictureToolWearManufRSList();"/>
				    	<div class="clear"></div>
				    	<span id="span_PictureToolWearManufRSList">
				    	</span>
				    </form>
			  	  </li>
			  </ul>
		</div>
		<div class="clear"></div>
	</div>
	
	
	<div class="box_xiangxi zhedie">
		<div class="box_zhedie">
			<span class="a_zhedie1" id = "zd3" onclick = "zd(3);" style="display:block;">自定义结果</span>
			<span class="a_zhedie2" id = "zd13" onclick = "zd1(3);" style="display:none;">自定义结果</span>
		</div>
		<div class="box_u1" id="box_clcs3" style="display:none">
			
			<ul class="box_text">
			  <li>
			    <span id="lititle">参数名称1</span>
			    <input name="ManufRSDefined1" id="ManufRSDefined1_userForm" type="text" value="${ManufactureResultChild.ManufRSDefined1 }" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">结果1</span>
			    <input name="ManufRSDefined1Value" id="ManufRSDefined1Value_userForm" type="text" value="${ManufactureResultChild.ManufRSDefined1Value}" class="input"  />
			  </li>
			  <li class="block"> 
		 	  	<form id = "ManufRSDefined1FileForm">
			 	    <span id="lititle">自定义文件1</span>
			 	    <input type ="hidden" id = "array_ManufRSDefined1File" value = "${array_ManufRSDefined1File }"/>
			 	    <input type ="hidden" id = "array_ManufRSDefined1File_name" value = "${array_ManufRSDefined1File_name }"/>
				    <span id = "ManufRSDefined1F">  
				    	<input type="file" accept=".pdf" name="ManufRSDefined1File" id="ManufRSDefined1File" />
				    </span>
				    <input type="button" value="加载文件" class="btn" onclick="onSaveManufRSDefined1FileList();"/>
				    <div class="clear"></div>
				    <span id="span_ManufRSDefined1FileList">
				    </span>
			    </form>
		 	  </li> 
		 	  
		 	  <li>
			    <span id="lititle">参数名称2</span>
			    <input name="ManufRSDefined2" id="ManufRSDefined2_userForm" type="text" value="${ManufactureResultChild.ManufRSDefined2 }" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">结果2</span>
			    <input name="ManufRSDefined2Value" id="ManufRSDefined2Value_userForm" type="text" value="${ManufactureResultChild.ManufRSDefined2Value}" class="input"  />
			  </li>
			  <li class="block"> 
		 	  	<form id = "ManufRSDefined2FileForm">
			 	    <span id="lititle">自定义文件2</span>
			 	    <input type ="hidden" id = "array_ManufRSDefined2File" value = "${array_ManufRSDefined2File }"/>
			 	    <input type ="hidden" id = "array_ManufRSDefined2File_name" value = "${array_ManufRSDefined2File_name }"/>
				    <span id = "ManufRSDefined2F">  
				    	<input type="file" accept=".pdf" name="ManufRSDefined2File" id="ManufRSDefined2File" />
				    </span>
				    <input type="button" value="加载文件" class="btn" onclick="onSaveManufRSDefined2FileList();"/>
				    <div class="clear"></div>
				    <span id="span_ManufRSDefined2FileList">
				    </span>
			    </form>
		 	  </li> 
		 	  
		 	  <li>
			    <span id="lititle">参数名称3</span>
			    <input name="ManufRSDefined3" id="ManufRSDefined3_userForm" type="text" value="${ManufactureResultChild.ManufRSDefined3 }" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">结果3</span>
			    <input name="ManufRSDefined3Value" id="ManufRSDefined3Value_userForm" type="text" value="${ManufactureResultChild.ManufRSDefined3Value}" class="input"  />
			  </li>
			  <li class="block"> 
		 	  	<form id = "ManufRSDefined3FileForm">
			 	    <span id="lititle">自定义文件3</span>
			 	    <input type ="hidden" id = "array_ManufRSDefined3File" value = "${array_ManufRSDefined3File }"/>
			 	    <input type ="hidden" id = "array_ManufRSDefined3File_name" value = "${array_ManufRSDefined3File_name }"/>
				    <span id = "ManufRSDefined3F">  
				    	<input type="file" accept=".pdf" name="ManufRSDefined3File" id="ManufRSDefined3File" />
				    </span>
				    <input type="button" value="加载文件" class="btn" onclick="onSaveManufRSDefined3FileList();"/>
				    <div class="clear"></div>
				    <span id="span_ManufRSDefined3FileList">
				    </span>
			    </form>
		 	  </li> 
			  </ul>
		</div>
		<div class="clear"></div>
	</div>		

  </ul>
</div>
<div>
	
</div>
</body>
<script type="text/javascript">
	function zd(i){
		$("#box_clcs"+i).css("display","block");
		$("#zd"+i).css("display","none");
		$("#zd1"+i).css("display","block");
	}
	function zd1(i){
		$("#box_clcs"+i).css("display","none");
		$("#zd"+i).css("display","block");
		$("#zd1"+i).css("display","none");
	}
</script>
</html>
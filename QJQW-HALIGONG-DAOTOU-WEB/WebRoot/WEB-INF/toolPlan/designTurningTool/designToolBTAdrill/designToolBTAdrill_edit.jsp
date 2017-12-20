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

<script type="text/javascript">
	function zd(){
		$("#box_clcs0").css("display","block");
		$("#zd").css("display","none");
		$("#zd1").css("display","block");
	}
	function zd1(){
		$("#box_clcs0").css("display","none");
		$("#zd").css("display","block");
		$("#zd1").css("display","none");
	}
</script>

<script type="text/JavaScript">

	$(document).ready(function(){
		
		//图片
		var array_PictureDesignToolBTAdrill = $("#array_PictureDesignToolBTAdrill").val();
		if(array_PictureDesignToolBTAdrill != null && array_PictureDesignToolBTAdrill != ''){
			var PictureDesignToolBTAdrills = array_PictureDesignToolBTAdrill.split(',');
			var PictureDesignToolBTAdrills_str = '';
			for(var i = 0; i < PictureDesignToolBTAdrills.length; i++){
				if(PictureDesignToolBTAdrills[i] != null && PictureDesignToolBTAdrills[i] != ''){
					PictureDesignToolBTAdrills_str = PictureDesignToolBTAdrills_str + "<div><img name='pictureDesignToolBTAdrills_img' width='100px' height='100px' src='<%=path%>/goods"+PictureDesignToolBTAdrills[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureDesignToolBTAdrillImg(\""+PictureDesignToolBTAdrills[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureDesignToolBTAdrillList").html(PictureDesignToolBTAdrills_str);
		}
		
		//详细信息
		var array_InformDetailDesignToolBTAdrill = $("#array_InformDetailDesignToolBTAdrill").val();
		var array_InformDetailDesignToolBTAdrill_name = $("#array_InformDetailDesignToolBTAdrill_name").val();
		if(array_InformDetailDesignToolBTAdrill != null && array_InformDetailDesignToolBTAdrill != ''){
			var InformDetailDesignToolBTAdrills= array_InformDetailDesignToolBTAdrill.split(',');
			var InformDetailDesignToolBTAdrills_name = array_InformDetailDesignToolBTAdrill_name.split(',');
			var InformDetailDesignToolBTAdrills_str = '';
			for(var i = 0; i < InformDetailDesignToolBTAdrills.length; i++){
				if(InformDetailDesignToolBTAdrills[i] != null && InformDetailDesignToolBTAdrills[i] != ''){
					InformDetailDesignToolBTAdrills_str = InformDetailDesignToolBTAdrills_str + "<div><span name='informDetailDesignToolBTAdrills_img' url='"+InformDetailDesignToolBTAdrills[i]+"' >"+InformDetailDesignToolBTAdrills_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelInformDetailDesignToolBTAdrillImg(\""+InformDetailDesignToolBTAdrills[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_InformDetailDesignToolBTAdrillList").html(InformDetailDesignToolBTAdrills_str);
		}
		
		//part
		var array_PartDesignToolBTAdrill = $("#array_PartDesignToolBTAdrill").val();
		var array_PartDesignToolBTAdrill_name = $("#array_PartDesignToolBTAdrill_name").val();
		if(array_PartDesignToolBTAdrill != null && array_PartDesignToolBTAdrill != ''){
			var PartDesignToolBTAdrills = array_PartDesignToolBTAdrill.split(',');
			var PartDesignToolBTAdrills_name = array_PartDesignToolBTAdrill_name.split(',');
			var PartDesignToolBTAdrills_str = '';
			for(var i = 0; i < PartDesignToolBTAdrills.length; i++){
				if(PartDesignToolBTAdrills[i] != null && PartDesignToolBTAdrills[i] != ''){
					PartDesignToolBTAdrills_str = PartDesignToolBTAdrills_str + "<div><span name='partDesignToolBTAdrills_img' url='"+PartDesignToolBTAdrills[i]+"' >"+PartDesignToolBTAdrills_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelPartDesignToolBTAdrillImg(\""+PartDesignToolBTAdrills[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PartDesignToolBTAdrillList").html(PartDesignToolBTAdrills_str);
		}
		
	});

	
	//取消
	function onClose(){
		window.location.href='<%=path%>/designToolBTAdrill/queryDesignToolBTAdrillList';
	}
	
	
	//保存刀柄图片
	function onSavePictureDesignToolBTAdrillList(){
		 var formDate = new FormData(document.getElementById("pictureForm"));  
	     $.ajax({  
	          url: '/designToolBTAdrill/savePictureDesignToolBTAdrill' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (url) {  
	              if(url!=""){
	            	  $("#span_PictureDesignToolBTAdrillList").append("<div><img name='pictureDesignToolBTAdrills_img' width='100px' height='100px' src='<%=path%>/goods"+url+"' /><a class='btn btn_shanchu' onclick='onDelPictureDesignToolBTAdrillImg(\""+url+"\");'>删除</a><br/></div>");
	            	  $("#PictureDesignToolBTAdrill").remove();
	            	  $("#picture").html('<input type="file" accept="image/*" name="PictureDesignToolBTAdrill" id="PictureDesignToolBTAdrill" />');
	            	  var array_PictureDesignToolBTAdrill = $("#array_PictureDesignToolBTAdrill").val();
	            	  array_PictureDesignToolBTAdrill = array_PictureDesignToolBTAdrill + url + "," ;
	            	  $("#array_PictureDesignToolBTAdrill").val(array_PictureDesignToolBTAdrill);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除刀具图片
	function onDelPictureDesignToolBTAdrillImg(url_pictureDesignToolBTAdrill){
		
		var img_array = $("img[name='pictureDesignToolBTAdrills_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_pictureDesignToolBTAdrill){
				$(img_array[i]).parent().remove();
				var array_PictureDesignToolBTAdrill = $("#array_PictureDesignToolBTAdrill").val();
				array_PictureDesignToolBTAdrill = array_PictureDesignToolBTAdrill.replace(url_pictureDesignToolBTAdrill,'');
				$("#array_PictureDesignToolBTAdrill").val(array_PictureDesignToolBTAdrill);
			}
		}
	}
	
	//保存详细信息
	function onSaveInformDetailDesignToolBTAdrillList(){
		var formDate = new FormData(document.getElementById("informDetailForm"));  
	     $.ajax({  
	          url: '/designToolBTAdrill/saveInformDetailDesignToolBTAdrill' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  $("#span_InformDetailDesignToolBTAdrillList").append("<div><span name='informDetailDesignToolBTAdrills_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelInformDetailDesignToolBTAdrillImg(\""+data.url+"\");'>删除</a><br/></div>");
	            	  $("#InformDetailDesignToolBTAdrill").remove();
	            	  $("#informDetail").html('<input type="file" accept=".pdf" name="InformDetailDesignToolBTAdrill" id="InformDetailDesignToolBTAdrill" />');
	            	  var array_InformDetailDesignToolBTAdrill = $("#array_InformDetailDesignToolBTAdrill").val();
	            	  var array_InformDetailDesignToolBTAdrill_name = $("#array_InformDetailDesignToolBTAdrill_name").val();
	            	  array_InformDetailDesignToolBTAdrill_name = array_InformDetailDesignToolBTAdrill_name + data.fileName + ",";
	            	  array_InformDetailDesignToolBTAdrill = array_InformDetailDesignToolBTAdrill + data.url + "," ;
	            	  $("#array_InformDetailDesignToolBTAdrill").val(array_InformDetailDesignToolBTAdrill);
	            	  $("#array_InformDetailDesignToolBTAdrill_name").val(array_InformDetailDesignToolBTAdrill_name);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除详细信息
	function onDelInformDetailDesignToolBTAdrillImg(url_informDetailDesignToolBTAdrill){
		var img_array = $("span[name='informDetailDesignToolBTAdrills_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_informDetailDesignToolBTAdrill){
				$(img_array[i]).parent().remove();
				var array_InformDetailDesignToolBTAdrill = $("#array_InformDetailDesignToolBTAdrill").val();
				array_InformDetailDesignToolBTAdrill = array_InformDetailDesignToolBTAdrill.replace(url_informDetailDesignToolBTAdrill,'');
				$("#array_InformDetailDesignToolBTAdrill").val(array_InformDetailDesignToolBTAdrill);
				
			}
		}
	}
	
	
	//保存part
	function onSavePartDesignToolBTAdrillList(){
		var formDate = new FormData(document.getElementById("partForm"));  
	     $.ajax({  
	          url: '/designToolBTAdrill/savePartDesignToolBTAdrill' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  $("#span_PartDesignToolBTAdrillList").append("<div><span name='partDesignToolBTAdrills_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelPartDesignToolBTAdrillImg(\""+data.url+"\");'>删除</a><br/></div>");
	            	  $("#PartDesignToolBTAdrill").remove();
	            	  $("#part").html('<input type="file" name="PartDesignToolBTAdrill" id="PartDesignToolBTAdrill" />');
	            	  var array_PartDesignToolBTAdrill = $("#array_PartDesignToolBTAdrill").val();
	            	  var array_PartDesignToolBTAdrill_name = $("#array_PartDesignToolBTAdrill_name").val();
	            	  array_PartDesignToolBTAdrill_name = array_PartDesignToolBTAdrill_name + data.fileName + ",";
	            	  array_PartDesignToolBTAdrill = array_PartDesignToolBTAdrill + data.url + "," ;
	            	  $("#array_PartDesignToolBTAdrill").val(array_PartDesignToolBTAdrill);
	            	  $("#array_PartDesignToolBTAdrill_name").val(array_PartDesignToolBTAdrill_name);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	

	//删除part
	function onDelPartDesignToolBTAdrillImg(url_partDesignToolBTAdrill){
		var img_array = $("span[name='partDesignToolBTAdrills_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_partDesignToolBTAdrill){
				$(img_array[i]).parent().remove();
				var array_PartDesignToolBTAdrill = $("#array_PartDesignToolBTAdrill").val();
				array_PartDesignToolBTAdrill = array_PartDesignToolBTAdrill.replace(url_partDesignToolBTAdrill,'');
				$("#array_PartDesignToolBTAdrill").val(array_PartDesignToolBTAdrill);
			}
		}
	}

	
	//保存刀片信息下的part文件all
	function onSavePartAllDesignToolBTAdrillList(ascription){
        var file = null;
		if("P"==ascription){
			file = $("#PartAllDesignToolBTAdrill_P").get(0).files[0]; //选择上传的文件
		}
		else if("C"==ascription){
			file = $("#PartAllDesignToolBTAdrill_C").get(0).files[0]; //选择上传的文件
		}
		else if("ZI"==ascription){
			file = $("#PartAllDesignToolBTAdrill_ZI").get(0).files[0]; //选择上传的文件
		}
		else if("One"==ascription){
			file = $("#PartAllDesignToolBTAdrill_One").get(0).files[0]; //选择上传的文件
		}
		else if("Two"==ascription){
			file = $("#PartAllDesignToolBTAdrill_Two").get(0).files[0]; //选择上传的文件
		}
		else if("Body"==ascription){
			file = $("#PartAllDesignToolBTAdrill_Body").get(0).files[0]; //选择上传的文件
		}
		else if("S"==ascription){
			file = $("#PartAllDesignToolBTAdrill_S").get(0).files[0]; //选择上传的文件
		}
		if(file==null||file==""){
			alert("请选择文件");
			return false;
		}
		var formData = new FormData();
		formData.append("file",file);
		formData.append("ascription",ascription);
		
		$.ajax({  
	          url: '/designToolBTAdrill/savePartAllDesignToolBTAdrill' ,  
	          type: 'POST',  
	          data: formData,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  if(data.ascription=="P"){
		            	  $("#span_PartAllDesignToolBTAdrillList_P").append("<div><span name='partAllDesignToolBTAdrills_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelPartAllDesignToolBTAdrillImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#PartAllDesignToolBTAdrill_P").remove();
		            	  $("#partAll_P").html('<input type="file" name="PartAllDesignToolBTAdrill_P" id="PartAllDesignToolBTAdrill_P" />');
		            	  var array_pPart = $("#array_pPart").val();
		            	  var array_pPart_name = $("#array_pPart_name").val();
		            	  array_pPart_name = array_pPart_name + data.fileName + ",";
		            	  array_pPart = array_pPart + data.url + "," ;
		            	  $("#array_pPart").val(array_pPart);
		            	  $("#array_pPart_name").val(array_pPart_name);
	            	  }
	            	  if(data.ascription=="C"){
		            	  $("#span_PartAllDesignToolBTAdrillList_C").append("<div><span name='partAllDesignToolBTAdrills_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelPartAllDesignToolBTAdrillImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#PartAllDesignToolBTAdrill_C").remove();
		            	  $("#partAll_C").html('<input type="file" name="PartAllDesignToolBTAdrill_C" id="PartAllDesignToolBTAdrill_C" />');
		            	  var array_cPart = $("#array_cPart").val();
		            	  var array_cPart_name = $("#array_cPart_name").val();
		            	  array_cPart_name = array_cPart_name + data.fileName + ",";
		            	  array_cPart = array_cPart + data.url + "," ;
		            	  $("#array_cPart").val(array_cPart);
		            	  $("#array_cPart_name").val(array_cPart_name);
	            	  }
	            	  if(data.ascription=="ZI"){
		            	  $("#span_PartAllDesignToolBTAdrillList_ZI").append("<div><span name='partAllDesignToolBTAdrills_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelPartAllDesignToolBTAdrillImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#PartAllDesignToolBTAdrill_ZI").remove();
		            	  $("#partAll_ZI").html('<input type="file" name="PartAllDesignToolBTAdrill_ZI" id="PartAllDesignToolBTAdrill_ZI" />');
		            	  var array_ziPart = $("#array_ziPart").val();
		            	  var array_ziPart_name = $("#array_ziPart_name").val();
		            	  array_ziPart_name = array_ziPart_name + data.fileName + ",";
		            	  array_ziPart = array_ziPart + data.url + "," ;
		            	  $("#array_ziPart").val(array_ziPart);
		            	  $("#array_ziPart_name").val(array_ziPart_name);
	            	  }
	            	  if(data.ascription=="One"){
		            	  $("#span_PartAllDesignToolBTAdrillList_One").append("<div><span name='partAllDesignToolBTAdrills_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelPartAllDesignToolBTAdrillImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#PartAllDesignToolBTAdrill_One").remove();
		            	  $("#partAll_One").html('<input type="file" name="PartAllDesignToolBTAdrill_One" id="PartAllDesignToolBTAdrill_One" />');
		            	  var array_onePart = $("#array_onePart").val();
		            	  var array_onePart_name = $("#array_onePart_name").val();
		            	  array_onePart_name = array_onePart_name + data.fileName + ",";
		            	  array_onePart = array_onePart + data.url + "," ;
		            	  $("#array_onePart").val(array_onePart);
		            	  $("#array_onePart_name").val(array_onePart_name);
	            	  }
	            	  if(data.ascription=="Two"){
		            	  $("#span_PartAllDesignToolBTAdrillList_Two").append("<div><span name='partAllDesignToolBTAdrills_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelPartAllDesignToolBTAdrillImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#PartAllDesignToolBTAdrill_Two").remove();
		            	  $("#partAll_Two").html('<input type="file" name="PartAllDesignToolBTAdrill_Two" id="PartAllDesignToolBTAdrill_Two" />');
		            	  var array_twoPart = $("#array_twoPart").val();
		            	  var array_twoPart_name = $("#array_twoPart_name").val();
		            	  array_twoPart_name = array_twoPart_name + data.fileName + ",";
		            	  array_twoPart = array_twoPart + data.url + "," ;
		            	  $("#array_twoPart").val(array_twoPart);
		            	  $("#array_twoPart_name").val(array_twoPart_name);
	            	  }
	            	  if(data.ascription=="Body"){
		            	  $("#span_PartAllDesignToolBTAdrillList_Body").append("<div><span name='partAllDesignToolBTAdrills_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelPartAllDesignToolBTAdrillImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#PartAllDesignToolBTAdrill_Body").remove();
		            	  $("#partAll_Body").html('<input type="file" name="PartAllDesignToolBTAdrill_Body" id="PartAllDesignToolBTAdrill_BodyP" />');
		            	  var array_bodyPart = $("#array_bodyPart").val();
		            	  var array_bodyPart_name = $("#array_bodyPart_name").val();
		            	  array_bodyPart_name = array_bodyPart_name + data.fileName + ",";
		            	  array_bodyPart = array_bodyPart + data.url + "," ;
		            	  $("#array_bodyPart").val(array_bodyPart);
		            	  $("#array_bodyPart_name").val(array_bodyPart_name);
	            	  }
	            	  if(data.ascription=="S"){
		            	  $("#span_PartAllDesignToolBTAdrillList_S").append("<div><span name='partAllDesignToolBTAdrills_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelPartAllDesignToolBTAdrillImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#PartAllDesignToolBTAdrill_S").remove();
		            	  $("#partAll_S").html('<input type="file" name="PartAllDesignToolBTAdrill_S" id="PartAllDesignToolBTAdrill_S" />');
		            	  var array_sPart = $("#array_sPart").val();
		            	  var array_sPart_name = $("#array_sPart_name").val();
		            	  array_sPart_name = array_sPart_name + data.fileName + ",";
		            	  array_sPart = array_sPart + data.url + "," ;
		            	  $("#array_sPart").val(array_sPart);
		            	  $("#array_sPart_name").val(array_sPart_name);
	            	  }
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除partAll
	function onDelPartAllDesignToolBTAdrillImg(url_partAll){
		var img_array = $("span[name='partAllDesignToolBTAdrills_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_partAll){
				$(img_array[i]).parent().remove();
				var array_pPart = $("#array_pPart").val();
				array_pPart = array_pPart.replace(url_partAll,'');
				$("#array_pPart").val(array_pPart);
				
				var array_cPart = $("#array_cPart").val();
				array_cPart = array_cPart.replace(url_partAll,'');
				$("#array_cPart").val(array_cPart);
				
				var array_ziPart = $("#array_ziPart").val();
				array_ziPart = array_ziPart.replace(url_partAll,'');
				$("#array_ziPart").val(array_ziPart);
				
				var array_onePart = $("#array_onePart").val();
				array_onePart = array_onePart.replace(url_partAll,'');
				$("#array_onePart").val(array_onePart);
				
				var array_twoPart = $("#array_twoPart").val();
				array_twoPart = array_twoPart.replace(url_partAll,'');
				$("#array_twoPart").val(array_twoPart);
				
				var array_bodyPart = $("#array_bodyPart").val();
				array_bodyPart = array_bodyPart.replace(url_partAll,'');
				$("#array_bodyPart").val(array_bodyPart);
				
				var array_sPart = $("#array_sPart").val();
				array_sPart = array_sPart.replace(url_partAll,'');
				$("#array_sPart").val(array_sPart);
			}
		}
	}
	
	//保存
	function save(){
		$("#array_PictureDesignToolBTAdrill_userForm").val($("#array_PictureDesignToolBTAdrill").val());
		
		$("#array_InformDetailDesignToolBTAdrill_userForm").val($("#array_InformDetailDesignToolBTAdrill").val());
		$("#array_InformDetailDesignToolBTAdrill_name_userForm").val($("#array_InformDetailDesignToolBTAdrill_name").val());
		
		$("#array_PartDesignToolBTAdrill_userForm").val($("#array_PartDesignToolBTAdrill").val());
		$("#array_PartDesignToolBTAdrill_name_userForm").val($("#array_PartDesignToolBTAdrill_name").val());	
		
		$("#array_pPart_userForm").val($("#array_pPart").val());
		$("#array_pPart_name_userForm").val($("#array_pPart_name").val());
		
		$("#array_cPart_userForm").val($("#array_cPart").val());
		$("#array_cPart_name_userForm").val($("#array_cPart_name").val());
		
		$("#array_ziPart_userForm").val($("#array_ziPart").val());
		$("#array_ziPart_name_userForm").val($("#array_ziPart_name").val());
		
		$("#array_onePart_userForm").val($("#array_onePart").val());
		$("#array_onePart_name_userForm").val($("#array_onePart_name").val());
		
		$("#array_twoPart_userForm").val($("#array_twoPart").val());
		$("#array_twoPart_name_userForm").val($("#array_twoPart_name").val());
		
		$("#array_bodyPart_userForm").val($("#array_bodyPart").val());
		$("#array_bodyPart_name_userForm").val($("#array_bodyPart_name").val());
		
		$("#array_sPart_userForm").val($("#array_sPart").val());
		$("#array_sPart_name_userForm").val($("#array_sPart_name").val());
		
		var P = $("#DesignBTADrillPWidth").val()+","+$("#DesignBTADrillPEdgeAngle").val()+","+$("#DesignBTADrillPRakeAngle").val()+","+$("#DesignBTADrillPReliefAngle").val()+","+$("#DesignBTADrillPNoseAngle").val();
		var C = $("#DesignBTADrillCWidth").val()+","+$("#DesignBTADrillCEdgeAngle").val()+","+$("#DesignBTADrillCRakeAngle").val()+","+$("#DesignBTADrillCReliefAngle").val()+","+$("#DesignBTADrillCNoseAngle").val();
		var ZI = $("#DesignBTADrillZIWidth").val()+","+$("#DesignBTADrillZIEdgeAngle").val()+","+$("#DesignBTADrillZIRakeAngle").val()+","+$("#DesignBTADrillZIReliefAngle").val()+","+$("#DesignBTADrillZINoseAngle").val();
		var One = $("#DesignBTADrillZIArcAngleOne").val()+","+$("#DesignBTADrillZILeadLengthOne").val()+","+$("#DesignBTADrillZILeadThicknessOne").val();
		var Two = $("#DesignBTADrillZIArcAngleTwo").val()+","+$("#DesignBTADrillZILeadLengthTwo").val()+","+$("#DesignBTADrillZILeadThicknessTwo").val();
		
		$("#P").val(P);
		$("#C").val(C);
		$("#ZI").val(ZI);
		$("#One").val(One);
		$("#Two").val(Two);
		
		 $("#userForm").ajaxSubmit(function(result){
			if(result == 1){
				alert('操作成功！');
				onClose();
			}else{
				alert('操作失败，请联系管理员！');
			}
		}); 
	}
</script>
</head>
<body>
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text">
    <form action="/designToolBTAdrill/saveDesignToolBTAdrill" name="userForm" id="userForm" method="post">
	  <input type="hidden" id="array_PictureDesignToolBTAdrill_userForm" name="array_PictureDesignToolBTAdrill"/>
	  
  	  <input type="hidden" id="array_InformDetailDesignToolBTAdrill_userForm" name="array_InformDetailDesignToolBTAdrill"/>
  	  <input type="hidden" id="array_InformDetailDesignToolBTAdrill_name_userForm" name="array_InformDetailDesignToolBTAdrill_name"/>
  	  
  	  <input type="hidden" id="array_PartDesignToolBTAdrill_userForm" name="array_PartDesignToolBTAdrill"/>
  	  <input type="hidden" id="array_PartDesignToolBTAdrill_name_userForm" name="array_PartDesignToolBTAdrill_name"/>
  	  
  	  <input type="hidden" id="array_pPart_userForm" name="array_pPart"/>
  	  <input type="hidden" id="array_pPart_name_userForm" name="array_pPart_name"/>
  	  
  	  <input type="hidden" id="array_cPart_userForm" name="array_cPart"/>
  	  <input type="hidden" id="array_cPart_name_userForm" name="array_cPart_name"/>
  	  
  	  <input type="hidden" id="array_ziPart_userForm" name="array_ziPart"/>
  	  <input type="hidden" id="array_ziPart_name_userForm" name="array_ziPart_name"/>
  	  
  	  <input type="hidden" id="array_onePart_userForm" name="array_onePart"/>
  	  <input type="hidden" id="array_onePart_name_userForm" name="array_onePart_name"/>
  	  
  	  <input type="hidden" id="array_twoPart_userForm" name="array_twoPart"/>
  	  <input type="hidden" id="array_twoPart_name_userForm" name="array_twoPart_name"/>
  	  
  	  <input type="hidden" id="array_bodyPart_userForm" name="array_bodyPart"/>
  	  <input type="hidden" id="array_bodyPart_name_userForm" name="array_bodyPart_name"/>
  	  
  	  <input type="hidden" id="array_sPart_userForm" name="array_sPart"/>
  	  <input type="hidden" id="array_sPart_name_userForm" name="array_sPart_name"/>
  	  
  	  <input type="hidden" id="P" name = "P" />
  	  <input type="hidden" id="C" name = "C" />
  	  <input type="hidden" id="ZI" name = "ZI" />
  	  <input type="hidden" id="One" name = "One" />
  	  <input type="hidden" id="Two" name = "Two" />
  	    
	  <input type="hidden" name="id_DesignToolBTAdrill" id="id_DesignToolBTAdrill_userForm" value="${(designToolBTAdrill.id_DesignToolBTAdrill == null || designToolBTAdrill.id_DesignToolBTAdrill == '') ? 0 : designToolBTAdrill.id_DesignToolBTAdrill}"/>
	  <li>
	    <span id="lititle">钻头编号</span>
	    <input name="DesignNumberBTADrill" id="DesignNumberBTADrill_userForm" type="text" value="${designToolBTAdrill.DesignNumberBTADrill}" class="input"/>
	  </li>		
	  <li>
	    <span id="lititle">钻头名称</span>
	    <input name="DesignNameBTADrill" id="DesignNameBTADrill_userForm" type="text" value="${designToolBTAdrill.DesignNameBTADrill}" class="input" />
	  </li>
	  <li>
	    <span id="lititle">加工直径</span>
	    <input name="DesignDiameterBTADrill" id="DesignDiameterBTADrill_userForm" type="text" value="${designToolBTAdrill.DesignDiameterBTADrill}" class="input" />
	  </li>
	  <li>
	    <span id="lititle">设计厂家</span>
	    <input name="DesignCompanyBTADrill" id="DesignCompanyBTADrill_userForm" type="text" value="${designToolBTAdrill.DesignCompanyBTADrill}" class="input" />
	  </li>
	  <li>
	    <span id="lititle">断屑槽类型</span>
	    <input name="DesignBreakerBTADrill" id="DesignBreakerBTADrill_userForm" type="text" value="${designToolBTAdrill.DesignBreakerBTADrill}" class="input" />
	  </li>
	  <li>
	    <span id="lititle">加工特性简述</span>
	    <input name="DesignFeatureBTADrill" id="DesignFeatureBTADrill_userForm" type="text" value="${designToolBTAdrill.DesignFeatureBTADrill}" class="input" />
	  </li>
	</form>
	<!-- 刀柄图片 begin  -->
	
  	  <li class="block bor_t">
  	  	<form id="pictureForm">
	    	<span id="lititle">刀柄图片</span>
	    	<input type ="hidden" id = "array_PictureDesignToolBTAdrill" value = "${array_PictureDesignToolBTAdrill }"/>
	    	<span id = "picture">  	
	    		<input type="file" accept="image/*" name="PictureDesignToolBTAdrill" id="PictureDesignToolBTAdrill" />
	    	</span>  
	    	<input type="button" value="加载图片" class="btn" onclick="onSavePictureDesignToolBTAdrillList();"/>
	    	<span id="span_PictureDesignToolBTAdrillList">
	    	</span>
	    </form>
  	  </li>
  	 
	<!-- 刀柄图片 end  -->

	

	<!-- 详细信息 begin  -->
 	  <li class="block bor_t"> 
 	  	<form id = "informDetailForm">
	 	    <span id="lititle">详细信息</span>
	 	    <input type ="hidden" id = "array_InformDetailDesignToolBTAdrill" value = "${array_InformDetailDesignToolBTAdrill }"/>
	 	    <input type ="hidden" id = "array_InformDetailDesignToolBTAdrill_name" value = "${array_InformDetailDesignToolBTAdrill_name }"/>
		    <span id = "informDetail">  
		    	<input type="file" accept=".pdf" name="InformDetailDesignToolBTAdrill" id="InformDetailDesignToolBTAdrill" />
		    </span>
		    <input type="button" value="加载文件" class="btn" onclick="onSaveInformDetailDesignToolBTAdrillList();"/>
		    <span id="span_InformDetailDesignToolBTAdrillList">
		    </span>
	    </form>
 	  </li> 
  	<!-- 详细信息 end  -->
  	
  	<!-- 详细图片 begin  -->
	  <li class="block bor_t">
	  	<form id = "partForm">
		    <span id="lititle">part文件</span>
		    <input type ="hidden" id = "array_PartDesignToolBTAdrill" value = "${array_PartDesignToolBTAdrill }"/>
		    <input type ="hidden" id = "array_PartDesignToolBTAdrill_name" value = "${array_PartDesignToolBTAdrill_name }"/>
	    	<span id="part">
	    		<input type="file" name="PartDesignToolBTAdrill" id="PartDesignToolBTAdrill" />
	    	</span>
		    <input type="button" value="加载part文件" class="btn" onclick="onSavePartDesignToolBTAdrillList();"/>
		    <span id="span_PartDesignToolBTAdrillList">
	    	</span>
    	</form>
	  </li>
	<!-- 详细图片 end  -->
		<li class="block bor_t">
						<div class="box_zhedie">
							<span class="a_zhedie1" id = "zd" onclick = "zd();" style="display:block;">刀片信息</span>
							<span class="a_zhedie2" id = "zd1" onclick = "zd1();" style="display:none;">刀片信息</span>
						</div>
							<div class="box_xiangxi zhedie">
							<div class="box_u1" id="box_clcs0" style="display:none">
							<ul  class="ul1  img_ul">
								<li><img src="/resources/images/P_BTADrill.png" /></li>
							</ul>						
							<ul class="ul1 img_infor_ul">
							  	<li><span>外齿工作宽度Lp:<input name="DesignNumberBTADrill" id="DesignBTADrillPWidth" type="text" value="${designToolBTAdrill.P.DesignBTADrillPWidth}" class="input"/></span></li>
							  	<li><span>外刃偏角φp: &nbsp;<input  name="DesignNumberBTADrill" id="DesignBTADrillPEdgeAngle" type="text" value="${designToolBTAdrill.P.DesignBTADrillPEdgeAngle}" class="input"/></span></li>
							  	<li><span>外齿前角γp: &nbsp;<input  name="DesignNumberBTADrill" id="DesignBTADrillPRakeAngle" type="text" value="${designToolBTAdrill.P.DesignBTADrillPRakeAngle}" class="input"/></span></li>
							  	<li><span>外齿后角αp: &nbsp;<input  name="DesignNumberBTADrill" id="DesignBTADrillPReliefAngle" type="text" value="${designToolBTAdrill.P.DesignBTADrillPReliefAngle}" class="input"/></span></li>
							  	<li><span>外齿刀尖角εp: <input  name="DesignNumberBTADrill" id="DesignBTADrillPNoseAngle" type="text" value="${designToolBTAdrill.P.DesignBTADrillPNoseAngle}" class="input"/></span></li>
							</ul>
							<ul class="ul1 img_addr_ul">
								<li>								
									<div class="box_p">
										<span id = "partAll_P">
											<input type="file" name="PartAllDesignToolBTAdrill_P" id="PartAllDesignToolBTAdrill_P" />
										</span>
										<input type="button" value="加载part文件" class="btn" onclick="onSavePartAllDesignToolBTAdrillList('P');"/>
										
									    <h4>part文件：</h4>
									    <input type="hidden" id="array_pPart" value="${array_pPart }"/>
									    <input type="hidden" id="array_pPart_name" value="${array_pPart_name }"/>
									    <span id = "span_PartAllDesignToolBTAdrillList_P">
										    <c:forEach items="${designToolBTAdrill.P.pPart}" var="var1" varStatus="vs">
										    	<div>
											     <span name='partAllDesignToolBTAdrills_img' url = "${var1.url_DesignBTADrillPartAll }">${var1.name_DesignBTADrillPartAll }</span>
											     <a class="btn btn_shanchu" onclick="onDelPartAllDesignToolBTAdrillImg('${var1.url_DesignBTADrillPartAll }');">删除</a>
											     <br/>
											     </div>
											</c:forEach>
										</span>
									</div>							
								</li>						
							</ul>
							
							<div class="clear"></div>
							<hr/>
							<ul  class="ul1 img_ul">
								<li><img src="/resources/images/C_BTADrill.png" /></li>
							</ul>
							<ul class="ul1 img_infor_ul">
							  	<li><span>中心齿工作宽Lc: <input name="DesignNumberBTADrill" id="DesignBTADrillCWidth" type="text" value="${designToolBTAdrill.C.DesignBTADrillCWidth }" class="input"/></span></li>
							  	<li><span>内刃偏角φc:&nbsp;&nbsp;<input  name="DesignNumberBTADrill" id="DesignBTADrillCEdgeAngle" type="text" value="${designToolBTAdrill.C.DesignBTADrillCEdgeAngle}" class="input"/></span></li>
							  	<li><span>中心齿前角γc:&nbsp;<input  name="DesignNumberBTADrill" id="DesignBTADrillCRakeAngle" type="text" value="${designToolBTAdrill.C.DesignBTADrillCRakeAngle}" class="input"/></span></li>
							  	<li><span>中心齿后角αc:&nbsp;<input  name="DesignNumberBTADrill" id="DesignBTADrillCReliefAngle" type="text" value="${designToolBTAdrill.C.DesignBTADrillCReliefAngle}" class="input"/></span></li>
							  	<li><span>中心齿刀尖角εc:<input  name="DesignNumberBTADrill" id="DesignBTADrillCNoseAngle" type="text" value="${designToolBTAdrill.C.DesignBTADrillCNoseAngle}" class="input"/></span></li>
							</ul>
							<ul class="ul1 img_addr_ul">
								<li>								
									<div class="box_p">
										<span id = "partAll_C">
											<input type="file" name="PartAllDesignToolBTAdrill_C" id="PartAllDesignToolBTAdrill_C" />
									    </span>
										<input type="button" value="加载part文件" class="btn" onclick="onSavePartAllDesignToolBTAdrillList('C');"/>
									    <h4>part文件：</h4>
									    <input type="hidden" id="array_cPart" value="${array_cPart }"/>
									    <input type="hidden" id="array_cPart_name" value="${array_cPart_name }"/>
									    <span id = "span_PartAllDesignToolBTAdrillList_C">
									    	<c:forEach items="${designToolBTAdrill.C.cPart}" var="var1" varStatus="vs">
									    		<div>
											     <span name='partAllDesignToolBTAdrills_img' url = "${var1.url_DesignBTADrillPartAll }">${var1.name_DesignBTADrillPartAll }</span>
											     <a class="btn btn_shanchu" onclick="onDelPartAllDesignToolBTAdrillImg('${var1.url_DesignBTADrillPartAll }');">删除</a>
											     <br/>
											     </div>
											</c:forEach>
										</span>
									</div>
								</li>						
							</ul>
							<div class="clear"></div>
							<hr/>
							<ul  class="ul1  img_ul">
								<li><img src="/resources/images/ZI_BTADrill.png" /></li>
							</ul>	
							<ul class="ul1 img_infor_ul">
							  	<li><span>中间齿工作宽LI: <input name="DesignNumberBTADrill" id="DesignBTADrillZIWidth" type="text" value="${designToolBTAdrill.ZI.DesignBTADrillZIWidth }" class="input"/></span></li>
							  	<li><span>内刃偏角φI:&nbsp;&nbsp;<input  name="DesignNumberBTADrill" id="DesignBTADrillZIEdgeAngle" type="text" value="${designToolBTAdrill.ZI.DesignBTADrillZIEdgeAngle}" class="input"/></span></li>
							  	<li><span>中心齿前角γI:&nbsp;<input  name="DesignNumberBTADrill" id="DesignBTADrillZIRakeAngle" type="text" value="${designToolBTAdrill.ZI.DesignBTADrillZIRakeAngle }" class="input"/></span></li>
							  	<li><span>中间齿后角αI:&nbsp;<input  name="DesignNumberBTADrill" id="DesignBTADrillZIReliefAngle" type="text" value="${designToolBTAdrill.ZI.DesignBTADrillZIReliefAngle}" class="input"/></span></li>
							  	<li><span>中间齿刀尖角εI:<input  name="DesignNumberBTADrill" id="DesignBTADrillZINoseAngle" type="text" value="${designToolBTAdrill.ZI.DesignBTADrillZINoseAngle}" class="input"/></span></li>
							</ul>
							<ul class="ul1 img_addr_ul">
								<li>								
									<div class="box_p">
										<span id = "partAll_ZI">
											<input type="file" name="PartAllDesignToolBTAdrill_ZI" id="PartAllDesignToolBTAdrill_ZI" />
									    </span>
										<input type="button" value="加载part文件" class="btn" onclick="onSavePartAllDesignToolBTAdrillList('ZI');"/>
									    <h4>part文件：</h4>
									    <input type="hidden" id="array_ziPart" value="${array_ziPart }"/>
									    <input type="hidden" id="array_ziPart_name" value="${array_ziPart_name }"/>
									    <span id = "span_PartAllDesignToolBTAdrillList_ZI">
									    <c:forEach items="${designToolBTAdrill.ZI.ziPart}" var="var1" varStatus="vs">
									    	<div>
											     <span name='partAllDesignToolBTAdrills_img' url = "${var1.url_DesignBTADrillPartAll }">${var1.name_DesignBTADrillPartAll }</span>
											     <a class="btn btn_shanchu" onclick="onDelPartAllDesignToolBTAdrillImg('${var1.url_DesignBTADrillPartAll }');">删除</a>
											     <br/>
											 </div>
										</c:forEach>
										</span>
									</div>							
								</li>						
							</ul>
							<div class="clear"></div>
							<hr/>
							<ul  class="ul1  img_ul">
								<li><img src="/resources/images/One_BTADrill.png" /></li>
							</ul>	
							<ul class="ul1 img_infor_ul">
							  	<li><span>初始圆弧角度:<input name="DesignNumberBTADrill" id="DesignBTADrillZIArcAngleOne" type="text" value="${designToolBTAdrill.One.DesignBTADrillZIArcAngleOne}" class="input"/></span></li>
							  	<li><span>导向块长度:&nbsp;<input  name="DesignNumberBTADrill" id="DesignBTADrillZILeadLengthOne" type="text" value="${designToolBTAdrill.One.DesignBTADrillZILeadLengthOne}" class="input"/></span></li>
							  	<li><span>导向块厚度:&nbsp;<input  name="DesignNumberBTADrill" id="DesignBTADrillZILeadThicknessOne" type="text" value="${designToolBTAdrill.One.DesignBTADrillZILeadThicknessOne}" class="input"/></span></li>
							</ul>
							<ul class="ul1 img_addr_ul">
								<li>								
									<div class="box_p">
										<span id = "partAll_One">
											<input type="file" name="PartAllDesignToolBTAdrill_One" id="PartAllDesignToolBTAdrill_One" />
									    </span>
										<input type="button" value="加载part文件" class="btn" onclick="onSavePartAllDesignToolBTAdrillList('One');"/>
									    <h4>part文件：</h4>
									    <input type="hidden" id="array_onePart" value="${array_onePart }"/>
									    <input type="hidden" id="array_onePart_name" value="${array_onePart_name }"/>
									    <span id = "span_PartAllDesignToolBTAdrillList_One">
									    <c:forEach items="${designToolBTAdrill.One.onePart}" var="var1" varStatus="vs">
									    <div>
											     <span name='partAllDesignToolBTAdrills_img' url = "${var1.url_DesignBTADrillPartAll }">${var1.name_DesignBTADrillPartAll }</span>
											     <a class="btn btn_shanchu" onclick="onDelPartAllDesignToolBTAdrillImg('${var1.url_DesignBTADrillPartAll }');">删除</a>
											     <br/>
											     </div>
											 </c:forEach>
										</span>
									</div>							
								</li>						
							</ul>
							<div class="clear"></div>
							<hr/>
							<ul  class="ul1  img_ul">
								<li><img src="/resources/images/Two_BTADrill.png" /></li>
							</ul>	
							<ul class="ul1 img_infor_ul">
							  	<li><span>初始圆弧角度:<input name="DesignNumberBTADrill" id="DesignBTADrillZIArcAngleTwo" type="text" value="${designToolBTAdrill.Two.DesignBTADrillZIArcAngleTwo }" class="input"/></span></li>
							  	<li><span>导向块长度:&nbsp;<input  name="DesignNumberBTADrill" id="DesignBTADrillZILeadLengthTwo" type="text" value="${designToolBTAdrill.Two.DesignBTADrillZILeadLengthTwo }" class="input"/></span></li>
							  	<li><span>导向块厚度:&nbsp;<input  name="DesignNumberBTADrill" id="DesignBTADrillZILeadThicknessTwo" type="text" value="${designToolBTAdrill.Two.DesignBTADrillZILeadThicknessTwo}" class="input"/></span></li>
							</ul>
							<ul class="ul1 img_addr_ul">
								<li>								
									<div class="box_p">
										<span id = "partAll_Two">
											<input type="file" name="PartAllDesignToolBTAdrill_Two" id="PartAllDesignToolBTAdrill_Two" />
									    </span>
										<input type="button" value="加载part文件" class="btn" onclick="onSavePartAllDesignToolBTAdrillList('Two');"/>
									    <h4>part文件：</h4>
									    <input type="hidden" id="array_twoPart" value="${array_twoPart }"/>
									    <input type="hidden" id="array_twoPart_name" value="${array_twoPart_name }"/>
									    <span id = "span_PartAllDesignToolBTAdrillList_Two">
									    <c:forEach items="${designToolBTAdrill.Two.twoPart}" var="var1" varStatus="vs">
									    <div>
											     <span name='partAllDesignToolBTAdrills_img' url = "${var1.url_DesignBTADrillPartAll }">${var1.name_DesignBTADrillPartAll }</span>
											     <a class="btn btn_shanchu" onclick="onDelPartAllDesignToolBTAdrillImg('${var1.url_DesignBTADrillPartAll }');">删除</a>
											     <br/>
										</div>
										</c:forEach>
										</span>
									</div>							
								</li>						
							</ul>
							<div class="clear"></div>
							<hr/>
							<ul  class="ul1  img_ul">
								<li><img src="/resources/images/Body_BTADrill.png" /></li>
							</ul>
							<ul class="ul1 img_addr_ul">
								<li>								
									<div class="box_p">
										<span id = "partAll_Body">
											<input type="file" name="PartAllDesignToolBTAdrill_Body" id="PartAllDesignToolBTAdrill_Body" />
									    </span>
										<input type="button" value="加载part文件" class="btn" onclick="onSavePartAllDesignToolBTAdrillList('Body');"/>
									    <h4>part文件：</h4>
									    <input type="hidden" id="array_bodyPart" value="${array_bodyPart }"/>
									    <input type="hidden" id="array_bodyPart_name" value="${array_bodyPart_name }"/>
									    <span id = "span_PartAllDesignToolBTAdrillList_Body">
									    <c:forEach items="${designToolBTAdrill.Body.bodyPart}" var="var1" varStatus="vs">
									    <div>
											     <span name='partAllDesignToolBTAdrills_img' url = "${var1.url_DesignBTADrillPartAll }">${var1.name_DesignBTADrillPartAll }</span>
											     <a class="btn btn_shanchu" onclick="onDelPartAllDesignToolBTAdrillImg('${var1.url_DesignBTADrillPartAll }');">删除</a>
											     <br/>
										</div>
										</c:forEach>
										</span>
									</div>							
								</li>						
							</ul>
							<div class="clear"></div>
							<hr/>
							<ul  class="ul1  img_ul">
								<li><img src="/resources/images/S_BTADrill.png" style="width:10;height:10;"/></li>
							</ul>
							<ul class="ul1 img_addr_ul">
								<li>								
									<div class="box_p">
										<span id = "partAll_S">
											<input type="file" name="PartAllDesignToolBTAdrill_S" id="PartAllDesignToolBTAdrill_S" />
										</span>
									     <input type="button" value="加载part文件" class="btn" onclick="onSavePartAllDesignToolBTAdrillList('S');"/>
								    	 <h4>part文件：</h4>
								    	 <input type="hidden" id="array_sPart" value="${array_sPart }"/>
									    <input type="hidden" id="array_sPart_name" value="${array_sPart_name }"/>
								    	 <span id = "span_PartAllDesignToolBTAdrillList_S">
									     <c:forEach items="${designToolBTAdrill.S.sPart}" var="var1" varStatus="vs">
									     <div>
											     <span name='partAllDesignToolBTAdrills_img' url = "${var1.url_DesignBTADrillPartAll }">${var1.name_DesignBTADrillPartAll }</span>
											     <a class="btn btn_shanchu" onclick="onDelPartAllDesignToolBTAdrillImg('${var1.url_DesignBTADrillPartAll }');">删除</a>
											     <br/>
										 </div>
										 </c:forEach>
										 </span>
									</div>							
								</li>						
							</ul>
							<div class="clear"></div>
							</div>
				<div class="clear"></div>
				</div>
				</li>
				
</ul>
</div>
</body>

</html>
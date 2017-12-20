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
		
		changeValue();
		
		//图片
		var array_PictureProcessPart = $("#array_PictureProcessPart").val();
		if(array_PictureProcessPart != null && array_PictureProcessPart != ''){
			var PictureProcessParts = array_PictureProcessPart.split(',');
			var PictureProcessParts_str = '';
			for(var i = 0; i < PictureProcessParts.length; i++){
				if(PictureProcessParts[i] != null && PictureProcessParts[i] != ''){
					PictureProcessParts_str = PictureProcessParts_str + "<div><img name='PictureProcessParts_img' width='100px' height='100px' src='<%=path%>/goods"+PictureProcessParts[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureProcessPartImg(\""+PictureProcessParts[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureProcessPartList").html(PictureProcessParts_str);
		}
		
		//详细信息
		var array_InformProcessPart = $("#array_InformProcessPart").val();
		var array_InformProcessPart_name = $("#array_InformProcessPart_name").val();
		if(array_InformProcessPart != null && array_InformProcessPart != ''){
			var InformProcessParts= array_InformProcessPart.split(',');
			var InformProcessParts_name = array_InformProcessPart_name.split(',');
			var InformProcessParts_str = '';
			for(var i = 0; i < InformProcessParts.length; i++){
				if(InformProcessParts[i] != null && InformProcessParts[i] != ''){
					InformProcessParts_str = InformProcessParts_str + "<div><span name='InformProcessParts_img' url='"+InformProcessParts[i]+"' >"+InformProcessParts_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelInformProcessPartImg(\""+InformProcessParts[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_InformProcessPartList").html(InformProcessParts_str);
		}
		
		//part
		var array_PartProcessPart = $("#array_PartProcessPart").val();
		var array_PartProcessPart_name = $("#array_PartProcessPart_name").val();
		if(array_PartProcessPart != null && array_PartProcessPart != ''){
			var PartProcessParts = array_PartProcessPart.split(',');
			var PartProcessParts_name = array_PartProcessPart_name.split(',');
			var PartProcessParts_str = '';
			for(var i = 0; i < PartProcessParts.length; i++){
				if(PartProcessParts[i] != null && PartProcessParts[i] != ''){
					PartProcessParts_str = PartProcessParts_str + "<div><span name='PartProcessParts_img' url='"+PartProcessParts[i]+"' >"+PartProcessParts_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelPartProcessPartImg(\""+PartProcessParts[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PartProcessPartList").html(PartProcessParts_str);
		}
		
	});
	
	//取消
	function onClose(){
		window.location.href='<%=path%>/ProcessPart/ProcessPartList';
	}
	
	
	//保存刀柄图片
	function onSavePictureProcessPartList(){
		 var formDate = new FormData(document.getElementById("pictureForm"));  
	     $.ajax({  
	          url: '/ProcessPart/savePictureProcessPart' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (url) {  
	              if(url!=""){
	            	  $("#span_PictureProcessPartList").append("<div><img name='PictureProcessParts_img' width='100px' height='100px' src='<%=path%>/goods"+url+"' /><a class='btn btn_shanchu' onclick='onDelPictureProcessPartImg(\""+url+"\");'>删除</a><br/></div>");
	            	  $("#PictureProcessPart").remove();
	            	  $("#picture").html('<input type="file" accept="image/*" name="PictureProcessPart" id="PictureProcessPart" />');
	            	  var array_PictureProcessPart = $("#array_PictureProcessPart").val();
	            	  array_PictureProcessPart = array_PictureProcessPart + url + "," ;
	            	  $("#array_PictureProcessPart").val(array_PictureProcessPart);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除刀具图片
	function onDelPictureProcessPartImg(url_PictureProcessPart){
		
		var img_array = $("img[name='PictureProcessParts_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_PictureProcessPart){
				$(img_array[i]).parent().remove();
				var array_PictureProcessPart = $("#array_PictureProcessPart").val();
				array_PictureProcessPart = array_PictureProcessPart.replace(url_PictureProcessPart,'');
				$("#array_PictureProcessPart").val(array_PictureProcessPart);
			}
		}
	}
	
	//保存详细信息
	function onSaveInformProcessPartList(){
		var formDate = new FormData(document.getElementById("informDetailForm"));  
	     $.ajax({  
	          url: '/ProcessPart/saveInformProcessPart' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  $("#span_InformProcessPartList").append("<div><span name='InformProcessParts_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelInformProcessPartImg(\""+data.url+"\");'>删除</a><br/></div>");
	            	  $("#InformProcessPart").remove();
	            	  $("#informDetail").html('<input type="file" accept=".pdf" name="InformProcessPart" id="InformProcessPart" />');
	            	  var array_InformProcessPart = $("#array_InformProcessPart").val();
	            	  var array_InformProcessPart_name = $("#array_InformProcessPart_name").val();
	            	  array_InformProcessPart_name = array_InformProcessPart_name + data.fileName + ",";
	            	  array_InformProcessPart = array_InformProcessPart + data.url + "," ;
	            	  $("#array_InformProcessPart").val(array_InformProcessPart);
	            	  $("#array_InformProcessPart_name").val(array_InformProcessPart_name);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除详细信息
	function onDelInformProcessPartImg(url_InformProcessPart){
		var img_array = $("span[name='InformProcessParts_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_InformProcessPart){
				$(img_array[i]).parent().remove();
				var array_InformProcessPart = $("#array_InformProcessPart").val();
				array_InformProcessPart = array_InformProcessPart.replace(url_InformProcessPart,'');
				$("#array_InformProcessPart").val(array_InformProcessPart);
				
			}
		}
	}
	
	
	//保存part
	function onSavePartProcessPartList(){
		var formDate = new FormData(document.getElementById("partForm"));  
	     $.ajax({  
	          url: '/ProcessPart/savePartProcessPart' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  $("#span_PartProcessPartList").append("<div><span name='PartProcessParts_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelPartProcessPartImg(\""+data.url+"\");'>删除</a><br/></div>");
	            	  $("#PartProcessPart").remove();
	            	  $("#part").html('<input type="file" name="PartProcessPart" id="PartProcessPart" />');
	            	  var array_PartProcessPart = $("#array_PartProcessPart").val();
	            	  var array_PartProcessPart_name = $("#array_PartProcessPart_name").val();
	            	  array_PartProcessPart_name = array_PartProcessPart_name + data.fileName + ",";
	            	  array_PartProcessPart = array_PartProcessPart + data.url + "," ;
	            	  $("#array_PartProcessPart").val(array_PartProcessPart);
	            	  $("#array_PartProcessPart_name").val(array_PartProcessPart_name);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	

	//删除part
	function onDelPartProcessPartImg(url_PartProcessPart){
		var img_array = $("span[name='PartProcessParts_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_PartProcessPart){
				$(img_array[i]).parent().remove();
				var array_PartProcessPart = $("#array_PartProcessPart").val();
				array_PartProcessPart = array_PartProcessPart.replace(url_PartProcessPart,'');
				$("#array_PartProcessPart").val(array_PartProcessPart);
			}
		}
	}

	
	
	function changeValue(){
			document.getElementById('IndustryProcessPart_userForm').value=document.getElementById('selectWrap').options[document.getElementById('selectWrap').selectedIndex].text;
			document.getElementById('TypeProcessPart_userForm').value=document.getElementById('selectWrap1').options[document.getElementById('selectWrap1').selectedIndex].text;
	}
	
	
	//保存
	function save(){
		
		$("#array_PictureProcessPart_userForm").val($("#array_PictureProcessPart").val());
		$("#array_InformProcessPart_userForm").val($("#array_InformProcessPart").val());
		$("#array_InformProcessPart_name_userForm").val($("#array_InformProcessPart_name").val());
		$("#array_PartProcessPart_userForm").val($("#array_PartProcessPart").val());
		$("#array_PartProcessPart_name_userForm").val($("#array_PartProcessPart_name").val());
		
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
		var html = '<iframe name="content_iframe" class="content_iframe" id="content_iframe" frameborder="0" src="/ProcessPart/loadingMaterial" style="width:100%;height:100%;"></iframe>';
		$("#div").html(html);
	}
	function close(){
		$("#div").html("");
	}
	function opt(id,type){
		$("#div").html("");
		$("#NumberMaterialProcessPart_userForm").val(id);
		$("#CategoryMaterialProcessPart_userForm").val(type);
		
	}
</script>
</head>
<body>
<div id="div">
</div>

<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text">
    <form action="/ProcessPart/saveProcessPart" name="userForm" id="userForm" method="post">
      <input type="hidden" id="array_PictureProcessPart_userForm" name="array_PictureProcessPart"/>
  	  <input type="hidden" id="array_InformProcessPart_userForm" name="array_InformProcessPart"/>
  	  <input type="hidden" id="array_InformProcessPart_name_userForm" name="array_InformProcessPart_name"/>
  	  <input type="hidden" id="array_PartProcessPart_userForm" name="array_PartProcessPart"/>
  	  <input type="hidden" id="array_PartProcessPart_name_userForm" name="array_PartProcessPart_name"/>
  	    
  	    
	  <input type="hidden" name="id_ProcessPart" id="id_ProcessPart_userForm" value="${(ProcessPart.id_ProcessPart == null || ProcessPart.id_ProcessPart == '') ? 0 : ProcessPart.id_ProcessPart}"/>
	  <li>
	    <span id="lititle">零件名称</span>
	    <input name="NameProcessPart" id="NameProcessPart_userForm" type="text" value="${ProcessPart.NameProcessPart}" class="input" maxlength="10"/>
	  </li>		
	  <li>
	    <span id="lititle">零件编号</span>
	    <input name="NumberProcessPart" id="NumberProcessPart_userForm" type="text" value="${ProcessPart.NumberProcessPart}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">零件类别</span>
	    <span class="select_wrap">
				<span class="edit_select">
					<select  name="selectWrap1"  id="selectWrap1" onChange="changeValue();" class="select" contenteditable="true">
						<c:forEach items="${CategoryTypeProcessPart}" var="var" varStatus="vs">
							<option value="${var.id_CategoryTypeProcessPart }" ${ProcessPart.TypeProcessPart == var.id_CategoryTypeProcessPart ? 'selected' : '' }>${var.name_CategoryTypeProcessPart }</option>	
						</c:forEach>
					</select>
				</span>
				<span class="input_select">
				<input type="text" name="TypeProcessPart" id="TypeProcessPart_userForm" value="">
				</span>
		</span>
	  </li>
	  
	  <li>
	    <span id="lititle">零件部件</span>
	    <input name="AssemblyProcessPart" id="AssemblyProcessPart_userForm" type="text" value="${ProcessPart.AssemblyProcessPart}" class="input" maxlength="100"/>
	  </li>
	  
	  <li>
	    <span id="lititle">零件部件编号</span>
	    <input name="NoAssemblyProcessPart" id="NoAssemblyProcessPart_userForm" type="text" value="${ProcessPart.NoAssemblyProcessPart}" class="input" maxlength="100"/>
	  </li>
	  
	  <li>
	    <span id="lititle">零件所属厂家</span>
	    <input name="CompanyProcessPart" id="CompanyProcessPart_userForm" type="text" value="${ProcessPart.CompanyProcessPart}" class="input" maxlength="100"/>
	  </li>
	  
	  <li>
	    <span id="lititle">应用行业</span>
	    <span class="select_wrap">
				<span class="edit_select">
					<select  name="selectWrap"  id="selectWrap" onChange="changeValue();" class="select" contenteditable="true">
						<c:forEach items="${CategoryIndustryProcessPart}" var="var" varStatus="vs">
							<option value="${var.id_CategoryIndustryProcessPart }" ${ProcessPart.IndustryProcessPart == var.id_CategoryIndustryProcessPart ? 'selected' : '' }>${var.name_CategoryIndustryProcessPart }</option>	
						</c:forEach>
					</select>
				</span>
				<span class="input_select">
				<input type="text" name="IndustryProcessPart"  id="IndustryProcessPart_userForm" value="">
				</span>
		</span>
	  </li>
	  <li>
	    <span id="lititle">材料牌号</span>
	    <input name="NumberMaterialProcessPart" id="NumberMaterialProcessPart_userForm" type="text" value="${ProcessPart.NumberMaterialProcessPart}" class="input" maxlength="100"/>
	  </li>
	  
	  <li>
	    <span id="lititle">材料类别</span>
	    <input name="CategoryMaterialProcessPart" id="CategoryMaterialProcessPart_userForm" type="text" value="${ProcessPart.CategoryMaterialProcessPart}" class="input" maxlength="100"/>
	  </li>
	  
	  <li>
	  	<input type = "button" value = "加载材料牌号和类别" class="btn" onclick="jz();"/>
	  </li>
	  <li class="block">
	    <span id="lititle">备注</span>
	    <input name="RemarkProcessPart" id="RemarkProcessPart_userForm" type="text" value="${ProcessPart.RemarkProcessPart}" class="input" maxlength="100"/>
	  </li>
	</form>
	
	
  	  <li class="block bor_t">
  	  	<form id="pictureForm">
	    	<span id="lititle">图片</span>
	    	<input type ="hidden" id = "array_PictureProcessPart" value = "${array_PictureProcessPart }"/>
	    	<span id = "picture">  	
	    		<input type="file" accept="image/*" name="PictureProcessPart" id="PictureProcessPart" />
	    	</span>  
	    	<input type="button" value="加载图片" class="btn" onclick="onSavePictureProcessPartList();"/>
	    	<span id="span_PictureProcessPartList">
	    	</span>
	    </form>
  	  </li>
  	 

 	  <li class="block bor_t"> 
 	  	<form id = "informDetailForm">
	 	    <span id="lititle">详细信息</span>
	 	    <input type ="hidden" id = "array_InformProcessPart" value = "${array_InformProcessPart }"/>
	 	    <input type ="hidden" id = "array_InformProcessPart_name" value = "${array_InformProcessPart_name }"/>
		    <span id = "informDetail">  
		    	<input type="file" accept=".pdf" name="InformProcessPart" id="InformProcessPart" />
		    </span>
		    <input type="button" value="加载文件" class="btn" onclick="onSaveInformProcessPartList();"/>
		    <span id="span_InformProcessPartList">
		    </span>
	    </form>
 	  </li> 
  	
	  <li class="block bor_t">
	  	<form id = "partForm">
		    <span id="lititle">零件图纸</span>
		    <input type ="hidden" id = "array_PartProcessPart" value = "${array_PartProcessPart }"/>
		    <input type ="hidden" id = "array_PartProcessPart_name" value = "${array_PartProcessPart_name }"/>
	    	<span id="part">
	    		<input type="file" name="PartProcessPart" id="PartProcessPart" />
	    	</span>
		    <input type="button" value="加载part文件" class="btn" onclick="onSavePartProcessPartList();"/>
		    <span id="span_PartProcessPartList">
	    	</span>
    	</form>
	  </li>
	<div class="clear"></div>
    
  </ul>
</div>
<div>
	
</div>
</body>

</html>
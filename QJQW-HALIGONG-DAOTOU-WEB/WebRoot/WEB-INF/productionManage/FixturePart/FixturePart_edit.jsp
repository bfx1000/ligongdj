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
		var array_PictureFixturePart = $("#array_PictureFixturePart").val();
		if(array_PictureFixturePart != null && array_PictureFixturePart != ''){
			var PictureFixtureParts = array_PictureFixturePart.split(',');
			var PictureFixtureParts_str = '';
			for(var i = 0; i < PictureFixtureParts.length; i++){
				if(PictureFixtureParts[i] != null && PictureFixtureParts[i] != ''){
					PictureFixtureParts_str = PictureFixtureParts_str + "<div><img name='PictureFixtureParts_img' width='100px' height='100px' src='<%=path%>/goods"+PictureFixtureParts[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureFixturePartImg(\""+PictureFixtureParts[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureFixturePartList").html(PictureFixtureParts_str);
		}
		
		//详细信息
		var array_InformFixturePart = $("#array_InformFixturePart").val();
		var array_InformFixturePart_name = $("#array_InformFixturePart_name").val();
		if(array_InformFixturePart != null && array_InformFixturePart != ''){
			var InformFixtureParts= array_InformFixturePart.split(',');
			var InformFixtureParts_name = array_InformFixturePart_name.split(',');
			var InformFixtureParts_str = '';
			for(var i = 0; i < InformFixtureParts.length; i++){
				if(InformFixtureParts[i] != null && InformFixtureParts[i] != ''){
					InformFixtureParts_str = InformFixtureParts_str + "<div><span name='InformFixtureParts_img' url='"+InformFixtureParts[i]+"' >"+InformFixtureParts_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelInformFixturePartImg(\""+InformFixtureParts[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_InformFixturePartList").html(InformFixtureParts_str);
		}
		
		//part
		var array_PartFixturePart = $("#array_PartFixturePart").val();
		var array_PartFixturePart_name = $("#array_PartFixturePart_name").val();
		if(array_PartFixturePart != null && array_PartFixturePart != ''){
			var PartFixtureParts = array_PartFixturePart.split(',');
			var PartFixtureParts_name = array_PartFixturePart_name.split(',');
			var PartFixtureParts_str = '';
			for(var i = 0; i < PartFixtureParts.length; i++){
				if(PartFixtureParts[i] != null && PartFixtureParts[i] != ''){
					PartFixtureParts_str = PartFixtureParts_str + "<div><span name='PartFixtureParts_img' url='"+PartFixtureParts[i]+"' >"+PartFixtureParts_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelPartFixturePartImg(\""+PartFixtureParts[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PartFixturePartList").html(PartFixtureParts_str);
		}
		
	});
	
	//取消
	function onClose(){
		window.location.href='<%=path%>/FixturePart/FixturePartList';
	}
	
	
	//保存刀柄图片
	function onSavePictureFixturePartList(){
		 var formDate = new FormData(document.getElementById("pictureForm"));  
	     $.ajax({  
	          url: '/FixturePart/savePictureFixturePart' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (url) {  
	              if(url!=""){
	            	  $("#span_PictureFixturePartList").append("<div><img name='PictureFixtureParts_img' width='100px' height='100px' src='<%=path%>/goods"+url+"' /><a class='btn btn_shanchu' onclick='onDelPictureFixturePartImg(\""+url+"\");'>删除</a><br/></div>");
	            	  $("#PictureFixturePart").remove();
	            	  $("#picture").html('<input type="file" accept="image/*" name="PictureFixturePart" id="PictureFixturePart" />');
	            	  var array_PictureFixturePart = $("#array_PictureFixturePart").val();
	            	  array_PictureFixturePart = array_PictureFixturePart + url + "," ;
	            	  $("#array_PictureFixturePart").val(array_PictureFixturePart);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除刀具图片
	function onDelPictureFixturePartImg(url_PictureFixturePart){
		
		var img_array = $("img[name='PictureFixtureParts_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_PictureFixturePart){
				$(img_array[i]).parent().remove();
				var array_PictureFixturePart = $("#array_PictureFixturePart").val();
				array_PictureFixturePart = array_PictureFixturePart.replace(url_PictureFixturePart,'');
				$("#array_PictureFixturePart").val(array_PictureFixturePart);
			}
		}
	}
	
	//保存详细信息
	function onSaveInformFixturePartList(){
		var formDate = new FormData(document.getElementById("informDetailForm"));  
	     $.ajax({  
	          url: '/FixturePart/saveInformFixturePart' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  $("#span_InformFixturePartList").append("<div><span name='InformFixtureParts_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelInformFixturePartImg(\""+data.url+"\");'>删除</a><br/></div>");
	            	  $("#InformFixturePart").remove();
	            	  $("#informDetail").html('<input type="file" accept=".pdf" name="InformFixturePart" id="InformFixturePart" />');
	            	  var array_InformFixturePart = $("#array_InformFixturePart").val();
	            	  var array_InformFixturePart_name = $("#array_InformFixturePart_name").val();
	            	  array_InformFixturePart_name = array_InformFixturePart_name + data.fileName + ",";
	            	  array_InformFixturePart = array_InformFixturePart + data.url + "," ;
	            	  $("#array_InformFixturePart").val(array_InformFixturePart);
	            	  $("#array_InformFixturePart_name").val(array_InformFixturePart_name);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除详细信息
	function onDelInformFixturePartImg(url_InformFixturePart){
		var img_array = $("span[name='InformFixtureParts_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_InformFixturePart){
				$(img_array[i]).parent().remove();
				var array_InformFixturePart = $("#array_InformFixturePart").val();
				array_InformFixturePart = array_InformFixturePart.replace(url_InformFixturePart,'');
				$("#array_InformFixturePart").val(array_InformFixturePart);
				
			}
		}
	}
	
	
	//保存part
	function onSavePartFixturePartList(){
		var formDate = new FormData(document.getElementById("partForm"));  
	     $.ajax({  
	          url: '/FixturePart/savePartFixturePart' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  $("#span_PartFixturePartList").append("<div><span name='PartFixtureParts_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelPartFixturePartImg(\""+data.url+"\");'>删除</a><br/></div>");
	            	  $("#PartFixturePart").remove();
	            	  $("#part").html('<input type="file" name="PartFixturePart" id="PartFixturePart" />');
	            	  var array_PartFixturePart = $("#array_PartFixturePart").val();
	            	  var array_PartFixturePart_name = $("#array_PartFixturePart_name").val();
	            	  array_PartFixturePart_name = array_PartFixturePart_name + data.fileName + ",";
	            	  array_PartFixturePart = array_PartFixturePart + data.url + "," ;
	            	  $("#array_PartFixturePart").val(array_PartFixturePart);
	            	  $("#array_PartFixturePart_name").val(array_PartFixturePart_name);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	

	//删除part
	function onDelPartFixturePartImg(url_PartFixturePart){
		var img_array = $("span[name='PartFixtureParts_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_PartFixturePart){
				$(img_array[i]).parent().remove();
				var array_PartFixturePart = $("#array_PartFixturePart").val();
				array_PartFixturePart = array_PartFixturePart.replace(url_PartFixturePart,'');
				$("#array_PartFixturePart").val(array_PartFixturePart);
			}
		}
	}

	
	
	function changeValue(){
			document.getElementById('TypeFixturePart_userForm').value=document.getElementById('selectWrap1').options[document.getElementById('selectWrap1').selectedIndex].text;
	}
	
	
	//保存
	function save(){
		
		$("#array_PictureFixturePart_userForm").val($("#array_PictureFixturePart").val());
		$("#array_InformFixturePart_userForm").val($("#array_InformFixturePart").val());
		$("#array_InformFixturePart_name_userForm").val($("#array_InformFixturePart_name").val());
		$("#array_PartFixturePart_userForm").val($("#array_PartFixturePart").val());
		$("#array_PartFixturePart_name_userForm").val($("#array_PartFixturePart_name").val());
		
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
	function jz(deputy){
		var html = '<iframe name="content_iframe" class="content_iframe" id="content_iframe" frameborder="0" src="/FixturePart/loading?deputy='+deputy+'" style="width:100%;height:100%;"></iframe>';
		$("#div").html(html);
	}
	function close(){
		$("#div").html("");
	}
	function opt(id,deputy){
		$("#div").html("");
		if(deputy==1){
			var value = $("#MachineFixturePart_userForm").val();
			if(value==""){
				$("#MachineFixturePart_userForm").val(id);
			}else{
				value = value + "," + id ; 
				$("#MachineFixturePart_userForm").val(value);
			}
		}
		if(deputy==2){
			var value = $("#FixturePartFixturePart_userForm").val();
			if(value==""){
				$("#FixturePartFixturePart_userForm").val(id);
			}else{
				value = value + "," + id ; 
				$("#FixturePartFixturePart_userForm").val(value);
			}
		}
		
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
    <form action="/FixturePart/saveFixturePart" name="userForm" id="userForm" method="post">
      <input type="hidden" id="array_PictureFixturePart_userForm" name="array_PictureFixturePart"/>
  	  <input type="hidden" id="array_InformFixturePart_userForm" name="array_InformFixturePart"/>
  	  <input type="hidden" id="array_InformFixturePart_name_userForm" name="array_InformFixturePart_name"/>
  	  <input type="hidden" id="array_PartFixturePart_userForm" name="array_PartFixturePart"/>
  	  <input type="hidden" id="array_PartFixturePart_name_userForm" name="array_PartFixturePart_name"/>
  	    
  	    
	  <input type="hidden" name="id_FixturePart" id="id_FixturePart_userForm" value="${(FixturePart.id_FixturePart == null || FixturePart.id_FixturePart == '') ? 0 : FixturePart.id_FixturePart}"/>
	  <li>
	    <span id="lititle">夹具名称</span>
	    <input name="NameFixturePart" id="NameFixturePart_userForm" type="text" value="${FixturePart.NameFixturePart}" class="input" maxlength="10"/>
	  </li>		
	  <li>
	    <span id="lititle">夹具编号</span>
	    <input name="NumberFixturePart" id="NumberFixturePart_userForm" type="text" value="${FixturePart.NumberFixturePart}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">夹具类别</span>
	    <span class="select_wrap">
				<span class="edit_select">
					<select  name="selectWrap1"  id="selectWrap1" onChange="changeValue();" class="select" contenteditable="true">
						<c:forEach items="${CategoryTypeFixturePart}" var="var" varStatus="vs">
							<option value="${var.id_CategoryTypeFixturePart }" ${FixturePart.TypeFixturePart == var.id_CategoryTypeFixturePart ? 'selected' : '' }>${var.name_CategoryTypeFixturePart }</option>	
						</c:forEach>
					</select>
				</span>
				<span class="input_select">
				<input type="text" name="TypeFixturePart" id="TypeFixturePart_userForm" value="">
				</span>
		</span>
	  </li>
	  <li>
	    <span id="lititle">应用公司</span>
	    <input name="AppCo" id="AppCo_userForm" type="text" value="${FixturePart.AppCo}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">应用机床</span>
	    <input name="MachineFixturePart" id="MachineFixturePart_userForm" type="text" value="${FixturePart.MachineFixturePart}" class="input" maxlength="100"/>
	  </li>
	  <li>
	  	<input type = "button" value = "加载机床节点" class="btn" onclick="jz(1);"/>
	  </li>
	  <li>
	    <span id="lititle">应用加工零件</span>
	    <input name="ProcessPartFixturePart" id="FixturePartFixturePart_userForm" type="text" value="${FixturePart.ProcessPartFixturePart}" class="input" maxlength="100"/>
	  </li>
	  <li>
	  <input type = "button" value = "加载加工零件" class="btn" onclick="jz(2);"/>
	  </li>
	  <li class="block">
	    <span id="lititle">夹具存放地点</span>
	    <input name="LocationFixturePart" id="LocationFixturePart_userForm" type="text" value="${FixturePart.LocationFixturePart}" class="input" maxlength="100"/>
	  </li>
	  <li class="block">
	    <span id="lititle">备注</span>
	    <input name="RemarkFixturePart" id="RemarkFixturePart_userForm" type="text" value="${FixturePart.RemarkFixturePart}" class="input" maxlength="100"/>
	  </li>
	</form>
	
	
  	  <li class="block bor_t">
  	  	<form id="pictureForm">
	    	<span id="lititle">图片</span>
	    	<input type ="hidden" id = "array_PictureFixturePart" value = "${array_PictureFixturePart }"/>
	    	<span id = "picture">  	
	    		<input type="file" accept="image/*" name="PictureFixturePart" id="PictureFixturePart" />
	    	</span>  
	    	<input type="button" value="加载图片" class="btn" onclick="onSavePictureFixturePartList();"/>
	    	<span id="span_PictureFixturePartList">
	    	</span>
	    </form>
  	  </li>
  	 

 	  <li class="block bor_t"> 
 	  	<form id = "informDetailForm">
	 	    <span id="lititle">详细信息</span>
	 	    <input type ="hidden" id = "array_InformFixturePart" value = "${array_InformFixturePart }"/>
	 	    <input type ="hidden" id = "array_InformFixturePart_name" value = "${array_InformFixturePart_name }"/>
		    <span id = "informDetail">  
		    	<input type="file" accept=".pdf" name="InformFixturePart" id="InformFixturePart" />
		    </span>
		    <input type="button" value="加载文件" class="btn" onclick="onSaveInformFixturePartList();"/>
		    <span id="span_InformFixturePartList">
		    </span>
	    </form>
 	  </li> 
  	
	  <li class="block bor_t">
	  	<form id = "partForm">
		    <span id="lititle">零件图纸</span>
		    <input type ="hidden" id = "array_PartFixturePart" value = "${array_PartFixturePart }"/>
		    <input type ="hidden" id = "array_PartFixturePart_name" value = "${array_PartFixturePart_name }"/>
	    	<span id="part">
	    		<input type="file" name="PartFixturePart" id="PartFixturePart" />
	    	</span>
		    <input type="button" value="加载part文件" class="btn" onclick="onSavePartFixturePartList();"/>
		    <span id="span_PartFixturePartList">
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
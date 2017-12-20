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


<script type="text/JavaScript">

	$(document).ready(function(){
		changeValue();
		//图片
		var array_ModelPictureCutSim = $("#array_ModelPictureCutSim").val();
		if(array_ModelPictureCutSim != null && array_ModelPictureCutSim != ''){
			var ModelPictureCutSims = array_ModelPictureCutSim.split(',');
			var ModelPictureCutSims_str = '';
			for(var i = 0; i < ModelPictureCutSims.length; i++){
				if(ModelPictureCutSims[i] != null && ModelPictureCutSims[i] != ''){
					ModelPictureCutSims_str = ModelPictureCutSims_str + "<div><img name='ModelPictureCutSims_img' width='100px' height='100px' src='<%=path%>/goods"+ModelPictureCutSims[i]+"' /><a class='btn btn_shanchu' onclick='onDelModelPictureCutSimImg(\""+ModelPictureCutSims[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ModelPictureCutSimList").html(ModelPictureCutSims_str);
		}
		
		//详细信息
		var array_FileCutSim = $("#array_FileCutSim").val();
		var array_FileCutSim_name = $("#array_FileCutSim_name").val();
		if(array_FileCutSim != null && array_FileCutSim != ''){
			var FileCutSims= array_FileCutSim.split(',');
			var FileCutSims_name = array_FileCutSim_name.split(',');
			var FileCutSims_str = '';
			for(var i = 0; i < FileCutSims.length; i++){
				if(FileCutSims[i] != null && FileCutSims[i] != ''){
					FileCutSims_str = FileCutSims_str + "<div><span name='FileCutSims_img' url='"+FileCutSims[i]+"' >"+FileCutSims_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelFileCutSimImg(\""+FileCutSims[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_FileCutSimList").html(FileCutSims_str);
		}
		
		
	});

	function changeValue(){
		
		document.getElementById('TypeCutSim_userForm').value=document.getElementById('selectWrap').options[document.getElementById('selectWrap').selectedIndex].text;
		document.getElementById('SoftwareCutSim_userForm').value=document.getElementById('selectWrap1').options[document.getElementById('selectWrap1').selectedIndex].text;
}
	
	//取消
	function onClose(){
		window.location.href='<%=path%>/CuttingSimulation/queryCuttingSimulationList';
	}
	
	
	//保存刀柄图片
	function onSaveModelPictureCutSimList(){
		 var formDate = new FormData(document.getElementById("pictureForm"));  
	     $.ajax({  
	          url: '/CuttingSimulation/saveModelPictureCutSim' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (url) {  
	              if(url!=""){
	            	  $("#span_ModelPictureCutSimList").append("<div><img name='ModelPictureCutSims_img' width='100px' height='100px' src='<%=path%>/goods"+url+"' /><a class='btn btn_shanchu' onclick='onDelModelPictureCutSimImg(\""+url+"\");'>删除</a><br/></div>");
	            	  $("#ModelPictureCutSim").remove();
	            	  $("#pictureSpan").html('<input type="file" accept="image/*" name="ModelPictureCutSim" id="ModelPictureCutSim" />');
	            	  var array_ModelPictureCutSim = $("#array_ModelPictureCutSim").val();
	            	  array_ModelPictureCutSim = array_ModelPictureCutSim + url + "," ;
	            	  $("#array_ModelPictureCutSim").val(array_ModelPictureCutSim);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除刀具图片
	function onDelModelPictureCutSimImg(url){
		
		var img_array = $("img[name='ModelPictureCutSims_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url){
				$(img_array[i]).parent().remove();
				var array_ModelPictureCutSim = $("#array_ModelPictureCutSim").val();
				array_ModelPictureCutSim = array_ModelPictureCutSim.replace(url,'');
				$("#array_ModelPictureCutSim").val(array_ModelPictureCutSim);
			}
		}
	}
	
	//保存详细信息
	function onSaveFileCutSimList(){
		var formDate = new FormData(document.getElementById("fileForm"));  
	     $.ajax({  
	          url: '/CuttingSimulation/saveFileCutSim' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  $("#span_FileCutSimList").append("<div><span name='FileCutSims_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelFileCutSimImg(\""+data.url+"\");'>删除</a><br/></div>");
	            	  $("#FileCutSim").remove();
	            	  $("#fileSpan").html('<input type="file" accept=".pdf" name="FileCutSim" id="FileCutSim" />');
	            	  var array_FileCutSim = $("#array_FileCutSim").val();
	            	  var array_FileCutSim_name = $("#array_FileCutSim_name").val();
	            	  array_FileCutSim_name = array_FileCutSim_name + data.fileName + ",";
	            	  array_FileCutSim = array_FileCutSim + data.url + "," ;
	            	  $("#array_FileCutSim").val(array_FileCutSim);
	            	  $("#array_FileCutSim_name").val(array_FileCutSim_name);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除详细信息
	function onDelFileCutSimImg(url_FileCutSim){
		var img_array = $("span[name='FileCutSims_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_FileCutSim){
				$(img_array[i]).parent().remove();
				var array_FileCutSim = $("#array_FileCutSim").val();
				array_FileCutSim = array_FileCutSim.replace(url_FileCutSim,'');
				$("#array_FileCutSim").val(array_FileCutSim);
				
			}
		}
	}
	
	//加载各种信息
	function jz(deputy){
		var html = '<iframe name="content_iframe" class="content_iframe" id="content_iframe" frameborder="0" src="/CuttingSimulation/jzAll?deputy='+deputy+'" style="width:100%;height:100%;"></iframe>';
		$("#div").html(html);
	}
	
	function jz1(){
		$("#jzdp").attr('style','display:black;');
		$("#jzskz").attr('style','display:black;');
	}
	
	function opt(id,deputy,type){
		$("#div").html("");
		if(deputy==1){
			$("#MaterialWorkpieceCutSim_userForm").val(id);
		}
		if(deputy==2){
			$("#MaterialToolCutSim_userForm").val(id);
			$("#MaterialToolCutSimNum_userForm").val(type);
		}
		if(deputy==3){
			$("#MaterialToolCutSim_userForm").val(id);
			$("#MaterialToolCutSimNum_userForm").val(type);
		}
	}
	
	
	function close(){
		$("#div").html("");
	}
	
	//保存
	function save(){
		$("#array_ModelPictureCutSim_userForm").val($("#array_ModelPictureCutSim").val());
		
		$("#array_FileCutSim_userForm").val($("#array_FileCutSim").val());
		$("#array_FileCutSim_name_userForm").val($("#array_FileCutSim_name").val());
		
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
<div id="div">

</div>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text">
    <form action="/CuttingSimulation/saveCuttingSimulation" name="userForm" id="userForm" method="post">
	  <input type="hidden" id="array_ModelPictureCutSim_userForm" name="array_ModelPictureCutSim"/>
	  
  	  <input type="hidden" id="array_FileCutSim_userForm" name="array_FileCutSim"/>
  	  <input type="hidden" id="array_FileCutSim_name_userForm" name="array_FileCutSim_name"/>
  	  
	  <input type="hidden" name="id_CuttingSimulation" id="id_CuttingSimulation_userForm" value="${(CuttingSimulation.id_CuttingSimulation == null || CuttingSimulation.id_CuttingSimulation == '') ? 0 : CuttingSimulation.id_CuttingSimulation}"/>
	  <li>
	    <span id="lititle">仿真编号</span>
	    <input name="IDCutSim" id="IDCutSim_userForm" type="text" value="${CuttingSimulation.IDCutSim}" class="input"/>
	  </li>		
	  <li>
	    <span id="lititle">仿真名称</span>
	    <input name="NameCutSim" id="NameCutSim_userForm" type="text" value="${CuttingSimulation.NameCutSim}" class="input" />
	  </li>
	  <li>
	    <span id="lititle">工件材料</span>
	    <input name="MaterialWorkpieceCutSim" id="MaterialWorkpieceCutSim_userForm" type="text" value="${CuttingSimulation.MaterialWorkpieceCutSim}" class="input" />
	  </li>
	  <li>
	  	<input type="button" class = "btn" onclick="jz(1);" value = "加载工件材料" />
	  </li>
	  <li>
	    <span id="lititle">仿真类型</span>
	    <span class="select_wrap">
				<span class="edit_select">
					<select  name="selectWrap"  id="selectWrap" onChange="changeValue();" class="select" contenteditable="true">
						<c:forEach items="${CategoryTypeCutSimList}" var="var" varStatus="vs">
							<option value="${var.id_CategoryTypeCutSim }" ${CuttingSimulation.TypeCutSim == var.id_CategoryTypeCutSim ? 'selected' : '' }>${var.name_CategoryTypeCutSim }</option>	
						</c:forEach>
					</select>
				</span>
				<span class="input_select">
				<input type="text" name="TypeCutSim" id="TypeCutSim_userForm" value="">
				</span>
		</span>
	  </li>
	  <li>
	    <span id="lititle">刀具类型</span>
	    	<span class="select_wrap">
	    	<span class="edit_select">
	    	<select name="ToolType" class="select" style="width : 100px;">
				<option value="">请选择</option>
				<option value="1" ${CuttingSimulation.ToolType == 1 ? 'selected' : '' }>刀片</option>	
				<option value="2" ${CuttingSimulation.ToolType == 2 ? 'selected' : '' }>整体刀具</option>
			  </select>
			 </span>
			 </span>
	  </li>
	  <li>
	    <span id="lititle">刀具材料</span>
	    <input name="MaterialToolCutSim" id="MaterialToolCutSim_userForm" type="text" value="${CuttingSimulation.MaterialToolCutSim}" class="input" />
	  </li>
	  <li>
	  	<input type="button" class = "btn" onclick="jz1();" value = "加载刀具" />
	  	<input type="button" id = "jzdp" class = "btn btn_shanchu" onclick="jz(2);" style="display:none;" value = "刀片" />
	  	<input type="button" id = "jzskz" class = "btn btn_shanchu" onclick="jz(3);" style="display:none;" value = "深孔钻" />
	  </li>
	  <li>
	    <span id="lititle">刀具/刀片编号</span>
	    <input name="MaterialToolCutSimNum" id="MaterialToolCutSimNum_userForm" type="text" value="${CuttingSimulation.MaterialToolCutSimNum}" class="input" />
	  </li>
	  <li>
	  	&nbsp;
	  </li>
	  <li>
	    <span id="lititle">前角</span>
	    <input name="QianjiaoCutSim" id="QianjiaoCutSim_userForm" type="text" value="${CuttingSimulation.QianjiaoCutSim}" class="input" 
	    onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" />
	  </li>
	  <li>
	    <span id="lititle">后角</span>
	    <input name="HoujiaoCutSim" id="HoujiaoCutSim_userForm" type="text" value="${CuttingSimulation.HoujiaoCutSim}" class="input" 
	    onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" />
	  </li>
	  <li>
	    <span id="lititle">刃倾角</span>
	    <input name="RenqingCutSim" id="RenqingCutSim_userForm" type="text" value="${CuttingSimulation.RenqingCutSim}" class="input" 
	    onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" />
	  </li>
	  <li>
	    <span id="lititle">刀尖圆弧半径</span>
	    <input name="NoseRadiusCutSim" id="NoseRadiusCutSim_userForm" type="text" value="${CuttingSimulation.NoseRadiusCutSim}" class="input" 
	    onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" />
	  </li>
	  <li>
	    <span id="lititle">断屑槽类型</span>
	    <input name="BreakerBladeCutSim" id="BreakerBladeCutSim_userForm" type="text" value="${CuttingSimulation.BreakerBladeCutSim}" class="input" />
	  </li>
	  <li>
	    <span id="lititle">切削速度</span>
	    <input name="CuttingSpeedCutSim" id="CuttingSpeedCutSim_userForm" type="text" value="${CuttingSimulation.CuttingSpeedCutSim}" class="input" 
	    onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" />
	  </li>
	  <li>
	    <span id="lititle">转速</span>
	    <input name="RoatingSpeedCutSim" id="RoatingSpeedCutSim_userForm" type="text" value="${CuttingSimulation.RoatingSpeedCutSim}" class="input" 
	    onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" />
	  </li>
	  <li>
	    <span id="lititle">进给量</span>
	    <input name="FeedCutSim" id="FeedCutSim_userForm" type="text" value="${CuttingSimulation.FeedCutSim}" class="input" 
	    onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" />
	  </li>
	  <li>
	    <span id="lititle">进给速度</span>
	    <input name="FeedSpeedCutSim" id="FeedSpeedCutSim_userForm" type="text" value="${CuttingSimulation.FeedSpeedCutSim}" class="input" 
	    onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" />
	  </li>
	  <li>
	    <span id="lititle">切削深度</span>
	    <input name="CuttingDepthCutSim" id="CuttingDepthCutSim_userForm" type="text" value="${CuttingSimulation.CuttingDepthCutSim}" class="input" 
	    onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" />
	  </li>
	  <li>
	    <span id="lititle">切削宽度</span>
	    <input name="CuttingWidthCutSim" id="CuttingWidthCutSim_userForm" type="text" value="${CuttingSimulation.CuttingWidthCutSim}" class="input" 
	    onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/\d+(\.\d{0,2})?/)||[''],''))" />
	  </li>
	  <li>
	    <span id="lititle">仿真软件</span>
	    <span class="select_wrap">
				<span class="edit_select">
					<select  name="selectWrap1"  id="selectWrap1" onChange="changeValue();" class="select" contenteditable="true">
						<c:forEach items="${CategorySoftwareCutSimList}" var="var" varStatus="vs">
							<option value="${var.id_CategorySoftwareCutSim }" ${CuttingSimulation.SoftwareCutSim == var.id_CategorySoftwareCutSim ? 'selected' : '' }>${var.name_CategorySoftwareCutSim }</option>	
						</c:forEach>
					</select>
				</span>
				<span class="input_select">
				<input type="text" name="SoftwareCutSim" id="SoftwareCutSim_userForm" value="">
				</span>
		</span>
	  </li>
	  <li class="block bor_t">
	    	<span id="lititle">仿真结果信息：</span><br/>
	    	<li><span id="lititle">切削力Fx</span>
	    	<input name="ForceXCutSim" id="ForceXCutSim_userForm" type="text" value="${CuttingSimulation.ForceXCutSim}" class="input" />\
	    	</li>
	    	<li>
	    	<span id="lititle">切削力Fy</span>
	    	<input name="ForceYCutSim" id="ForceYCutSim_userForm" type="text" value="${CuttingSimulation.ForceYCutSim}" class="input" />
	    	</li>
	    	<li>
	    	<span id="lititle">切削力Fz</span>
	    	<input name="ForceZCutSim" id="ForceZCutSim_userForm" type="text" value="${CuttingSimulation.ForceZCutSim}" class="input" />
	    	</li>
	    	<li>
	    	<span id="lititle">扭矩 N</span>
	    	<input name="TorqueCutSim" id="TorqueCutSim_userForm" type="text" value="${CuttingSimulation.TorqueCutSim}" class="input" />
	    	</li>
	    	<li>
	    	<span id="lititle">切削温度</span>
	    	<input name="TemperatureCutSim" id="TemperatureCutSim_userForm" type="text" value="${CuttingSimulation.TemperatureCutSim}" class="input" />
	    	</li>
  	  </li>
	</form>
	<!-- 刀柄图片 begin  -->
	
  	  <li class="block bor_t">
  	  	<form id="pictureForm">
	    	<span id="lititle">仿真模型图片</span>
	    	<input type ="hidden" id = "array_ModelPictureCutSim" value = "${array_ModelPictureCutSim }"/>
	    	<span id = "pictureSpan">  	
	    		<input type="file" accept="image/*" name="ModelPictureCutSim" id="ModelPictureCutSim" />
	    	</span>  
	    	<input type="button" value="加载图片" class="btn" onclick="onSaveModelPictureCutSimList();"/>
	    	<span id="span_ModelPictureCutSimList">
	    	</span>
	    </form>
  	  </li>
  	 
	<!-- 刀柄图片 end  -->

	

	<!-- 详细信息 begin  -->
 	  <li class="block bor_t"> 
 	  	<form id = "fileForm">
	 	    <span id="lititle">仿真程序文件</span>
	 	    <input type ="hidden" id = "array_FileCutSim" value = "${array_FileCutSim }"/>
	 	    <input type ="hidden" id = "array_FileCutSim_name" value = "${array_FileCutSim_name }"/>
		    <span id = "fileSpan">  
		    	<input type="file" name="FileCutSim" id="FileCutSim" />
		    </span>
		    <input type="button" value="加载文件" class="btn" onclick="onSaveFileCutSimList();"/>
		    <span id="span_FileCutSimList">
		    </span>
	    </form>
 	  </li> 
  	<!-- 详细信息 end  -->
  	
</ul>
</div>
</body>

</html>
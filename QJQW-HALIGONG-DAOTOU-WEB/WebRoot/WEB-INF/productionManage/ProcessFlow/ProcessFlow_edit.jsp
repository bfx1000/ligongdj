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
		var array_PicturePartProcessFlow = $("#array_PicturePartProcessFlow").val();
		if(array_PicturePartProcessFlow != null && array_PicturePartProcessFlow != ''){
			var PicturePartProcessFlows = array_PicturePartProcessFlow.split(',');
			var PicturePartProcessFlows_str = '';
			for(var i = 0; i < PicturePartProcessFlows.length; i++){
				if(PicturePartProcessFlows[i] != null && PicturePartProcessFlows[i] != ''){
					PicturePartProcessFlows_str = PicturePartProcessFlows_str + "<div><img name='PicturePartProcessFlows_img' width='100px' height='100px' src='<%=path%>/goods"+PicturePartProcessFlows[i]+"' /><a class='btn btn_shanchu' onclick='onDelPicturePartProcessFlowsImg(\""+PicturePartProcessFlows[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PicturePartProcessFlowList").html(PicturePartProcessFlows_str);
		}
		
		var num = $("#WorkingProcedureNum").val();
		for(var i = 0 ; i<num ;i++){
			var img_array = $("input[name=PictureProcessFlow_img"+i+"]");
			for(var j = 0;j<img_array.length;j++){
				var val = $("#array_PictureProcessFlow"+i).val();
				val = val + $(img_array[j]).val()+",";
				$("#array_PictureProcessFlow"+i).val(val);
			}
		}
		
	});
	
	//取消
	function onClose(){
		window.location.href='<%=path%>/ProcessFlow/ProcessFlowList';
	}
	
	
	//保存图片
	function onSavePicturePartProcessFlowList(){
		 var formDate = new FormData(); 
		 var file = $("#PicturePartProcessFlow").get(0).files[0];
		 formDate.append("PicturePartProcessFlow",file);
	     $.ajax({  
	          url: '/ProcessFlow/savePicturePartProcessFlow' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (url) {  
	              if(url!=""){
	            	  $("#span_PicturePartProcessFlowList").append("<div><img name='PicturePartProcessFlows_img' width='100px' height='100px' src='<%=path%>/goods"+url+"' /><a class='btn btn_shanchu' onclick='onDelPicturePartProcessFlowsImg(\""+url+"\");'>删除</a><br/></div>");
	            	  $("#PicturePartProcessFlow").remove();
	            	  $("#picture").html('<input type="file" accept="image/*" name="PicturePartProcessFlow" id="PicturePartProcessFlow" />');
	            	  var array_PicturePartProcessFlow = $("#array_PicturePartProcessFlow").val();
	            	  array_PicturePartProcessFlow = array_PicturePartProcessFlow + url + "," ;
	            	  $("#array_PicturePartProcessFlow").val(array_PicturePartProcessFlow);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除图片
	function onDelPicturePartProcessFlowsImg(url_PicturePartProcessFlow){
		
		var img_array = $("img[name='PicturePartProcessFlows_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_PicturePartProcessFlow){
				$(img_array[i]).parent().remove();
				var array_PicturePartProcessFlow = $("#array_PicturePartProcessFlow").val();
				array_PicturePartProcessFlow = array_PicturePartProcessFlow.replace(url_PicturePartProcessFlow,'');
				$("#array_PicturePartProcessFlow").val(array_PicturePartProcessFlow);
			}
		}
	}
	
	//上传工序图片
	function onSavePictureProcessFlow(index){
		var file = $("#PictureProcessFlow"+index).get(0).files[0]; //选择上传的文件
		var formData = new FormData();
		formData.append("PictureProcessFlow",file);
		$.ajax({  
	          url: '/ProcessFlow/savePictureProcessFlow' ,  
	          type: 'POST',  
	          data: formData,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
		            	  $("#div_PictureProcessFlow"+index).append("<div><img width='100px' height='100px' name='PictureProcessFlows_img"+index+"' src='<%=path%>/goods"+data.url+"'/><input type='hidden' name ='PictureProcessFlow_img"+index+"' value='"+data.url+"' /><a class='btn btn_shanchu' onclick='onDelPictureProcessFlowImg(\""+data.url+"\","+index+");'>删除</a></div>");
		            	  $("#PictureProcessFlow"+index).remove();
		            	  $("#span_PictureProcessFlow"+index).html('<input type="file" name="PictureProcessFlow'+index+'" id="PictureProcessFlow'+index+'" onchange="onSavePictureProcessFlow(\'PictureProcessFlow\',this,'+index+');"/>');
		            	  var array_PictureProcessFlow = $("#array_PictureProcessFlow"+index).val();
		            	  array_PictureProcessFlow = array_PictureProcessFlow + data.url + "," ;
		            	  $("#array_PictureProcessFlow"+index).val(array_PictureProcessFlow);
	              }
	              else {
	            	  alert("上传失败，请重新选择文件");
	              }
	          }  
	     }); 
	}
	
	function onDelPictureProcessFlowImg(url,i){
		var img_array = $("img[name=PictureProcessFlows_img"+i+"]");
		for(var j=0;j<img_array.length;j++){
			if($(img_array[j]).attr("src") =="/goods" + url){
				$(img_array[j]).parent().remove();
				var array_PictureProcessFlow = $("#array_PictureProcessFlow"+i).val();
				array_PictureProcessFlow = array_PictureProcessFlow.replace(url,'');
				$("#array_PictureProcessFlow"+i).val(array_PictureProcessFlow);
			}
		}		
	}
	
	
	function addWorkingProcedure(){
		var num = $("#WorkingProcedureNum").val();
		var html = '<div id = "gx_'+num+'"><div class="box_xiangxi zhedie">'+
			'<div class="box_zhedie">'+
				'<span class="a_zhedie1" id = "zd_'+num+'" onclick = "zd('+num+');" style="display:block;">新增的工序</span>'+
				'<span class="a_zhedie2" id = "zd1_'+num+'" onclick = "zd1('+num+');" style="display:none;">新增的工序</span>'+
			'</div>'+
			'<div class="box_u1" id="box_clcs'+num+'" style="display:none">'+
				'<ul class="box_text">'+
				        '<input name="id_WorkingProcedure" id="id_WorkingProcedure_userForm" type="hidden" class="input" value = "0" />'+
						'<li>'+
						'<input type = "button" style="float:right;" class="btn_add" value = "删除工序" onclick="delgx('+num+');"/>'+
					    '</li>'+
					    ' <li>&nbsp;</li>'+
					 ' <li>'+
					  '  <span id="lititle">工序编号</span>'+
					 '   <input name="NoProcedureProcessFlow" id="NoProcedureProcessFlow_userForm" type="text" class="input" value = "" />'+
					'  </li>	'+
					'  <li>'+
					 '   <span id="lititle">工序名称</span>'+
					 '   <input name="NameProcedureProcessFlow" id="NameProcedureProcessFlow_userForm" type="text" class="input" value = "" />'+
					 ' </li>'+
					 '  <li>'+
					 '   <span id="lititle">工序内容</span>'+
					 '   <input name="ContentProcedureProcessFlow" id="ContentProcedureProcessFlow_userForm" type="text" class="input" value = "" />'+
					 ' </li>'+
					'   <li>'+
					 '   <span id="lititle">设备型号</span>'+
					 '   <input name="EquipmentType" id="EquipmentType_userForm" type="text" class="input" value = "" />'+
					 ' </li>'+
					 '  <li>'+
					 '   <span id="lititle">工时</span>'+
					 '   <input name="TimeProcessFlow" id="TimeProcessFlow_userForm" type="text" class="input" value = "" />'+
					 ' </li>'+
					 	'  <li>'+
						'   <span id="lititle">加工程序</span>'+
						'    <input name="MachineProcessCode" id="MachineProcessCode_userForm" type="text" class="input" value = "" />'+
						'  </li>'+
					 '  <li>'+
					  '  <span id="lititle">加工夹具</span>'+
					  '  <input name="MachineProcessFlow" id="MachineProcessFlow_userForm" type="text" class="input" value = "" />'+
					'  </li>'+
					' <li>'+
					'    <input type="button" value="加载夹具" class="btn" onclick="jz(2,'+num+');"/>'+
					'  </li>'+
				 	' <li>'+
					 '   <span id="lititle">切削液</span>'+
					 '   <input name="CuttingFluidProcessFlow" id="CuttingFluidProcessFlow_userForm" type="text" class="input" value = ""/>'+
					'  </li>	' +
						'<li>' +
				   		' <input type="button" value="加载切削液" class="btn" onclick="jz(1,'+num+');"/>' +
				  		'</li>' +
					 ' <li>'+
					 '   <span id="lititle">工序备注</span>'+
					'    <input name="RemarkProcessFlow" id="RemarkProcessFlow_userForm" type="text" class="input"  value = ""/>'+
					'  </li>'+
					'  <li class="block bor_t" style="line-height:50px;">'+
					'	    <span id="lititle">工序简图</span>'+
				  	'		<input type ="hidden" name = "array_PictureProcessFlow" id = "array_PictureProcessFlow'+num+'" value="" />  '+
				  	'		<span id="span_PictureProcessFlow'+num+'">  '+
					'			<input type="file" name="PictureProcessFlow'+num+'" id="PictureProcessFlow'+num+'" />'+
					'		</span> '+
					'		<input type="button" value="加载图片" class="btn" onclick="onSavePictureProcessFlow('+num+');"/>'+
					'		<div id="div_PictureProcessFlow'+num+'"> '+

					'		</div> '+
					 ' </li>'+
				 ' </ul>'+
			'</div>'+
			'<div class="clear"></div>'+
		'</div></div>';
		$("#gx").append(html);
		num++;
		$("#WorkingProcedureNum").val(num);
	}
	
	//保存
	function save(){
		
		var form={};
		
		form.id_ProcessFlow=$("#id_ProcessFlow_userForm").val();
		form.NoProcessFlow=$("#NoProcessFlow_userForm").val();
		form.CompanyProcessFlow=$("#CompanyProcessFlow_userForm").val();
		form.NameProcessFlow=$("#NameProcessFlow_userForm").val();
		form.PartNameProcessFlow=$("#PartNameProcessFlow_userForm").val();
		form.PartNumberProcessFlow=$("#PartNumberProcessFlow_userForm").val();
		form.PartNoMaterialProcessFlow=$("#PartNoMaterialProcessFlow_userForm").val();
		form.PartCategoryMaterialProcessFlow=$("#PartCategoryMaterialProcessFlow_userForm").val();
		form.PartAssemblyProcessFlow=$("#PartAssemblyProcessFlow_userForm").val();
		form.PartNoAssemblyProcessFlow=$("#PartNoAssemblyProcessFlow_userForm").val();
		form.PartTypeProcessFlow=$("#PartTypeProcessFlow_userForm").val(); 
		form.array_PicturePartProcessFlow = $("#array_PicturePartProcessFlow").val();
		
		id_WorkingProcedure = $("input[name=id_WorkingProcedure]");
		NoProcedureProcessFlow = $("input[name=NoProcedureProcessFlow]");
		NameProcedureProcessFlow = $("input[name=NameProcedureProcessFlow]");
		ContentProcedureProcessFlow = $("input[name=ContentProcedureProcessFlow]");
		EquipmentType = $("input[name=EquipmentType]");
		TimeProcessFlow = $("input[name=TimeProcessFlow]");
		MachineProcessFlow = $("input[name=MachineProcessFlow]");
		MachineProcessCode = $("input[name=MachineProcessCode]");
		CuttingFluidProcessFlow = $("input[name=CuttingFluidProcessFlow]");
		RemarkProcessFlow = $("input[name=RemarkProcessFlow]");
		array_PictureProcessFlow = $("input[name=array_PictureProcessFlow]");
		
		var list = new Array();
		for(var i = 0;i<NoProcedureProcessFlow.length;i++){
			var form1 = {};
			form1.id_WorkingProcedure = $(id_WorkingProcedure[i]).val();
			form1.NoProcedureProcessFlow = $(NoProcedureProcessFlow[i]).val();
			form1.NameProcedureProcessFlow = $(NameProcedureProcessFlow[i]).val();
			form1.ContentProcedureProcessFlow = $(ContentProcedureProcessFlow[i]).val();
			form1.EquipmentType = $(EquipmentType[i]).val();
			form1.TimeProcessFlow = $(TimeProcessFlow[i]).val();
			form1.MachineProcessFlow =$(MachineProcessFlow[i]).val();
			form1.MachineProcessCode = $(MachineProcessCode[i]).val();
			form1.CuttingFluidProcessFlow = $(CuttingFluidProcessFlow[i]).val();
			form1.RemarkProcessFlow = $(RemarkProcessFlow[i]).val();
			form1.array_PictureProcessFlow = $(array_PictureProcessFlow[i]).val();
			list[i] = form1;
		}
		
		form.WorkingProcedure = JSON.stringify(list); 
		$.ajax({  
	          url: '/ProcessFlow/saveProcessFlow' ,  
	          type: 'POST',  
	          data: JSON.stringify(form),  
	          contentType: "application/json", 
	          processData: false,  
	          success: function (result) {  
	              if(result == 1){
	            	alert('操作成功！');
	            	onClose();
	              }
	              else {
	            	  alert('操作失败，请联系管理员！');
	              }
	          }  
	     });
	}
	
	function delgx(i){
		$("#gx_"+i).remove();
	}
	
	
	//加载各种信息
	function jz(i,j){
		var html = '<iframe name="content_iframe" class="content_iframe" id="content_iframe" frameborder="0" src="/ProcessFlow/jzAll?deputy='+i+'&gxId='+j+'" style="width:100%;height:100%;"></iframe>';
		$("#div").html(html);
	}
	function close(){
		$("#div").html("");
	}
	function opt(deputy,gxId,id,type,NameProcessPart,NumberMaterialProcessPart,CategoryMaterialProcessPart,AssemblyProcessPart,NoAssemblyProcessPart){
		$("#div").html("");
		if(deputy==1){
			$("#box_clcs"+gxId+" ul li #CuttingFluidProcessFlow_userForm").val(id);
		}
		if(deputy==2){
			$("#box_clcs"+gxId+" ul li #MachineProcessFlow_userForm").val(id);
		}
		if(deputy==3){
			$("#PartNumberProcessFlow_userForm").val(NameProcessPart);	
			$("#PartNameProcessFlow_userForm").val(id);
			$("#PartTypeProcessFlow_userForm").val(type);
			$("#PartNoMaterialProcessFlow_userForm").val(NumberMaterialProcessPart);
			$("#PartCategoryMaterialProcessFlow_userForm").val(CategoryMaterialProcessPart);
			$("#PartAssemblyProcessFlow_userForm").val(AssemblyProcessPart);
			$("#PartNoAssemblyProcessFlow_userForm").val(NoAssemblyProcessPart);
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
    <form action = "/ProcessFlow/saveProcessFlow" name="userForm" id="userForm" method="post">
  	    
	  <input type="hidden" name="id_ProcessFlow" id="id_ProcessFlow_userForm" value="${(ProcessFlow.id_ProcessFlow == null || ProcessFlow.id_ProcessFlow == '') ? 0 : ProcessFlow.id_ProcessFlow}"/>
	  <li>
	    <span id="lititle">工艺流程编号</span>
	    <input name="NoProcessFlow" id="NoProcessFlow_userForm" type="text" value="${ProcessFlow.NoProcessFlow}" class="input"/>
	  </li>		
	  <li>
	    <span id="lititle">单位名称</span>
	    <input name="CompanyProcessFlow" id="CompanyProcessFlow_userForm" type="text" value="${ProcessFlow.CompanyProcessFlow}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">工艺流程名称</span>
	    <input name="NameProcessFlow" id="NameProcessFlow_userForm" type="text" value="${ProcessFlow.NameProcessFlow}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <input type="button" value="加载零件信息" class="btn" onclick="jz(3,-1);"/>
	  </li>
	  <li>
	    <span id="lititle">零件名称</span>
	    <input name="PartNameProcessFlow" id="PartNameProcessFlow_userForm" type="text" value="${ProcessFlow.PartNameProcessFlow}" class="input" maxlength="100"/>
	  </li>
	  
	  <li>
	    <span id="lititle">零件编号</span>
	    <input name="PartNumberProcessFlow" id="PartNumberProcessFlow_userForm" type="text" value="${ProcessFlow.PartNumberProcessFlow}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">零件材料牌号</span>
	    <input name="PartNoMaterialProcessFlow" id="PartNoMaterialProcessFlow_userForm" type="text" value="${ProcessFlow.PartNoMaterialProcessFlow}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">零件材料类别</span>
	    <input name="PartCategoryMaterialProcessFlow" id="PartCategoryMaterialProcessFlow_userForm" type="text" value="${ProcessFlow.PartCategoryMaterialProcessFlow}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">零件所属部件</span>
	    <input name="PartAssemblyProcessFlow" id="PartAssemblyProcessFlow_userForm" type="text" value="${ProcessFlow.PartAssemblyProcessFlow}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">零件部件编号</span>
	    <input name="PartNoAssemblyProcessFlow" id="PartNoAssemblyProcessFlow_userForm" type="text" value="${ProcessFlow.PartNoAssemblyProcessFlow}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">零件类别</span>
	    <input name="PartTypeProcessFlow" id="PartTypeProcessFlow_userForm" type="text" value="${ProcessFlow.PartTypeProcessFlow}" class="input" maxlength="100"/>
	  </li>
	  <!-- <li>
	  	<input type = "button" value = "加载材料牌号和类别" class="btn" onclick="jz();"/>
	  </li> -->
	 
  	  <li class="block bor_t">
	    	<span id="lititle">图片</span>
	    	<input type ="hidden" name = "array_PicturePartProcessFlow" id = "array_PicturePartProcessFlow" value = "${array_PicturePartProcessFlow }"/>
	    	<span id = "picture">  	
	    		<input type="file" accept="image/*" name="PicturePartProcessFlow" id="PicturePartProcessFlow" />
	    	</span>  
	    	<input type="button" value="加载图片" class="btn" onclick="onSavePicturePartProcessFlowList();"/>
	    	<span id="span_PicturePartProcessFlowList">
	    	</span>
  	  </li>
	<div class="clear"></div>
	
	<input type = "hidden" id = "WorkingProcedureNum" value = "${(WorkingProcedureNum == null || WorkingProcedureNum == '') ? 0 : WorkingProcedureNum }"/>
	<input type = "button"  style="float:right;" class="btn_add" value = "添加工序" onclick="addWorkingProcedure();"/>
	<div class="clear"></div>
	
	<div id="gx">
		
	  	<c:forEach items="${ProcessFlow.WorkingProcedureList }" var="var" varStatus="vs">	
	  		<div id = "gx_${vs.index }">
		    <div class="box_xiangxi zhedie">
				<div class="box_zhedie">
					<span class="a_zhedie1" id = "zd_${vs.index }" onclick = "zd(${vs.index });" style="display:block;">${var.NameProcedureProcessFlow }</span>
					<span class="a_zhedie2" id = "zd1_${vs.index }" onclick = "zd1(${vs.index });" style="display:none;">${var.NameProcedureProcessFlow }</span>
				</div>
				<div class="box_u1" id="box_clcs${vs.index }" style="display:none">
					<ul class="box_text">
							<input name="id_WorkingProcedure" id="id_WorkingProcedure_userForm" type="hidden" class="input" value = "${var.id_WorkingProcedure }" />
						  <li>
							<input type = "button" style="float:right;" class="btn_add" value = "删除工序" onclick="delgx(${vs.index });"/>
						  </li>
						  <li>&nbsp;</li>
						  <li>
						    <span id="lititle">工序编号</span>
						    <input name="NoProcedureProcessFlow" id="NoProcedureProcessFlow_userForm" type="text" class="input" value = "${var.NoProcedureProcessFlow }" />
						  </li>	
						  <li>
						    <span id="lititle">工序名称</span>
						    <input name="NameProcedureProcessFlow" id="NameProcedureProcessFlow_userForm" type="text" class="input" value = "${var.NameProcedureProcessFlow }" />
						  </li>
						   <li>
						    <span id="lititle">工序内容</span>
						    <input name="ContentProcedureProcessFlow" id="ContentProcedureProcessFlow_userForm" type="text" class="input" value = "${var.ContentProcedureProcessFlow }" />
						  </li>
						   <li>
						    <span id="lititle">设备型号</span>
						    <input name="EquipmentType" id="EquipmentType_userForm" type="text" class="input" value = "${var.EquipmentType }" />
						  </li>
						   <li>
						    <span id="lititle">工时</span>
						    <input name="TimeProcessFlow" id="TimeProcessFlow_userForm" type="text" class="input" value = "${var.TimeProcessFlow }" />
						  </li>
						  <li>
						    <span id="lititle">加工程序</span>
						    <input name="MachineProcessCode" id="MachineProcessCode_userForm" type="text" class="input" value = "${var.MachineProcessCode }" />
						  </li>
						   <li>
						    <span id="lititle">加工夹具</span>
						    <input name="MachineProcessFlow" id="MachineProcessFlow_userForm" type="text" class="input" value = "${var.MachineProcessFlow }" />
						  </li>
						   <li>
						    <input type="button" value="加载夹具" class="btn" onclick="jz(2,${vs.index });"/>
						  </li>
					 	 <li>
						    <span id="lititle">切削液</span>
						    <input name="CuttingFluidProcessFlow" id="CuttingFluidProcessFlow_userForm" type="text" class="input" value = "${var.CuttingFluidProcessFlow }"/>
						  </li>	
						  <li>
						    <input type="button" value="加载切削液" class="btn" onclick="jz(1,${vs.index });"/>
						  </li>
						  <li>
						    <span id="lititle">工序备注</span>
						    <input name="RemarkProcessFlow" id="RemarkProcessFlow_userForm" type="text" class="input"  value = "${var.RemarkProcessFlow }"/>
						  </li>
						  <li class="block bor_t" style="line-height:50px;">
							    <span id="lititle">工序简图</span>
					  			<input type ="hidden" name = "array_PictureProcessFlow" id = "array_PictureProcessFlow${vs.index }" value="" />  
					  			<span id="span_PictureProcessFlow${vs.index }">
									<input type="file" name="PictureProcessFlow${vs.index }" id="PictureProcessFlow${vs.index }" />
								</span>
								<input type="button" value="加载图片" class="btn" onclick="onSavePictureProcessFlow(${vs.index });"/>
								<div id="div_PictureProcessFlow${vs.index }">
									<c:forEach items="${var.PictureProcessFlow }" var="var1" varStatus="vs1">
									<div>
								     	<img width='100px' height='100px' name='PictureProcessFlows_img${vs.index }' src= "<%=path%>/goods${var1.url_PictureProcessFlow }" />
								    	<input type = "hidden" name ='PictureProcessFlow_img${vs.index }' value="${var1.url_PictureProcessFlow }" />
								    	<a class="btn btn_shanchu" onclick="onDelPictureProcessFlowImg('${var1.url_PictureProcessFlow }',${vs.index });">删除</a>
							     	</div>
									</c:forEach>
								</div>
						  </li>
						 
					  </ul>
				</div>
				<div class="clear"></div>
			</div></div>
		</c:forEach>
	</div>
	 </form>
  </ul>
</div>
<div>
	
</div>
</body>
<script type="text/javascript">
	function zd(pid){
		$("#box_clcs"+pid).css("display","block");
		$("#zd_"+pid).css("display","none");
		$("#zd1_"+pid).css("display","block");
	}
	function zd1(pid){
		$("#box_clcs"+pid).css("display","none");
		$("#zd_"+pid).css("display","block");
		$("#zd1_"+pid).css("display","none");
	}
</script>
</html>
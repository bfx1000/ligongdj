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
		var array_PictureProcessStep = $("#array_PictureProcessStep").val();
		if(array_PictureProcessStep != null && array_PictureProcessStep != ''){
			var PictureProcessSteps = array_PictureProcessStep.split(',');
			var PictureProcessSteps_str = '';
			for(var i = 0; i < PictureProcessSteps.length; i++){
				if(PictureProcessSteps[i] != null && PictureProcessSteps[i] != ''){
					PictureProcessSteps_str = PictureProcessSteps_str + "<div><img name='PictureProcessSteps_img' width='100px' height='100px' src='<%=path%>/goods"+PictureProcessSteps[i]+"' /><a class='btn btn_shanchu' onclick='onDelPictureProcessStepImg(\""+PictureProcessSteps[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_PictureProcessStepList").html(PictureProcessSteps_str);
		}
		
	});
	
	//取消
	function onClose(NoProcedureProcessFlow){
		window.location.href='<%=path%>/ProcessStep/ProcessStepList?NoProcedureProcessFlow='+NoProcedureProcessFlow;
	}
	
	
	//保存刀柄图片
	function onSavePictureProcessStepList(){
		 var formDate = new FormData(document.getElementById("pictureForm"));  
	     $.ajax({  
	          url: '/ProcessStep/savePictureProcessStep' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (url) {  
	              if(url!=""){
	            	  $("#span_PictureProcessStepList").append("<div><img name='PictureProcessSteps_img' width='100px' height='100px' src='<%=path%>/goods"+url+"' /><a class='btn btn_shanchu' onclick='onDelPictureProcessStepImg(\""+url+"\");'>删除</a><br/></div>");
	            	  $("#PictureProcessStep").remove();
	            	  $("#picture").html('<input type="file" accept="image/*" name="PictureProcessStep" id="PictureProcessStep" />');
	            	  var array_PictureProcessStep = $("#array_PictureProcessStep").val();
	            	  array_PictureProcessStep = array_PictureProcessStep + url + "," ;
	            	  $("#array_PictureProcessStep").val(array_PictureProcessStep);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除刀具图片
	function onDelPictureProcessStepImg(url_PictureProcessStep){
		
		var img_array = $("img[name='PictureProcessSteps_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url_PictureProcessStep){
				$(img_array[i]).parent().remove();
				var array_PictureProcessStep = $("#array_PictureProcessStep").val();
				array_PictureProcessStep = array_PictureProcessStep.replace(url_PictureProcessStep,'');
				$("#array_PictureProcessStep").val(array_PictureProcessStep);
			}
		}
	}
	
	//保存
	function save(){
		
		$("#array_PictureProcessStep_userForm").val($("#array_PictureProcessStep").val());
		
		$("#userForm").ajaxSubmit(function(result){
			if(result == 1){
				alert('操作成功！');
				onClose('${WorkingProcedure.NoProcedureProcessFlow }');
			}else{
				alert('操作失败，请联系管理员！');
			}
		});
	}
	//加载各种信息
	function jz(){
		var html = '<iframe name="content_iframe" class="content_iframe" id="content_iframe" frameborder="0" src="/ProcessStep/loadingMaterial" style="width:100%;height:100%;"></iframe>';
		$("#div").html(html);
	}
	function close(){
		$("#div").html("");
	}
	function opt(id,type){
		$("#div").html("");
		$("#NumberMaterialProcessStep_userForm").val(id);
		$("#CategoryMaterialProcessStep_userForm").val(type);
		
	}
</script>
</head>
<body>
<div id="div">
</div>
<div></div>
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose('${WorkingProcedure.NoProcedureProcessFlow }');">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text">
    <form action="/ProcessStep/saveProcessStep" name="userForm" id="userForm" method="post">
      <input type="hidden" id="array_PictureProcessStep_userForm" name="array_PictureProcessStep"/>
  	  
	  <input type="hidden" name="id_ProcessStep" id="id_ProcessStep_userForm" value="${(ProcessStep.id_ProcessStep == null || ProcessStep.id_ProcessStep == '') ? 0 : ProcessStep.id_ProcessStep}"/>
	  
	  <input type="hidden" name="id_WorkingProcedure" id="id_WorkingProcedure_userForm" value="${WorkingProcedure.id_WorkingProcedure }"/>
	  <li>
	  	<span id="lititle">工艺编号</span>
	  	<span>${ProcessFlow.NoProcessFlow } </span>
	  </li>
	  <li>
	  	<span id="lititle">工序编号</span>
	  	<span>${WorkingProcedure.NoProcedureProcessFlow } </span>
	  </li>
	  <li>
	    <span id="lititle">工艺名称</span>
	    <span>${ProcessFlow.NameProcessFlow } </span>
	  </li>
	  <li>
	    <span id="lititle">工序名称</span>
	    <span>${WorkingProcedure.NameProcedureProcessFlow } </span>
	  </li>
	  <li>
	    <span id="lititle">工步编号</span>
	    <input name="NoProcessStep" id="NoProcessStep_userForm" type="text" value="${ProcessStep.NoProcessStep}" class="input" maxlength="10"/>
	  </li>		
	  <li>
	    <span id="lititle">加工级别</span>
	    <select name="MachiningLevelProcessStep" id="MachiningLevelProcessStep_userForm" class="select">
	      <option value="" ${ProcessStep.MachiningLevelProcessStep == "" || ProcessStep.MachiningLevelProcessStep == null ? 'selected' : '' }>请选择</option>
		  <option value="1" ${ProcessStep.MachiningLevelProcessStep == 1 ? 'selected' : '' }>精加工</option>
		  <option value="2" ${ProcessStep.MachiningLevelProcessStep == 2 ? 'selected' : '' }>粗加工</option>
		  <option value="3" ${ProcessStep.MachiningLevelProcessStep == 3 ? 'selected' : '' }>半精加工</option>
		</select>
	  </li>
	  <li>
	    <span id="lititle">加工类别</span>
	    <select name="MachiningTypeProcessStep" id="MachiningTypeProcessStep_userForm" class="select">
	      <option value="" ${ProcessStep.MachiningTypeProcessStep == "" || ProcessStep.MachiningTypeProcessStep == null ? 'selected' : '' }>请选择</option>
		  <option value="1" ${ProcessStep.MachiningTypeProcessStep == 1 ? 'selected' : '' }>车削</option>
		  <option value="2" ${ProcessStep.MachiningTypeProcessStep == 2 ? 'selected' : '' }>铣削</option>
		  <option value="3" ${ProcessStep.MachiningTypeProcessStep == 3 ? 'selected' : '' }>镗削</option>
		  <option value="4" ${ProcessStep.MachiningTypeProcessStep == 4 ? 'selected' : '' }>钻削</option>
		  <option value="5" ${ProcessStep.MachiningTypeProcessStep == 5 ? 'selected' : '' }>磨削</option>
		</select>
	  </li>
	  <li>
	    <span id="lititle">工步名称</span>
	    <input name="NameProcessStep" id="NameProcessStep_userForm" type="text" value="${ProcessStep.NameProcessStep}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">工步内容</span>
	    <input name="ContentProcessStep" id="ContentProcessStep_userForm" type="text" value="${ProcessStep.ContentProcessStep}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">量具</span>
	    <input name="MeasureProcessStep" id="MeasureProcessStep_userForm" type="text" value="${ProcessStep.MeasureProcessStep}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">刀柄</span>
	    <input name="ToolHolderProcessStep" id="ToolHolderProcessStep_userForm" type="text" value="${ProcessStep.ToolHolderProcessStep}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">刀片</span>
	    <input name="ToolbladeProcessStep" id="ToolbladeProcessStep_userForm" type="text" value="${ProcessStep.ToolbladeProcessStep}" class="input" maxlength="100"/>
	  </li>
	  
	  <li>
	    <span id="lititle">刀片材料</span>
	    <input name="ToolMaterialProcessStep" id="ToolMaterialProcessStep_userForm" type="text" value="${ProcessStep.ToolMaterialProcessStep}" class="input" maxlength="100"/>
	  </li>
	  
	  <li>
	    <span id="lititle">刀具</span>
	    <input name="CutterProcessStep" id="CutterProcessStep_userForm" type="text" value="${ProcessStep.CutterProcessStep}" class="input" maxlength="100"/>
	  </li>
	  
	  <li>
	    <span id="lititle">切削速度</span>
	    <input name="CutterSpeedProcessStep" id="CutterSpeedProcessStep_userForm" type="text" value="${ProcessStep.CutterSpeedProcessStep}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">主轴转速</span>
	    <input name="SpindlespeedProcessStep" id="SpindlespeedProcessStep_userForm" type="text" value="${ProcessStep.SpindlespeedProcessStep}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">每齿进给量</span>
	    <input name="FeedProcessStep" id="FeedProcessStep_userForm" type="text" value="${ProcessStep.FeedProcessStep}" class="input" maxlength="100"/>
	  </li>
	  
	  <li>
	    <span id="lititle">进给速度</span>
	    <input name="FeedSpeedProcessStep" id="FeedSpeedProcessStep_userForm" type="text" value="${ProcessStep.FeedSpeedProcessStep}" class="input" maxlength="100"/>
	  </li>
	  
	  <li>
	    <span id="lititle">切削深度</span>
	    <input name="CuttingDepthProcessStep" id="CuttingDepthProcessStep_userForm" type="text" value="${ProcessStep.CuttingDepthProcessStep}" class="input" maxlength="100"/>
	  </li>
	  
	  <li>
	    <span id="lititle">切削宽度</span>
	    <input name="CuttingWidthProcessStep" id="CuttingWidthProcessStep_userForm" type="text" value="${ProcessStep.CuttingWidthProcessStep}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">机动</span>
	    <input name="TimeMachiningProcessStep" id="TimeMachiningProcessStep_userForm" type="text" value="${ProcessStep.TimeMachiningProcessStep}" class="input" maxlength="100"/>
	  </li>
	   <li>
	    <span id="lititle">辅助</span>
	    <input name="TimeAssistProcessStep" id="TimeAssistProcessStep_userForm" type="text" value="${ProcessStep.TimeAssistProcessStep}" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">备注</span>
	    <input name="RemarkProcessStep" id="RemarkProcessStep_userForm" type="text" value="${ProcessStep.RemarkProcessStep}" class="input" maxlength="100"/>
	  </li>
	   <li>
	    <span id="lititle">设备</span>
	    <input name="DeviceProcessStep" id="DeviceProcessStep_userForm" type="text" value="${ProcessStep.DeviceProcessStep==''||ProcessStep.DeviceProcessStep==null ? WorkingProcedure.EquipmentType : ProcessStep.DeviceProcessStep }" class="input" maxlength="100"/>
	  </li>
	  <li>
	    <span id="lititle">夹具</span>
	    <input name="FixtureProcessStep" id="FixtureProcessStep_userForm" type="text" value="${ProcessStep.FixtureProcessStep==''||ProcessStep.FixtureProcessStep==null ? WorkingProcedure.MachineProcessFlow:ProcessStep.FixtureProcessStep }" class="input" maxlength="100"/>
	  </li>
	   <li>
	    <span id="lititle">切削液</span>
	    <input name="CuttingFluidProcessStep" id="CuttingFluidProcessStep_userForm" type="text" value="${ProcessStep.CuttingFluidProcessStep==''||ProcessStep.CuttingFluidProcessStep==null ? WorkingProcedure.CuttingFluidProcessFlow:ProcessStep.CuttingFluidProcessStep }" class="input" maxlength="100"/>
	  </li>
	  
	</form>
	
  	  <li class="block bor_t">
  	  	<form id="pictureForm">
	    	<span id="lititle">图片</span>
	    	<input type ="hidden" id = "array_PictureProcessStep" value = "${array_PictureProcessStep }"/>
	    	<span id = "picture">  	
	    		<input type="file" accept="image/*" name="PictureProcessStep" id="PictureProcessStep" />
	    	</span>  
	    	<input type="button" value="加载图片" class="btn" onclick="onSavePictureProcessStepList();"/>
	    	<span id="span_PictureProcessStepList">
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
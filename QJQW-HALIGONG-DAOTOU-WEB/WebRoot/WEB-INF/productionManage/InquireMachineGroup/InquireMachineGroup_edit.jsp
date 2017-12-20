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
<script src="<%=path%>/resources/js/laydate/laydate.js"></script>

<script type="text/JavaScript">
	
	//保存
	function save(){
		
		var displayMachGrStatus_userForm = $("#displayMachGrStatus_userForm").val();
		if(displayMachGrStatus_userForm==1){
			alert("请设定状态！");
			return false;
		}
		
		$("#InquireMachGrStatus_userForm_copy").val($("#InquireMachGrStatus_userForm").val());
		$("#displayMachGrStatus_userForm_copy").val(displayMachGrStatus_userForm);
		
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
		window.location.href='<%=path%>/InquireMachineGroup/InquireMachineGroupList';
	}
	
	
	//加载各种信息
	function jz(i){
		var html = '<iframe name="content_iframe" class="content_iframe" id="content_iframe" frameborder="0" src="/InquireMachineGroup/loading?deputy='+i+'" style="width:100%;height:100%;"></iframe>';
		$("#div").html(html);
	}
	
	function jz1(){
		var NumberMachGrNode = $("#NumberMachGrNode_userForm").val();
		var html = '<iframe name="content_iframe" class="content_iframe" id="content_iframe" frameborder="0" src="/InquireMachineGroup/loading?deputy=3&IDDeviceManufPlan='+NumberMachGrNode+'" style="width:100%;height:100%;"></iframe>';
		$("#div").html(html);
	}
	
	function close(){
		$("#div").html("");
	}
	function opt(i){
		$("#div").html("");
		if(i==1){
			$("#NumberMachGrNode_userForm").val(arguments[1]);
			$("#ModelMachGrNode_userForm").val(arguments[2]);
			$("#TypeMachGrNode_userForm").val(arguments[3]);
			$("#DepartmentMachGrNode_userForm").val(arguments[4]);
			$("#WorkshopMachGrNode_userForm").val(arguments[5]);
			$("#PositionMachGrNode_userForm").val(arguments[6]);
		}
		if(i==2){  
			$("#NameMachineGroup_userForm").val(arguments[1]);
		}
		if(i==3){
			$.ajax({
			    url:"/InquireMachineGroup/judgingState",
			    type:"post",
			    data:{startDate:arguments[3],endDate:arguments[4],id:arguments[5]},
			    dataType:"json",
			    success:function(data){
			    	if(data){
			    		$("#InquireMachGrStatus_userForm").val(2);
			    		if($("#SetMachGrStatus_userForm").val()==1){
			    			$("#displayMachGrStatus_userForm").val(2);
			    		}
			    	}else{
			    		$("#InquireMachGrStatus_userForm").val(3);
			    		if($("#SetMachGrStatus_userForm").val()==1){
			    			$("#displayMachGrStatus_userForm").val(3);
			    		}
			    	}
			    }
			});
			$("#PartNoMachGr_userForm").val(arguments[1]);
			$("#PartNameMachGr_userForm").val(arguments[2]);
			$("#id_ManufacturePlan_userForm").val(arguments[5]);
		}
	}
	function change(){
		var SetMachGrStatus_userForm = $("#SetMachGrStatus_userForm").val();
		if(SetMachGrStatus_userForm==1){
			$("#displayMachGrStatus_userForm").val($("#InquireMachGrStatus_userForm").val());
		}else{
			$("#displayMachGrStatus_userForm").val(SetMachGrStatus_userForm);
		}
		alert("设置状态更改");
	}

</script>
</head>
<body style="background:#fff;">
<div id="div">

</div>
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text">
	<form action="/InquireMachineGroup/saveInquireMachineGroup" name="userForm" id="userForm" method="post">
    	
	  <input type="hidden" name="id_InquireMachineGroup" id="id_InquireMachineGroup_userForm" value="${InquireMachineGroup.id_InquireMachineGroup==''||InquireMachineGroup.id_InquireMachineGroup==null?0:InquireMachineGroup.id_InquireMachineGroup}"/>
	  <li>
	  	<span style="color:#217fe1;"><h3>设备信息：</h3></span>
	  </li>
	  <li>
  		<input type="button" value="加载设备" class="btn" onclick="jz(1);"/>
 	  </li>
	  <li>
	    <span id="lititle">机床编号</span>
	    <input name="NumberMachGrNode" id="NumberMachGrNode_userForm" type="text" value="${InquireMachineGroup.NumberMachGrNode }" class="input" maxlength="10" />
	  </li>
	  <li>
	    <span id="lititle">机床型号</span>
	    <input name="ModelMachGrNode" id="ModelMachGrNode_userForm" type="text" value="${InquireMachineGroup.ModelMachGrNode }" class="input" maxlength="100"/>
	  </li>
	  <li class="append_wrap">
	    <span id="lititle">机床类别</span>
	    <input name="TypeMachGrNode" id="TypeMachGrNode_userForm"  type="text" value="${InquireMachineGroup.TypeMachGrNode }" class="input" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">机床所在单位</span>
	    <input name="DepartmentMachGrNode" id="DepartmentMachGrNode_userForm" type="text" value="${InquireMachineGroup.DepartmentMachGrNode }" class="input" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">机床车间</span>
	    <input name="WorkshopMachGrNode" id="WorkshopMachGrNode_userForm" type="text" value="${InquireMachineGroup.WorkshopMachGrNode }" class="input" maxlength="250"/>
	  </li>
		<li>
	    <span id="lititle">机床位置</span>
	    <input name="PositionMachGrNode" id="PositionMachGrNode_userForm" type="text" value="${InquireMachineGroup.PositionMachGrNode }" class="input" maxlength="250"/>
	  </li>
	  <li>
	  	<span style="color:#217fe1;"><h3>设备组：</h3></span>
	  </li>
	  <li>&nbsp;</li>
	  <li>
	    <span id="lititle">设备组名称</span>
	    <input name="NameMachineGroup" id="NameMachineGroup_userForm" type="text" value="${InquireMachineGroup.NameMachineGroup }" class="input" maxlength="250"/>
	  </li>
	  <li>
	  	<input type="button" value="加载设备组" class="btn" onclick="jz(2);"/>
	  </li>
	  <li>
	  	<span style="color:#217fe1;"><h3>状态信息：</h3></span>
	  </li>
	  <li>&nbsp;</li>
	  <li>
	    <span id="lititle">目前加工零件</span>
	    <input name="PartNoMachGr" id="PartNoMachGr_userForm" type="text" placeholder="无" value="${InquireMachineGroup.PartNoMachGr }" class="input" maxlength="250"/>
	  </li>
	  <li>
	    <span id="lititle">目前加工零件名</span>
	    <input name="PartNameMachGr" id="PartNameMachGr_userForm" type="text" placeholder="无" value="${InquireMachineGroup.PartNameMachGr }" class="input" maxlength="250"/>
	  </li>
	  <li>
	    <span id="lititle">查询设备状态</span>
	    <input type="hidden" name="id_ManufacturePlan" id="id_ManufacturePlan_userForm" value = "0"/>
	    <select name="InquireMachGrStatus" id="InquireMachGrStatus_userForm" disabled="disabled" onChange="" class="select">
		  <option value="1" ${InquireMachineGroup.InquireMachGrStatus == 1 ? 'selected' : '' }>未设定</option>
		  <option value="2" ${InquireMachineGroup.InquireMachGrStatus == 2 ? 'selected' : '' }>使用</option>
		  <option value="3" ${InquireMachineGroup.InquireMachGrStatus == 3 ? 'selected' : '' }>未使用</option>
		</select>
	  </li>
	  <li>
  		<input type="button" value="加载状态" class="btn" onclick="jz1(1);"/>
 	  </li>
	  <li>
	    <span id="lititle">设定设备状态</span>
	    <select name="SetMachGrStatus" id="SetMachGrStatus_userForm" onChange="change();" class="select">
		  <option value="1" ${InquireMachineGroup.SetMachGrStatus == 1 ? 'selected' : '' }>未设定</option>
		  <option value="2" ${InquireMachineGroup.SetMachGrStatus == 2 ? 'selected' : '' }>使用</option>
		  <option value="3" ${InquireMachineGroup.SetMachGrStatus == 3 ? 'selected' : '' }>未使用</option>
		  <option value="4" ${InquireMachineGroup.SetMachGrStatus == 4 ? 'selected' : '' }>维修</option>
		</select>
	  </li>
	  <li>
	    <span id="lititle">显示设备状态</span>
	    <select name="displayMachGrStatus" id="displayMachGrStatus_userForm" disabled="disabled" onChange="" class="select">
	      <option value="1" ${InquireMachineGroup.displayMachGrStatus == 1 ? 'selected' : '' }>待选择</option>
		  <option value="2" ${InquireMachineGroup.displayMachGrStatus == 2 ? 'selected' : '' }>使用</option>
		  <option value="3" ${InquireMachineGroup.displayMachGrStatus == 3 ? 'selected' : '' }>未使用</option>
		  <option value="4" ${InquireMachineGroup.displayMachGrStatus == 4 ? 'selected' : '' }>维修</option>
		</select>
	  </li>
	  <input name="InquireMachGrStatus" id="InquireMachGrStatus_userForm_copy" type="hidden" class="input" maxlength="250"/>
	  <input name="displayMachGrStatus" id="displayMachGrStatus_userForm_copy" type="hidden" class="input" maxlength="250"/>
	</form>
	</ul>
</div>
</body>
</html>
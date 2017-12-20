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
		$("#userForm").ajaxSubmit(function(result){
			if(result == 1){
				alert('操作成功！');
				onClose();
			}else if(result == -1){
				alert('该组名已存在，请重新输入！');
			}else{
				alert('操作失败，请联系管理员！');
			}
		});
	}
	
	//取消
	function onClose(){
		window.location.href='<%=path%>/MachineGroup/MachineGroupList';
	}
	
	//加载各种信息
	function loading(){
		var html = '<iframe name="content_iframe" class="content_iframe" id="content_iframe" frameborder="0" src="/MachineGroup/loading" style="width:100%;height:100%;"></iframe>';
		$("#div").html(html);
	}
	function close(){
		$("#div").html("");
	}
	
	function opt(){
		$("#div").html("");
		$("#SuperiorMachineGroup_userForm").val(arguments[0]);
		$("#LevelMachineGroup_userForm").val(arguments[1]);
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
	<form action="/MachineGroup/saveMachineGroup" name="userForm" id="userForm" method="post">
    
	  <input type="hidden" name="id_MachineGroup" id="id_MachineGroup_userForm" value="${MachineGroup.id_MachineGroup==''||MachineGroup.id_MachineGroup==null?0:MachineGroup.id_MachineGroup}"/>
	  <li>
	    <span id="lititle">上级设备组</span>
	    <input name="SuperiorMachineGroup" id="SuperiorMachineGroup_userForm" readonly = "readonly" type="text" value="${MachineGroup.SuperiorMachineGroup }" class="input" maxlength="10" />
	  </li>
	  <li>
	  	<input name = "LevelMachineGroup" id="LevelMachineGroup_userForm" type ="hidden" value ="${MachineGroup.LevelMachineGroup }"/>
	    <input onclick="loading();" type="button" value="选择" class="btn" />
	  </li>
	  <li>
	    <span id="lititle">设备组名称</span>
	    <input name="NameMachineGroup" id="NameMachineGroup_userForm" type="text" value="${MachineGroup.NameMachineGroup }" class="input" maxlength="100"/>
	  </li>
	  <li class="append_wrap">
	    <span id="lititle">设备组编号</span>
	    <input name="NoMachineGroup" id="NoMachineGroup_userForm"  type="text" value="${MachineGroup.NoMachineGroup }" class="input" maxlength="250" />
	  </li>
	  <li class="append_wrap">
	    <span id="lititle">地址</span>
	    <input name="AddressMachineGroup" id="AddressMachineGroup_userForm"   type="text" value="${MachineGroup.AddressMachineGroup }" class="input" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">负责人</span>
	    <input name="PrincipalMachineGroup" id="PrincipalMachineGroup_userForm" type="text" value="${MachineGroup.PrincipalMachineGroup }" class="input" maxlength="250"/>
	  </li>
		<li>
	    <span id="lititle">备注</span>
	    <input name="RemarkMachineGroup" id="RemarkMachineGroup_userForm" type="text" value="${MachineGroup.RemarkMachineGroup }" class="input" maxlength="250"/>
	  </li>
	  	
	</form>
	</ul>
</div>
</body>
</html>
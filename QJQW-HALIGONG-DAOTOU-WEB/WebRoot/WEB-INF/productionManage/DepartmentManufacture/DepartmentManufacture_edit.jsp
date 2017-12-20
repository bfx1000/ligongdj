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
				alert('部门名称已存在，请重新输入！');
			}else{
				alert('操作失败，请联系管理员！');
			}
		});
	}
	
	//取消
	function onClose(){
		window.location.href='<%=path%>/DepartmentManufacture/DepartmentManufactureList';
	}
	
	//加载各种信息
	function loading(){
		var html = '<iframe name="content_iframe" class="content_iframe" id="content_iframe" frameborder="0" src="/DepartmentManufacture/loading" style="width:100%;height:100%;"></iframe>';
		$("#div").html(html);
	}
	function close(){
		$("#div").html("");
	}
	
	function opt(){
		$("#div").html("");
		$("#SuperiorDepartmentManuf_userForm").val(arguments[0]);
		$("#LevelDepartmentManuf_userForm").val(arguments[1]);
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
	<form action="/DepartmentManufacture/saveDepartmentManufacture" name="userForm" id="userForm" method="post">
    
	  <input type="hidden" name="id_DepartmentManufacture" id="id_DepartmentManufacture_userForm" value="${DepartmentManufacture.id_DepartmentManufacture==''||DepartmentManufacture.id_DepartmentManufacture==null?0:DepartmentManufacture.id_DepartmentManufacture}"/>
	  <li>
	    <span id="lititle">上级部门</span>
	    <input name="SuperiorDepartmentManuf" id="SuperiorDepartmentManuf_userForm" readonly = "readonly" type="text" value="${DepartmentManufacture.SuperiorDepartmentManuf }" class="input" maxlength="10" />
	  </li>
	  <li>
	  	<input name = "LevelDepartmentManuf" id="LevelDepartmentManuf_userForm" type ="hidden" value ="${DepartmentManufacture.LevelDepartmentManuf }"/>
	    <input onclick="loading();" type="button" value="选择" class="btn" />
	  </li>
	  <li>
	    <span id="lititle">部门名称</span>
	    <input name="NameDepartmentManuf" id="NameDepartmentManuf_userForm" type="text" value="${DepartmentManufacture.NameDepartmentManuf }" class="input" maxlength="100"/>
	  </li>
	  <li class="append_wrap">
	    <span id="lititle">部门编号</span>
	    <input name="NoDepartmentManuf" id="NoDepartmentManuf_userForm"  type="text" value="${DepartmentManufacture.NoDepartmentManuf }" class="input" maxlength="250" />
	  </li>
	  <li class="append_wrap">
	    <span id="lititle">地址</span>
	    <input name="AddressDepartmentManuf" id="AddressDepartmentManuf_userForm"   type="text" value="${DepartmentManufacture.AddressDepartmentManuf }" class="input" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">电话</span>
	    <input name="TeleNoDepartmentManuf" id="TeleNoDepartmentManuf_userForm" type="text" value="${DepartmentManufacture.TeleNoDepartmentManuf }" class="input" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">负责人</span>
	    <input name="PrincipalDepartmentManuf" id="PrincipalDepartmentManuf_userForm" type="text" value="${DepartmentManufacture.PrincipalDepartmentManuf }" class="input" maxlength="250"/>
	  </li>
		<li>
	    <span id="lititle">备注</span>
	    <input name="RemarkDepartmentManuf" id="RemarkDepartmentManuf_userForm" type="text" value="${DepartmentManufacture.RemarkDepartmentManuf }" class="input" maxlength="250"/>
	  </li>
	  	
	</form>
	</ul>
</div>
</body>
</html>
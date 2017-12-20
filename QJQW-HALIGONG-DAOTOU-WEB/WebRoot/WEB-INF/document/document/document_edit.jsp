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
		if($("#title_userForm").val()=="" || $("#title_userForm").val()==null){
			alert("标题不能为空！");
			return false;
		}
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
		window.location.href='<%=path%>/document/documentList';
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
	<form action="/document/saveDocument" name="userForm" id="userForm" method="post">
	  <input type="hidden" name="id_Document" id="id_Document_userForm" value="${document.id_Document==''||document.id_Document==null?0:document.id_Document}"/>
	  <div>
	  	<div class="title_div">标题</div>
	    <textarea name = "title" id="title_userForm" rows="" cols=""  class="title_textarea">${document.title }</textarea>
	  </div>
	  <div>
	  	<div class="title_div">内容</div>
	    <textarea name = "text" id="text_userForm" rows="" cols=""  class="content_textarea">${document.text }</textarea>
	  </div>    
	</form>
</div>
</body>
</html>
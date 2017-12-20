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
	
	$(document).ready(function(){
		changeValue();
	});
	function changeValue(){
		document.getElementById('TitlesStaffManuf_userForm').value=document.getElementById('selectWrap').options[document.getElementById('selectWrap').selectedIndex].text;
	}
	//保存
	function save(){
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
		window.location.href='<%=path%>/StaffManuf/StaffManufList';
	}
	
	

</script>
</head>
<body style="background:#fff;">
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text">
	<form action="/StaffManuf/saveStaffManuf" name="userForm" id="userForm" method="post">
    
	  <input type="hidden" name="id_StaffManuf" id="id_StaffManuf_userForm" value="${StaffManuf.id_StaffManuf==''||StaffManuf.id_StaffManuf==null?0:StaffManuf.id_StaffManuf}"/>
	  <li>
	    <span id="lititle">员工姓名</span>
	    <input name="NameStaffManuf" id="NameStaffManuf_userForm" type="text" value="${StaffManuf.NameStaffManuf }" class="input" maxlength="10" />
	  </li>
	  <li>
	    <span id="lititle">员工部门</span>
	    <input name="DepartStaffManuf" id="DepartStaffManuf_userForm" type="text" value="${StaffManuf.DepartStaffManuf }" class="input" maxlength="100"/>
	  </li>
	  <li class="append_wrap">
	    <span id="lititle">员工编号</span>
	    <input name="NoStaffManuf" id="NoStaffManuf_userForm"  type="text" value="${StaffManuf.NoStaffManuf }" class="input" maxlength="250" />
	  </li>
	  <li class="append_wrap">
	    <span id="lititle">出生日期</span>
	    <input name="BirthStaffManuf" id="BirthStaffManuf_userForm"  onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"  type="text" value="${StaffManuf.BirthStaffManuf }" class="input" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">职务</span>
	    <input name="JobStaffManuf" id="JobStaffManuf_userForm" type="text" value="${StaffManuf.JobStaffManuf }" class="input" maxlength="250" />
	  </li>
	  <li>
	    <span id="lititle">状态</span>
	    <input name="StatusStaffManuf" id="StatusStaffManuf_userForm" type="text" value="${StaffManuf.StatusStaffManuf }" class="input" maxlength="250"/>
	  </li>
	   <li>
	   <span id="lititle">职称</span>
	  		<span class="select_wrap">
				<span class="edit_select">
					<select  name="selectWrap"  id="selectWrap" onChange="changeValue();" class="select" contenteditable="true">
						<c:forEach items="${CategoryTitlesStaffManuf}" var="var" varStatus="vs">
							<option value="${var.id_TitlesStaffManuf }" ${StaffManuf.TitlesStaffManuf == var.id_TitlesStaffManuf ? 'selected' : '' }>${var.name_TitlesStaffManuf }</option>	
						</c:forEach>
					</select>
				</span>
				<span class="input_select">
					<input type="text" name="TitlesStaffManuf" id="TitlesStaffManuf_userForm" value="">
				</span>
			</span>
		</li>
		<li>
	    <span id="lititle">备注</span>
	    <input name="RemarkStaffManuf" id="RemarkStaffManuf_userForm" type="text" value="${StaffManuf.RemarkStaffManuf }" class="input" maxlength="250"/>
	  </li>
	</form>
	</ul>
</div>
</body>
</html>
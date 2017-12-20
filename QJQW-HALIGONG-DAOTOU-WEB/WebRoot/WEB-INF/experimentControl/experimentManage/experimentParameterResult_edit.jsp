<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Long date = System.currentTimeMillis();
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
		<title>哈理工刀头</title>
	    <meta name="description" content="哈理工刀头,专业打造各种类型机械刀头,产品类型齐全,质量放心有保障,联合祈福科技公司打造专业的刀头网站。" />
	    <meta name="keywords" content="哈理工刀头,刀头,刀具,切断切槽,仿形切削,外圆切槽刀,内圆切槽刀,端面切槽。" />
	<link href="<%=path%>/resources/css/index/style_a.css?v=<%=date%>" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/resources/js/jquery-1.7.2.js"></script>
	<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
	<script src="<%=path%>/resources/js/laydate/laydate.js"></script>
	
	<script type="text/javascript">
	
	
	</script>
	
	
</head>
<body>
<div class="content_box_text">
  <ul class="box_text">
	 <li>
	    <span id="lititle">实验编号</span>
	    <input name="ExperimentNo" id="ExperimentNo_userForm" type="text" class="input" />
	  </li>
	  <li>
	  	<input type="button" class = "btn btn_sc" onclick="jzbh();" value = "加载试验编号" />
	  </li>	
  </ul>
</div>









	
</body>

</html>




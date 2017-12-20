<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Long date = System.currentTimeMillis();
%>
<!DOCTYPE html>
<HTML>
<HEAD>
	<TITLE> ZTREE DEMO - checkbox</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link href="<%=path%>/resources/css/index/style_a.css" rel="stylesheet" type="text/css" />
	
	
	
	<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.2.js"></script>	
	<script type="text/javascript" src="/resources/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
	<script type="text/javascript" src="/resources/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
	
	<!-- 引入 -->
	<script type="text/javascript" src="/resources/js/jquery.tips.js"></script><!--提示框-->
	<!-- tree  -->
	<link rel="stylesheet" href="/resources/JQueryzTreev3.1/css/zTreeStyle/zTreeStyle.css?v=<%=date%>" type="text/css">
	<script type="text/javascript" src="/resources/JQueryzTreev3.1/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="/resources/JQueryzTreev3.1/js/jquery.ztree.core.authority-3.1.js"></script>
	<script type="text/javascript" src="/resources/JQueryzTreev3.1/js/jquery.ztree.excheck-3.1.js"></script>
	
	<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
	<!--
	<script type="text/javascript" src="../../../js/jquery.ztree.exedit-3.1.js"></script>
	-->
	<SCRIPT type="text/javascript">
		<!--
		var setting = {
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		};
		var code;
		
		$(document).ready(function(){
			var json_tree = $("#json_tree").val();
			var zNodes = jQuery.parseJSON(json_tree);
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});
		
		
		
		
		//授权
		function onShouquan(){
			var ids = '';
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			var checkedNodes = zTree.getCheckedNodes(true);
			if(checkedNodes != null){
				for(var i=0;i<checkedNodes.length;i++){
					ids = ids + checkedNodes[i].id + ',';
				}
				$("#userForm_ids").val(ids);
			}
			
			$("#userForm").ajaxSubmit(function(result){
				if(result == 1){
					alert('操作成功！');
					window.location.href='<%=path%>/qjqwmain/systemuser/queryUserList';
				}else{
					alert('操作失败，请联系管理员！');
				}
			});
		}
		
		function back(){
			window.location.href='<%=path%>/qjqwmain/systemuser/queryUserList';
		}
		//-->
	</SCRIPT>
</HEAD>

<BODY class="user_sq_wrap">
<form action="/qjqwmain/systemuser/saveMenuListForUser" name="userForm" id="userForm" method="post">
  <input type="hidden" name="user_id" value="${user_id}"/>
  <input type="hidden" name="ids" id="userForm_ids" value=""/>
</form>
<div class="container-fluid" id="main-container">
  <div id="breadcrumbs">
	<!-- 检索  -->
	<input id="json_tree" type="hidden" value='${json_tree}' />
    <a class="btn btn-small btn-success" onclick="onShouquan();">授权</a>
    <a class="btn btn-small btn-success" onclick="back();">返回</a>
	<div>
	  <div class="zTreeDemoBackground left">
		<!-- 		<ul id="treeDemo" class="ztree"></ul> -->
		<table id="treeDemo" class="ztree">			
						
		</table>
	  </div>
	</div>
  </div>
</div>
</BODY>
</HTML>
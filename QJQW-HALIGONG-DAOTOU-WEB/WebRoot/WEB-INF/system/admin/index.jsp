<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="none"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- jsp文件头和头部 -->
<%@ include file="/WEB-INF/system/admin/top.jsp"%>

		<style type="text/css">
		.commitopacity{position:absolute; width:100%; height:1000px; background:#7f7f7f; filter:alpha(opacity=50); -moz-opacity:0.8; -khtml-opacity: 0.5; opacity: 0.5; top:0px; z-index:99999;}
		</style>
		<script type="text/javascript" src="<%=path%>/resources/js/jquery-1.7.2.js"></script>
		
<script type="text/javascript">
	//跳转目录
	function onturnMenu(url){
		var iframe = document.getElementById("mainFrame"); 
		$(iframe).attr("src",url);
	}
</script>
</head>
<body>

	<!-- 页面顶部¨ -->
	<%@ include file="/WEB-INF/system/admin/head.jsp"%>

	<div class="container-fluid" id="main-container">
		<a href="#" id="menu-toggler"><span></span></a>
		<!-- menu toggler -->

		<!-- 左侧菜单 -->
		<%@ include file="/WEB-INF/system/admin/left.jsp"%>

		<div id="main-content" class="clearfix">


 
			<div id="jzts" style="display:none; width:100%; position:fixed; z-index:99999999;">
			<div class="commitopacity" id="bkbgjz"></div>
			<div style="padding-left: 16%;padding-top: 2px;">
				<div style="float: left;margin-top: 7px;"><img src="<%=path%>/resources/images/loadingi.gif" /> </div>
				<div><h4 class="lighter block red">&nbsp;加载中  ...</h4></div>
			</div>
			</div>

			<div>
				<iframe name="mainFrame" id="mainFrame" frameborder="0" 
				src="<%=path%>/qjqwmain/systemuser/view" 
				style="margin:0 auto;width:100%;height:100%;"></iframe>
			</div>
			

			<!-- 换肤 -->
			<div id="ace-settings-container">
				<div class="btn btn-app btn-mini btn-warning" id="ace-settings-btn">
					<i class="icon-cog"></i>
				</div>
				<div id="ace-settings-box">
					<div>
						<div class="pull-left">
							<select id="skin-colorpicker" class="hidden">
								<option data-class="default" value="#438EB9"
									<c:if test="${user.skin =='default' }">selected</c:if>>#438EB9</option>
								<option data-class="skin-1" value="#222A2D"
									<c:if test="${user.skin =='skin-1' }">selected</c:if>>#222A2D</option>
								<option data-class="skin-2" value="#C6487E"
									<c:if test="${user.skin =='skin-2' }">selected</c:if>>#C6487E</option>
								<option data-class="skin-3" value="#D0D0D0"
									<c:if test="${user.skin =='skin-3' }">selected</c:if>>#D0D0D0</option>
							</select>
						</div>
						<span>&nbsp; 选择皮肤</span>
					</div>
					<div>
						<label><input type='checkbox' name='menusf' id="menusf"
							onclick="menusf();" /><span class="lbl" style="padding-top: 5px;">菜单缩放</span></label>
					</div>
				</div>
			</div>
			<!--/#ace-settings-container-->

		</div>
		<!-- #main-content -->
	</div>
	<!--/.fluid-container#main-container-->
	<!-- basic scripts -->
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='<%=path%>/resources/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="<%=path%>/resources/js/bootstrap.min.js"></script>
		<script src="<%=path%>/resources/js/ace-elements.min.js"></script>
		<script src="<%=path%>/resources/js/ace.min.js"></script>
		<!-- 引入 -->
		
		<script type="text/javascript" src="<%=path%>/resources/js/jquery.cookie.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/myjs/menusf.js"></script>
		
		<script type="text/javascript">
	/*	$(function() {
			if (typeof ($.cookie('menusf')) == "undefined") {
				$("#menusf").attr("checked", true);
				$("#sidebar").attr("class", "menu-min");
			} else {
				$("#sidebar").attr("class", "");
			}
		});
	*/
		function cmainFrame(){
			var hmain = document.getElementById("mainFrame");
			var bheight = document.documentElement.clientHeight;
			hmain .style.width = '100%';
			hmain .style.height = (bheight  - 51) + 'px';
	
			
		}
		cmainFrame();
		window.onresize=function(){  
			cmainFrame();
		}
		</script>
</body>
</html>

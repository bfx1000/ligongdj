<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="<%=path%>/resources/images/dt2.ico">
<title>汽车覆盖件数据库</title>
<meta name="description" content="哈理工刀头,专业打造各种类型机械刀头,产品类型齐全,质量放心有保障,联合祈福科技公司打造专业的刀头网站。" />
<meta name="keywords" content="哈理工刀头,刀头,刀具,切断切槽,仿形切削,外圆切槽刀,内圆切槽刀,端面切槽。" />
<link href="<%=path%>/resources/css/index/style_a.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.2.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.SuperSlide.2.1.1.source.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.collapser.js"></script>
<script type="text/javascript" src="/resources/js/jquery.tips.js"></script>
<script type="text/javascript" src="/resources/js/jquery.cookie.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	  $(".nav ul li").click(function(){
		$(".nav ul li").removeClass("active");
		$(this).addClass("active");
	  });
	});
	
	function onShowSecondMenu(menu_id, menu_name){
		$("#wap_login_iframe1").attr("src","<%=path%>/index/goContent?menu_id=" + menu_id + "&menu_name=" + menu_name);
		$("#wap_login_iframe1").attr("class", "iframe_content");
// 		$("#wap_login_iframe1").changeMenuTitle();
// 		var frm1 = document.getElementById('wap_login_iframe1');
// 		frm1.contentWindow.document.getElementById('menu_1').innerHTML = "aaa";
		
	}
	
	function add(url, msg){
	
		$("#span_title_msg").text(msg);
		$("#editor_content").css("display","block");
		$("#content_iframe").attr("src", url);

	}
	function addAjax(url, msg){
	
		$("#span_title_msg").text(msg);
		$("#editor_content").css("display","block");
		$("#content_iframe").attr("src", url);

	}
	
	function onClose(){
		$("#editor_content").css("display","none");
	}
	
	
	function reflush(url){
// 		alert(url);
		var frm1 = document.getElementById('wap_login_iframe1');
		frm1.contentWindow.document.getElementById('iframe').src = "<%=basePath%>" + url;
	}

	$(document).ready(function(){
	  $(".btn_dl").click(function(){
	    $("#box_login").css("display","block");
	  });
	  $(".btn_zc").click(function(){
	    $("#box_login").css("display","block");
	  });
	  $(".btn_qr").click(function(){
	    $("#box_login").css("display","none");
	  });
	  $(".btn_qx").click(function(){
	    $("#box_login").css("display","none");
	  });
	});

</script>

</head>
  
<body class="body_bg">  
<input type="hidden" value="<%=basePath%>"/>
<div class="wrap">
  <!--  头部   -->
  <%@ include file="/WEB-INF/system/common/top.jsp"%>
	<!--  内容体   -->
  <iframe name="wap_login_iframe1" id="wap_login_iframe1" frameborder="0" src="<%=path%>/index/goIndex" class="iframe_index_content"></iframe>
	
  </div>
  <div class="foot">高档数控机床与基础制造装备 科技重大专项 Copyright 2016 <a href="http://qifukeji.cn" alt="哈尔滨祈福科技有限公司" title="哈尔滨祈福科技有限公司">qifukeji.cn</a> All rights reserved 黑ICP备095413309号	</div>




<!--  弹出  -->
<div id="editor_content" style="display: none;">
  <div id="editor_box">
	<div class="editor_head_bg"><span id="span_title_msg">编辑</span><a href="#" class="btn_cancel" onclick="onClose();"></a></div>
	<div class="list_box  iframe_wrapper">
	  <iframe name="content_iframe" id="content_iframe" frameborder="0" src=""  class="add_wind_iframe" ></iframe>
	</div>
  </div>
  <div id="divbg">&nbsp;</div>
</div>

<script type=text/javascript>
	$(document).ready(function(){
		
		$('.demo7').collapser({
			target: 'siblings',
			effect: 'slide',
			expandHtml: 'Expand List',
			collapseHtml: 'Collapse List',
			expandClass: 'expArrow',
			collapseClass: 'collArrow'
		});
		
	});
	
	
	
	autodivheight();
	function autodivheight(){
	    var winHeight=0;
	    if (window.innerHeight)
	        winHeight = window.innerHeight;
	    else if ((document.body) && (document.body.clientHeight))
	        winHeight = document.body.clientHeight;
	    if (document.documentElement && document.documentElement.clientHeight)
	        winHeight = document.documentElement.clientHeight;
	    document.getElementById("divbg").style.height= winHeight-0 +"px";
	}
	window.onresize=autodivheight;
	
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path_default = request.getContextPath();
%>
<link href="<%=path_default%>/resources/css/index/style_a.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path_default%>/resources/js/jquery/jquery-1.8.2.js"></script>
<script type="text/javascript" src="<%=path_default%>/resources/js/jquery.SuperSlide.2.1.1.source.js"></script>
<script type="text/javascript" src="<%=path_default%>/resources/js/jquery.collapser.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	  $(".m1").click(function(){
		$(this).toggleClass("m2");
	  });
	  $(".nav ul li").click(function(){
		$(".nav ul li").removeClass("active");
		$(this).addClass("active");
	  });
	});
	function onChangeMenuTitle(menu_name, parent_menu_name, flag){
		if(flag == 2){//只有两层菜单
			$("#menu_2").html(menu_name);
			$("#menu_3").html(menu_name);
		}else{//三层菜单
			if(parent_menu_name != null && parent_menu_name != ''){
				$("#menu_2").html(parent_menu_name);
			}
			$("#menu_3").html(menu_name);
		}
		
	}
</script>

<!--  内容体   -->
<div class="content">
   	<div class="banner_box_dtcp" alt="哈理工刀头" title="哈理工刀头" style="background-image:url(../resources/images/banner_djcp${menu_id}.png);"></div>
  	
   
   
  <div class="dz_box">您的位置： 
    <a href="#" class="grey" id="menu_1">${(menu_name == null || menu_name == '') ? '首页' : menu_name }</a> / 
    <a href="#" id="menu_2" class="grey">刀具产品</a> / 
    <a href="#" id="menu_3" class="grey">刀具产品</a></div>
	<!--  内容   -->
	<div class="content_box">
	  <div class="tab">
		<div class="hd">
<!-- 		  <ul><li>焊接钻头</li><li>车削刀具</li><li>切断切槽</li><li>螺纹加工刀具</li><li>财产信息</li><li>铣削刀具</li><li>钻削刀具</li><li>镗削和铰削刀具</li><li>工具系统</li><li>纵切机床用刀具</li></ul> -->
		  <iframe name="wap_login_iframe" id="wap_login_iframe" frameborder="0" src="<%=path_default%>/index/querySecondMenuListById?parent_id=${menu_id}" style="width:100%;height:970px;"></iframe>
				</div>
				<div class="bd">
				  <iframe name="iframe" id="iframe" frameborder="0" src="<%=path_default%>${menu_url}" style="width:100%;height:970px;"></iframe>
					
				</div>
			</div>
			<script type="text/javascript">jQuery(".tab").slide({trigger:"click"});</script>
		
		</div>
		<div class="clear"></div>
	</div>


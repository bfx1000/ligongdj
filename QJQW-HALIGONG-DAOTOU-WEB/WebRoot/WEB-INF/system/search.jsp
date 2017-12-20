<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.2.js"></script>
	<script type="text/javascript" src="/resources/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
	<script type="text/javascript" src="/resources/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
	<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
	<script src="<%=path%>/resources/js/common/detail.js"  type="text/javascript"></script>
	<link href="<%=path%>/resources/css/index/style_a.css" rel="stylesheet" type="text/css" />
	<!-- <link href="<%=path%>/resources/css/bootstrap.min.css" rel="stylesheet" /> -->
	<!-- <link href="<%=path%>/resources/css/bootstrap-responsive.min.css" rel="stylesheet" /> -->
	<style>
		.search_box{ width: 411px; }
		.head_content { width: 722px;  margin-left: -351px;}
		.nav{ width:680px; }
		.content_box_table{ background-color:#fff;width:700px;border:1px solid #bbb;border-top:0px none;margin-top:-10px; }
		/* 分页   */
		.page-header{min-height:30px;vertical-align:top;padding-bottom:16px;padding-left:20px;}
	</style>
	<script type="text/javascript">
	    
		
		function onClose(){
			Dialog.getInstance('0').cancelButton.onclick.apply(Dialog.getInstance('0').cancelButton,[]);
		}
	
		$(function() {
			
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
			});
		});
		
	</script>
		
	<script type="text/javascript">
		
		
		//展开折叠详细
		function onShowDetial(id_TurningHolder){
			$("#ulli_" + id_TurningHolder).toggle();
		}
		
		
		//预览pdf文件
		function onShowPdf(url){
			window.open("<%=basePath%>goods" + url);
		}
	</script>
</head>
<body class="body_bg">
<div class="wrap">
	<!--  头部   -->
  	<div class="head_content">
		<div class="head_top">
		  	<!-- <span class="hy">汽轮机零件加工用刀具设计平台</span> -->
		  	<span class="hy">汽车覆盖件淬硬钢模具数据库设计平台</span>
		</div>	
		<div class="box_logo">
		  <div class="logo" alt="哈理工刀头" title="哈理工刀头"></div>
			<div class="search_box">
			  <div class="box_a"></div>
			</div>
	  	</div>
	  	<!--  导航   -->
	  <div class="nav">
		<ul>
		  <li class="active"><a href="index.html">首页</a></li>
		  <div class="clear"></div>
		</ul>
	  </div>
	</div>
</div>	
	
<div class="content_box_table">
  <form action="" method="post" name="Form" id="Form">
    <input type = "hidden" class = "input" value ="${pd.NumberTurningBlade }"/>
  </form>
  <!-- 复选框   -->
  <div class="search_wrap" style="width:700px;">
	<div class="check_wrap">	
	  <span class="label_wrap"><input type="checkbox" checked="checked" />刀片编号</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />刀片类型</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />ISO基准刀片</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />刀片涂层</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />刀具材料</span>
	  <span class="label_wrap"><input type="checkbox" />加工类别</span>
	  <span class="label_wrap"><input type="checkbox" />刀片加工特点</span>
	  <span class="label_wrap"><input type="checkbox" />刀片厂商</span>
	  <span class="label_wrap"><input type="checkbox" />加工材料</span>		
	</div>
	<div class="opera_img">
	  <img src="/resources/images/ico_n.png" data-name="0"  onclick="changeOpera(this);"  alt="展开" />
	</div>
	<div class="choose_show_btn"   onclick="selectData();" >应用</div>	
	<div class="clear"></div>
  </div>
  <div class="content_wrap" style="width:700px;">
  	<div class="each_list_wrap" style="background: white;">
			<span class="list_title skz_hide skz_list0">&nbsp;刀片编号</span> 
 			<span class="list_title skz_hide skz_list1">&nbsp;刀片类型</span> 
 			<span class="list_title skz_hide skz_list2">&nbsp;ISO基准刀片</span> 
 			<span class="list_title skz_hide skz_list3"  >&nbsp;刀片涂层</span> 
 			<span class="list_title skz_hide skz_list4"  >&nbsp;刀具材料</span> 
 			<span class="list_title skz_hide skz_list5" style="display: none;">&nbsp;加工类别</span> 
			<span class="list_title skz_hide skz_list6" style="display: none;">&nbsp;刀片加工特点</span> 
 			<span class="list_title skz_hide skz_list7" style="display: none;">&nbsp;刀片厂商</span> 
 			<span class="list_title skz_hide skz_list8" style="display: none;">&nbsp;加工材料</span> 
			<span class="list_title opera_wrap  skz_hide  skz_list9">&nbsp;&nbsp;&nbsp;操作</span>
	</div>
    <c:choose>
      <c:when test="${not empty turningBladeList}">
	    <c:forEach items="${turningBladeList}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_TurningBlade });"></div>
			<span class="skz_hide skz_list0">&nbsp;${var.NumberTurningBlade }</span> 
 			<span class="skz_hide skz_list1">&nbsp;<c:choose>
						    <c:when test="${var.TypeBTADrill == 1}">外圆切削</c:when>
						    <c:when test="${var.TypeBTADrill == 2}">内孔切削</c:when>
						    <c:when test="${var.TypeBTADrill == 3}">超硬刀具</c:when>
						    <c:when test="${var.TypeBTADrill == 4}">重型加工刀片</c:when>
						  </c:choose></span> 
 			<span class="skz_hide skz_list2">&nbsp;${var.ISOBladeTurning }</span> 
 			<span class="skz_hide skz_list3"  >&nbsp;${var.ToolCoatBladeTurning }</span> 
 			<span class="skz_hide skz_list4"  >&nbsp;${var.ToolMaterialBladeTurning }</span> 
 			<span class="skz_hide skz_list5" style="display: none;">&nbsp;<c:choose>
						    <c:when test="${var.MachiningTypeBladeTurning == 1}">精加工</c:when>
						    <c:when test="${var.MachiningTypeBladeTurning == 2}">粗加工</c:when>
						    <c:when test="${var.MachiningTypeBladeTurning == 3}">半精加工</c:when>
						  </c:choose></span> 
			<span class="skz_hide skz_list6" style="display: none;">&nbsp;${var.ToolBladeFeatureTurning }</span> 
 			<span class="skz_hide skz_list7" style="display: none;">&nbsp;${var.CompanyTurningBlade }</span> 
 			<span class="skz_hide skz_list8" style="display: none;">&nbsp;${var.MateriaBladeTurning }</span> 
			<span class="opera_wrap  skz_hide  skz_list9">
			  &nbsp;&nbsp; <span class="btn btn_xg" onclick="onShowDetial('${var.id_TurningBlade}');">查看详细</span>
			</span>					
			<div class="clear"></div>
			<!-- 展开详情   -->
			<div id="ulli_${var.id_TurningBlade}" class="ulli" style="display: none;">
			  <div class="box_xiangxi">
				<!--<img src="images/dtcp_img1.png" class="img1" alt="哈理工刀头" title="哈理工刀头"/> -->
				<div class="box_u1">
				  <ul class="ul1">
					<li><span>刀片编号</span><i>${var.NumberTurningBlade }</i></li>
					<li><span>刀片名称</span><i>${var.NameTurningBlade }</i></li>
					<li><span>刀片涂层</span><i>${var.ToolCoatBladeTurning }</i></li>
					<li><span>加工类别</span><div>
						<c:choose>
						    <c:when test="${var.MachiningTypeBladeTurning == 1}">精加工</c:when>
						    <c:when test="${var.MachiningTypeBladeTurning == 2}">粗加工</c:when>
						    <c:when test="${var.MachiningTypeBladeTurning == 3}">半精加工</c:when>
						  </c:choose></div>
					</li>
					<li><span>刀片厂商</span><i>${var.CompanyTurningBlade } </i></li>
					<li><span>刀柄</span><i>${var.HolderInfo } </i></li>
				  </ul>
				  <ul class="ul1">
					<li><span>刀片类型</span><i>
						<c:choose>
						    <c:when test="${var.TypeBTADrill == 1}">外圆切削</c:when>
						    <c:when test="${var.TypeBTADrill == 2}">内孔切削</c:when>
						    <c:when test="${var.TypeBTADrill == 3}">超硬刀具</c:when>
						    <c:when test="${var.TypeBTADrill == 4}">重型加工刀片</c:when>
						  </c:choose>
						</i>
					</li>
					<li><span>ISO基准刀片</span><i>${var.ISOBladeTurning } </i></li>
					<li><span>刀具材料</span><div>${var.ToolMaterialBladeTurning } </div></li>
					<li><span>刀片加工特点</span><i>${var.ToolBladeFeatureTurning } </i></li>
					<li><span>断屑槽类型</span><i>${var.BreakerBladeTurning } </i></li>
					<li></li>			
				  </ul>
				  <div class="clear"></div>
				  <div class="block">刀片角度信息：</div>
				  <ul class="ul1">
				  	<li><span>后角</span><i>${var.HoujiaoBladeTurning } </i></li>
					<li><span>刀尖圆弧半径</span><i>${var.NoseRadiusTurning } </i></li>
				  </ul>
				  <ul class="ul1">
				  	<li><span>前角</span><i>${var.QianjiaoBladeTurning } </i></li>
					<li><span>刃倾角</span><i>${var.HoujisojiaoBladeTurning } </i></li>
				  </ul>
  				  <div class="clear"></div>
				</div>
			  </div>
			  <c:if test="${fn:contains(var.isPMKNS, 'P')}">
			    <div class="box_p">
			  	  <h4>加工P参数</h4>
			  	  <p>${var.ISOPTextBladeTurning }</p>
			    </div>
			  </c:if>
			  <c:if test="${fn:contains(var.isPMKNS, 'M')}">
			    <div class="box_p">
			  	  <h4>加工M参数</h4>
			  	  <p>${var.ISOMTextBladeTurning }</p>
			    </div>
			  </c:if>
			  <c:if test="${fn:contains(var.isPMKNS, 'K')}">
			    <div class="box_p">
			  	  <h4>加工K参数</h4>
			  	  <p>${var.ISOKTextBladeTurning }</p>
			    </div>
			  </c:if>
			  <c:if test="${fn:contains(var.isPMKNS, 'N')}">
			    <div class="box_p">
			  	  <h4>加工N参数</h4>
			  	  <p>${var.ISONTextBladeTurning }</p>
			    </div>
			  </c:if>
			  <c:if test="${fn:contains(var.isPMKNS, 'S')}">
			    <div class="box_p">
			  	  <h4>加工S参数</h4>
			  	  <p>${var.ISOSTextBladeTurning }</p>
			    </div>
			  </c:if>
			  <div class ="clear"></div>
			</div>
		  </div>
		</c:forEach>
	  </c:when>
	  <c:otherwise>没有相关数据</c:otherwise>
	</c:choose>
	
	<div class="page-header position-relative">
		<div class="pagination">
		  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="index/search"/>
		</div>
	</div>
	
  </div> 
</div>
</body>
</html>


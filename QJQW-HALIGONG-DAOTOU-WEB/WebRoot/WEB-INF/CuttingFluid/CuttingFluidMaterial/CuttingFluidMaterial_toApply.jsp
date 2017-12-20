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

<script type="text/javascript">
    
	//检索
	function onSearchKey(){
		var url = "<%=path%>/CuttingFluidMaterial/toCuttingFluidApply";
		document.Form.action = url;
		$("#Form").submit();
	}
	
	//展开折叠详细
	function onShowDetial(id_MachineInform){
		$("#ulli_" + id_MachineInform).toggle();
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
		

</head>
<body>	
<div class="content_box_table">
  <form action="/CuttingFluidMaterial/toCuttingFluidApply" method="post" name="Form" id="Form">
    <div class="search_wrap">
	  <div class="search_input_wrap">
		<span>工件材料<input name="WorkpieceMaterial" tpye="text" value="${pd.WorkpieceMaterial }" id="WorkpieceMaterial_userForm"/></span>
		<span>加工方式<input name="MachiningMethod" tpye="text" value="${pd.MachiningMethod }" id="MachiningMethod_userForm"/></span>
		<span>加工精度<input name="MachiningPrecision" tpye="text" value="${pd.MachiningPrecision }" id="MachiningPrecision_userForm"/></span>
		<div class="clear"></div>
	  </div>
	  <div class="opera_img">
		<img src="/resources/images/ico_n.png" data-name="0"  onclick="changeOpera(this);"  alt="展开" />
	  </div>		  
	  <a class="sousuo_btn_min" onclick="onSearchKey();">搜索</a>			  
	  <div class="clear"></div>
	</div>
  </form>
  
  <div class="content_wrap">
    <c:choose>
      <c:when test="${not empty CuttingFluidApply}">
	    <c:forEach items="${CuttingFluidApply}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_UsingCuttingFluid });"></div>
			<span class="list_title skz_hide skz_list0">切削液名称：<br>${var.NameCuttingFluid }</span> 
 			<span class="skz_hide skz_list1">切削液编号：<br>${var.NumberCuttingFluid }</span> 
 			<span class="skz_hide skz_list2">工件材料：<br>${var.WorkpieceMaterial }</span>
 			<span class="skz_hide skz_list3">加工方式：<br>${var.MachiningMethod }</span>
 			<span class="skz_hide skz_list4">加工精度：<br>${var.MachiningPrecision }</span>
			<div class="clear"></div>
			<!-- 展开详情   -->
			<div id="ulli_${var.id_UsingCuttingFluid }" class="ulli" style="display: none;">
			  <div class="box_xiangxi">
				<div class="box_u1">
				  <ul class="ul1">
					<li><span>切削液名称</span><i>${var.NameCuttingFluid }</i></li>
					<li><span>切削液编号</span><i>${var.NumberCuttingFluid }</i></li>
					<li><span>工件材料</span><i>${var.WorkpieceMaterial }</i></li>
				  </ul>
				  <ul class="ul1">
				  	<li><span>加工方式</span><i>${var.MachiningMethod }</i></li>
				  	<li><span>加工精度</span><i>${var.MachiningPrecision }</i></li>
				  </ul>
				  <div class="clear"></div>
				</div>
			  </div>
			  <div class="box_p">
				  <h4>———————————————————————————————————————————————————————</h4>
				</div>
			</div>
		  </div>
		</c:forEach>
	  </c:when>
	  <c:otherwise>没有相关数据</c:otherwise>
	</c:choose>
  </div>
  <div class="page-header position-relative" style="vertical-align:top;padding-top:10px;padding-left:20px;">
	<div class="pagination">
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="CuttingFluidMaterial/toCuttingFluidApply"/>
	</div>
  </div>
</div> 
</body>
</html>


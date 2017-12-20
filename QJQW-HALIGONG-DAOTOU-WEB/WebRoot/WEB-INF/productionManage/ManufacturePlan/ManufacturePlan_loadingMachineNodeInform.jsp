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
		var url = "<%=path%>/ManufacturePlan/loading?deputy=6";
		document.Form.action = url;
		$("#Form").submit();
	}
	
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
<body>	
<div class="content_box_table">
  <form action="ManufacturePlan/loading?deputy=6" method="post" name="Form" id="Form">
    <div class="search_wrap">
	  <div class="search_input_wrap">
		<span>机床编号<input name="NumberMachineNode" tpye="text" value="${pd.NumberMachineNode }" /></span>
		<span>机床型号<input name="NumberMachine" tpye="text" value="${pd.NumberMachine }" /></span>
		<span>机床类别
		  <select name="TypeMachineNode" class="select" style="width : 100px;">
			<option value="">请选择</option>
				<c:forEach items="${categoryMachineNodeInform}" var="var" varStatus="vs">
						<option value="${var.id_CategoryMachineNodeInform }" ${pd.TypeMachineNode == var.id_CategoryMachineNodeInform ? 'selected' : '' }>${var.name_CategoryMachineNodeInform }</option>	
				</c:forEach>
		  </select>
		</span>
		<span>机床所在单位<input name="DepartmentMachineNode" tpye="text" value="${pd.DepartmentMachineNode }" /></span>
		<span>机床车间<input name="WorkshopMachineNode" tpye="text" value="${pd.WorkshopMachineNode }" /></span>
		<div class="clear"></div>
	  </div>
	  <div class="opera_img">
		<img src="/resources/images/ico_n.png" data-name="0"  onclick="changeOpera(this);"  alt="展开" />
	  </div>		  
	  <a class="sousuo_btn_min" onclick="onSearchKey();">搜索</a>			  
	  <div class="clear"></div>
	</div>
  </form>
  <!-- 复选框   -->
  <div class="search_wrap">
	<div class="check_wrap">			
	  <span class="label_wrap"><input type="checkbox" checked="checked" />机床编号</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />机床型号</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />机床类别</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />机床所在单位</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />机床车间</span>
	</div>
	<div class="opera_img">
	  <img src="/resources/images/ico_n.png" data-name="0"  onclick="changeOpera(this);"  alt="展开" />
	</div>
	<div class="choose_show_btn"   onclick="selectData();" >应用</div>	
	<div class="clear"></div>
  </div>
  <!-- 新增按钮   -->
  <div class="addbtn_wrap">
	<a class="btn" onclick="add();">新增</a>
  </div>
  <div class="content_wrap">
  	<div class="each_list_wrap" style="background: white;">
			<span class="list_title skz_hide skz_list0">&nbsp;机床编号</span> 
 			<span class="list_title skz_hide skz_list1">&nbsp;机床型号</span> 
 			<span class="list_title skz_hide skz_list2">&nbsp;机床类别</span> 
 			<span class="list_title skz_hide skz_list3"  >&nbsp;机床所在单位</span> 
 			<span class="list_title skz_hide skz_list4"  >&nbsp;机床车间</span> 
			<span class="list_title opera_wrap  skz_hide  skz_list6">&nbsp;&nbsp;&nbsp;操作</span>	
		</div>
    <c:choose>
      <c:when test="${not empty machineNodeInformList}">
	    <c:forEach items="${machineNodeInformList}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_MachineNodeInform });"></div>
			<span class="skz_hide skz_list0">&nbsp;${var.NumberMachineNode }</span> 
 			<span class="skz_hide skz_list1">&nbsp;${var.NumberMachine }</span> 
 			<span class="skz_hide skz_list2">&nbsp;
 				 <c:forEach items="${categoryMachineNodeInform}" var="var1" varStatus="vs">
	 				<c:if test="${var1.id_CategoryMachineNodeInform == var.TypeMachineNode}">${var1.name_CategoryMachineNodeInform }</c:if>
				 </c:forEach>
 			</span> 
 			<span class="skz_hide skz_list3"  >&nbsp;${var.DepartmentMachineNode }</span> 
 			<span class="skz_hide skz_list4"  >&nbsp;${var.WorkshopMachineNode }</span> 
			<span class="opera_wrap  skz_hide  skz_list6">
			  <span class="btn btn_xg" onclick="window.parent.opt(6,'${var.NumberMachineNode}','${var.NumberMachine}');">选择</span>
			</span>					
			<div class="clear"></div>
			<!-- 展开详情   -->
			<div id="ulli_${var.id_MachineNodeInform}" class="ulli" style="display: none;">
			  <div class="box_xiangxi">
				<!--<img src="images/dtcp_img1.png" class="img1" alt="哈理工刀头" title="哈理工刀头"/> -->
				<div class="box_u1">
				  <ul class="ul1">
					<li><span>机床编号</span><i>${var.NumberMachineNode }</i></li>
					<li><span>机床型号</span><i>${var.NumberMachine }</i></li>
					<li><span>机床类别</span>
						<i>
							<c:forEach items="${categoryMachineNodeInform}" var="var1" varStatus="vs">
	 							<c:if test="${var1.id_CategoryMachineNodeInform == var.TypeMachineNode}">${var1.name_CategoryMachineNodeInform }</c:if>
				 			</c:forEach>
 						</i>
 					</li>
					<li><span>机床所在单位</span><div>${var.DepartmentMachineNode } </div></li>
					<li><span>机床车间</span><i>${var.WorkshopMachineNode }</i></li>
				  </ul>
				  <ul class="ul1">
					<li><span>机床位置</span><i>${var.PositionMachineNode }</i></li>
					<li><span>机床使用强度</span><i>${var.UseFrequencyMachineNode } 工时/周</i></li>
					<li><span>机床投入使用时间</span><div>${var.TimeUseMachineNode }</div></li>
					<li><span>机床报废时间</span><i>${var.TimeDestroyMachineNode }</i></li>
					<li></li>			
				  </ul>
				  <div class="clear"></div>
				</div>
			  </div>
			  <div class="clear"></div>
			</div>
		  </div>
		</c:forEach>
	  </c:when>
	  <c:otherwise>没有相关数据</c:otherwise>
	</c:choose>
  </div>
  <div class="page-header position-relative" style="vertical-align:top;padding-top:10px;padding-left:20px;">
	<div class="pagination">
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="ManufacturePlan/loading?deputy=6"/>
	</div>
  </div>
</div>

</body>
</html>


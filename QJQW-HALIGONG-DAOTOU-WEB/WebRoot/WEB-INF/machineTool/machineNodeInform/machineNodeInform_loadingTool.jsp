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
		var url = "<%=path%>/machineNodeInform/loadingTool";
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
	
	//修改
	function loading(id){
		$("#MachineId").val(id);
		var url = "<%=path%>/machineNodeInform/goLoading";
		document.Form.action = url;
		$("#Form").submit();
	}
</script>
		

</head>
<body>	
<div class="content_box_table">
  <form action="/machineNodeInform/loadingTool" method="post" name="Form" id="Form">
  	  <input name="id_MachineNodeInform" type="hidden" value="${MachineNodeInform.id_MachineNodeInform}"/>
      <input type="hidden" id="NumberMachineNode_loadingTool" value="${MachineNodeInform.NumberMachineNode}" class="input" name="NumberMachineNode"/>
      <input type="hidden" id="NumberMachine_loadingTool" value="${MachineNodeInform.NumberMachine}" class="input" name="NumberMachine"/>
      <input type="hidden" id="TypeMachineNode_loadingTool" value="${MachineNodeInform.TypeMachineNode}" class="input" name="TypeMachineNode"/>
      <input type="hidden" id="DepartmentMachineNode_loadingTool" value="${MachineNodeInform.DepartmentMachineNode}" class="input" name="DepartmentMachineNode"/>
      <input type="hidden" id="WorkshopMachineNode_loadingTool" value="${MachineNodeInform.WorkshopMachineNode}" class="input" name="WorkshopMachineNode"/>
      <input type="hidden" id="PositionMachineNode_loadingTool" value="${MachineNodeInform.PositionMachineNode}" class="input" name="PositionMachineNode"/>
      <input type="hidden" id="UseFrequencyMachineNode_loadingTool" value="${MachineNodeInform.UseFrequencyMachineNode}" class="input" name="UseFrequencyMachineNode"/>
      <input type="hidden" id="TimeUseMachineNode_loadingTool" value="${MachineNodeInform.TimeUseMachineNode}" class="input" name="TimeUseMachineNode"/>
      <input type="hidden" id="TimeDestroyMachineNode_loadingTool" value="${MachineNodeInform.TimeDestroyMachineNode}" class="input" name="TimeDestroyMachineNode"/>
     
      <input type="hidden" id="array_InformDetailMachineNodeInform" value="${array_InformDetailMachineNodeInform}" class="input" name="array_InformDetailMachineNodeInform"/>
      <input type="hidden" id="array_InformDetailMachineNodeInform_name" value="${array_InformDetailMachineNodeInform_name}" class="input" name="array_InformDetailMachineNodeInform_name"/>
      <input type="hidden" value='${DwArray }' id='DwArray' name = 'DwArray'/>
	  <input type="hidden" value='${CjArray }' id='CjArray' name = 'CjArray'/>
      
      <input type = "hidden" id = "MachineId" value = "" name = "id"/>
    <div class="search_wrap">
	  <div class="search_input_wrap">
		<span>机床名称<input name="NameMachine" tpye="text" value="${pd.NameMachine }" /></span>
		<span>机床型号<input name="NumberMachine" tpye="text" value="${pd.NumberMachine }" /></span>
		<span>机床类别
		  <select name="TypeMachine" class="select" style="width : 100px;">
			<option value="">请选择</option>
			<c:forEach items="${categoryMachineInform}" var="var" varStatus="vs">
				<option value="${var.id_CategoryMachineInform }" ${pd.TypeMachine == var.id_CategoryMachineInform ? 'selected' : '' }>${var.name_CategoryMachineInform }</option>	
			</c:forEach>
		  </select>
		</span>
		<span>数控系统<input name="ControlSystemMachine" tpye="text" value="${pd.ControlSystemMachine }" /></span>
		<span>主轴最大转速<input name="SpindleSpeedMachine" tpye="text" value="${pd.SpindleSpeedMachine }" /></span>
		<span>生产厂家<input name="CompanyMachine" tpye="text" value="${pd.CompanyMachine }" /></span>
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
      <c:when test="${not empty machineInformList}">
	    <c:forEach items="${machineInformList}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_MachineInform });"></div>
			<span class="list_title skz_hide skz_list0">机床名称：${var.NameMachine }</span> 
 			<span class="skz_hide skz_list1">机床型号：${var.NumberMachine }</span> 
 			<span class="skz_hide skz_list2">机床类别：
 				<c:forEach items="${categoryMachineInform}" var="var1" varStatus="vs">
	 				<c:if test="${var1.id_CategoryMachineInform == var.TypeMachine}">${var1.name_CategoryMachineInform }</c:if>
				</c:forEach>
 			</span> 
			<span class="opera_wrap  skz_hide  skz_list6">
			  	<span class="btn btn_xg" onclick="loading('${var.id_MachineInform}');">选择</span>
			</span>					
			<div class="clear"></div>
			<!-- 展开详情   -->
			<div id="ulli_${var.id_MachineInform}" class="ulli" style="display: none;">
			  <div class="box_xiangxi">
				<div class="box_u1">
				  <ul class="ul1">
					<li><span>机床名称</span><i>${var.NameMachine }</i></li>
					<li><span>机床型号</span><i>${var.NumberMachine }</i></li>
					<li><span>机床类别</span>
						<i>
							<c:forEach items="${categoryMachineInform}" var="var1" varStatus="vs">
	 							<c:if test="${var1.id_CategoryMachineInform == var.TypeMachine}">${var1.name_CategoryMachineInform }</c:if>
							</c:forEach>
 						</i>
 					</li>
				  </ul>
				  <ul class="ul1">
				  	<li><span>数控系统</span><div>${var.ControlSystemMachine } </div></li>
					<li><span>主轴最大转速  (单位：r/min) </span><i>${var.SpindleSpeedMachine }</i></li>
					<li><span>生产厂家</span><i>${var.CompanyMachine }</i></li>
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
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="machineNodeInform/loadingTool"/>
	</div>
  </div>
</div> 
</body>
</html>


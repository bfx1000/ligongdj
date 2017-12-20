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
		var url = "<%=path%>/InquireMachineGroup/InquireMachineGroupList";
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
	
	//新增
	function add(){
		window.location.href='<%=path%>/InquireMachineGroup/goAddInquireMachineGroup?id=';
	}
	
	//修改
	function edit(id){
		window.location.href='<%=path%>/InquireMachineGroup/goAddInquireMachineGroup?id=' + id;
	}
	
	//展开折叠详细
	function onShowDetial(id_StaffManuf){
		$("#ulli_" + id_StaffManuf).toggle();
	}
	
	//删除
	function del(id_InquireMachineGroup){
		if(confirm("确定要删除吗?")){
			var url = "<%=path%>/InquireMachineGroup/deleteInquireMachineGroupList?id_InquireMachineGroup=" + id_InquireMachineGroup;
			document.Form.action = url;
			$("#Form").ajaxSubmit(function(result){
				if(result) {
					jump(${page.pageNo});
				}else{
					alert('操作失败，请联系管理员！');
				}
			});
		}
	}
	
	//预览pdf文件
	function onShowPdf(url){
		window.open("<%=basePath%>goods" + url);
	}
</script>
</head>
<body>	
<div class="content_box_table">
  <form action="InquireMachineGroup/InquireMachineGroupList" method="post" name="Form" id="Form">
    <div class="search_wrap">
	  <div class="search_input_wrap">
		<span>机床编号<input name="NumberMachGrNode" tpye="text" value="${pd.NumberMachGrNode }" /></span>
		<span>机床型号<input name="ModelMachGrNode" tpye="text" value="${pd.ModelMachGrNode }" /></span>
		<span>机床类别<input name="TypeMachGrNode" tpye="text" value="${pd.TypeMachGrNode }" /></span>
		<span>机床所在单位<input name="DepartmentMachGrNode" tpye="text" value="${pd.DepartmentMachGrNode }" /></span>
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
				<span class="list_title opera_wrap  skz_hide  skz_list4">&nbsp;&nbsp;&nbsp;操作</span>	
		</div>
    <c:choose>
      <c:when test="${not empty InquireMachineGroup}">
	    <c:forEach items="${InquireMachineGroup}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_InquireMachineGroup });"></div>
			<span class="  skz_hide skz_list0">&nbsp;${var.NumberMachGrNode }</span> 
 			<span class="skz_hide skz_list1">&nbsp;${var.ModelMachGrNode }</span> 
 			<span class="skz_hide skz_list2">&nbsp;${var.TypeMachGrNode }</span> 
 			<span class="skz_hide skz_list3"  >&nbsp;${var.DepartmentMachGrNode }</span> 
			<span class="opera_wrap  skz_hide  skz_list4">
			  <span class="btn btn_xg" onclick="edit('${var.id_InquireMachineGroup}');">修改</span>
			  <span class="btn btn_sc" onclick="del('${var.id_InquireMachineGroup}');">删除</span>
			</span>					
			<div class="clear"></div>
			<!-- 展开详情   -->
			<div id="ulli_${var.id_InquireMachineGroup}" class="ulli" style="display: none;">
			  <div class="box_xiangxi">
				<!--<img src="images/dtcp_img1.png" class="img1" alt="哈理工刀头" title="哈理工刀头"/> -->
				<div class="box_u1">
				  <ul class="ul1">
					<li><span>机床编号</span><i>${var.NumberMachGrNode }</i></li>
					<li><span>机床型号</span><i>${var.ModelMachGrNode }</i></li>
					<li><span>机床类别</span><div>${var.TypeMachGrNode }</div></li>
					<li><span>机床所在单位</span><i>${var.DepartmentMachGrNode } </i></li>
					
					<li><span>目前加工零件名</span><i>${var.PartNameMachGr } </i></li>
					<li><span>设定设备状态</span><i>
						<c:choose>
							<c:when test="${var.SetMachGrStatus == 1}">未设定</c:when>
						    <c:when test="${var.SetMachGrStatus == 2}">使用</c:when>
						    <c:when test="${var.SetMachGrStatus == 3}">未使用</c:when>
						    <c:when test="${var.SetMachGrStatus == 4}">检修</c:when>
						</c:choose>
					</i></li>
				  </ul>
				  <ul class="ul1">
					<li><span>机床车间</span><i>${var.WorkshopMachGrNode } </i></li>
					<li><span>机床位置</span><i>${var.PositionMachGrNode } </i></li>
					<li><span>设备组名称</span><i>${var.NameMachineGroup } </i></li>
					<li><span>目前加工零件</span><i>${var.PartNoMachGr } </i></li>
					
					<li><span>查询设备状态</span><i>
						<c:choose>
							<c:when test="${var.InquireMachGrStatus == 1}">未设定</c:when>
						    <c:when test="${var.InquireMachGrStatus == 2}">使用</c:when>
						    <c:when test="${var.InquireMachGrStatus == 3}">未使用</c:when>
						    
						</c:choose>
					</i></li>
					<li><span>显示设备状态</span><i>
						<c:choose>
							<c:when test="${var.displayMachGrStatus == 1}">待选择</c:when>
						    <c:when test="${var.displayMachGrStatus == 2}">使用</c:when>
						    <c:when test="${var.displayMachGrStatus == 3}">未使用</c:when>
						    <c:when test="${var.displayMachGrStatus == 4}">检修</c:when>
						</c:choose>
					</i></li>
				  </ul>
				  <div class="clear"></div>
				</div>
				 <div class="clear"></div>
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
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="InquireMachineGroup/InquireMachineGroupList"/>
	</div>
  </div>
</div>

</body>
</html>


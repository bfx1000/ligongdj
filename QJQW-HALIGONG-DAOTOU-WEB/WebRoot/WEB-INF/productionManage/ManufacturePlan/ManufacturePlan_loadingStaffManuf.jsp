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
		var url = "<%=path%>/ManufacturePlan/loading?deputy=4";
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
	function onShowDetial(id_StaffManuf){
		$("#ulli_" + id_StaffManuf).toggle();
	}
	
	//预览pdf文件
	function onShowPdf(url){
		window.open("<%=basePath%>goods" + url);
	}
</script>
</head>
<body>	
<div class="content_box_table">
  <form action="/ManufacturePlan/loading?deputy=4" method="post" name="Form" id="Form">
    <div class="search_wrap">
	  <div class="search_input_wrap">
		<span>员工姓名<input name="NameStaffManuf" tpye="text" value="${pd.NameStaffManuf }" /></span>
		<span>员工部门<input name="DepartStaffManuf" tpye="text" value="${pd.DepartStaffManuf }" /></span>
		<span>员工编号<input name="NoStaffManuf" tpye="text" value="${pd.NoStaffManuf }" /></span>
		<span>职务<input name="JobStaffManuf" tpye="text" value="${pd.JobStaffManuf }" /></span>
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
	  <span class="label_wrap"><input type="checkbox" checked="checked" />员工姓名</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />员工部门</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />员工编号</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />职务</span>
	</div>
	<div class="opera_img">
	  <img src="/resources/images/ico_n.png" data-name="0"  onclick="changeOpera(this);"  alt="展开" />
	</div>
	<div class="choose_show_btn"   onclick="selectData();" >应用</div>	
	<div class="clear"></div>
  </div>
  <div class="content_wrap">
	  <div class="each_list_wrap" style="background: white;">
				<span class="list_title skz_hide skz_list0">&nbsp;员工姓名</span> 
	 			<span class="list_title skz_hide skz_list1">&nbsp;员工部门</span> 
	 			<span class="list_title skz_hide skz_list2">&nbsp;员工编号</span> 
	 			<span class="list_title skz_hide skz_list3"  >&nbsp;职务</span> 
				<span class="list_title opera_wrap  skz_hide  skz_list4">&nbsp;&nbsp;&nbsp;操作</span>	
		</div>
    <c:choose>
      <c:when test="${not empty StaffManuf}">
	    <c:forEach items="${StaffManuf}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_StaffManuf });"></div>
			<span class="  skz_hide skz_list0">&nbsp;${var.NameStaffManuf }</span> 
 			<span class="skz_hide skz_list1">&nbsp;${var.DepartStaffManuf }</span> 
 			<span class="skz_hide skz_list2">&nbsp;${var.NoStaffManuf }</span> 
 			<span class="skz_hide skz_list3"  >&nbsp;${var.JobStaffManuf }</span> 
			<span class="opera_wrap  skz_hide  skz_list4">
			  <span class="btn btn_xg" onclick="window.parent.opt(4,'${var.NameStaffManuf}');">选择</span>
			</span>					
			<div class="clear"></div>
			<!-- 展开详情   -->
			<div id="ulli_${var.id_StaffManuf}" class="ulli" style="display: none;">
			  <div class="box_xiangxi">
				<!--<img src="images/dtcp_img1.png" class="img1" alt="哈理工刀头" title="哈理工刀头"/> -->
				<div class="box_u1">
				  <ul class="ul1">
					<li><span>员工姓名</span><i>${var.NameStaffManuf }</i></li>
					<li><span>员工部门</span><i>${var.DepartStaffManuf }</i></li>
					<li><span>员工编号</span><div>${var.NoStaffManuf } </div></li>
					<li><span>状态</span><i>${var.StatusStaffManuf } </i></li>
				  </ul>
				  <ul class="ul1">
					<li><span>出生日期</span><i>${var.BirthStaffManuf } </i></li>
					<li><span>职务</span><i>${var.JobStaffManuf } </i></li>
					<li><span>职称</span><i>
						<c:forEach items="${CategoryTitlesStaffManuf}" var="var1" varStatus="vs">
	 						<c:if test="${var1.id_TitlesStaffManuf == var.TitlesStaffManuf}">${var1.name_TitlesStaffManuf }</c:if>
						</c:forEach></i>
					</li>
					<li><span>备注</span><i>${var.RemarkStaffManuf } </i></li>
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
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="ManufacturePlan/loading?deputy=4"/>
	</div>
  </div>
</div>

</body>
</html>


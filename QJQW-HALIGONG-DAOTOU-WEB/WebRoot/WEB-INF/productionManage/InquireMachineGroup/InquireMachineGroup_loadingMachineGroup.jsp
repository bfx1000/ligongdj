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
		var url = "<%=path%>/InquireMachineGroup/loading?deputy=2";
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
  <form action="InquireMachineGroup/loading?deputy=2" method="post" name="Form" id="Form">
    <div class="search_wrap">
	  <div class="search_input_wrap">
		<span>上级设备组<input name="SuperiorMachineGroup" tpye="text" value="${pd.SuperiorMachineGroup }" /></span>
		<span>设备组名称<input name="NameMachineGroup" tpye="text" value="${pd.NameMachineGroup }" /></span>
		<span>设备组编号<input name="NoMachineGroup" tpye="text" value="${pd.NoMachineGroup }" /></span>
		<span>地址<input name="AddressMachineGroup" tpye="text" value="${pd.AddressMachineGroup }" /></span>
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
	  <span class="label_wrap"><input type="checkbox" checked="checked" />上级设备组</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />设备组名称</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />设备组编号</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />地址</span>
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
				<span class="list_title skz_hide skz_list0">&nbsp;上级设备组</span> 
	 			<span class="list_title skz_hide skz_list1">&nbsp;设备组名称</span> 
	 			<span class="list_title skz_hide skz_list2">&nbsp;设备组编号</span> 
	 			<span class="list_title skz_hide skz_list3"  >&nbsp;地址</span> 
				<span class="list_title opera_wrap  skz_hide  skz_list4">&nbsp;&nbsp;&nbsp;操作</span>	
		</div>
    <c:choose>
      <c:when test="${not empty MachineGroup}">
	    <c:forEach items="${MachineGroup}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_MachineGroup });"></div>
			<span class="  skz_hide skz_list0">&nbsp;${var.SuperiorMachineGroup }</span> 
 			<span class="skz_hide skz_list1">&nbsp;${var.NameMachineGroup }</span> 
 			<span class="skz_hide skz_list2">&nbsp;${var.NoMachineGroup }</span> 
 			<span class="skz_hide skz_list3"  >&nbsp;${var.AddressMachineGroup }</span> 
			<span class="opera_wrap  skz_hide  skz_list4">
			  &nbsp;&nbsp; <span class="btn btn_xg" onclick="window.parent.opt(2,'${var.NameMachineGroup}');">选择</span>
			</span>					
			<div class="clear"></div>
			<!-- 展开详情   -->
			<div id="ulli_${var.id_MachineGroup}" class="ulli" style="display: none;">
			  <div class="box_xiangxi">
				<!--<img src="images/dtcp_img1.png" class="img1" alt="哈理工刀头" title="哈理工刀头"/> -->
				<div class="box_u1">
				  <ul class="ul1">
					<li><span>上级设备组</span><i>${var.SuperiorMachineGroup }</i></li>
					<li><span>设备组名称</span><i>${var.NameMachineGroup }</i></li>
					<li><span>设备组编号</span><div>${var.NoMachineGroup } </div></li>
				  </ul>
				  <ul class="ul1">
					<li><span>地址</span><i>${var.AddressMachineGroup } </i></li>
					<li><span>负责人</span><i>${var.PrincipalMachineGroup } </i></li>
					<li><span>备注</span><i>${var.RemarkMachineGroup } </i></li>
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
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="InquireMachineGroup/loading?deputy=2"/>
	</div>
  </div>
</div>

</body>
</html>


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
		var url = "<%=path%>/standarMachine/queryStandarMachineList";
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
		window.location.href='<%=path%>/standarMachine/goAddMachineInform?id=';
	}
	
	//修改
	function edit(id){
		window.location.href='<%=path%>/standarMachine/goAddMachineInform?id=' + id;
	}
	
	//展开折叠详细
	function onShowDetial(id_TurningHolder){
		$("#ulli_" + id_TurningHolder).toggle();
	}
	
	//删除
	function del(id_MachineInform){
		if(confirm("确定要删除吗?")){
			var url = "<%=path%>/standarMachine/deleteMachineInform?id_MachineInform=" + id_MachineInform;
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
  <form action="standarMachine/queryStandarMachineList" method="post" name="Form" id="Form">
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
  <!-- 复选框   -->
  <div class="search_wrap">
	<div class="check_wrap">			
	  <span class="label_wrap"><input type="checkbox" checked="checked" />机床名称</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />机床型号</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />机床类别</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />数控系统</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />主轴最大转速</span>
	  <span class="label_wrap"><input type="checkbox" />生产厂家</span>
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
			<span class="list_title skz_hide skz_list0">&nbsp;机床名称</span> 
 			<span class="list_title skz_hide skz_list1">&nbsp;机床型号</span> 
 			<span class="list_title skz_hide skz_list2">&nbsp;机床类别</span> 
 			<span class="list_title skz_hide skz_list3"  >&nbsp;数控系统</span> 
 			<span class="list_title skz_hide skz_list4"  >主轴最大转速</span> 
 			<span class="list_title skz_hide skz_list5" style="display: none;">&nbsp;生产厂家</span> 
			<span class="list_title opera_wrap  skz_hide  skz_list6">&nbsp;&nbsp;&nbsp;操作</span>		
		</div>
    <c:choose>
      <c:when test="${not empty machineInformList}">
	    <c:forEach items="${machineInformList}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_MachineInform });"></div>
			<span class="skz_hide skz_list0">&nbsp;${var.NameMachine }</span> 
 			<span class="skz_hide skz_list1">&nbsp;${var.NumberMachine }</span> 
 			<span class="skz_hide skz_list2">&nbsp;
 				<c:forEach items="${categoryMachineInform}" var="var1" varStatus="vs">
	 				<c:if test="${var1.id_CategoryMachineInform == var.TypeMachine}">${var1.name_CategoryMachineInform }</c:if>
				</c:forEach>
 			</span> 
 			<span class="skz_hide skz_list3"  >&nbsp;${var.ControlSystemMachine }</span> 
 			<span class="skz_hide skz_list4"  >&nbsp;${var.SpindleSpeedMachine }</span> 
 			<span class="skz_hide skz_list5" style="display: none;">&nbsp;${var.CompanyMachine }</span> 
			<span class="opera_wrap  skz_hide  skz_list6">
			  <span class="btn btn_xg" onclick="edit('${var.id_MachineInform}');">修改</span>
			  <span class="btn btn_sc" onclick="del('${var.id_MachineInform}');">删除</span>
			</span>					
			<div class="clear"></div>
			<!-- 展开详情   -->
			<div id="ulli_${var.id_MachineInform}" class="ulli" style="display: none;">
			  <div class="box_xiangxi">
				<!--<img src="images/dtcp_img1.png" class="img1" alt="哈理工刀头" title="哈理工刀头"/> -->
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
					<li><span>数控系统</span><div>${var.ControlSystemMachine } </div></li>
					<li><span>主轴最大转速  (单位：r/min) </span><i>${var.SpindleSpeedMachine }</i></li>
				  </ul>
				  <ul class="ul1">
					<li><span>生产厂家</span><i>${var.CompanyMachine }</i></li>
					<li><span>最大切削直径 (单位：mm)</span><i>${var.CuttingDiameterMachine } </i></li>
					<li><span>最大承重 (单位：kg)</span><div>${var.MaxweightMachine }</div></li>
					<li><span>工作台尺寸 (长X宽X高 mm)</span><i>${var.TypeTurningHolderMachine }</i></li>
					<li></li>			
				  </ul>
				  <div class="clear"></div>
				</div>
			  </div>
			  
			<div class="box_p">
			    <h4>机床图片</h4>
			    <p>
			      <c:forEach items="${var.pictureMachineInformList}" var="var1" varStatus="vs">
			        <img name='pictureTurningHolders_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_PictureMachineInform }' />
			        <a class="btn" onclick="onShowPdf('${var1.url_PictureMachineInform }');">预览</a>
			        <br/>
			      </c:forEach>
			    </p>
			  </div>
			  
				<div class="box_p">
				  <h4>详细信息</h4>
				  <p>
				    <c:forEach items="${var.informDetailMachineInformList}" var="var1" varStatus="vs">
				      <span name='informDetailTurningHolders_img' >${var1.name_InformDetailMachineInform }</span>
				      <a class="btn" onclick="onShowPdf('${var1.url_InformDetailMachineInform }');">预览</a>
				      <br/>
				    </c:forEach>
				  </p>
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
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="standarMachine/queryStandarMachineList"/>
	</div>
  </div>
</div>

</body>
</html>


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
	<link href="<%=path%>/resources/css/index/style_a.css?v=<%=date%>" rel="stylesheet" type="text/css" />
	<!-- <link href="<%=path%>/resources/css/bootstrap.min.css" rel="stylesheet" /> -->
	<!-- <link href="<%=path%>/resources/css/bootstrap-responsive.min.css" rel="stylesheet" /> -->

	<script type="text/javascript">
	
	    
		//检索
		function onSearchKey(){
			var url = "<%=path%>/ManufacturePlan/loading?deputy=2";
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
		function onShowDetial(id_BTADrill){
			$("#ulli_" + id_BTADrill).toggle();
		}
		
		//删除
		function del(id_ProcessPart){
			if(confirm("确定要删除吗?")){
				var url = "<%=path%>/ProcessPart/deleteProcessPartList?id_ProcessPart=" + id_ProcessPart;
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
<a class="btn" onclick="window.parent.close();">返回</a>	
<div class="content_box_table">
	<form action="ManufacturePlan/loading?deputy=2" method="post" name="Form" id="Form">
	  <%-- <div class="box_input_min">
		<input name="keyword" tpye="text" class="sousuo_text_min" value="${pd.keyword }" />	
		<a class="sousuo_btn_min" onclick="onSearchKey();">搜索</a>	
	  </div> --%>
	  
	  <div class="search_wrap">
  
	  	<div class="search_input_wrap">
		  	<span>工序编号<input name="NoProcedureProcessFlow" tpye="text" value="${pd.NoProcedureProcessFlow }" /></span>
		  	<span>工序名称<input name="NameProcedureProcessFlow" tpye="text" value="${pd.NameProcedureProcessFlow }" /></span>
		  	<span>工序内容<input name="ContentProcedureProcessFlow" tpye="text" value="${pd.ContentProcedureProcessFlow }" /></span>
		  	<span>设备型号<input name="EquipmentType" tpye="text" value="${pd.EquipmentType }" /></span>
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
			<span class="label_wrap"><input type="checkbox" checked="checked" />工序编号</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />工序名称</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />工序内容</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />设备型号</span>
		</div>
		
		<div class="opera_img">
		  	<img src="/resources/images/ico_n.png" data-name="0"  onclick="changeOpera(this);"  alt="展开" />
		</div>
		<div class="choose_show_btn"   onclick="selectData();" >应用</div>	
		<div class="clear"></div>
	</div>
	
	<div class="content_wrap">
		<div class="each_list_wrap"  style="background: white;">
			<span class="list_title skz_hide  skz_list0">&nbsp;工序编号</span>
			<span class="list_title skz_hide skz_list1" >&nbsp;工序名称</span>
			<span class="list_title skz_hide skz_list2" >&nbsp;工序内容</span>
			<span class="list_title skz_hide  skz_list3" >&nbsp;设备型号</span>
			<span class="list_title opera_wrap  skz_hide  skz_list4">&nbsp;&nbsp;&nbsp;操作</span>
		</div>
		<c:choose>
    		<c:when test="${not empty WorkingProcedure}">
	  			<c:forEach items="${WorkingProcedure}" var="var" varStatus="vs">	
					<div class="each_list_wrap"  >
						<div class="onclick" onclick="onShowDetial(${var.id_WorkingProcedure });"></div>
						<span class="  skz_hide  skz_list0">&nbsp;${var.NoProcedureProcessFlow }</span>
						<span class="skz_hide skz_list1" >&nbsp;${var.NameProcedureProcessFlow }</span>
						<span class="skz_hide  skz_list2"  >&nbsp;${var.ContentProcedureProcessFlow}</span>
						<span class="skz_hide  skz_list3" >&nbsp;${var.EquipmentType}</span>
						<span class="opera_wrap  skz_hide  skz_list4">
							&nbsp;&nbsp;<span class="btn btn_xg" onclick="window.parent.opt(2,'${var.NoProcedureProcessFlow}','${var.NameProcedureProcessFlow}');">选择</span>
						</span>
						<div class="clear"></div>	
						
						<!-- 展开详情   -->
						<div id="ulli_${var.id_WorkingProcedure}"  data-name="0"  class="ulli" style="display: none;">
							<div class="box_xiangxi">
							<!--<img src="images/dtcp_img1.png" class="img1" alt="哈理工刀头" title="哈理工刀头"/> -->
								<div class="box_u1">
									<ul class="ul1">
								  		<li><span>工序编号</span><i>${var.NoProcedureProcessFlow } </i></li>
								  		<li><span>工序名称</span><div>${var.NameProcedureProcessFlow} </div></li>
								  		<li><span>工序内容</span><i>${var.ContentProcedureProcessFlow } </i></li>
								  		<li><span>设备型号</span><i>${var.EquipmentType } </i></li>
								  		<li><span>工序备注</span><i>${var.RemarkProcessFlow } </i></li>
								  		
									</ul>
									<ul class="ul1">
								  		<li><span>工时</span><i>${var.TimeProcessFlow}</i></li>
								  		<li><span>加工夹具</span><i>${var.MachineProcessFlow } </i></li>
								  		<li><span>切削液</span><i>${var.MachineProcessCode } </i></li>
								  		<li><span>备注</span><i>${var.CuttingFluidProcessFlow } </i></li>
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
	
	<div class="clear"></div>
  	<div class="page-header position-relative" style="vertical-align:top;padding-top:10px;padding-left:20px;">
<!-- 		  <a class="btn" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" >批量删除</a> -->
	   
		<div class="pagination">
	  		<ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="ManufacturePlan/loading?deputy=2"/>
		</div>
	</div>
</div>
</body>
</html>
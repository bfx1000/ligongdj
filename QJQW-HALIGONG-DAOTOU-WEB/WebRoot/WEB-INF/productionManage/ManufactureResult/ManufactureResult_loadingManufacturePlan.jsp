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
	<script src="<%=path%>/resources/js/laydate/laydate.js"></script>
	<link href="<%=path%>/resources/css/index/style_a.css?v=<%=date%>" rel="stylesheet" type="text/css" />
	<!-- <link href="<%=path%>/resources/css/bootstrap.min.css" rel="stylesheet" /> -->
	<!-- <link href="<%=path%>/resources/css/bootstrap-responsive.min.css" rel="stylesheet" /> -->

	<script type="text/javascript">
		//检索
		function onSearchKey(){
			var url = "<%=path%>/ManufactureResult/loading";
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
		
		//预览pdf文件
		function onShowPdf(url){
			window.open("<%=basePath%>goods" + url);
		}
	</script>
</head>
<body>
<div class="content_box_table">
	<form action="/ManufactureResult/loading" method="post" name="Form" id="Form">
	  <div class="search_wrap">
  
	  	<div class="search_input_wrap">
		  	<span>生产编号<input name="NoManufPlan" tpye="text" value="${pd.NoManufPlan }" /></span>
		  	<span>生产日期<input name="DateStartManufPlan" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" tpye="text" value="${pd.DateStartManufPlan }" /></span>
		  	<span>完成日期<input name="DateFinishManufPlan" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" tpye="text" value="${pd.DateFinishManufPlan }" /></span>
		  	<span>零件编号<input name="PartNoManufPlan" tpye="text" value="${pd.PartNoManufPlan }" /></span>
		  	<span>设备编号<input name="DeviceManufPlan" tpye="text" value="${pd.DeviceManufPlan }" /></span>
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
			<span class="label_wrap"><input type="checkbox" checked="checked" />生产编号</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />生产日期</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />完成日期</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />零件编号</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />&nbsp;设备编号</span>
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
		<div class="each_list_wrap"  style="background: white;">
			<span class="list_title skz_hide  skz_list0">&nbsp;生产编号</span>
			<span class="list_title skz_hide skz_list1" >&nbsp;生产日期</span>
			<span class="list_title skz_hide skz_list2" >&nbsp;完成日期</span>
			<span class="list_title skz_hide  skz_list3" >&nbsp;零件编号</span>
			<span class="list_title skz_hide  skz_list4" >设备编号</span>
			<span class="list_title opera_wrap  skz_hide  skz_list5">&nbsp;&nbsp;&nbsp;操作</span>
		</div>
		<c:choose>
    		<c:when test="${not empty ManufacturePlan}">
	  			<c:forEach items="${ManufacturePlan}" var="var" varStatus="vs">	
					<div class="each_list_wrap"  >
						<div class="onclick" onclick="onShowDetial(${var.id_ManufacturePlan });"></div>
						<span class="  skz_hide  skz_list0">&nbsp;${var.NoManufPlan }</span>
						<span class="skz_hide skz_list1" >&nbsp;${var.DateStartManufPlan }</span>
						<span class="skz_hide skz_list2" >&nbsp;${var.DateFinishManufPlan }</span>
						<span class="skz_hide  skz_list3"  >&nbsp;${var.PartNoManufPlan}</span>
						<span class="skz_hide  skz_list4" >&nbsp;${var.DeviceManufPlan}</span>
						<span class="opera_wrap  skz_hide  skz_list5">
							<span class="btn btn_xg" onclick="window.parent.opt('${var.NoManufPlan}','${var.QuantityManufPlan}','${var.DateStartManufPlan}','${var.DateFinishManufPlan}','${var.RemarkManufPlan}','${var.PartNoManufPlan}','${var.NameManufPlan}','${var.NumberMaterialManufPlan}','${var.CategoryMaterialManufPlan}','${var.DeviceManufPlan}','${var.IDDeviceManufPlan}','${var.NoProcessManufPlan}','${var.NameProcessManufPlan}','${var.NoProcessStepManufPlan}','${var.NameProcessStepManufPlan}','${var.MachiningTypeManufPlan}','${var.MachiningLevelManufPlan}','${var.CuttingFluidManufPlan}','${var.CutterSpeedManufPlan}','${var.SpindleSpeedManufPlan}','${var.FeedManufPlan}','${var.CuttingDepthManufPlan}','${var.CuttingWidthManufPlan}','${var.FeedSpeedManufPlan}','${var.ToolHolderManufPlan}','${var.ToolbladeManufPlan}','${var.ToolMaterialManufPlan}','${var.CutterManufPlan}');">选择</span>
						</span>
						<div class="clear"></div>	
						
						<!-- 展开详情   -->
						<div id="ulli_${var.id_ManufacturePlan}"  data-name="0"  class="ulli" style="display: none;">
							<div class="box_xiangxi_copy">
								<div class="box_u1">
								<br/>
								<span style="color:#217fe1;"><h3>生产计划：</h3></span>
								<br/>
									<ul class="ul1_copy">
								  		<li><span>生产编号:</span><i>${var.NoManufPlan } &nbsp;</i></li>
								  		<li><span>完成日期:</span><div>${var.DateFinishManufPlan} &nbsp;</div></li>
									</ul>
									<ul class="ul1_copy">
								  		<li><span>生产数量:</span><i>${var.QuantityManufPlan } &nbsp;</i></li>
								  		<li><span>备注:</span><div>${var.RemarkManufPlan} &nbsp;</div></li>
									</ul>
									<ul class="ul1_copy">
								  		<li><span>生产日期:</span><i>${var.DateStartManufPlan } &nbsp;</i></li>
								  		<li><span> </span><i>&nbsp; </i></li>
									</ul>
								<br/>&nbsp; 
								<span style="color:#217fe1;"><h3>零件信息及设备：</h3></span>
								<br/>
									<ul class="ul1_copy">
								  		<li><span>零件名称:</span><i>${var.NameManufPlan } &nbsp;</i></li>
								  		<li><span>设备编号:</span><i>${var.DeviceManufPlan }&nbsp; </i></li>
								  		<li><span>生产人员:</span><i>${var.StaffManufPlan } &nbsp;</i></li>
									</ul>
									<ul class="ul1_copy">
								  		<li><span>材料牌号:</span><i>${var.NumberMaterialManufPlan } &nbsp;</i></li>
								  		<li><span>节点设备编号:</span><i>${var.IDDeviceManufPlan }&nbsp;</i></li>
								  		<li><span>部门分厂:</span><i>${var.BranchManufPlan }&nbsp; </i></li>
									</ul>
									<ul class="ul1_copy">
								  		<li><span>零件编号:</span><div>${var.PartNoManufPlan}&nbsp; </div></li>
								  		<li><span>材料类别:</span><i>${var.CategoryMaterialManufPlan }&nbsp; </i></li>
								  		<li><span> </span><i>&nbsp; </i></li>
									</ul>
									<div class="clear"></div>
							  	</div>
							</div>
							<div class="clear"></div>
							
							
						<div class="box_xiangxi zhedie">	
							<div class="box_zhedie">
									<span class="a_zhedie1" id = "zd${var.id_ManufacturePlan }" onclick = "zd(${var.id_ManufacturePlan });" style="display:block;">工艺信息</span>
									<span class="a_zhedie2" id = "zd1${var.id_ManufacturePlan }" onclick = "zd1(${var.id_ManufacturePlan });" style="display:none;">工艺信息</span>
								</div>
								 <div class="box_u1" id="box_clcs${var.id_ManufacturePlan }" style="display:none"> 
								 	<div class="box_xiangxi_copy">
										<div class="box_u1">
										  	<ul class="ul1_copy">	
										  		<li><span>工步编号:</span><div>${var.NoProcessStepManufPlan} </div></li>
										  		<li><span>加工级别:</span><i>${var.MachiningLevelManufPlan } </i></li>
										  		<li><span>主轴转速:</span><i>${var.SpindleSpeedManufPlan } </i></li>
										  		<li><span>切削宽度:</span><i>${var.CuttingWidthManufPlan } </i></li>
										  		<li><span>刀片:</span><i>${var.ToolbladeManufPlan } </i></li>
										  		<li><span>刀片/刀具材料:</span><i>${var.ToolMaterialManufPlan } </i></li>
										  	</ul>	
										  	<ul class="ul1_copy">	
										  		<li><span>工序编号:</span><i>${var.NoProcessManufPlan } </i></li>
										  		<li><span>工步名称:</span><div>${var.NameProcessStepManufPlan} </div></li>
										  		<li><span>切削液:</span><i>${var.CuttingFluidManufPlan } </i></li>
										  		<li><span>每齿进给量:</span><i>${var.FeedManufPlan } </i></li>
										  		<li><span>进给速度:</span><i>${var.FeedSpeedManufPlan } </i></li>
										  		<li><span>刀具:</span><i>${var.CutterManufPlan } </i></li>
										  	</ul>	
										  	<ul class="ul1_copy">	
										  		<li><span>工序名称:</span><i>${var.NameProcessManufPlan } </i></li>
										  		<li><span>加工类别:</span><div>${var.MachiningTypeManufPlan} </div></li>
										  		<li><span>切削速度:</span><i>${var.CutterSpeedManufPlan } </i></li>
										  		<li><span>切削深度:</span><i>${var.CuttingDepthManufPlan } </i></li>
										  		<li><span>刀柄:</span><i>${var.ToolHolderManufPlan } </i></li>
										  		
										  	</ul>
										  </div>
									 </div>
								  </div>
								 
							</div>
							 <div class="clear"></div>
							<br/><br/>
							
							
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
	  		<ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="ManufactureResult/loading"/>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	function zd(i){
		$("#box_clcs"+i).css("display","block");
		$("#zd"+i).css("display","none");
		$("#zd1"+i).css("display","block");
	}
	function zd1(i){
		$("#box_clcs"+i).css("display","none");
		$("#zd"+i).css("display","block");
		$("#zd1"+i).css("display","none");
	}
</script>
</html>
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
			var url = "<%=path%>/ManufacturePlan/loading?deputy=3";
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
		
		function opt1(){
			
		}
	</script>
</head>
<body>
<a class="btn" onclick="window.parent.close();">返回</a>	
<div class="content_box_table" id="div_core">
	<form action="/ManufacturePlan/loading?deputy=3" method="post" name="Form" id="Form">
	  <div class="search_wrap">
	  	<div class="search_input_wrap">
		  	<span>工步编号<input name="NoProcessStep" tpye="text" value="${pd.NoProcessStep }" /></span>
		  	<span>加工类别
		  		<select name="MachiningTypeProcessStep" class="select" style="width : 100px;">
					<option value="" ${pd.MachiningTypeProcessStep == '' ? 'selected' : '' }>请选择</option>
					<option value="1" ${pd.MachiningTypeProcessStep == 1 ? 'selected' : '' }>车削</option>
					<option value="2" ${pd.MachiningTypeProcessStep == 2 ? 'selected' : '' }>铣削</option>
					<option value="3" ${pd.MachiningTypeProcessStep == 3 ? 'selected' : '' }>镗削</option>
					<option value="4" ${pd.MachiningTypeProcessStep == 4 ? 'selected' : '' }>钻削</option>
					<option value="5" ${pd.MachiningTypeProcessStep == 5 ? 'selected' : '' }>磨削</option>
				</select>
		  	</span>
		  	<span>加工级别
		  		<select name="MachiningLevelProcessStep" class="select" style="width : 100px;">
					<option value="" ${pd.MachiningLevelProcessStep == '' ? 'selected' : '' }>请选择</option>
					<option value="1" ${pd.MachiningLevelProcessStep == 1 ? 'selected' : '' }>精加工</option>
					<option value="2" ${pd.MachiningLevelProcessStep == 2 ? 'selected' : '' }>粗加工</option>
					<option value="3" ${pd.MachiningLevelProcessStep == 3 ? 'selected' : '' }>半精加工</option>
				</select>
		  	</span>
		  	<span>工步名称<input name="NameProcessStep" tpye="text" value="${pd.NameProcessStep }" /></span>
		  	<span>工步内容<input name="ContentProcessStep" tpye="text" value="${pd.ContentProcessStep }" /></span>
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
			<span class="label_wrap"><input type="checkbox" checked="checked" />工步编号</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />加工类别</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />加工级别</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />工步名称</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />工步内容</span>
		</div>
		
		<div class="opera_img">
		  	<img src="/resources/images/ico_n.png" data-name="0"  onclick="changeOpera(this);"  alt="展开" />
		</div>
		<div class="choose_show_btn" onclick="selectData();" >应用</div>	
		<div class="clear"></div>
	</div>
	
	<div class="content_wrap">
		<div class="each_list_wrap"  style="background: white;">
			<span class="list_title skz_hide  skz_list0">&nbsp;工步编号</span>
			<span class="list_title skz_hide skz_list1" >&nbsp;加工类别</span>
			<span class="list_title skz_hide skz_list2" >&nbsp;加工级别</span>
			<span class="list_title skz_hide  skz_list3" >&nbsp;工步名称</span>
			<span class="list_title skz_hide  skz_list4" >工步内容</span>
			<span class="list_title opera_wrap  skz_hide  skz_list5">&nbsp;&nbsp;&nbsp;操作</span>
		</div>
		<c:choose>
    		<c:when test="${not empty ProcessStep}">
	  			<c:forEach items="${ProcessStep}" var="var" varStatus="vs">	
					<div class="each_list_wrap"  >
						<div class="onclick" onclick="onShowDetial(${var.id_ProcessStep });"></div>
						<span class="  skz_hide  skz_list0">&nbsp;${var.NoProcessStep }</span>
						<span class="skz_hide skz_list1" >&nbsp;
							 <c:choose>
						      	<c:when test="${var.MachiningTypeProcessStep == ''}"> </c:when>
						        <c:when test="${var.MachiningTypeProcessStep == 1}">车削</c:when>
						        <c:when test="${var.MachiningTypeProcessStep == 2}">铣削</c:when>
						        <c:when test="${var.MachiningTypeProcessStep == 3}">镗削</c:when>
						        <c:when test="${var.MachiningTypeProcessStep == 4}">钻削</c:when>
						        <c:when test="${var.MachiningTypeProcessStep == 5}">磨削</c:when>
						     </c:choose>
						</span>
						<span class="skz_hide  skz_list2"  >&nbsp;
							<c:choose>
						      	<c:when test="${var.MachiningLevelProcessStep == ''}"> </c:when>
						        <c:when test="${var.MachiningLevelProcessStep == 1}">精加工</c:when>
						        <c:when test="${var.MachiningLevelProcessStep == 2}">粗加工</c:when>
						        <c:when test="${var.MachiningLevelProcessStep == 3}">半精加工</c:when>
						    </c:choose>
						</span>
						<span class="skz_hide  skz_list3" >&nbsp;${var.NameProcessStep}</span>
						<span class="skz_hide  skz_list4" >&nbsp;${var.ContentProcessStep}</span>
						<span class="opera_wrap  skz_hide  skz_list5">
							&nbsp;&nbsp;&nbsp;<span class="btn btn_xg" onclick="window.parent.opt(3,'${var.NoProcessStep }','${var.NameProcessStep }','${var.MachiningTypeProcessStep }','${var.MachiningLevelProcessStep }','${var.ToolHolderProcessStep }','${var.ToolbladeProcessStep }','${var.ToolMaterialProcessStep }','${var.CutterProcessStep }','${var.CutterSpeedProcessStep }','${var.SpindlespeedProcessStep }','${var.FeedProcessStep }','${var.FeedSpeedProcessStep }','${var.CuttingDepthProcessStep }','${var.CuttingWidthProcessStep }','${var.CuttingFluidProcessStep }');">选择</span>
						</span>
						<div class="clear"></div>	
						
						<!-- 展开详情   -->
						<div id="ulli_${var.id_ProcessStep}"  data-name="0"  class="ulli" style="display: none;">
							<div class="box_xiangxi_copy">
								<div class="box_u1">
									<ul class="ul1_copy">
										<li><span>工步编号</span><i>${var.NoProcessStep } </i></li>
								  		<li><span>加工类别</span>
									  		<div>
										      <c:choose>
										      	<c:when test="${var.MachiningTypeProcessStep == ''}"> </c:when>
										        <c:when test="${var.MachiningTypeProcessStep == 1}">车削</c:when>
										        <c:when test="${var.MachiningTypeProcessStep == 2}">铣削</c:when>
										        <c:when test="${var.MachiningTypeProcessStep == 3}">镗削</c:when>
										        <c:when test="${var.MachiningTypeProcessStep == 4}">钻削</c:when>
										        <c:when test="${var.MachiningTypeProcessStep == 5}">磨削</c:when>
										      </c:choose>
										    </div>
								  		</li>
								  		<li><span>加工级别</span>
								  			<div>
										      <c:choose>
										      	<c:when test="${var.MachiningLevelProcessStep == ''}"> </c:when>
										        <c:when test="${var.MachiningLevelProcessStep == 1}">精加工</c:when>
										        <c:when test="${var.MachiningLevelProcessStep == 2}">粗加工</c:when>
										        <c:when test="${var.MachiningLevelProcessStep == 3}">半精加工</c:when>
										      </c:choose>
										    </div>
								  		</li>
								  		<li><span>工步名称</span><i>${var.NameProcessStep } </i></li>
								  		<li><span>刀片材料</span><i>${var.ToolMaterialProcessStep } </i></li>
								  		<li><span>刀具</span><div>${var.CutterProcessStep} </div></li>
								  		<li><span>切削速度</span><i>${var.CutterSpeedProcessStep } </i></li>
								  		<li><span>主轴转速</span><i>${var.SpindlespeedProcessStep } </i></li>
									</ul>
									<ul class="ul1_copy">
										<li><span>工步内容</span><i>${var.ContentProcessStep}</i></li>
								  		<li><span>量具</span><i>${var.MeasureProcessStep } </i></li>
								  		<li><span>刀柄</span><i>${var.ToolHolderProcessStep } </i></li>
								  		<li><span>刀片</span><i>${var.ToolbladeProcessStep } </i></li>
								  		<li><span>每齿进给量</span><i>${var.FeedProcessStep}</i></li>
								  		<li><span>进给速度</span><i>${var.FeedSpeedProcessStep } </i></li>
								  		<li><span>切削深度</span><i>${var.CuttingDepthProcessStep } </i></li>
									</ul>
									<ul class="ul1_copy">
										<li><span>切削宽度</span><i>${var.CuttingWidthProcessStep } </i></li>
								  		<li><span>设备</span><div>${var.DeviceProcessStep} </div></li>
								  		<li><span>夹具</span><i>${var.FixtureProcessStep } </i></li>
								  		<li><span>切削液</span><i>${var.CuttingFluidProcessStep } </i></li>
								  		<li><span>机动</span><div>${var.TimeMachiningProcessStep} </div></li>
								  		<li><span>辅助</span><i>${var.TimeAssistProcessStep } </i></li>
								  		<li><span>备注</span><i>${var.RemarkProcessStep } </i></li>
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
	
	<div class="clear"></div>
  	<div class="page-header position-relative" style="vertical-align:top;padding-top:10px;padding-left:20px;">
<!-- 		  <a class="btn" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" >批量删除</a> -->
	   
		<div class="pagination">
	  		<ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="ManufacturePlan/loading?deputy=3"/>
		</div>
	</div>
</div>
</body>
</html>
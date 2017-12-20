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
	function zd(pid,id){
		$("#box_clcs"+pid+"_"+id).css("display","block");
		$("#zd"+pid+"_"+id).css("display","none");
		$("#zd1"+pid+"_"+id).css("display","block");
	}
	function zd1(pid,id){
		$("#box_clcs"+pid+"_"+id).css("display","none");
		$("#zd"+pid+"_"+id).css("display","block");
		$("#zd1"+pid+"_"+id).css("display","none");
	}
</script>

	<script type="text/javascript">
	
	    
		//检索
		function onSearchKey(){
			var url = "<%=path%>/ProcessFlow/ProcessFlowList";
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
			window.location.href='<%=path%>/ProcessFlow/goAddProcessFlow?id=';
		}
		
		
		//修改
		function edit(id){
			window.location.href='<%=path%>/ProcessFlow/goAddProcessFlow?id=' + id;
		}
		
		//展开折叠详细
		function onShowDetial(id_BTADrill){
			$("#ulli_" + id_BTADrill).toggle();
		}
		
		//删除
		function del(id_ProcessFlow){
			if(confirm("确定要删除吗?")){
				var url = "<%=path%>/ProcessFlow/deleteProcessFlowList?id_ProcessFlow=" + id_ProcessFlow;
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
		
		function queryProcessStep(NoProcedureProcessFlow){
			window.location.href='<%=path%>/ProcessStep/ProcessStepList?NoProcedureProcessFlow='+NoProcedureProcessFlow;
		}
		
		
	</script>
</head>
<body>
<div class="content_box_table">
	<form action="ProcessFlow/ProcessFlowList" method="post" name="Form" id="Form">
	  <%-- <div class="box_input_min">
		<input name="keyword" tpye="text" class="sousuo_text_min" value="${pd.keyword }" />	
		<a class="sousuo_btn_min" onclick="onSearchKey();">搜索</a>	
	  </div> --%>
	  
	  <div class="search_wrap">
  
	  	<div class="search_input_wrap">
		  	<span>工艺流程编号<input name="NoProcessFlow" tpye="text" value="${pd.NoProcessFlow }" /></span>
		  	<span>单位名称<input name="CompanyProcessFlow" tpye="text" value="${pd.CompanyProcessFlow }" /></span>
		  	<span>工艺流程名称<input name="NameProcessFlow" tpye="text" value="${pd.NameProcessFlow }" /></span>
		  	<span>零件名称<input name="PartNameProcessFlow" tpye="text" value="${pd.PartNameProcessFlow }" /></span>
		  	<span>零件编号<input name="PartNumberProcessFlow" tpye="text" value="${pd.PartNumberProcessFlow }" /></span>
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
			<span class="label_wrap"><input type="checkbox" checked="checked" />工艺流程编号</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />单位名称</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />工艺流程名称</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />零件名称</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />零件编号</span>
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
			<span class="list_title skz_hide  skz_list0">&nbsp;工艺流程编号</span>
			<span class="list_title skz_hide skz_list1" >&nbsp;单位名称</span>
			<span class="list_title skz_hide skz_list2" >&nbsp;工艺流程名称</span>
			<span class="list_title skz_hide  skz_list3" >&nbsp;零件名称</span>
			<span class="list_title skz_hide  skz_list4" >&nbsp;零件编号</span>
			<span class="list_title opera_wrap  skz_hide  skz_list5">&nbsp;&nbsp;&nbsp;操作</span>
		</div>
		<c:choose>
    		<c:when test="${not empty ProcessFlow}">
	  			<c:forEach items="${ProcessFlow}" var="var" varStatus="vs">	
					<div class="each_list_wrap"  >
						<div class="onclick" onclick="onShowDetial(${var.id_ProcessFlow });"></div>
						<span class="  skz_hide  skz_list0">&nbsp;${var.NoProcessFlow }</span>
						<span class="skz_hide skz_list1" >&nbsp;${var.CompanyProcessFlow }</span>
						<span class="skz_hide  skz_list2"  >&nbsp;${var.NameProcessFlow}</span>
						<span class="skz_hide  skz_list3" >&nbsp;${var.PartNameProcessFlow}</span>
						<span class="skz_hide  skz_list4" >&nbsp;${var.PartNumberProcessFlow}</span>
						<span class="opera_wrap  skz_hide  skz_list5">
							<span class="btn btn_xg" onclick="edit('${var.id_ProcessFlow}');">修改</span>
						    <span class="btn btn_sc" onclick="del('${var.id_ProcessFlow}');">删除</span>
						</span>
						<div class="clear"></div>	
						
						<!-- 展开详情   -->
						<div id="ulli_${var.id_ProcessFlow}"  data-name="0"  class="ulli" style="display: none;">
							<div class="box_xiangxi">
								<div class="box_u1">
									<ul class="ul1">
								  		<li><span>工艺流程编号</span><i>${var.NoProcessFlow } </i></li>
								  		<li><span>单位名称</span><div>${var.CompanyProcessFlow} </div></li>
								  		<li><span>工艺流程名称</span><i>${var.NameProcessFlow } </i></li>
								  		<li><span>零件名称</span><i>${var.PartNameProcessFlow } </i></li>
								  		<li><span>零件所属部件编号</span><i>${var.PartNoAssemblyProcessFlow } </i></li>
									</ul>
									<ul class="ul1">
								  		<li><span>零件编号</span><i>${var.PartNumberProcessFlow}</i></li>
								  		<li><span>零件材料牌号</span><i>${var.PartNoMaterialProcessFlow } </i></li>
								  		<li><span>零件材料类别</span><i>${var.PartCategoryMaterialProcessFlow } </i></li>
								  		<li><span>零件所属部件</span><i>${var.PartAssemblyProcessFlow } </i></li>
								  		<li><span>零件类别</span><i>${var.PartTypeProcessFlow } </i></li>
									</ul>
									<div class="clear"></div>
							  	</div>
							</div>
			
							<div class="box_p">
								<h4>零件图片</h4>
							  	<p>
							    	<c:forEach items="${var.PicturePartProcessFlow}" var="var1" varStatus="vs">
							      		<img name='PicturePartProcessFlows_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_PicturePartProcessFlow }' />
							      		<a class="btn" onclick="onShowPdf('${var1.url_PicturePartProcessFlow }');">预览</a>
							      		<br/>
							    	</c:forEach>
							  	</p>
							</div>
							<div class="clear"></div>
							
							<c:forEach items="${var.WorkingProcedureList}" var="var1" varStatus="vs">
							
							
							<div class="box_xiangxi zhedie">
								<div class="box_zhedie">
									<span class="a_zhedie1" id = "zd${var.id_ProcessFlow }_${var1.id_WorkingProcedure}" onclick = "zd(${var.id_ProcessFlow },${var1.id_WorkingProcedure});" style="display:block;">${var1.NameProcedureProcessFlow}</span>
									<span class="a_zhedie2" id = "zd1${var.id_ProcessFlow }_${var1.id_WorkingProcedure}" onclick = "zd1(${var.id_ProcessFlow },${var1.id_WorkingProcedure});" style="display:none;">${var1.NameProcedureProcessFlow}</span>
								</div>
								<div class="box_u1" id="box_clcs${var.id_ProcessFlow }_${var1.id_WorkingProcedure}" style="display:none">
									
										<div class="box_xiangxi">
											<div class="box_u1">
												<ul class="ul1">
											  		<li><span>工序编号</span><i>${var1.NoProcedureProcessFlow } </i></li>
											  		<li><span>工序名称</span><div>${var1.NameProcedureProcessFlow} </div></li>
											  		<li><span>工序内容</span><i>${var1.ContentProcedureProcessFlow } </i></li>
											  		<li><span>设备型号</span><i>${var1.EquipmentType } </i></li>
											  		<li><span>工时</span><i>${var1.TimeProcessFlow } </i></li>
												</ul>
												<ul class="ul1">
											  		<li><span>加工夹具</span><i>${var1.MachineProcessFlow}</i></li>
											  		<li><span>加工程序</span><i>${var1.MachineProcessCode } </i></li>
											  		<li><span>切削液</span><i>${var1.CuttingFluidProcessFlow } </i></li>
											  		<li><span>工序备注</span><i>${var1.RemarkProcessFlow } </i></li>
											  		<li><a class="btn" onclick="queryProcessStep('${var1.NoProcedureProcessFlow }');">查看工步</a></li>
												</ul>
												<div class="clear"></div>
										  	</div>
										</div>
										<div class="box_p">
											<h4>工序图片</h4>
										  	<p>
										    	<c:forEach items="${var1.PictureProcessFlow}" var="var1" varStatus="vs">
										      		<img name='PictureProcessFlows_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_PictureProcessFlow }' />
										      		<a class="btn" onclick="onShowPdf('${var1.url_PictureProcessFlow }');">预览</a>
										      		<br/>
										    	</c:forEach>
										  	</p>
										</div>
									<div class="clear"></div>
									
									
									
								</div>
								<div class="clear"></div>
							</div>
							</c:forEach>
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
	  		<ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="ProcessFlow/ProcessFlowList"/>
		</div>
	</div>
</div>
</body>
</html>
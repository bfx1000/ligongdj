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
		//利用该接口
		function on(id_Customization){
			window.location.href='<%=path%>/ManufactureResultChild/useCustomization?id_Customization='+id_Customization;
		}
		
	
		//删除
		function del(id_ManufactureResultChild){
			if(confirm("确定要删除吗?")){
				var url = "<%=path%>/ManufactureResultChild/deleteCustomization?id_Customization=" + id_ManufactureResultChild;
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
		
		//新增
		function add(){
			window.location.href='<%=path%>/ManufactureResultChild/goAddCustomization';
		}
		
		
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

	<!-- 新增按钮   -->
	<div class="search_wrap">
		 <a class="sousuo_btn_min" style="float:right;" onclick="add();">新增定制</a>
		 <a class="btn" href="/ManufactureResultChild/ManufactureResultChildList" >返回</a>
	</div>
	<form action = "" method="post" name="Form" id="Form">
	  
	</form>
	<div class="content_wrap">
		<c:choose>
    		<c:when test="${not empty Customization}">
	  			<c:forEach items="${Customization}" var="var" varStatus="vs">	
					<div class="each_list_wrap"  >
						<div class="onclick" onclick="onShowDetial(${var.id_Customization });"></div>
						<span class="  skz_hide  skz_list0">&nbsp;${var.name }</span>
						<span class="opera_wrap  skz_hide  skz_list1">
						   <span class="btn btn_sc" onclick="on('${var.id_Customization}');">使用定制</span>
						   <span class="btn btn_sc" onclick="del('${var.id_Customization}');">删除定制</span>
						</span>
						<div class="clear"></div>	
						
						<!-- 展开详情   -->
						<div id="ulli_${var.id_Customization}"  data-name="0"  class="ulli" style="display: none;">
							<div class="box_xiangxi_copy">
								<div class="box_u1">
								
									<br/>
									<span style="color:#217fe1;"><h3>该定制有如下字段信息：</h3></span>
									<br/>
									<ul class="ul1_copy">
										<c:forEach  var="i" begin="0" end="${fn:length(var.names_Chinese)}" step="1">	
								  			<li><i>${var.names_Chinese[i] }</i></li>
								  		</c:forEach>
									</ul>
									<div class="clear"></div>
									
							  	</div>
							</div>
							<div class="clear"></div>
						</div>							
					</div>
				</c:forEach>
			</c:when>
			
	    	<c:otherwise>没有相关的定制字段信息！</c:otherwise>
	  	</c:choose>	
	</div>
	
	<div class="clear"></div>
  	<div class="page-header position-relative" style="vertical-align:top;padding-top:10px;padding-left:20px;">
<!-- 		  <a class="btn" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" >批量删除</a> -->
	   
		<div class="pagination">
	  		<ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="ManufactureResultChild/Customization"/>
		</div>
	</div>
</div>
</body>
</html>
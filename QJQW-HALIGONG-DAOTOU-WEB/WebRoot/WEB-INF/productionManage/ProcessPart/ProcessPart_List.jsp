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
			var url = "<%=path%>/ProcessPart/ProcessPartList";
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
			window.location.href='<%=path%>/ProcessPart/goAddProcessPartt?id=';
		}
		
		
		//修改
		function edit(id){
			window.location.href='<%=path%>/ProcessPart/goAddProcessPartt?id=' + id;
		}
		
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
<div class="content_box_table">
	<form action="ProcessPart/ProcessPartList" method="post" name="Form" id="Form">
	  <%-- <div class="box_input_min">
		<input name="keyword" tpye="text" class="sousuo_text_min" value="${pd.keyword }" />	
		<a class="sousuo_btn_min" onclick="onSearchKey();">搜索</a>	
	  </div> --%>
	  
	  <div class="search_wrap">
  
	  	<div class="search_input_wrap">
		  	<span>零件名称<input name="NameProcessPart" tpye="text" value="${pd.NameProcessPart }" /></span>
		  	<span>零件编号<input name="NumberProcessPart" tpye="text" value="${pd.NumberProcessPart }" /></span>
		  	<span>零件类别
		  	  <select name="TypeProcessPart" class="select" style="width : 100px;">
						<option value="">请选择</option>
				<c:forEach items="${CategoryTypeProcessPart}" var="var" varStatus="vs">
						<option value="${var.id_CategoryTypeProcessPart }" ${pd.TypeProcessPart == var.id_CategoryTypeProcessPart ? 'selected' : '' }>${var.name_CategoryTypeProcessPart }</option>	
				</c:forEach>
		  </select>
		  	</span>
		  	<span>零件所属部件<input name="AssemblyProcessPart" tpye="text" value="${pd.AssemblyProcessPart }" /></span>
		  	<span>零件所属部件编号<input name="NoAssemblyProcessPart" tpye="text" value="${pd.NoAssemblyProcessPart }" /></span>
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
			<span class="label_wrap"><input type="checkbox" checked="checked" />零件名称</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />零件编号</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />零件类别</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />零件部件</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />&nbsp;零件部件编号</span>
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
			<span class="list_title skz_hide  skz_list0">&nbsp;零件名称</span>
			<span class="list_title skz_hide skz_list1" >&nbsp;零件编号</span>
			<span class="list_title skz_hide skz_list2" >&nbsp;零件类型</span>
			<span class="list_title skz_hide  skz_list3" >&nbsp;零件部件</span>
			<span class="list_title skz_hide  skz_list4" >零件部件编号</span>
			<span class="list_title opera_wrap  skz_hide  skz_list5">&nbsp;&nbsp;&nbsp;操作</span>
		</div>
		<c:choose>
    		<c:when test="${not empty ProcessPart}">
	  			<c:forEach items="${ProcessPart}" var="var" varStatus="vs">	
					<div class="each_list_wrap"  >
						<div class="onclick" onclick="onShowDetial(${var.id_ProcessPart });"></div>
						<span class="  skz_hide  skz_list0">&nbsp;${var.NameProcessPart }</span>
						<span class="skz_hide skz_list1" >&nbsp;${var.NumberProcessPart }</span>
						<span class="skz_hide skz_list2" >&nbsp;
							<c:forEach items="${CategoryTypeProcessPart}" var="var1" varStatus="vs">
									<c:if test="${var1.id_CategoryTypeProcessPart == var.TypeProcessPart}">${var1.name_CategoryTypeProcessPart }</c:if>	
							</c:forEach>
						</span>
						<span class="skz_hide  skz_list3"  >&nbsp;${var.AssemblyProcessPart}</span>
						<span class="skz_hide  skz_list4" >&nbsp;${var.NoAssemblyProcessPart}</span>
						<span class="opera_wrap  skz_hide  skz_list5">
							<span class="btn btn_xg" onclick="edit('${var.id_ProcessPart}');">修改</span>
						    <span class="btn btn_sc" onclick="del('${var.id_ProcessPart}');">删除</span>
						</span>
						<div class="clear"></div>	
						
						<!-- 展开详情   -->
						<div id="ulli_${var.id_ProcessPart}"  data-name="0"  class="ulli" style="display: none;">
							<div class="box_xiangxi">
							<!--<img src="images/dtcp_img1.png" class="img1" alt="哈理工刀头" title="哈理工刀头"/> -->
								<div class="box_u1">
									<ul class="ul1">
								  		<li><span>零件名称</span><i>${var.NameProcessPart } </i></li>
								  		<li><span>零件编号</span><div>${var.NumberProcessPart} </div></li>
								  		<li><span>零件类型</span><i>
								  			<c:forEach items="${CategoryTypeProcessPart}" var="var1" varStatus="vs">
													<c:if test="${var1.id_CategoryTypeProcessPart == var.TypeProcessPart}">${var1.name_CategoryTypeProcessPart }</c:if>	
											</c:forEach>
										</i></li>
								  		<li><span>材料牌号</span><i>${var.NumberMaterialProcessPart } </i></li>
								  		<li><span>材料类别</span><i>${var.CategoryMaterialProcessPart } </i></li>
									</ul>
									<ul class="ul1">
								  		<li><span>零件所属部件</span><i>${var.AssemblyProcessPart}</i></li>
								  		<li><span>零件所属部件编号</span><i>${var.NoAssemblyProcessPart } </i></li>
								  		<li><span>零件所属厂家</span><i>${var.CompanyProcessPart } </i></li>
								  		<li><span>应用行业</span><i>
								  			<c:forEach items="${CategoryIndustryProcessPart}" var="var1" varStatus="vs">
													<c:if test="${var1.id_CategoryIndustryProcessPart == var.IndustryProcessPart}">${var1.name_CategoryIndustryProcessPart }</c:if>	
											</c:forEach>
										</i></li>
								  		<li><span>备注</span><i>${var.RemarkProcessPart } </i></li>
									</ul>
									<div class="clear"></div>
							  	</div>
							</div>
							
			
							<div class="box_p">
								<h4>零件图片</h4>
							  	<p>
							    	<c:forEach items="${var.PictureProcessPart}" var="var1" varStatus="vs">
							      		<img name='PictureProcessParts_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_ProcessPartFile }' />
							      		<a class="btn" onclick="onShowPdf('${var1.url_ProcessPartFile }');">预览</a>
							      		<br/>
							    	</c:forEach>
							  	</p>
							</div>
							<div class="box_p">
							  	<h4>详细信息</h4>
							  	<p>
							    	<c:forEach items="${var.InformProcessPart}" var="var1" varStatus="vs">
							      		<span name='InformProcessParts_img' >${var1.name_ProcessPartFile }</span>
							      		<a class="btn" onclick="onShowPdf('${var1.url_ProcessPartFile }');">预览</a>
							      		<br/>
							    	</c:forEach>
							  	</p>
							</div>
							<div class="box_p">
							  	<h4>图纸文件</h4>
							  	<p>
							    	<c:forEach items="${var.PartProcessPart}" var="var1" varStatus="vs">
							      		<span name='PartProcessParts_img' >${var1.name_ProcessPartFile }</span>
							      		<a class="btn" onclick="onShowPdf('${var1.url_ProcessPartFile }');">预览</a>
							      	<br/>
							    	</c:forEach>
							  	</p>
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
	  		<ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="ProcessPart/ProcessPartList"/>
		</div>
	</div>
</div>
</body>
</html>
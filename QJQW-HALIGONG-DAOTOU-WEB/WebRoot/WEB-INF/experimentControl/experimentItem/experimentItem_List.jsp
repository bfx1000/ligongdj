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
			var url = "<%=path%>/experimentItem/experimentItemList";
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
			window.location.href='<%=path%>/experimentItem/goAddExperimentPart?id=';
		}
		
		
		//修改
		function edit(id){
			window.location.href='<%=path%>/experimentItem/goAddExperimentPart?id=' + id;
		}
		
		//展开折叠详细
		function onShowDetial(id_BTADrill){
			$("#ulli_" + id_BTADrill).toggle();
		}
		
		//删除
		function del(id_experimentPart){
			if(confirm("确定要删除吗?")){
				var url = "<%=path%>/experimentItem/deleteExperimentItemList?id_experimentPart=" + id_experimentPart;
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
	<form action="experimentItem/experimentItemList" method="post" name="Form" id="Form">
	  <%-- <div class="box_input_min">
		<input name="keyword" tpye="text" class="sousuo_text_min" value="${pd.keyword }" />	
		<a class="sousuo_btn_min" onclick="onSearchKey();">搜索</a>	
	  </div> --%>
	  
	  <div class="search_wrap">
  
	  	<div class="search_input_wrap">
		  	<span>零件名称<input name="nameExperimentPart" tpye="text" value="${pd.nameExperimentPart }" /></span>
		  	<span>零件编号<input name="numberExperimentPart" tpye="text" value="${pd.numberExperimentPart }" /></span>
		  	<span>零件类别
		  	  <select name="typeExperimentPart" class="select" style="width : 100px;">
						<option value="">请选择</option>
				<c:forEach items="${CategoryExperimentPart}" var="var" varStatus="vs">
						<option value="${var.id_typeExperimentPart }" ${pd.typeExperimentPart == var.id_typeExperimentPart ? 'selected' : '' }>${var.name_typeExperimentPart }</option>	
				</c:forEach>
		  </select>
		  	</span>
		  	<span>材料牌号<input name="numberMaterialExperimentPart" tpye="text" value="${pd.numberMaterialExperimentPart }" /></span>
		  	<span>材料类别<input name="categoryMaterialExperimentPart" tpye="text" value="${pd.categoryMaterialExperimentPart }" /></span>
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
			<span class="label_wrap"><input type="checkbox" checked="checked" />材料牌号</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />材料类别</span>
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
			<span class="list_title skz_hide  skz_list3" >&nbsp;材料牌号</span>
			<span class="list_title skz_hide  skz_list4" >&nbsp;材料类别</span>
			<span class="list_title skz_hide  skz_list5" style="display: none;">备注</span>
			<span class="list_title opera_wrap  skz_hide  skz_list6">&nbsp;&nbsp;&nbsp;操作</span>
		</div>
		<c:choose>
    		<c:when test="${not empty ExperimentItem}">
	  			<c:forEach items="${ExperimentItem}" var="var" varStatus="vs">	
					<div class="each_list_wrap"  >
						<div class="onclick" onclick="onShowDetial(${var.id_experimentPart });"></div>
						<span class="  skz_hide  skz_list0">&nbsp;${var.nameExperimentPart }</span>
						<span class="skz_hide skz_list1" >&nbsp;${var.numberExperimentPart }</span>
						<span class="skz_hide skz_list2" >&nbsp;
							<c:forEach items="${CategoryExperimentPart}" var="var1" varStatus="vs">
									<c:if test="${var1.id_typeExperimentPart == var.typeExperimentPart}">${var1.name_typeExperimentPart }</c:if>	
							</c:forEach>
						</span>
						<span class="skz_hide  skz_list3"  >&nbsp;${var.numberMaterialExperimentPart}</span>
						<span class="skz_hide  skz_list4"  >&nbsp;
							<c:forEach items="${categoryMaterialExperimentPartList}" var="var1" varStatus="vs">
									<c:if test="${var1.id_CategoryMaterialExperimentPart == var.categoryMaterialExperimentPart}">${var1.name_CategoryMaterialExperimentPart }</c:if>	
							</c:forEach>
						</span>
						<span class="skz_hide  skz_list5" style="display: none;">&nbsp;${var.remarkExperimentPart}</span>
						<span class="opera_wrap  skz_hide  skz_list6">
							<span class="btn btn_xg" onclick="edit('${var.id_experimentPart}');">修改</span>
						    <span class="btn btn_sc" onclick="del('${var.id_experimentPart}');">删除</span>
						</span>
						<div class="clear"></div>	
						
						<!-- 展开详情   -->
						<div id="ulli_${var.id_experimentPart}"  data-name="0"  class="ulli" style="display: none;">
							<div class="box_xiangxi">
							<!--<img src="images/dtcp_img1.png" class="img1" alt="哈理工刀头" title="哈理工刀头"/> -->
								<div class="box_u1">
									<ul class="ul1">
								  		<li><span>零件名称</span><i>${var.nameExperimentPart } </i></li>
								  		<li><span>零件编号</span><div>${var.numberExperimentPart} </div></li>
								  		<li><span>零件类型</span><i>
								  			<c:forEach items="${CategoryExperimentPart}" var="var1" varStatus="vs">
													<c:if test="${var1.id_typeExperimentPart == var.typeExperimentPart}">${var1.name_typeExperimentPart }</c:if>	
											</c:forEach>
										</i></li>
								  		
									</ul>
									<ul class="ul1">
								  		<li><span>备注</span><i>${var.remarkExperimentPart}</i></li>
								  		<li><span>材料牌号</span><i>${var.numberMaterialExperimentPart } </i></li>
								  		<li><span>材料类别</span><i>
											<c:forEach items="${categoryMaterialExperimentPartList}" var="var1" varStatus="vs">
													<c:if test="${var1.id_CategoryMaterialExperimentPart == var.categoryMaterialExperimentPart}">${var1.name_CategoryMaterialExperimentPart }</c:if>	
											</c:forEach>
										</i></li>
									</ul>
									<div class="clear"></div>
							  	</div>
							</div>
							
			
							<div class="box_p">
								<h4>零件图片</h4>
							  	<p>
							    	<c:forEach items="${var.pictureExperimentPartList}" var="var1" varStatus="vs">
							      		<img name='pictureBTADrills_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_pictureExperimentPart }' />
							      		<a class="btn" onclick="onShowPdf('${var1.url_pictureExperimentPart }');">预览</a>
							      		<br/>
							    	</c:forEach>
							  	</p>
							</div>
							<div class="box_p">
							  	<h4>详细信息</h4>
							  	<p>
							    	<c:forEach items="${var.informDetailExperimentPartList}" var="var1" varStatus="vs">
							      		<span name='informDetailBTADrills_img' >${var1.name_informDetailExperimentPart }</span>
							      		<a class="btn" onclick="onShowPdf('${var1.url_informDetailExperimentPart }');">预览</a>
							      		<br/>
							    	</c:forEach>
							  	</p>
							</div>
							<div class="box_p">
							  	<h4>part文件</h4>
							  	<p>
							    	<c:forEach items="${var.partExperimentPartList}" var="var1" varStatus="vs">
							      		<span name='applicationBTADrills_img' >${var1.name_partExperimentPart }</span>
							      		<a class="btn" onclick="onShowPdf('${var1.url_partExperimentPart }');">预览</a>
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
	  		<ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="experimentItem/experimentItemList"/>
		</div>
	</div>
</div>
</body>
</html>
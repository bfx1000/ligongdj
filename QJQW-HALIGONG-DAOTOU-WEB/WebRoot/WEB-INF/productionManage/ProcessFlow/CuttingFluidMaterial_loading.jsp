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


<!--   列表内容  添加折叠  js    -->
<script type="text/javascript">
	function zd(id){
		$("#box_clcs"+id).css("display","block");
		$("#zd"+id).css("display","none");
		$("#zd1"+id).css("display","block");
	}
	function zd1(id){
		$("#box_clcs"+id).css("display","none");
		$("#zd"+id).css("display","block");
		$("#zd1"+id).css("display","none");
	}
</script>
<script type="text/javascript">
    
	//检索
	function onSearchKey(gxId){
		var url = "<%=path%>/ProcessFlow/jzAll?deputy=1&gxId="+gxId;
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
		window.location.href='<%=path%>/CuttingFluidMaterial/goAddCuttingFluidMaterial?id=';
	}
	
	//修改
	function edit(id){
		window.location.href='<%=path%>/CuttingFluidMaterial/goAddCuttingFluidMaterial?id=' + id;
	}
	
	//展开折叠详细
	function onShowDetial(id_TurningHolder){
		$("#ulli_" + id_TurningHolder).toggle();
	}
	
	//删除
	function del(id_CuttingFluidMaterial){
		if(confirm("确定要删除吗?")){
			var url = "<%=path%>/CuttingFluidMaterial/deleteCuttingFluidMaterial?id_CuttingFluidMaterial=" + id_CuttingFluidMaterial;
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
	
	function toCuttingFluidApply(){
		var url = '<%=path%>/CuttingFluidMaterial/toCuttingFluidApply';
		document.toApply.action = url ;
		$("#toApply").submit();
	}
</script>
</head>
<body>	
<a class="btn" onclick="window.parent.close();">返回</a>	
<form action="ProcessFlow/jzAll?deputy=1" method="post" name="toApply" id="toApply">
	
	<input name="WorkpieceMaterial" type="hidden" value="" />
	<input name="MachiningMethod" type="hidden" value="" />
	<input name="MachiningPrecision" type="hidden" value="" />
	
</form>

<div class="content_box_table">
  <form action="CuttingFluidMaterial/queryCuttingFluidMaterialList" method="post" name="Form" id="Form">
    <div class="search_wrap">
	  <div class="search_input_wrap">
		<span>切削液名称
			<input name="NameCuttingFluid" tpye="text" value="${pd.NameCuttingFluid }" />
		</span>
		<span>切削液编号
			<input name="NumberCuttingFluid" tpye="text" value="${pd.NumberCuttingFluid }" />
		</span>
		<span>机床类别
		  <select name="CategoryCuttingFluid" class="select" style="width : 100px;">
			<option value="">请选择</option>
				<c:forEach items="${CategoryCuttingFluidMaterialList}" var="var" varStatus="vs">
						<option value="${var.id_CategoryCuttingFluid }" ${pd.CategoryCuttingFluid == var.id_CategoryCuttingFluid ? 'selected' : '' }>${var.name_CategoryCuttingFluid }</option>	
				</c:forEach>
		  </select>
		</span>
		<span>供应商
			<input name="CompanyCuttingFluid" tpye="text" value="${pd.CompanyCuttingFluid }" />
		</span>
		<div class="clear"></div>
	  </div>
	  <div class="opera_img">
		<img src="/resources/images/ico_n.png" data-name="0"  onclick="changeOpera(this);"  alt="展开" />
	  </div>		  
	  <a class="sousuo_btn_min" onclick="onSearchKey(${gxId});">搜索</a>			  
	  <div class="clear"></div>
	</div>
  </form>
  <!-- 复选框   -->
  <div class="search_wrap">
	<div class="check_wrap">	
	  <span class="label_wrap"><input type="checkbox" checked="checked" />切削液名称</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />切削液编号</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />切削液种类</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />供应商</span>
	</div>
	<div class="opera_img">
	  <img src="/resources/images/ico_n.png" data-name="0"  onclick="changeOpera(this);"  alt="展开" />
	</div>
	<div class="choose_show_btn"  onclick="selectData();" >应用</div>	
	<div class="clear"></div>
	
  </div>
  
  <div class="content_wrap">
  	 <div class="each_list_wrap" style="background: white;">
			<span class="list_title skz_hide skz_list0">&nbsp;切削液名称</span> 
 			<span class="list_title skz_hide skz_list1">&nbsp;切削液牌号</span> 
 			<span class="list_title skz_hide skz_list2">&nbsp;切削液类别</span> 
 			<span class="list_title skz_hide skz_list3"  >&nbsp;供应商</span> 
			<span class="list_title opera_wrap  skz_hide  skz_list4">&nbsp;&nbsp;&nbsp;操作</span>	
		</div>
    <c:choose>
      <c:when test="${not empty cuttingFluidMaterialList}">
	    <c:forEach items="${cuttingFluidMaterialList}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_CuttingFluidMaterial });"></div>
			<span class="  skz_hide skz_list0">&nbsp;${var.NameCuttingFluid }</span> 
 			<span class="skz_hide skz_list1">&nbsp;${var.NumberCuttingFluid }</span> 
 			<span class="skz_hide skz_list2">&nbsp;
				<c:forEach items="${CategoryCuttingFluidMaterialList}" var="var1" varStatus="vs">
					<c:if test="${var1.id_CategoryCuttingFluid == var.CategoryCuttingFluid}">${var1.name_CategoryCuttingFluid }</c:if>	
				</c:forEach>
 			</span> 
 			<span class="skz_hide skz_list3"  >&nbsp;${var.CompanyCuttingFluid }</span> 
			<span class="opera_wrap  skz_hide  skz_list4">
			  &nbsp;&nbsp; <span class="btn btn_xg" onclick="window.parent.opt(1,${gxId },'${var.NumberCuttingFluid}');">选择</span>
			</span>					
			<div class="clear"></div>
			<!-- 展开详情   -->
			<div id="ulli_${var.id_CuttingFluidMaterial}" class="ulli" style="display: none;">
					<!--  列表内容  添加折叠内容  -->
					<div class="box_xiangxi">
						<div class="box_u1">
								<ul class="ul1">
								  <li><span>切削液名称</span><i>${var.NameCuttingFluid }</i></li>
								  <li><span>切削液牌号</span><i>${var.NumberCuttingFluid }</i></li>
								</ul>
								<ul class="ul1">
								  <li><span>切削液类别</span><i>
									    <c:forEach items="${CategoryCuttingFluidMaterialList}" var="var1" varStatus="vs">
											<c:if test="${var1.id_CategoryCuttingFluid == var.CategoryCuttingFluid}">${var1.name_CategoryCuttingFluid }</c:if>	
										</c:forEach>	
								  </i></li>
								  <li><span>供应商</span><i>${var.CompanyCuttingFluid}</i></li>
								</ul>
								<div class="clear"></div>
						  </div>
					</div>
					
					<div class="box_p">
							<h4>切削液配方</h4>
							<p class = "p">${var.FormulaCuttingFluid}</p>
					</div>
					<div class="box_p">
							<h4>切削液性能特征</h4>
							<p class = "p">${var.CharacterCuttingFluid}</p>
					</div>
					<div class="box_p">
							<h4>切削液技术指标</h4>
							<p class = "p">${var.TechnicalCuttingFluid}</p>
					</div>
					<div class="box_xiangxi zhedie">
						<div class="box_zhedie">
							<span class="a_zhedie1" id = "zd${var.id_CuttingFluidMaterial }" onclick = "zd(${var.id_CuttingFluidMaterial });" style="display:block;">材料参数</span>
							<span class="a_zhedie2" id = "zd1${var.id_CuttingFluidMaterial }" onclick = "zd1(${var.id_CuttingFluidMaterial });" style="display:none;">材料参数</span>
						</div>
						<div class="box_u1" id="box_clcs${var.id_CuttingFluidMaterial }" style="display:none">
							<div class="box_p">
										  <h4>切削液应用</h4>
										  <p><table border="1" class="box_table li_table">
												  <tr>
													<th class="th">工件材料</td>
													<td class="th">加工方式</td>
													<td class="th">加工精度</td>
												  </tr>
												  <c:forEach items="${var.UsingCuttingFluidList}" var="var1" varStatus="vs">
												  <tr>
													<td class="td">${var1.WorkpieceMaterial }</td>
													<td class="td">${var1.MachiningMethod }</td>
													<td class="td">${var1.MachiningPrecision }</td>
												  </tr>
												  </c:forEach>
												 
											</table>
											</p>
										</div>
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
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="ProcessFlow/jzAll?deputy=1&gxId=${gxId}"/>
	</div>
  </div>
</div>

</body>
</html>


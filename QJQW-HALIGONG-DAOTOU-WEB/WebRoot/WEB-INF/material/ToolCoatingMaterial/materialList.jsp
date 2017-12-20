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
	function onSearchKey(){
		var url = "<%=path%>/CoatingMaterial/queryCoatingMaterialList";
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
		window.location.href='<%=path%>/CoatingMaterial/goAddCoatingMaterial?id=';
	}
	
	//修改
	function edit(id){
		window.location.href='<%=path%>/CoatingMaterial/goAddCoatingMaterial?id=' + id;
	}
	
	//展开折叠详细
	function onShowDetial(id_ToolCoatingMaterial){
		$("#ulli_" + id_ToolCoatingMaterial).toggle();
	}
	
	//删除
	function del(id_ToolCoatingMaterial){
		if(confirm("确定要删除吗?")){
			var url = "<%=path%>/CoatingMaterial/deleteCoatingMaterial?id_ToolCoatingMaterial=" + id_ToolCoatingMaterial;
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
  <form action="CoatingMaterial/queryCoatingMaterialList" method="post" name="Form" id="Form">
    <div class="search_wrap">
	  <div class="search_input_wrap">
		<span>涂层名称
			<input name="NameToolCoating" tpye="text" value="${pd.NameToolCoating }" />
		</span>
		<span>涂层编号
			<input name="NumberToolCoating" tpye="text" value="${pd.NumberToolCoating }" />
		</span>
		<span>涂层类别
		  <!-- 刀片类型(1 外圆切削 2 内孔切削 3 超硬刀具 4 重型加工刀片) -->
		  <select name="CategoryToolCoating" class="select" style="width : 100px;">
		  	<option value="">请选择</option>	
		  	<c:forEach items="${categoryToolCoatingList}" var="var" varStatus="vs">
				<option value="${var.id_CategoryToolCoating }" ${pd.CategoryToolCoating == var.id_CategoryToolCoating ? 'selected' : '' }>${var.name_CategoryToolCoating }</option>	
			</c:forEach>
		  </select>
		</span>
		<span>涂层工艺
		  <select name="ProcessingToolCoating" class="select">
		  	<option value="">请选择</option>	
			<option value="1" ${pd.ProcessingToolCoating == 1 ? 'selected' : '' }>PVD物理涂层</option>
			<option value="2" ${pd.ProcessingToolCoating == 2 ? 'selected' : '' }>CVD化学涂层</option>
		  </select>
		</span>
		<span>供应商
			<input name="CompanyToolCoating" tpye="text" value="${pd.CompanyToolCoating }" />
		</span>
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
	  <span class="label_wrap"><input type="checkbox" checked="checked" />涂层名称</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />涂层编号</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />涂层类别</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />涂层工艺</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />供应商</span>
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
			<span class="list_title skz_hide skz_list0">&nbsp;涂层名称</span> 
 			<span class="list_title skz_hide skz_list1">&nbsp;涂层编号</span> 
 			<span class="list_title skz_hide skz_list2">&nbsp;涂层类别</span> 
 			<span class="list_title skz_hide skz_list3">&nbsp;涂层工艺</span> 
 			<span class="list_title skz_hide skz_list4">&nbsp;供应商</span> 
			<span class="list_title opera_wrap  skz_hide skz_list5">&nbsp;&nbsp;&nbsp;操作</span>
		</div>
    <c:choose>
      <c:when test="${not empty materialList}">
	    <c:forEach items="${materialList}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_ToolCoatingMaterial });"></div>
			<span class="  skz_hide skz_list0">&nbsp;${var.NameToolCoating }</span> 
 			<span class="skz_hide skz_list1">&nbsp;${var.NumberToolCoating }</span> 
 			<span class="skz_hide skz_list2">&nbsp;
	 			<c:forEach items="${categoryToolCoatingList}" var="var1" varStatus="vs">
	 				<c:if test="${var1.id_CategoryToolCoating == var.CategoryToolCoating}">${var1.name_CategoryToolCoating }</c:if>
				</c:forEach>
 			</span> 
 			<span class="skz_hide skz_list3"  >&nbsp;
 				<c:choose>
			    <c:when test="${var.ProcessingToolCoating == 1}">PVD物理涂层</c:when>
			    <c:when test="${var.ProcessingToolCoating == 2}">CVD化学涂层</c:when>
			 	</c:choose>
 			</span> 
 			<span class="skz_hide skz_list4"  >&nbsp;${var.CompanyToolCoating }</span> 
			<span class="opera_wrap  skz_hide  skz_list5">
			  <span class="btn btn_xg" onclick="edit('${var.id_ToolCoatingMaterial }');">修改</span>
			  <span class="btn btn_sc" onclick="del('${var.id_ToolCoatingMaterial }');">删除</span>
			</span>					
			<div class="clear"></div>
			<!-- 展开详情   -->
			<div id="ulli_${var.id_ToolCoatingMaterial}" class="ulli" style="display: none;">
					<!--  列表内容  添加折叠内容  -->
					<div class="box_xiangxi">
						<div class="box_u1">
								<ul class="ul1">
								  <li><span>涂层名称</span><i>${var.NameToolCoating }</i></li>
								  <li><span>涂层编号</span><i>${var.NumberToolCoating }</i></li>
								  <li><span>涂层类别</span><i>
								  <c:forEach items="${categoryToolCoatingList}" var="var1" varStatus="vs">
										<c:if test="${var1.id_CategoryToolCoating == var.CategoryToolCoating}">${var1.name_CategoryToolCoating }</c:if>
								  </c:forEach>
								  </i></li>
								</ul>
								<ul class="ul1">
									<li><span>涂层工艺</span><i>
								  		<c:choose>
										    <c:when test="${var.ProcessingToolCoating == 1}">PVD物理涂层</c:when>
										    <c:when test="${var.ProcessingToolCoating == 2}">CVD化学涂层</c:when>
								 		</c:choose></i></li>
								  <li><span>供应商</span><i>${var.CompanyToolCoating }</i></li>
								</ul>
								<div class="clear"></div>
						  </div>
					</div>
					
					<div class="box_p">
					  <h4>涂层主要成分</h4>
						<table border="1" class="li_table box_table">
							  <tr>
								<th class="th">元素</th>
								<c:forEach items="${var.ISOToolCoatingList}" var="var1" varStatus="vs1">
 											<td class="td">${var1.yuansu }</td>
									</c:forEach>
							  </tr>
							  <tr>
								<th class="th">百分比</th>
								<c:forEach items="${var.ISOToolCoatingList}" var="var1" varStatus="vs">
 											<td class="td">${var1.baifenbi }</td>
 									</c:forEach>
							  </tr>
						</table><br>	
					</div>
					<div class="box_p">
							<h4>涂层特点</h4>
							<p class = "p">${var.CharacterToolCoating}</p>
					</div>
					<div class="box_p">
					    <h4>图片</h4>
					    <p>
					      <c:forEach items="${var.pictureCoatingMaterialList}" var="var1" varStatus="vs">
					        <img name='pictureTurningHolders_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_PictureToolCoating }' />
					        <a class="btn" onclick="onShowPdf('${var1.url_PictureToolCoating }');">预览</a>
					        <br/>
					      </c:forEach>
					    </p>
					</div>
				
					<div class="box_p">
					  <h4>详细信息</h4>
					  <p>
						<c:forEach items="${var.informDetailCoatingMaterialList}" var="var1" varStatus="vs">
				      		<span name='informDetailMaterials_img' >${var1.name_InformDetailToolCoating }</span>
				      		<a class="btn" onclick="onShowPdf('${var1.url_InformDetailToolCoating }');">预览</a>
		      				<br/>
		    			</c:forEach>
					  </p>
					</div>
					<div class="box_p">
					  <h4>应用实例</h4>
					  <p>
						<c:forEach items="${var.applicationCoatingMaterialList}" var="var1" varStatus="vs">
				      		<span name='applicationMaterials_img' >${var1.name_ApplicationToolCoating }</span>
				      		<a class="btn" onclick="onShowPdf('${var1.url_ApplicationToolCoating }');">预览</a>
		      				<br/>
		    			</c:forEach>
					  </p>
					</div>
					<div class="box_xiangxi zhedie">
						<div class="box_zhedie">
							<span class="a_zhedie1" id = "zd${var.id_ToolCoatingMaterial }" onclick = "zd(${var.id_ToolCoatingMaterial });" style="display:block;">材料参数</span>
							<span class="a_zhedie2" id = "zd1${var.id_ToolCoatingMaterial }" onclick = "zd1(${var.id_ToolCoatingMaterial });" style="display:none;">材料参数</span>
						</div>
						<div class="box_u1" id="box_clcs${var.id_ToolCoatingMaterial }" style="display:none">
							<ul class="ul1">
							  <li><span>涂层颜色：</span> &nbsp;${var.ColourToolCoating} </li>
							  <li><span>涂层硬度：</span> &nbsp;${var.HardnessToolCoating} </li>
							  <li><span>涂层厚度：</span> &nbsp;${var.ThicknessToolCoating} </li>
							</ul>
							<ul class="ul1">
							  <li><span>摩擦系数：</span> &nbsp;${var.FrictionToolCoating } </li>
							  <li><span>使用温度：</span> &nbsp;${var.TemperatureToolCoating} </li>
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
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="CoatingMaterial/queryCoatingMaterialList"/>
	</div>
  </div>
</div>

</body>
</html>


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
		var url = "<%=path%>/cuttingToolMaterial/queryCuttingToolMaterialList";
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
		window.location.href='<%=path%>/cuttingToolMaterial/goAddCuttingToolMaterial?id=';
	}
	
	//修改
	function edit(id){
		window.location.href='<%=path%>/cuttingToolMaterial/goAddCuttingToolMaterial?id=' + id;
	}
	
	//展开折叠详细
	function onShowDetial(id_TurningHolder){
		$("#ulli_" + id_TurningHolder).toggle();
	}
	
	//删除
	function del(id_CuttingToolMaterialD){
		if(confirm("确定要删除吗?")){
			var url = "<%=path%>/cuttingToolMaterial/deleteCuttingToolMaterial?id_CuttingToolMaterialD=" + id_CuttingToolMaterialD;
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
  <form action="cuttingToolMaterial/queryCuttingToolMaterialList" method="post" name="Form" id="Form">
    <div class="search_wrap">
	  <div class="search_input_wrap">
		<span>刀具材料名称
			<input name="NameToolMaterial" tpye="text" value="${pd.NameToolMaterial }" />
		</span>
		<span>刀具材料牌号
			<input name="NumberToolMaterial" tpye="text" value="${pd.NumberToolMaterial }" />
		</span>
		<span>材料类别
		  <!-- 刀片类型(1 外圆切削 2 内孔切削 3 超硬刀具 4 重型加工刀片) -->
		  <select name="CategoryToolMaterial" class="select" style="width : 100px;">
		  	<option value="">请选择</option>	
		  	<option value="1" ${pd.CategoryToolMaterial == 1 ? 'selected' : '' }>高速钢</option>
			<option value="2" ${pd.CategoryToolMaterial == 2 ? 'selected' : '' }>硬质合金</option>
			<option value="3" ${pd.CategoryToolMaterial == 3 ? 'selected' : '' }>金属陶瓷</option>
			<option value="4" ${pd.CategoryToolMaterial == 4 ? 'selected' : '' }>陶瓷</option>
			<option value="5" ${pd.CategoryToolMaterial == 5 ? 'selected' : '' }>超硬刀具</option>
			<option value="6" ${pd.CategoryToolMaterial == 6 ? 'selected' : '' }>其他</option>
		  </select>
		</span>
		<span>供应商
			<input name="CompanyToolMaterial" tpye="text" value="${pd.CompanyToolMaterial }" />
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
	  <span class="label_wrap"><input type="checkbox" checked="checked" />刀具材料名称</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />刀具材料牌号</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />材料类别</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />供应商</span>
	</div>
	<div class="opera_img">
	  <img src="/resources/images/ico_n.png" data-name="0"  onclick="changeOpera(this);"  alt="展开" />
	</div>
	<div class="choose_show_btn"  onclick="selectData();" >应用</div>	
	<div class="clear"></div>
  </div>
  <!-- 新增按钮   -->
  <div class="addbtn_wrap">
	<a class="btn" onclick="add();">新增</a>
  </div>
  <div class="content_wrap">
  	<div class="each_list_wrap" style="background: white;">
			<span class="list_title skz_hide skz_list0">刀具材料名称</span> 
 			<span class="list_title skz_hide skz_list1">刀具材料牌号</span> 
 			<span class="list_title skz_hide skz_list2">&nbsp;&nbsp;材料类别</span> 
 			<span class="list_title skz_hide skz_list3" >&nbsp;供应商</span> 
			<span class="list_title opera_wrap  skz_hide  skz_list4">&nbsp;&nbsp;&nbsp;操作</span>
		</div>
    <c:choose>
      <c:when test="${not empty categoryMaterialList}">
	    <c:forEach items="${categoryMaterialList}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_CuttingToolMaterialD });"></div>
			<span class="  skz_hide skz_list0">&nbsp;${var.NameToolMaterial }</span> 
 			<span class="skz_hide skz_list1">&nbsp;${var.NumberToolMaterial }</span> 
 			<span class="skz_hide skz_list2">&nbsp;
				<c:forEach items="${categoryToolMaterialList}" var="var1" varStatus="vs">
					<c:if test="${var1.id_CategoryToolMaterial == var.CategoryToolMaterial}">${var1.name_CategoryToolMaterial }</c:if>	
				</c:forEach>
 			</span> 
 			<span class="skz_hide skz_list3"  >&nbsp;${var.CompanyToolMaterial }</span> 
			<span class="opera_wrap  skz_hide  skz_list4">
			  <span class="btn btn_xg" onclick="edit('${var.id_CuttingToolMaterialD}');">修改</span>
			  <span class="btn btn_sc" onclick="del('${var.id_CuttingToolMaterialD}');">删除</span>
			</span>					
			<div class="clear"></div>
			<!-- 展开详情   -->
			<div id="ulli_${var.id_CuttingToolMaterialD}" class="ulli" style="display: none;">
					<!--  列表内容  添加折叠内容  -->
					<div class="box_xiangxi">
						<div class="box_u1">
								<ul class="ul1">
								  <li><span>刀具材料名称</span><i>${var.NameToolMaterial }</i></li>
								  <li><span>刀具材料牌号</span><i>${var.NumberToolMaterial }</i></li>
								</ul>
								<ul class="ul1">
								  <li><span>材料类别</span><i>
									    <c:forEach items="${categoryToolMaterialList}" var="var1" varStatus="vs">
											<c:if test="${var1.id_CategoryToolMaterial == var.CategoryToolMaterial}">${var1.name_CategoryToolMaterial }</c:if>	
										</c:forEach>	
								  </i></li>
								  <li><span>供应商</span><i>${var.CompanyToolMaterial}</i></li>
								</ul>
								<div class="clear"></div>
						  </div>
					</div>
					<div class="box_p">
					  	<h4>材料主要成分</h4>
						<table border="1" class="li_table box_table">
							  <tr>
								<th class="th">元素</th>
								<c:forEach items="${var.ISOCuttingMaterialList}" var="var1" varStatus="vs1">
 											<td class="td">${var1.yuansu }</td>
									</c:forEach>
							  </tr>
							  <tr>
								<th class="th">百分比</th>
								<c:forEach items="${var.ISOCuttingMaterialList}" var="var1" varStatus="vs">
 											<td class="td">${var1.baifenbi }</td>
 									</c:forEach>
							  </tr>
						</table><br>	
					</div>
					<div class="box_p">
							<h4>刀具材料特点</h4>
							<p class = "p">${var.MachineableMaterial}</p>
					</div>
					<div class="box_p">
					    <h4>图片</h4>
					    <p>
					      <c:forEach items="${var.pictureToolMaterialList}" var="var1" varStatus="vs">
					        <img name='pictureTurningHolders_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_PictureToolMaterial }' />
					        <a class="btn" onclick="onShowPdf('${var1.url_PictureToolMaterial }');">预览</a>
					        <br/>
					      </c:forEach>
					    </p>
					</div>
				
					<div class="box_p">
					  <h4>详细信息</h4>
					  <p>
						<c:forEach items="${var.informToolMaterialList}" var="var1" varStatus="vs">
				      		<span name='informDetailMaterials_img' >${var1.name_InformToolMaterial }</span>
				      		<a class="btn" onclick="onShowPdf('${var1.url_InformToolMaterial }');">预览</a>
		      				<br/>
		    			</c:forEach>
					  </p>
					</div>
					<div class="box_p">
					  <h4>应用实例</h4>
					  <p>
						<c:forEach items="${var.applicationToolMaterialList}" var="var1" varStatus="vs">
				      		<span name='applicationMaterials_img' >${var1.name_ApplicationToolMaterial }</span>
				      		<a class="btn" onclick="onShowPdf('${var1.url_ApplicationToolMaterial }');">预览</a>
		      				<br/>
		    			</c:forEach>
					  </p>
					</div>
					<div class="box_xiangxi zhedie">
						<div class="box_zhedie">
							<span class="a_zhedie1" id = "zd${var.id_CuttingToolMaterialD }" onclick = "zd(${var.id_CuttingToolMaterialD });" style="display:block;">材料参数</span>
							<span class="a_zhedie2" id = "zd1${var.id_CuttingToolMaterialD }" onclick = "zd1(${var.id_CuttingToolMaterialD });" style="display:none;">材料参数</span>
						</div>
						<div class="box_u1" id="box_clcs${var.id_CuttingToolMaterialD }" style="display:none">
							<ul class="ul1">
							  <li><span>刀具材料密度：</span> &nbsp;${var.DensityToolMaterial} </li>
							  <li><span>刀具材料硬度：</span> &nbsp;${var.HardnessToolMaterial} </li>
							  <li><span>抗弯强度：</span> &nbsp;${var.BendingStrengthToolMaterial} </li>
							  <li><span>冲击韧性：</span> &nbsp;${var.ImpactToughnessToolMaterial } </li>
							</ul>
							<ul class="ul1">
							  <li><span>弹性模量：</span> &nbsp;${var.ModulusToolMaterial } </li>
							  <li><span>耐热性：</span> &nbsp;${var.HeatResistanceToolMaterial} </li>
							  <li><span>材料热导率：</span> &nbsp;${var.ConductivityToolMaterial } </li>
							  <li><span>热膨胀系数：</span> &nbsp;${var.ThermalexpansionToolMaterial } </li>
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
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="cuttingToolMaterial/queryCuttingToolMaterialList"/>
	</div>
  </div>
</div>

</body>
</html>


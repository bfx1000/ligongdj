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
	<script src="<%=path%>/resources/Highcharts-5.0.5/code/highcharts.js"></script>
	<script src="<%=path%>/resources/Highcharts-5.0.5/code/highcharts-3d.js"></script>
    <script src="<%=path%>/resources/Highcharts-5.0.5/code/js/modules/exporting.js"></script>

<script type="text/javascript">
    
	//检索
	function onSearchKey(){
		var url = "<%=path%>/material/queryMaterialList";
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
		window.location.href='<%=path%>/material/goAddMaterial?id=';
	}
	
	//修改
	function edit(id){
		window.location.href='<%=path%>/material/goAddMaterial?id=' + id;
	}
	
	//展开折叠详细
	function onShowDetial(id_TurningHolder){
		$("#ulli_" + id_TurningHolder).toggle();
	}
	
	//删除
	function del(id_TurningBlade){
		if(confirm("确定要删除吗?")){
			var url = "<%=path%>/material/deleteTurningBlade?id_Material=" + id_TurningBlade;
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
  <form action="material/queryMaterialList" method="post" name="Form" id="Form">
    <div class="search_wrap">
	  <div class="search_input_wrap">
		<span>材料名称
			<input name="NameMaterial" tpye="text" value="${pd.NameMaterial }" />
		</span>
		<span>材料牌号
			<input name="NumberMaterial" tpye="text" value="${pd.NumberMaterial }" />
		</span>
		<span>材料类别
		  <!-- 刀片类型(1 外圆切削 2 内孔切削 3 超硬刀具 4 重型加工刀片) -->
		  <select name="id_CategoryMaterial" class="select" style="width : 100px;">
		  	<option value="">请选择</option>	
		  	<c:forEach items="${categoryMaterialList}" var="var" varStatus="vs">
				<option value="${var.id_CategoryMaterial }" ${pd.id_CategoryMaterial == var.id_CategoryMaterial ? 'selected' : '' }>${var.name_CategoryMaterial }</option>	
			</c:forEach>
		  </select>
		</span>
		<span>ISO加工分类
		  <select name="ISOCuttingMaterial" class="select">
		  	<option value="">请选择</option>	
			<option value="P" ${pd.ISOCuttingMaterial == 'P' ? 'selected' : '' }>P</option>
			<option value="M" ${pd.ISOCuttingMaterial == 'M' ? 'selected' : '' }>M</option>
			<option value="K" ${pd.ISOCuttingMaterial == 'K' ? 'selected' : '' }>K</option>
			<option value="N" ${pd.ISOCuttingMaterial == 'N' ? 'selected' : '' }>N</option>
			<option value="S" ${pd.ISOCuttingMaterial == 'S' ? 'selected' : '' }>S</option>
			<option value="H" ${pd.ISOCuttingMaterial == 'H' ? 'selected' : '' }>H</option>
		  </select>
		</span>
		<span>热处理方式
			<input name="CategoryMaterial" tpye="text" value="${pd.CategoryMaterial }" />
		</span>
		<span>供应商
			<input name="CompanyMaterial" tpye="text" value="${pd.CompanyMaterial }" />
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
	  <span class="label_wrap"><input type="checkbox" checked="checked" />材料名称</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />材料牌号</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />材料类别</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />ISO加工分类</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />热处理方式</span>
	  <span class="label_wrap"><input type="checkbox" />供应商</span>
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
			<span class="list_title skz_hide skz_list0">&nbsp;材料名称</span> 
 			<span class="list_title skz_hide skz_list1">&nbsp;材料牌号</span> 
 			<span class="list_title skz_hide skz_list2">&nbsp;材料类别</span> 
 			<span class="list_title skz_hide skz_list3"  >&nbsp;ISO加工分类</span> 
 			<span class="list_title skz_hide skz_list4"  >&nbsp;热处理方式</span> 
 			<span class="list_title skz_hide skz_list5" style="display: none;">&nbsp;供应商</span> 
			<span class="list_title opera_wrap  skz_hide  skz_list6">&nbsp;&nbsp;&nbsp;操作</span>	
		</div>
    <c:choose>
      <c:when test="${not empty materialList}">
	    <c:forEach items="${materialList}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_Material });"></div>
			<span class="  skz_hide skz_list0">&nbsp;${var.NameMaterial }</span> 
 			<span class="skz_hide skz_list1">&nbsp;${var.NumberMaterial }</span> 
 			<span class="skz_hide skz_list2">&nbsp;
	 			<c:forEach items="${categoryMaterialList}" var="var1" varStatus="vs">
	 				<c:if test="${var1.id_CategoryMaterial == var.id_CategoryMaterial}">${var1.name_CategoryMaterial }</c:if>
				</c:forEach>
 			</span> 
 			<span class="skz_hide skz_list3"  >&nbsp;${var.ISOCuttingMaterial }</span> 
 			<span class="skz_hide skz_list4"  >&nbsp;${var.CategoryMaterial }</span> 
 			<span class="skz_hide skz_list5" style="display: none;">&nbsp;${var.CompanyMaterial }</span> 
			<span class="opera_wrap  skz_hide  skz_list6">
			  <span class="btn btn_xg" onclick="edit('${var.id_Material}');">修改</span>
			  <span class="btn btn_sc" onclick="del('${var.id_Material}');">删除</span>
			</span>					
			<div class="clear"></div>
			<!-- 展开详情   -->
			<div id="ulli_${var.id_Material}" class="ulli" style="display: none;">
					<!--  列表内容  添加折叠内容  -->
										<div class="box_xiangxi">
											<div class="box_u1">
													<ul class="ul1">
													  <li><span>材料名称</span><i>${var.NameMaterial }</i></li>
													  <li><span>材料类别</span><i>
													  <c:forEach items="${categoryMaterialList}" var="var1" varStatus="vs">
	 				<c:if test="${var1.id_CategoryMaterial == var.id_CategoryMaterial}">${var1.name_CategoryMaterial }</c:if>
				</c:forEach>
													  </i></li>
													  <li><span>热处理方式</span><i>${var.CategoryMaterial }</i></li>
													</ul>
													<ul class="ul1">
													  <li><span>材料牌号</span>	<i>${var.NumberMaterial }</i></li>
													  <li><span>ISO加工分类</span><i>${var.ISOCuttingMaterial }</i></li>
													  <li><span>供应商</span><i>${var.CompanyMaterial}</i></li>
													</ul>
													<div class="clear"></div>
											  </div>
										</div>
										
										<div class="box_p">
										  <h4>材料主要成分</h4>
										  <p>
												<table border="1" class="li_table box_table">
													  <tr>
														<th class="th">元素</td>
														<c:forEach items="${var.ConstituentsMaterialList}" var="var1" varStatus="vs1">
			    	<td class="td">${var1.yuansu }</td>
			    </c:forEach>
<!-- 														<td class="td">铁</td> -->
<!-- 														<td class="td">铬</td> -->
<!-- 														<td class="td">铬</td> -->
<!-- 														<td class="td">铬</td> -->
													  </tr>
													  <tr>
														<th class="th">百分比</td>
														<c:forEach items="${var.ConstituentsMaterialList}" var="var1" varStatus="vs">
			    	<td class="td">${var1.baifenbi }</td>
			    </c:forEach>
<!-- 														<td class="td">65%</td> -->
<!-- 														<td class="td">3%</td> -->
<!-- 														<td class="td">3%</td> -->
<!-- 														<td class="td">3%</td> -->
													  </tr>
												</table>
											</p>
										</div>
										<div class="box_p">
										  <h4>材料加工性</h4>
										  <p class="p">${var.MachineableMaterial }</p>
										</div>
									
										<div class="box_p">
										  <h4>详细信息</h4>
										  <p>
											<c:forEach items="${var.informDetailMaterialList}" var="var1" varStatus="vs">
							      		<span name='informDetailMaterials_img' >${var1.name_InformDetailMaterial }</span>
							      		<a class="btn" onclick="onShowPdf('${var1.url_InformDetailMaterial }');">预览</a>
							      		<br/>
							    	</c:forEach>
											</p>
										</div>
										<div class="box_p">
										  <h4>应用实例</h4>
										  <p>
											<c:forEach items="${var.applicationMaterialList}" var="var1" varStatus="vs">
							      		<span name='applicationMaterials_img' >${var1.name_ApplicationMaterial }</span>
							      		<a class="btn" onclick="onShowPdf('${var1.url_ApplicationMaterial }');">预览</a>
							      		<br/>
							    	</c:forEach>
											</p>
										</div>
										
										<div class="box_p">
										  <h4>应变 应变率</h4>
										  <p><table border="1" class="box_table li_table">
												  <tr>
													<th class="th">数据点</td>
													<td class="th">温度</td>
													<td class="th">应变</td>
													<td class="th">应变率</td>
												  </tr>
												  <c:forEach items="${var.StrainRateList}" var="var1" varStatus="vs">
												  <tr>
													<td class="td">${var1.shujudian }</td>
													<td class="td">${var1.wendu }</td>
													<td class="td">${var1.yingbian }</td>
													<td class="td">${var1.yingbianlv }</td>
												  </tr>
												  </c:forEach>
												 
											</table>
											</p>
										</div>
<!-- 										<div class="box_p"> -->
<!-- 										  <h4>生成曲线</h4> -->
<!-- 										  <p><img src="#" class="img_qxt"/></p> -->
<!-- 										  </div> -->
										 <input type="button" value="查看图表" class="btn_add" style="float:right;" onclick="onPicture('${var.id_Material}');">
										<div class="clear"></div>
								
									<div class="box_xiangxi zhedie">
										<div class="box_zhedie">
											<span class="a_zhedie1" id = "zd${var.id_Material }" onclick = "zd(${var.id_Material });" style="display:block;">材料参数</span>
											<span class="a_zhedie2" id = "zd1${var.id_Material }" onclick = "zd1(${var.id_Material });" style="display:none;">材料参数</span>
										</div>
										<div class="box_u1" id="box_clcs${var.id_Material }" style="display:none">
													<ul class="ul1">
										
										<li>
										  <span>材料密度</span><i>${var.DensityMaterial }</i>
										  <input type="hidden"  readonly="readonly" name="DensityMaterial" id="DensityMaterial_userForm${var.id_Material}" value="${var.DensityMaterial }" class="input" />
								<!-- 		  <input type="text" value="0" class="input"/> -->
										  <a href="#" class="btn btn_wd" onclick="onEditWDXG('DensityMaterial_userForm','${var.id_Material}');">温度相关</a>
										</li>
										<li>
										  
										  <span id="lititle">弹性模量</span><i>${var.ModulusMaterial }</i>
										  <input type="hidden"  readonly="readonly" name="ModulusMaterial" id="ModulusMaterial_userForm${var.id_Material}" value="${var.ModulusMaterial }" class="input" />
								<!-- 		  <input type="text" value="0" class="input"/> -->
										  <a href="#" class="btn btn_wd" onclick="onEditWDXG('ModulusMaterial_userForm','${var.id_Material}');">温度相关</a>
										</li>
										<li>
										  
										  <span id="lititle">材料硬度</span><i>${var.HardnessMaterial }</i>
										  <input type="hidden"  readonly="readonly" name="HardnessMaterial" id="HardnessMaterial_userForm${var.id_Material}" value="${var.HardnessMaterial }" class="input" />
								<!-- 		  <input type="text" value="0" class="input"/> -->
										  <a href="#" class="btn btn_wd" onclick="onEditWDXG('HardnessMaterial_userForm','${var.id_Material}');">温度相关</a>
										</li>
										<li>
										  
										  <span id="lititle">材料热导率</span><i>${var.ConductivityMaterial }</i>
										  <input type="hidden"  readonly="readonly" name="ConductivityMaterial" id="ConductivityMaterial_userForm${var.id_Material}" value="${var.ConductivityMaterial }" class="input" />
								<!-- 		  <input type="text" value="0" class="input"/> -->
										  <a href="#" class="btn btn_wd" onclick="onEditWDXG('ConductivityMaterial_userForm','${var.id_Material}');">温度相关</a>
										</li>
										
										  </ul>
										  <ul class="ul1">
										  <li>
										  <span id="lititle">材料比热</span><i>${var.SpecificheatMaterial }</i>
										  <input type="hidden"  readonly="readonly" name="SpecificheatMaterial" id="SpecificheatMaterial_userForm${var.id_Material}" value="${var.SpecificheatMaterial }" class="input" />
								<!-- 		  <input type="text" value="0" class="input"/> -->
										  <a href="#" class="btn btn_wd" onclick="onEditWDXG('SpecificheatMaterial_userForm','${var.id_Material}');">温度相关</a>
										</li>
										<li>
										  
										  <span id="lititle">抗拉强度</span><i>${var.StrengthMaterial }</i>
										  <input type="hidden"  readonly="readonly" name="StrengthMaterial" id="StrengthMaterial_userForm${var.id_Material}" value="${var.StrengthMaterial }" class="input" />
								<!-- 		  <input type="text" value="0" class="input"/> -->
										  <a href="#" class="btn btn_wd" onclick="onEditWDXG('StrengthMaterial_userForm','${var.id_Material}');">温度相关</a>
										</li>
										<li>
										  
										  <span id="lititle">热膨胀系数</span><i>${var.ThermalExpansionMaterial }</i>
										  <input type="hidden"  readonly="readonly" name="ThermalExpansionMaterial" id="ThermalExpansionMaterial_userForm${var.id_Material}" value="${var.ThermalExpansionMaterial }" class="input" />
								<!-- 		  <input type="text" value="0" class="input"/> -->
										  <a href="#" class="btn btn_wd" onclick="onEditWDXG('ThermalExpansionMaterial_userForm','${var.id_Material}');">温度相关</a>
										</li>
								</ul></div></div>
								
						<div class="clear"></div>
		
		
			</div>
		  </div>
		</c:forEach>
	  </c:when>
	  <c:otherwise>没有相关数据</c:otherwise>
	</c:choose>
  </div>
  <div class="iframe_wrap">
	<iframe src="" id="iframe_wdxg"  width="100%"  height="970px" frameborder="0"></iframe>
  </div>
  <div class="page-header position-relative" style="vertical-align:top;padding-top:10px;padding-left:20px;">
	<div class="pagination">
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="material/queryMaterialList"/>
	</div>
  </div>
</div>

</body>
<script type="text/javascript">

	//应变率
	function onPicture(id){
	
		var str = $("#" + id).val();
		
		$("#iframe_wdxg").attr("src",  '<%=path%>/material/queryPicture?id=' + id);
		$(".iframe_wrap").show();
	}
	
	//温度相关
	function onEditWDXG(id,i){
	
		var str = $("#" + id+i).val();
		
		$("#iframe_wdxg").attr("src",  '<%=path%>/material/queryWDXG_copy?id=' + id + '&str=' + str);
		$(".iframe_wrap").show();
	}
</script>
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
</html>


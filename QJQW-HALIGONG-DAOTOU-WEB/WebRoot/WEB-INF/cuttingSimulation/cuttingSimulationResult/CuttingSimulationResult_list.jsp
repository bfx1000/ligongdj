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
<script src="<%=path%>/resources/js/common/detail.js?v=<%=date%>"  type="text/javascript"></script>
<link href="<%=path%>/resources/css/index/style_a.css?v=<%=date%>" rel="stylesheet" type="text/css" />
<!-- <link href="<%=path%>/resources/css/bootstrap.min.css" rel="stylesheet" /> -->
<!-- <link href="<%=path%>/resources/css/bootstrap-responsive.min.css" rel="stylesheet" /> -->
<!--   列表内容  添加折叠  js    -->
<script type="text/javascript">
	function zd(id,i){
		$("#box_clcs"+i+id).css("display","block");
		$("#zd_"+i+"_"+id).css("display","none");
		$("#zd1_"+i+"_"+id).css("display","block");
	}
	function zd1(id,i){
		$("#box_clcs"+i+id).css("display","none");
		$("#zd_"+i+"_"+id).css("display","block");
		$("#zd1_"+i+"_"+id).css("display","none");
	}
</script>
<script type="text/javascript">
	//检索
	function onSearchKey(){
		
		var url = "<%=path%>/CuttingSimulationResult/queryCuttingSimulationList";
		document.Form.action = url;
		$("#Form").submit();
	}
	//修改
	function edit(id){
		window.location.href='<%=path%>/CuttingSimulationResult/goAddCuttingSimulationResult?id=' + id;
	}

	//展开折叠详细
	function onShowDetial(id_CuttingSimulation){
		$("#ulli_" + id_CuttingSimulation).toggle();
	}
	
	//删除
	function del(id_CuttingSimulation){
		if(confirm("确定要删除吗?")){
			var url = "<%=path%>/CuttingSimulation/deleteCuttingSimulation?id_CuttingSimulation=" + id_CuttingSimulation;
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
  <form action="CuttingSimulationResult/queryCuttingSimulationList" method="post" name="Form" id="Form">
    <div class="search_wrap">
	  <div class="search_input_wrap">
		<span>仿真编号<input name="IDCutSim" tpye="text" value="${pd.IDCutSim }" /></span>
		<span>仿真名称<input name="NameCutSim" tpye="text" value="${pd.NameCutSim }" /></span>
		<span>仿真类型
			<select name="TypeCutSim" class="select" style="width : 100px;">
				<option value="">请选择</option>
					<c:forEach items="${CategoryTypeCutSimList}" var="var" varStatus="vs">
							<option value="${var.id_CategoryTypeCutSim }" ${pd.TypeCutSim == var.id_CategoryTypeCutSim ? 'selected' : '' }>${var.name_CategoryTypeCutSim }</option>	
					</c:forEach>
			  </select>
		</span>
		<span>刀具类型
			<select name="ToolType" class="select" style="width : 100px;">
				<option value="">请选择</option>
				<option value="1" ${pd.ToolType == 1 ? 'selected' : '' }>刀片</option>	
				<option value="2" ${pd.ToolType == 2 ? 'selected' : '' }>整体刀具</option>
			  </select>
		</span>
		<span>工件材料<input name="MaterialWorkpieceCutSim" tpye="text" value="${pd.MaterialWorkpieceCutSim }" /></span>
		<span>刀具材料<input name="MaterialToolCutSim" tpye="text" value="${pd.MaterialToolCutSim }" /></span>
		<span>刀具/刀片编号<input name="MaterialToolCutSim" tpye="text" value="${pd.MaterialToolCutSim }" /></span>
		<span>仿真软件
			<select name="SoftwareCutSim" class="select" style="width : 100px;">
				<option value="">请选择</option>
					<c:forEach items="${CategorySoftwareCutSimList}" var="var" varStatus="vs">
							<option value="${var.id_CategorySoftwareCutSim }" ${pd.SoftwareCutSim == var.id_CategorySoftwareCutSim ? 'selected' : '' }>${var.name_CategorySoftwareCutSim }</option>	
					</c:forEach>
			  </select>
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
	  <span class="label_wrap"><input type="checkbox" checked="checked" />仿真编号</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />仿真名称</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />仿真类型</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />工件材料</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />刀具类型</span>
	  <span class="label_wrap"><input type="checkbox" />刀具材料</span>
	  <span class="label_wrap"><input type="checkbox" />刀具/刀片编号</span>
	  <span class="label_wrap"><input type="checkbox" />仿真软件</span>
	</div>
	<div class="opera_img">
	  <img src="/resources/images/ico_n.png" data-name="0"  onclick="changeOpera(this);"  alt="展开" />
	</div>
	<div class="choose_show_btn"   onclick="selectData();" >应用</div>	
	<div class="clear"></div>
  </div>
  
  
  <div class="content_wrap">
  	<div class="each_list_wrap" style="background: white;">
			<span class="list_title skz_hide skz_list0">&nbsp;仿真编号</span> 
 			<span class="list_title skz_hide skz_list1">&nbsp;仿真名称</span> 
 			<span class="list_title skz_hide skz_list2">&nbsp;仿真类型</span> 
 			<span class="list_title skz_hide skz_list3">&nbsp;工件材料</span> 
 			<span class="list_title skz_hide skz_list4">&nbsp;刀具类型</span> 
 			<span class="list_title skz_hide skz_list5" style="display: none;">&nbsp;刀具材料</span> 
 			<span class="list_title skz_hide skz_list6" style="display: none;">&nbsp;刀具/刀片编号</span> 
 			<span class="list_title skz_hide skz_list7" style="display: none;">&nbsp;仿真软件</span> 
			<span class="list_title opera_wrap  skz_hide  skz_list8">&nbsp;&nbsp;&nbsp;操作</span>	
	</div>
    <c:choose>
      <c:when test="${not empty CuttingSimulation}">
	    <c:forEach items="${CuttingSimulation}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_CuttingSimulation });"></div>
			<span class="skz_hide skz_list0">&nbsp;${var.IDCutSim }</span> 
 			<span class="skz_hide skz_list1">&nbsp;${var.NameCutSim }</span> 
 			<span class="skz_hide skz_list2">&nbsp;
				<c:forEach items="${CategoryTypeCutSimList}" var="var1" varStatus="vs">
						<c:if test="${var1.id_CategoryTypeCutSim == var.TypeCutSim}">${var1.name_CategoryTypeCutSim }</c:if>
	 			</c:forEach>
			</span> 
 			<span class="skz_hide skz_list3">&nbsp;${var.MaterialWorkpieceCutSim }</span> 
 			<span class="skz_hide skz_list4">&nbsp;
 				<c:if test="${var.ToolType == 1}">刀片</c:if>
	 			<c:if test="${var.ToolType == 2}">整体刀具</c:if>
	 		</span> 
 			<span class="skz_hide skz_list5" style="display: none;">&nbsp;${var.MaterialToolCutSim }</span> 
 			<span class="skz_hide skz_list6" style="display: none;">&nbsp;${var.MaterialToolCutSimNum }</span> 
 			<span class="skz_hide skz_list7" style="display: none;">&nbsp;
 				<c:forEach items="${CategorySoftwareCutSimList}" var="var1" varStatus="vs">
						<c:if test="${var1.id_CategorySoftwareCutSim == var.SoftwareCutSim}">${var1.name_CategorySoftwareCutSim }</c:if>
	 			</c:forEach>
	 		</span> 
			<span class="opera_wrap  skz_hide  skz_list8">
			  &nbsp;&nbsp;<span class="btn btn_xg" onclick="edit('${var.id_CuttingSimulation}');">添加结果</span>
			  <%-- <span class="btn btn_sc" onclick="del('${var.id_CuttingSimulation}');">删除</span> --%>
			</span>					
			<div class="clear"></div>
			<!-- 展开详情   -->
			<div id="ulli_${var.id_CuttingSimulation}" class="ulli" style="display: none;">
				<div class="box_xiangxi zhedie">
						<div class="box_zhedie">
							<span class="a_zhedie1" id = "zd_3_${var.id_CuttingSimulation }" onclick = "zd(${var.id_CuttingSimulation },3);" style="display:none;">仿真结果信息</span>
							<span class="a_zhedie2" id = "zd1_3_${var.id_CuttingSimulation }" onclick = "zd1(${var.id_CuttingSimulation },3);" style="display:block;">仿真结果信息</span>
						</div>
						<div class="box_u1" id="box_clcs3${var.id_CuttingSimulation }" style="display:block">
							<ul class="box_text">
							  	<li><span id = "lititle">切削力Fx：</span> &nbsp;${var.ForceXCutSim} </li>
							  	<li><span id = "lititle">切削力Fy： </span> &nbsp;${var.ForceYCutSim} </li>
							  	<li><span id = "lititle">切削力Fz:</span> &nbsp;${var.ForceZCutSim} </li>
							  	<li><span id = "lititle">扭矩 N:</span> &nbsp;${var.TorqueCutSim} </li>
							  	<li><span id = "lititle">切削温度： </span> &nbsp;${var.TemperatureCutSim} </li>
							  	<li><span id = "lititle">表面残余应力： </span> &nbsp;${var.SurfaceStressCutSim} </li>
							  	<li><span id = "lititle">切屑形态： </span> &nbsp;${var.ChipShapeCutSim} </li>
							  	<li>&nbsp;</li>
							</ul>
						</div>
				<div class="clear"></div>
				</div>
				
				
				<div class="box_xiangxi zhedie">
						<div class="box_zhedie">
							<span class="a_zhedie1" id = "zd_9_${var.id_CuttingSimulation }" onclick = "zd(${var.id_CuttingSimulation },9);" style="display:block;">图片及文件</span>
							<span class="a_zhedie2" id = "zd1_9_${var.id_CuttingSimulation }" onclick = "zd1(${var.id_CuttingSimulation },9);" style="display:none;">图片及文件</span>
						</div>
						<div class="box_u1" id="box_clcs9${var.id_CuttingSimulation }" style="display:none">
							<div class="box_p">
								<h4>仿真结果图片</h4>
							  	<p>
							    	<c:forEach items="${var.PictureFileCutSim}" var="var1" varStatus="vs">
								        <img name='PictureFileCutSims_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_CuttingSimulationResultFile }' />
								        <a class="btn btn_shanchu" onclick="onShowPdf('${var1.url_CuttingSimulationResultFile }');">预览</a>
								        <br/>
								      </c:forEach>
							  	</p>
							</div>
							<div class="box_p">
								<h4>切屑形态图片</h4>
							  	<p>
							    	<c:forEach items="${var.ChipShapePicCutSim}" var="var1" varStatus="vs">
								        <img name='ChipShapePicCutSims_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_CuttingSimulationResultFile }' />
								        <a class="btn btn_shanchu" onclick="onShowPdf('${var1.url_CuttingSimulationResultFile }');">预览</a>
								        <br/>
								      </c:forEach>
							  	</p>
							</div>
							<div class="box_p">
								<h4>仿真结果文件:</h4>
							  	<p>
							    	<c:forEach items="${var.ResultFileCutSim}" var="var1" varStatus="vs">
								      <span name='ResultFileCutSims_img'>${var1.name_CuttingSimulationResultFile }</span>
								      <a class="btn btn_shanchu" onclick="onShowPdf('${var1.url_CuttingSimulationResultFile }');">下载</a>
								      <br/>
								    </c:forEach>
							  	</p>
							</div>
							<div class="box_p">
								<h4>切削力文件:</h4>
							  	<p>
							    	<c:forEach items="${var.ForceFileCutSim}" var="var1" varStatus="vs">
								      <span name='ForceFileCutSims_img'>${var1.name_CuttingSimulationResultFile }</span>
								      <a class="btn btn_shanchu" onclick="onShowPdf('${var1.url_CuttingSimulationResultFile }');">下载</a>
								      <br/>
								    </c:forEach>
							  	</p>
							</div>
							<div class="box_p">
								<h4>表面参与应力:</h4>
							  	<p>
							    	<c:forEach items="${var.SurfaceStressFileCutSim}" var="var1" varStatus="vs">
								      <span name='SurfaceStressFileCutSims_img'>${var1.name_CuttingSimulationResultFile }</span>
								      <a class="btn btn_shanchu" onclick="onShowPdf('${var1.url_CuttingSimulationResultFile }');">下载</a>
								      <br/>
								    </c:forEach>
							  	</p>
							</div>
							<div class="box_p">
								<h4>切削温度文件:</h4>
							  	<p>
							    	<c:forEach items="${var.TemperatureFileCutSim}" var="var1" varStatus="vs">
								      <span name='TemperatureFileCutSims_img'>${var1.name_CuttingSimulationResultFile }</span>
								      <a class="btn btn_shanchu" onclick="onShowPdf('${var1.url_CuttingSimulationResultFile }');">下载</a>
								      <br/>
								    </c:forEach>
							  	</p>
							</div>
						</div>
				<div class="clear"></div>
				</div>
				
				
				<div class="box_xiangxi zhedie">
						<div class="box_zhedie">
							<span class="a_zhedie1" id = "zd_4_${var.id_CuttingSimulation }" onclick = "zd(${var.id_CuttingSimulation },4);" style="display:block;">刀具磨损信息</span>
							<span class="a_zhedie2" id = "zd1_4_${var.id_CuttingSimulation }" onclick = "zd1(${var.id_CuttingSimulation },4);" style="display:none;">刀具磨损信息</span>
						</div>
						<div class="box_u1" id="box_clcs4${var.id_CuttingSimulation }" style="display:none">
							<ul class="box_text">
							  	<li><span id = "lititle">刀具寿命：</span> &nbsp;${var.ExReToolLife} </li>
							  	<li>&nbsp;</li>
							</ul>
							<div class="box_p">
								<h4>刀具磨损文件：</h4>
							  	<p>
							    	<c:forEach items="${var.ExReWearFile}" var="var1" varStatus="vs">
								      <span name='ExReWearFiles_img'>${var1.name_CuttingSimulationResultFile }</span>
								      <a class="btn btn_shanchu" onclick="onShowPdf('${var1.url_CuttingSimulationResultFile }');">下载</a>
								      <br/>
								    </c:forEach>
							  	</p>
							</div>
							<div class="box_p">
							  <h4>刀具磨损表:</h4>
							  <p>
									<table border="1" class="li_table box_table">
										  <tr>
											<th class="th">时间</td>
											<c:forEach items="${var.ExReWearTimeAndValueList}" var="var1" varStatus="vs1">
										    	<td class="td">${var1.shijian }</td>
										    </c:forEach>
										  </tr>
										  <tr>
											<th class="th">磨损量VB(mm)</td>
											<c:forEach items="${var.ExReWearTimeAndValueList}" var="var1" varStatus="vs">
										    	<td class="td">${var1.mosundu }</td>
										    </c:forEach>
										  </tr>
									</table>
								</p>
							</div>
							<div class="box_p">
								<h4>刀具磨损图片：</h4>
							  	<p>
							    	<c:forEach items="${var.ExReWearPicture}" var="var1" varStatus="vs">
								        <img name='ExReWearPictures_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_CuttingSimulationResultFile }' />
								        <a class="btn btn_shanchu" onclick="onShowPdf('${var1.url_CuttingSimulationResultFile }');">预览</a>
								        <br/>
								      </c:forEach>
							  	</p>
							</div>
						</div>
				<div class="clear"></div>
				</div>
				
				<div class="box_xiangxi zhedie">
						<div class="box_zhedie">
							<span class="a_zhedie1" id = "zd_5_${var.id_CuttingSimulation }" onclick = "zd(${var.id_CuttingSimulation },5);" style="display:block;">自定义仿真</span>
							<span class="a_zhedie2" id = "zd1_5_${var.id_CuttingSimulation }" onclick = "zd1(${var.id_CuttingSimulation },5);" style="display:none;">自定义仿真</span>
						</div>
						<div class="box_u1" id="box_clcs5${var.id_CuttingSimulation }" style="display:none">
							<ul class="box_text">
							  	<li><span id = "lititle">自定义参数名：</span> &nbsp;${var.CutSimDefined1} </li>
							  	<li><span id = "lititle">结果:</span> &nbsp;${var.CutSimDefined1Value} </li>
							</ul>
							<div class="box_p">
								<h4>结果文件：</h4>
							  	<p>
							    	<c:forEach items="${var.Defined1File}" var="var1" varStatus="vs">
								      <span name='Defined1Files_img'>${var1.name_CuttingSimulationResultFile }</span>
								      <a class="btn btn_shanchu" onclick="onShowPdf('${var1.url_CuttingSimulationResultFile }');">下载</a>
								      <br/>
								    </c:forEach>
							  	</p>
							</div>
							
							<ul class="box_text">
							  	<li><span id = "lititle">自定义参数名：</span> &nbsp;${var.CutSimDefined2} </li>
							  	<li><span id = "lititle">结果:</span> &nbsp;${var.CutSimDefined2Value} </li>
							</ul>
							<div class="box_p">
								<h4>结果文件：</h4>
							  	<p>
							    	<c:forEach items="${var.Defined2File}" var="var1" varStatus="vs">
								      <span name='Defined2Files_img'>${var1.name_CuttingSimulationResultFile }</span>
								      <a class="btn btn_shanchu" onclick="onShowPdf('${var1.url_CuttingSimulationResultFile }');">下载</a>
								      <br/>
								    </c:forEach>
							  	</p>
							</div>
							
							<ul class="box_text">
							  	<li><span id = "lititle">自定义参数名：</span> &nbsp;${var.CutSimDefined3} </li>
							  	<li><span id = "lititle">结果:</span> &nbsp;${var.CutSimDefined3Value} </li>
							</ul>
							<div class="box_p">
								<h4>结果文件：</h4>
							  	<p>
							    	<c:forEach items="${var.Defined3File}" var="var1" varStatus="vs">
								      <span name='Defined3Files_img'>${var1.name_CuttingSimulationResultFile }</span>
								      <a class="btn btn_shanchu" onclick="onShowPdf('${var1.url_CuttingSimulationResultFile }');">下载</a>
								      <br/>
								    </c:forEach>
							  	</p>
							</div>
							
						</div>
				<div class="clear"></div>
				</div>
				
				
				<div class="box_xiangxi zhedie">
			  	<div class="box_zhedie">
							<span class="a_zhedie1" id = "zd_0_${var.id_CuttingSimulation }" onclick = "zd(${var.id_CuttingSimulation },0);" style="display:block;">刀片基本信息</span>
							<span class="a_zhedie2" id = "zd1_0_${var.id_CuttingSimulation }" onclick = "zd1(${var.id_CuttingSimulation },0);" style="display:none;">刀片基本信息</span>
						</div>
				<div class="box_u1" id="box_clcs0${var.id_CuttingSimulation }" style="display:none">
				  <ul class="ul1 img_infor_ul" >
					<li><span>仿真编号</span><i>${var.IDCutSim }</i></li>
					<li><span>仿真名称</span><i>${var.NameCutSim }</i></li>
					<li><span>仿真类型</span>
						<i>
							<c:forEach items="${CategoryTypeCutSimList}" var="var1" varStatus="vs">
	 							<c:if test="${var1.id_CategoryTypeCutSim == var.TypeCutSim}">${var1.name_CategoryTypeCutSim }</c:if>
				 			</c:forEach>
 						</i>
					</li>
					<li><span>刀具/刀片编号</span><i>${var.MaterialToolCutSimNum }</i></li>
				  </ul>
				  <ul class="ul1 img_infor_ul">
					<li><span>工件材料</span><i>${var.MaterialWorkpieceCutSim } </i></li>
					<li><span>刀具类型</span>
						<i>
	 						<c:if test="${var.ToolType == 1}">刀片</c:if>
	 						<c:if test="${var.ToolType == 2}">整体刀具</c:if>
 						</i>
					</li>
					<li><span>刀具材料</span><i>${var.MaterialToolCutSim } </i></li>
					<li><span>仿真软件</span>
						<i>
							<c:forEach items="${CategorySoftwareCutSimList}" var="var1" varStatus="vs">
	 							<c:if test="${var1.id_CategorySoftwareCutSim == var.SoftwareCutSim}">${var1.name_CategorySoftwareCutSim }</c:if>
				 			</c:forEach>
 						</i>
					</li>
				  </ul>
				</div>
				<div class="clear"></div>
			  </div>
			  
			  <div class="box_xiangxi zhedie">
						<div class="box_zhedie">
							<span class="a_zhedie1" id = "zd_1_${var.id_CuttingSimulation }" onclick = "zd(${var.id_CuttingSimulation },1);" style="display:block;">刀片角度信息</span>
							<span class="a_zhedie2" id = "zd1_1_${var.id_CuttingSimulation }" onclick = "zd1(${var.id_CuttingSimulation },1);" style="display:none;">刀片角度信息</span>
						</div>
						<div class="box_u1" id="box_clcs1${var.id_CuttingSimulation }" style="display:none">
							<ul class="ul1 img_infor_ul">
							  	<li><span>前角：</span> &nbsp;${var.QianjiaoCutSim} </li>
							  	<li><span>后角： </span> &nbsp;${var.HoujiaoCutSim} </li>
							  	<li><span>断屑槽类型： </span> &nbsp;${var.BreakerBladeCutSim} </li>
							</ul>
							<ul class="ul1 img_infor_ul">
							  	<li><span>刃倾角:</span> &nbsp;${var.RenqingCutSim} </li>
							  	<li><span>刀尖圆弧半径:</span> &nbsp;${var.NoseRadiusCutSim} </li>
							</ul>
						</div>
				<div class="clear"></div>
				</div>
				
				<div class="box_xiangxi zhedie">
						<div class="box_zhedie">
							<span class="a_zhedie1" id = "zd_2_${var.id_CuttingSimulation }" onclick = "zd(${var.id_CuttingSimulation },2);" style="display:block;">刀片参数信息</span>
							<span class="a_zhedie2" id = "zd1_2_${var.id_CuttingSimulation }" onclick = "zd1(${var.id_CuttingSimulation },2);" style="display:none;">刀片参数信息</span>
						</div>
						<div class="box_u1" id="box_clcs2${var.id_CuttingSimulation }" style="display:none">
							<ul class="ul1 img_infor_ul">
							  	<li><span>切削速度：</span> &nbsp;${var.CuttingSpeedCutSim} </li>
							  	<li><span>转速： </span> &nbsp;${var.RoatingSpeedCutSim} </li>
							  	<li><span>进给量:</span> &nbsp;${var.FeedCutSim} </li>
							</ul>
							<ul class="ul1 img_infor_ul">
							  	<li><span>进给速度:</span> &nbsp;${var.FeedSpeedCutSim} </li>
							  	<li><span>切削深度： </span> &nbsp;${var.CuttingDepthCutSim} </li>
							  	<li><span>切削宽度： </span> &nbsp;${var.CuttingWidthCutSim} </li>
							</ul>
							
							
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
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="CuttingSimulationResult/queryCuttingSimulationList"/>
	</div>
  </div>
</div>

</body>




</html>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib  uri="http://java.sun.com/jsp/jstl/functions"   prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%@ page import="java.util.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Long date = System.currentTimeMillis();
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
		<title>哈理工刀头</title>
	    <meta name="description" content="哈理工刀头,专业打造各种类型机械刀头,产品类型齐全,质量放心有保障,联合祈福科技公司打造专业的刀头网站。" />
	    <meta name="keywords" content="哈理工刀头,刀头,刀具,切断切槽,仿形切削,外圆切槽刀,内圆切槽刀,端面切槽。" />
	<link href="<%=path%>/resources/css/index/style_a.css?v=<%=date%>" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/resources/js/jquery-1.7.2.js"></script>
	<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
	<script src="<%=path%>/resources/js/laydate/laydate.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.2.js"></script>
	<script type="text/javascript" src="/resources/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
	<script type="text/javascript" src="/resources/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
	<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
	<script src="<%=path%>/resources/js/common/detail.js"  type="text/javascript"></script>
	<link href="<%=path%>/resources/css/index/style_a.css?v=<%=date%>" rel="stylesheet" type="text/css" />

	<!-- <link href="<%=path%>/resources/css/bootstrap.min.css" rel="stylesheet" /> -->
	<!-- <link href="<%=path%>/resources/css/bootstrap-responsive.min.css" rel="stylesheet" /> -->
	
	<script type="text/javascript">
		function edit(number){
			window.location.href = "<%=path%>/experimentParameterResult/goExperimentResult?zT=0&&ExperimentNo="+number;
		}
		function insertResult(id,i){
			 var html = '<iframe id="iframe'+i+'"  scrolling="no" width="100%" frameborder="0"  src="/experimentParameterResult/CheckExperimentResultList?id_ExperimentParameterResult='+id+'&&WhetherVariable=1"></iframe>';
			 $("#resultList"+i).html(html);
		 }
	</script>
	<script type="text/javascript">
		//检索
		function onSearchKey(){
			var url = "<%=path%>/experimentParameterResult/selectResult";
			document.Form.action = url;
			$("#Form").submit();
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
<div class="content_box_text">
<form action="experimentParameterResult/selectResult" method="post" name="Form" id="Form">
	  
	  <div class="search_wrap">
  
	  	<div class="search_input_wrap">
		  	<span>实验编号<input name="ExperimentNo" tpye="text" value="${pd.ExperimentNo }" /></span>
		  	<span>实验机床<input name="ExperimentMachine" tpye="text" value="${pd.ExperimentMachine }" /></span>
		  	<span>实验类型
		  	  <select name="ExperimentType" class="select" style="width : 100px;">
						<option value="">请选择</option>
				<c:forEach items="${CategoryExperimentType}" var="var" varStatus="vs">
						<option value="${var.id_ExperimentType }" ${pd.ExperimentType == var.id_ExperimentType ? 'selected' : '' }>${var.name_ExperimentType }</option>	
				</c:forEach>
		  </select>
		  	</span>
		  	<span>试验件<input name="ExperimentPart" tpye="text" value="${pd.ExperimentPart }" /></span>
		  	<span>试验材料牌号<input name="NumberMaterialExperimentPart" tpye="text" value="${pd.NumberMaterialExperimentPart }" /></span>
		  	<span>试验材料种类<input name="CategoryMaterialExperimentPart" tpye="text" value="${pd.CategoryMaterialExperimentPart }" /></span>
		  	<span>试验刀具<input name="ExperimentTool" tpye="text" value="${pd.ExperimentTool }" /></span>
		  	<span>刀具材料<input name="ExperimentToolMaterial" tpye="text" value="${pd.ExperimentToolMaterial }" /></span>
		  	<span>切削液<input name="ExperimentCuttingFluid" tpye="text" value="${pd.ExperimentCuttingFluid }" /></span>
		  	<span>加工类别<select name="ExperimentMachiningType" class="select" style="width : 100px;">
						<option value="">请选择</option>
						<option value="精加工" ${pd.ExperimentMachiningType == "精加工" ? 'selected' : '' }>精加工</option>
						<option value="半精加工" ${pd.ExperimentMachiningType == "半精加工" ? 'selected' : '' }>半精加工</option>
						<option value="粗加工" ${pd.ExperimentMachiningType == "粗加工" ? 'selected' : '' }>粗加工</option>
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
			<span class="label_wrap"><input type="checkbox" checked="checked" />实验编号</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />实验类型</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />实验机床</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />试验件</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />试验材料牌号</span>
			<span class="label_wrap"><input type="checkbox" />试验材料种类</span>
			<span class="label_wrap"><input type="checkbox" />试验刀具</span>
			<span class="label_wrap"><input type="checkbox" />刀具材料</span>
			<span class="label_wrap"><input type="checkbox" />切削液</span>
			<span class="label_wrap"><input type="checkbox" />加工类别</span>
		</div>
		
		<div class="opera_img">
		  	<img src="/resources/images/ico_n.png" data-name="0"  onclick="changeOpera(this);"  alt="展开" />
		</div>
		<div class="choose_show_btn"   onclick="selectData();" >应用</div>	
		<div class="clear"></div>
	</div>
	
	<div class="content_wrap">
		<div class="each_list_wrap"  style="background: white;">
			<span class="list_title skz_hide  skz_list0">实验编号</span>
			<span class="list_title skz_hide skz_list1" >实验类型</span>
			<span class="list_title skz_hide skz_list2" >实验机床</span>
			<span class="list_title skz_hide  skz_list3" >试验件</span>
			<span class="list_title skz_hide  skz_list4" >试验材料牌号</span>
			<span class="list_title skz_hide  skz_list5" style="display: none;">试验材料种类</span>
			<span class="list_title skz_hide skz_list6" style="display: none;">试验刀具</span>
			<span class="list_title skz_hide skz_list7" style="display: none;">刀具材料</span>
			<span class="list_title skz_hide  skz_list8" style="display: none;">切削液</span>
			<span class="list_title skz_hide  skz_list9" style="display: none;">加工类别</span>
			<span class="list_title opera_wrap  skz_hide  skz_list10">&nbsp;&nbsp;&nbsp;操作</span>
		</div>
		<c:choose>
    		<c:when test="${not empty ExperimentManage}">
	  			<c:forEach items="${ExperimentManage}" var="var" varStatus="vs">	
					<div class="each_list_wrap"  >
						<div class="onclick" onclick="onShowDetial(${var.id_ExperimentManage });"></div>
						<span class="  skz_hide  skz_list0">&nbsp;${var.ExperimentNo }</span>
						<span class="  skz_hide skz_list1" >&nbsp;${var.ExperimentType }</span>
						<span class="  skz_hide skz_list2" >&nbsp;${var.ExperimentMachine }</span>
						<span class="  skz_hide  skz_list3" >&nbsp;${var.ExperimentPart }</span>
						<span class="  skz_hide  skz_list4" >&nbsp;${var.NumberMaterialExperimentPart }</span>
						<span class="  skz_hide  skz_list5" style="display: none;">&nbsp;${var.CategoryMaterialExperimentPart }</span>
						<span class="  skz_hide skz_list6" style="display: none;">&nbsp;${var.ExperimentTool }</span>
						<span class="  skz_hide skz_list7" style="display: none;">&nbsp;${var.ExperimentToolMaterial }</span>
						<span class="  skz_hide  skz_list8" style="display: none;">&nbsp;${var.ExperimentCuttingFluid }</span>
						<span class="  skz_hide  skz_list9" style="display: none;">&nbsp;${var.ExperimentMachiningType }</span>
						<span class="opera_wrap  skz_hide  skz_list10">&nbsp;&nbsp;
							<span class="btn btn_xg" onclick="edit('${var.ExperimentNo}');">修改</span>
						</span>
						<div class="clear"></div>	
						
						<!-- 展开详情   -->
						<div id="ulli_${var.id_ExperimentManage}"  data-name="0"  class="ulli" style="display: none;">
							<br/>
							<div class="box_xiangxi zhedie">
								<div class="box_zhedie">
									<span class="a_zhedie1" id = "zd_9_${var.id_ExperimentManage}" onclick = "zd(9,${var.id_ExperimentManage});" style="display:block;">实验基本信息</span>
									<span class="a_zhedie2" id = "zd1_9_${var.id_ExperimentManage}" onclick = "zd1(9,${var.id_ExperimentManage});" style="display:none;">实验基本信息</span>
								</div>
								<div class="box_u1" id="box_clcs9_${var.id_ExperimentManage}" style="display:none">
									<ul class="ul1">
								  		<li><span>实验编号</span><i>${var.ExperimentNo } </i></li>
								  		<li><span>实验名称</span><div>${var.ExperimentName} </div></li>
								  		<li><span>实验类型</span><i>${var.ExperimentType } </i></li>
								  		<li><span>实验机床</span><i>${var.ExperimentMachine } </i></li>
								  		<li><span>实验人员</span><div>${var.ExperimentPerson} </div></li>
								  		<li><span>责任人</span><i>${var.ExperimentTeacher } </i></li>
								  		<li><span>加工类别</span><i>${var.ExperimentMachiningType } </i></li>
								  		<li><span>加工形式</span><div>${var.ExperimentContent} </div></li>
								  		<li><span>实验时间</span><i>${var.ExperimentTime } </i></li>
									</ul>
									<ul class="ul1">
								  		<li><span>试验件</span><i>${var.ExperimentPart}</i></li>
								  		<li><span>试验材料牌号</span><i>${var.NumberMaterialExperimentPart } </i></li>
								  		<li><span>试验材料种类</span><i>${var.CategoryMaterialExperimentPart } </i></li>
								  		<li><span>试验刀具</span><i>${var.ExperimentTool}</i></li>
								  		<li><span>刀具材料</span><i>${var.ExperimentToolMaterial } </i></li>
								  		<li><span>切削液</span><i>${var.ExperimentCuttingFluid } </i></li>
								  		<li><span>实验说明</span><i>${var.ExperimentCondition } </i></li>
								  		<li><span>实验备注</span><i>${var.ExperimentRemark } </i></li>
									</ul>
									<div class="box_p">
									  	<h4>试验报告</h4>
									  	<p>
									    	<c:forEach items="${var.ExperimentReportList}" var="var1" varStatus="vs">
									      		<span name='informDetailBTADrills_img' >${var1.name_ExperimentReport }</span>
									      		<a class="btn" onclick="onShowPdf('${var1.url_ExperimentReport }');">预览</a>
									      		<br/>
									    	</c:forEach>
									  	</p>
									</div>
								</div>
							</div>
							
							<div class="clear"></div>
							
							<br/><br/>
							<ul>
						  <li class="block nobor" id="li_table">
							<table border="1" class="box_table li_table" id="table">
								<c:choose>
									<c:when test="${not empty var.ExperimentParameterResult}">
										 <tr id = "row_0">
										 <th class="th" id = "col_row0_th">序号</th>
										 	<c:forEach items="${var.parameters}" var="var1" varStatus="vs1">
										 		<td class="th" id = "col_row0_${vs.index }">
										 		<select class="select"  disabled = "disabled" onChange="test(this);">
												  <option value="">请选择</option>
												  <option value="ExperimentCuttingSpeed" ${var1=='ExperimentCuttingSpeed' ?'selected':''} >切削速度</option>
												  <option value="ExperimentCuttingDepth" ${var1=='ExperimentCuttingDepth'?'selected':''}>切削深度</option>
												  <option value="ExperimentCuttingWidth" ${var1=='ExperimentCuttingWidth' ?'selected':''}>切削宽度</option>
												  <option value="ExperimentFeedRate" ${var1=='ExperimentFeedRate' ?'selected':''}>进给量</option>
												  <option value="ExperimentToolQianjiao" ${var1==ExperimentToolQianjiao ?'selected':''}>刀具前角</option>
												  <option value="ExperimentToolHoujiao" ${var1==ExperimentToolHoujiao ?'selected':''}>刀具后角</option>
												  <option value="ExperimentToolZhupianjiao" ${var1==ExperimentToolZhupianjiao ?'selected':''}>刀具主偏角</option>
												  <option value="ExperimentToolRenqingjiao" ${var1==ExperimentToolRenqingjiao ?'selected':''}>刀具刃倾角</option>
												  <option value="ExperimentToolNoseRadius" ${var1==ExperimentToolNoseRadius ?'selected':''}>刀尖圆弧半径</option>
												  <option value="ExperimentToolBreakerBlade" ${var1==ExperimentToolBreakerBlade ?'selected':''}>断屑槽类型</option>
												  <option value="ExperimentMachiningType" ${var1==ExperimentMachiningType ?'selected':''}>加工类别</option>
												  <option value="ExperimentTool" ${var1==ExperimentTool ?'selected':''}>试验刀具</option>
												  <option value="ExperimentToolMaterial" ${var1==ExperimentToolMaterial ?'selected':''} >刀具材料</option>
												  <option value="ExperimentCuttingFluid" ${var1==ExperimentCuttingSpeed ?'selected':''}>切削液</option>
												  <option value="ExperimentPara1" ${var1==ExperimentPara1 ?'selected':''}>预留1</option>
												  <option value="ExperimentPara2" ${var1==ExperimentPara2 ?'selected':''}>预留2</option>
												</select>
										 		</td>
									    	</c:forEach>
										 <th class="th" id = "col_row0">操作</th>
										</tr>
										<c:forEach items="${var.ExperimentParameterResult}" var="var2" varStatus="vs2">
											<tr id = "row_${vs2.index }" >
												<th id="col_row${vs2.index }_th">${vs2.index+1 }</th>
												<c:forEach items="${var.parameters}" var="var3" varStatus="vs3">
													<c:set var="sid" value="${var3 }"></c:set>
													<td id="col_row${vs2.index }_${vs3.index }" >${var2[sid]}</td>
												</c:forEach>
												<th id="col_row${vs2.index }"><a class="btn btn_bg_orange b_block" onclick="insertResult('${var2.id_ExperimentParameterResult}','${var.id_ExperimentManage }');">查看结果</a></th>
											</tr>
										</c:forEach>
									</c:when>
										<c:otherwise>
											  <li id="id_h2"><h3>&nbsp;&nbsp;该实验无参数，所以无试验结果，请先填写参数！</h3></li>
									</c:otherwise>
								 </c:choose>
								</table>
							</li>
							
						<div id="resultList${var.id_ExperimentManage }">
						</div>
						<br/><br/><br/>
					</ul> 
						</div>							
					</div>
				</c:forEach>
			</c:when>
	    	<c:otherwise>没有相关数据</c:otherwise>
	  	</c:choose>	
	</div>
	<div class="page-header position-relative" style="vertical-align:top;padding-top:10px;padding-left:20px;">
	<div class="pagination">
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="experimentParameterResult/selectResult"/>
	</div>
  </div>
</div>


<script type="text/javascript">
//折叠
function zd(index,id){
	$("#box_clcs"+index+"_"+id).css("display","block");
	$("#zd_"+index+"_"+id).css("display","none");
	$("#zd1_"+index+"_"+id).css("display","block");
}
function zd1(index,id){
	$("#box_clcs"+index+"_"+id).css("display","none");
	$("#zd_"+index+"_"+id).css("display","block");
	$("#zd1_"+index+"_"+id).css("display","none");
}

</script>   
</body>
</html>


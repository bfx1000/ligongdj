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
		//检索
		function onSearchKey(){
			var url = "<%=path%>/experimentManage/selectResult";
			document.Form.action = url;
			$("#Form").submit();
		}
		
		//展开折叠详细
		function onShowDetial(id_BTADrill){
			$("#ulli_" + id_BTADrill).toggle();
		}
		
		//新增
		function add(){
			window.location.href='<%=path%>/experimentManage/goExperimentManageAdd';
		}
		
		//修改
		function edit(id){
			window.location.href='<%=path%>/experimentManage/goExperimentManageAdd?id=' + id;
		}
		
		//添加参数
		function addC(ExperimentNo){
			window.location.href='<%=path%>/experimentParameterResult/goExperimentParameterResult?ExperimentNo='+ExperimentNo;
		}
		//删除
		function del(id_ExperimentManage){
			if(confirm("确定要删除吗?")){
				var url = "<%=path%>/experimentManage/deleteExperimentManage?id_ExperimentManage=" + id_ExperimentManage;
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
<form action="experimentManage/selectResult" method="post" name="Form" id="Form">
	  
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
	
	<div class="addbtn_wrap">
		<a class="btn" onclick="add();">新增</a>
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
						<span class="  skz_hide skz_list1" >&nbsp;
							<c:forEach items="${CategoryExperimentType}" var="var1" varStatus="vs">
									<c:if test="${var1.id_ExperimentType == var.ExperimentType}">${var1.name_ExperimentType }</c:if>	
							</c:forEach>
						</span>
						<span class="  skz_hide skz_list2" >&nbsp;${var.ExperimentMachine }</span>
						<span class="  skz_hide  skz_list3" >&nbsp;${var.ExperimentPart }</span>
						<span class="  skz_hide  skz_list4" >&nbsp;${var.NumberMaterialExperimentPart }</span>
						<span class="  skz_hide  skz_list5" style="display: none;">&nbsp;${var.CategoryMaterialExperimentPart }</span>
						<span class="  skz_hide skz_list6" style="display: none;">&nbsp;${var.ExperimentTool }</span>
						<span class="  skz_hide skz_list7" style="display: none;">&nbsp;${var.ExperimentToolMaterial }</span>
						<span class="  skz_hide  skz_list8" style="display: none;">&nbsp;${var.ExperimentCuttingFluid }</span>
						<span class="  skz_hide  skz_list9" style="display: none;">&nbsp;${var.ExperimentMachiningType }</span>
						<span class="opera_wrap  skz_hide  skz_list10">
							<span class="btn btn_xg" onclick="edit('${var.id_ExperimentManage}');">修改</span>
							<span class="btn btn_xg" onclick="del('${var.id_ExperimentManage}');">删除</span>
						</span>
						<div class="clear"></div>	
						
						<!-- 展开详情   -->
						<div id="ulli_${var.id_ExperimentManage}"  data-name="0"  class="ulli" style="display: none;">
							<div class="box_xiangxi zhedie">
								<div class="box_u1" id="box_clcs9_${var.id_ExperimentManage}">
									<ul class="ul1">
								  		<li><span>实验编号</span><i>${var.ExperimentNo } </i></li>
								  		<li><span>实验名称</span><div>${var.ExperimentName} </div></li>
								  		<li><span>实验类型</span><i>
								  		<c:forEach items="${CategoryExperimentType}" var="var1" varStatus="vs">
											<c:if test="${var1.id_ExperimentType == var.ExperimentType}">${var1.name_ExperimentType }</c:if>	
										</c:forEach></i>
										</li>
								  		<li><span>实验机床</span><i>${var.ExperimentMachine } </i></li>
								  		<li><span>实验人员</span><div>${var.ExperimentPerson} </div></li>
								  		<li><span>责任人</span><i>${var.ExperimentTeacher } </i></li>
								  		<li><span>加工类别</span><i>${var.ExperimentMachiningType } </i></li>
								  		<li><span>加工形式</span><div>${var.ExperimentContent} </div></li>
								  		<li><span>实验时间</span><i>${var.ExperimentTime } </i></li>
									</ul>
									<span><div type = "button" class="choose_show_btn" style="margin-left:-5px" onclick="addC('${var.ExperimentNo }');" >添加参数</div></span>&nbsp;&nbsp;&nbsp;
									<span><div type = "button" class="choose_show_btn" style="margin-left:5px" onclick="goResult('${var.ExperimentNo }');" >查看该编号结果</div></span>
									
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
									
							</div>
							
							<div class="clear"></div>
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
					</div>
				</c:forEach>
			</c:when>
			
	    	<c:otherwise>没有相关数据</c:otherwise>
	  	</c:choose>	
	</div>
	<div class="page-header position-relative" style="vertical-align:top;padding-top:10px;padding-left:20px;">
	<div class="pagination">
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="experimentManage/selectResult"/>
	</div>
  </div>
</div>


<script type="text/javascript">
	function goResult(num){
		window.location.href = "<%=path%>/experimentParameterResult/goExperimentResult?zT=1&&ExperimentNo="+num;
	}
</script>   
</body>
</html>


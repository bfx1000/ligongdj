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

<script type="text/javascript">
    
	//检索
	function onSearchKey(){
		var url = "<%=path%>/experimentManage/jzExperimentMachine?deputy=4";
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
	
	//展开折叠详细
	function onShowDetial(id_TurningHolder){
		$("#ulli_" + id_TurningHolder).toggle();
	}
	
	//预览pdf文件
	function onShowPdf(url){
		window.open("<%=basePath%>goods" + url);
	}
</script>
</head>
<body>	
<a class="btn" onclick="window.parent.close();">返回</a>	
<div class="content_box_table">
  <form action="experimentManage/jzExperimentMachine?deputy=4" method="post" name="Form" id="Form">
    <div class="search_wrap">
	  <div class="search_input_wrap">
		<span>刀片编号<input name="NumberTurningBlade" tpye="text" value="${pd.NumberTurningBlade }" /></span>
		<span>刀片类型
		  <!-- 刀片类型(1 外圆切削 2 内孔切削 3 超硬刀具 4 重型加工刀片) -->
		  <select name="TypeBTADrill" class="select" style="width : 100px;">
			<option value="" ${pd.TypeBTADrill == '' ? 'selected' : '' }>请选择</option>
			<option value="1" ${pd.TypeBTADrill == 1 ? 'selected' : '' }>外圆切削</option>
			<option value="2" ${pd.TypeBTADrill == 2 ? 'selected' : '' }>内孔切削</option>
			<option value="3" ${pd.TypeBTADrill == 3 ? 'selected' : '' }>超硬刀具</option>
			<option value="4" ${pd.TypeBTADrill == 4 ? 'selected' : '' }>重型加工刀片</option>
		  </select>
		</span>
		<span>ISO基准刀片<input name="ISOBladeTurning" tpye="text" value="${pd.ISOBladeTurning }" /></span>
		<span>刀片涂层<input name="ToolCoatBladeTurning" tpye="text" value="${pd.ToolCoatBladeTurning }" /></span>
		<span>刀具材料<input name="ToolMaterialBladeTurning" tpye="text" value="${pd.ToolMaterialBladeTurning }" /></span>
		<span>加工类别
		  <!-- 加工类别(1 精加工 2 粗加工 3 半精加工)  -->
		  <select name="MachiningTypeBladeTurning" class="select" style="width : 100px;">
			<option value="" ${pd.MachiningTypeBladeTurning == '' ? 'selected' : '' }>请选择</option>
			<option value="1" ${pd.MachiningTypeBladeTurning == 1 ? 'selected' : '' }>精加工</option>
			<option value="2" ${pd.MachiningTypeBladeTurning == 2 ? 'selected' : '' }>粗加工</option>
			<option value="3" ${pd.MachiningTypeBladeTurning == 3 ? 'selected' : '' }>半精加工</option>
		  </select>
		</span>
		<span>刀片加工特点<input name="ToolBladeFeatureTurning" tpye="text" value="${pd.ToolBladeFeatureTurning }" /></span>
		<span>刀片厂商<input name="CompanyTurningBlade" tpye="text" value="${pd.CompanyTurningBlade }" /></span>
		<span>加工材料<input name="MateriaBladeTurning" tpye="text" value="${pd.MateriaBladeTurning }" /></span>
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
	  <span class="label_wrap"><input type="checkbox" checked="checked" />刀片编号</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />刀片类型</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />ISO基准刀片</span>
	  <span class="label_wrap"><input type="checkbox" />刀片涂层</span>
	  <span class="label_wrap"><input type="checkbox" />刀具材料</span>
	  <span class="label_wrap"><input type="checkbox" />加工类别</span>
	  <span class="label_wrap"><input type="checkbox" />刀片加工特点</span>
	  <span class="label_wrap"><input type="checkbox" />刀片厂商</span>
	  <span class="label_wrap"><input type="checkbox" />加工材料</span>		
	</div>
	<div class="opera_img">
	  <img src="/resources/images/ico_n.png" data-name="0"  onclick="changeOpera(this);"  alt="展开" />
	</div>
	<div class="choose_show_btn"   onclick="selectData();" >应用</div>	
	<div class="clear"></div>
  </div>
  <!-- 新增按钮   -->
  <div class="content_wrap">
    <c:choose>
      <c:when test="${not empty turningBladeList}">
	    <c:forEach items="${turningBladeList}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_TurningBlade });"></div>
			<span class="list_title skz_hide skz_list0">刀片编号：${var.NumberTurningBlade }</span> 
 			<span class="skz_hide skz_list1">刀片类型：${var.TypeBTADrill }</span> 
 			<span class="skz_hide skz_list2">ISO基准刀片：${var.ISOBladeTurning }</span> 
 			<span class="skz_hide skz_list3" style="display: none;">刀片涂层：${var.ToolCoatBladeTurning }</span> 
 			<span class="skz_hide skz_list4" style="display: none;">刀具材料：${var.ToolMaterialBladeTurning }</span> 
 			<span class="skz_hide skz_list5" style="display: none;">加工类别：${var.MachiningTypeBladeTurning }</span> 
			<span class="skz_hide skz_list6" style="display: none;">刀片加工特点：${var.ToolBladeFeatureTurning }</span> 
 			<span class="skz_hide skz_list7" style="display: none;">刀片厂商：${var.CompanyTurningBlade }</span> 
 			<span class="skz_hide skz_list8" style="display: none;">加工材料：${var.MateriaBladeTurning }</span> 
			<span class="opera_wrap  skz_hide  skz_list9">
			  <span class="btn btn_xg" onclick="window.parent.opt('${var.NumberTurningBlade }',4,'${var.TypeBTADrill==1?'外圆切削':(var.TypeBTADrill==2?'内孔切削':(var.TypeBTADrill==3?'超硬刀具':(var.TypeBTADrill==4?'重型加工刀片':''))) }');">选择</span>
			</span>					
			<div class="clear"></div>
			<!-- 展开详情   -->
			<div id="ulli_${var.id_TurningBlade}" class="ulli" style="display: none;">
			  <div class="box_xiangxi">
				<!--<img src="images/dtcp_img1.png" class="img1" alt="哈理工刀头" title="哈理工刀头"/> -->
				<div class="box_u1">
				  <ul class="ul1">
					<li><span>刀片编号</span><i>${var.NumberTurningBlade }</i></li>
					<li><span>刀片名称</span><i>${var.NameTurningBlade }</i></li>
					<li><span>刀片涂层</span><i>${var.ToolCoatBladeTurning }</i></li>
					<li><span>加工类别</span><div>${var.MachiningTypeBladeTurning } </div></li>
					<li><span>刀片厂商</span><i>${var.CompanyTurningBlade } </i></li>
				  </ul>
				  <ul class="ul1">
					<li><span>刀片类型</span><i>${var.TypeBTADrill }</i></li>
					<li><span>ISO基准刀片</span><i>${var.ISOBladeTurning } </i></li>
					<li><span>刀具材料</span><div>${var.ToolMaterialBladeTurning } </div></li>
					<li><span>刀片加工特点</span><i>${var.ToolBladeFeatureTurning } </i></li>
					<li><span>断屑槽类型</span><i>${var.BreakerBladeTurning } </i></li>
					<li></li>			
				  </ul>
				  <div class="clear"></div>
				  <div class="block">刀片角度信息：</div>
				  <ul class="ul1">
				  	<li><span>后角</span><i>${var.HoujiaoBladeTurning } </i></li>
					<li><span>刀尖圆弧半径</span><i>${var.NoseRadiusTurning } </i></li>
				  </ul>
				  <ul class="ul1">
				  	<li><span>前角</span><i>${var.QianjiaoBladeTurning } </i></li>
					<li><span>刃倾角</span><i>${var.HoujisojiaoBladeTurning } </i></li>
				  </ul>
  				  <div class="clear"></div>
				</div>
			  </div>
			  <c:if test="${fn:contains(var.isPMKNS, 'P')}">
			    <div class="box_p">
			  	  <h4>加工P参数</h4>
			  	  <p>${var.ISOPTextBladeTurning }</p>
			    </div>
			  </c:if>
			  <c:if test="${fn:contains(var.isPMKNS, 'M')}">
			    <div class="box_p">
			  	  <h4>加工M参数</h4>
			  	  <p>${var.ISOMTextBladeTurning }</p>
			    </div>
			  </c:if>
			  <c:if test="${fn:contains(var.isPMKNS, 'K')}">
			    <div class="box_p">
			  	  <h4>加工K参数</h4>
			  	  <p>${var.ISOKTextBladeTurning }</p>
			    </div>
			  </c:if>
			  <c:if test="${fn:contains(var.isPMKNS, 'N')}">
			    <div class="box_p">
			  	  <h4>加工N参数</h4>
			  	  <p>${var.ISONTextBladeTurning }</p>
			    </div>
			  </c:if>
			  <c:if test="${fn:contains(var.isPMKNS, 'S')}">
			    <div class="box_p">
			  	  <h4>加工S参数</h4>
			  	  <p>${var.ISOSTextBladeTurning }</p>
			    </div>
			  </c:if>
				<div class="box_p">
				&nbsp;
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
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="experimentManage/jzExperimentMachine?deputy=4"/>
	</div>
  </div>
</div>

</body>
</html>


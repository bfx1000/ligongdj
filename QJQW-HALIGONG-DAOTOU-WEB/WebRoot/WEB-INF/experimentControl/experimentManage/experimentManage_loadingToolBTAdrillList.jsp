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
			var url = "<%=path%>/experimentManage/jzExperimentMachine?deputy=5";
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
		function onShowDetial(id_BTADrill){
			$("#ulli_" + id_BTADrill).toggle();
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
	<form action="experimentManage/jzExperimentMachine?deputy=5" method="post" name="Form" id="Form">
	  <div class="search_wrap">
	  
	  	<div class="search_input_wrap">
		  	<span>钻头编号<input name="NumberBTADrill" tpye="text" value="${pd.NumberBTADrill }" /></span>
		  	<span>钻头类型
		  	  <select name="TypeBTADrill" onChange="" class="select" id="TypeBTADrill_userForm" >
		  	  	<option value="" ${pd.TypeBTADrill == '' ? 'selected' : '' }>请选择</option>
			    <option value="1" ${pd.TypeBTADrill == 1 ? 'selected' : '' }>焊接钻头</option>
			    <option value="2" ${pd.TypeBTADrill == 2 ? 'selected' : '' }>可转位钻头</option>
			  </select>
		  	</span>
		  	<span>钻头名称<input name="NameBTADrill" tpye="text" value="${pd.NameBTADrill }" /></span>
		  	<span>加工直径<input name="DiameterBTADrill" tpye="text" value="${pd.DiameterBTADrill }" /></span>
		  	<span>加工材料<input name="MateriaBTAlDrill" tpye="text" value="${pd.MateriaBTAlDrill }" /></span>
		  	<span>刀具材料<input name="ToolMaterialBTADrill" tpye="text" value="${pd.ToolMaterialBTADrill }" /></span>
		  	<span>刀具涂层<input name="ToolCoatBTADrill" tpye="text" value="${pd.ToolCoatBTADrill }" /></span>
		  	<span>断屑槽类型<input name="BreakerBTADrill" tpye="text" value="${pd.BreakerBTADrill }" /></span>
		  	<span>生产厂家<input name="CompanyBTADrill" tpye="text" value="${pd.CompanyBTADrill }" /></span>
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
			<span class="label_wrap"><input type="checkbox" checked="checked" />钻头编号</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />钻头类型</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />钻头名称</span>
			<span class="label_wrap"><input type="checkbox" />加工直径</span>
			<span class="label_wrap"><input type="checkbox" />加工材料</span>
			<span class="label_wrap"><input type="checkbox" />刀具材料</span>
			<span class="label_wrap"><input type="checkbox" />刀具涂层</span>
			<span class="label_wrap"><input type="checkbox" />断屑槽类型</span>
			<span class="label_wrap"><input type="checkbox" />生产厂家</span>
		</div>
		
		<div class="opera_img">
		  	<img src="/resources/images/ico_n.png" data-name="0"  onclick="changeOpera(this);"  alt="展开" />
		</div>
		<div class="choose_show_btn"   onclick="selectData();" >应用</div>	
		<div class="clear"></div>
	</div>
	
	<div class="content_wrap">
		<!-- class : skz_hide用在勾选显示         -->
		<c:choose>
    		<c:when test="${not empty toolBTAdrillList}">
	  			<c:forEach items="${toolBTAdrillList}" var="var" varStatus="vs">	
					<div class="each_list_wrap"  >
						<div class="onclick" onclick="onShowDetial(${var.id_BTADrill });"></div>
						<span class="list_title skz_hide  skz_list0">钻头编号：${var.NumberBTADrill }</span>
						<span class="skz_list1" >钻头类型：${var.TypeBTADrill == 1 ? '焊接钻头' : '可转位钻头'}</span>
						<span class="skz_hide  skz_list2" >钻头名称：${var.NameBTADrill }</span>
						<span class="skz_hide  skz_list3" style="display: none;">加工直径：${var.DiameterBTADrill}</span>
						<span class="skz_hide  skz_list4" style="display: none;">加工材料：${var.MateriaBTAlDrill}</span>
						<span class="skz_hide  skz_list5" style="display: none;">刀具材料：${var.ToolMaterialBTADrill}</span>
						<span class="skz_hide  skz_list6" style="display: none;">刀具涂层：${var.ToolCoatBTADrill}</span>
						<span class="skz_hide  skz_list7" style="display: none;">断屑槽类型：${var.BreakerBTADrill }</span>
						<span class="skz_hide  skz_list8" style="display: none;">生产厂家：${var.CompanyBTADrill }</span>
						<span class="opera_wrap  skz_hide  skz_list9">
							<span class="btn btn_xg" onclick="window.parent.opt('${var.NumberBTADrill}',5,'${var.TypeBTADrill == 1 ? '焊接钻头' : '可转位钻头'}');">选择</span>
						</span>
						<div class="clear"></div>	
						
						<!-- 展开详情   -->
						<div id="ulli_${var.id_BTADrill}"  data-name="0"  class="ulli" style="display: none;">
							<div class="box_xiangxi">
							<!--<img src="images/dtcp_img1.png" class="img1" alt="哈理工刀头" title="哈理工刀头"/> -->
								<div class="box_u1">
									<ul class="ul1">
								  		<li><span>钻头编号</span><i>${var.NumberBTADrill } </i></li>
								  		<li><span>钻头类型</span><i>${var.TypeBTADrill == 1 ? '焊接钻头' : '可转位钻头'} </i></li>
								  		<li><span>加工直径</span><div>${var.DiameterBTADrill} </div></li>
								  		<li><span>断屑槽类型</span><i>${var.BreakerBTADrill } </i></li>
								  		<li><span>生产厂家</span><i>${var.CompanyBTADrill } </i></li>
									</ul>
									<ul class="ul1">
								  		<li><span>加工材料</span><i>${var.MateriaBTAlDrill}</i></li>
								  		<li><span>刀具材料</span><i>${var.ToolMaterialBTADrill}</i></li>
								  		<li><span>刀具涂层</span><i>${var.ToolCoatBTADrill}</i></li>
								  		<li><span>ISO材料加工信息</span><i></i></li>
									</ul>
									<div class="clear"></div>
							  	</div>
							</div>
							
			
							<div class="box_p">
							  	<h4>详细信息</h4>
							  	<p>
							    	<c:forEach items="${var.informDetailBTADrillList}" var="var1" varStatus="vs">
							      		<span name='informDetailBTADrills_img' >${var1.name_InformDetailBTADrill }</span>
							      		<a class="btn" onclick="onShowPdf('${var1.url_InformDetailBTADrill }');">预览</a>
							      		<br/>
							    	</c:forEach>
							  	</p>
							</div>
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
	
	<div class="clear"></div>
  	<div class="page-header position-relative" style="vertical-align:top;padding-top:10px;padding-left:20px;">
<!-- 		  <a class="btn" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" >批量删除</a> -->
	   
		<div class="pagination">
	  		<ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="experimentManage/jzExperimentMachine?deputy=5"/>
		</div>
	</div>
</div>
</body>
</html>
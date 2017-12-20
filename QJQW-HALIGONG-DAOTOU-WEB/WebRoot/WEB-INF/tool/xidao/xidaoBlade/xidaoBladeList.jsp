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
		var url = "<%=path%>/xidaoBlade/queryXidaoBladeList";
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
		window.location.href='<%=path%>/xidaoBlade/goAddXidaoBlade?id=';
	}
	
	//修改
	function edit(id){
		window.location.href='<%=path%>/xidaoBlade/goAddXidaoBlade?id=' + id;
	}
	
	//展开折叠详细
	function onShowDetial(id_XidaoHolder){
		$("#ulli_" + id_XidaoHolder).toggle();
	}
	
	//删除
	function del(id_XidaoBlade){
		if(confirm("确定要删除吗?")){
			var url = "<%=path%>/xidaoBlade/deleteXidaoBlade?id_XidaoBlade=" + id_XidaoBlade;
			document.Form.action = url;
			$("#Form").ajaxSubmit(function(result){
				if(result) {jump(${page.pageNo};
				}else{alert('操作失败，请联系管理员！');
				}//if 结束
			}//$("#Form").ajaxSubmit(function(result)结束
		);
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
  <form action="xidaoBlade/queryXidaoBladeList" method="post" name="Form" id="Form">
    <div class="search_wrap">
	  <div class="search_input_wrap">
		<span>刀片编号<input name="NumberXidaoBlade" tpye="text" value="${pd.NumberXidaoBlade }" /></span>
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
		<span>ISO基准刀片<input name="ISOBladeXidao" tpye="text" value="${pd.ISOBladeXidao }" /></span>
		<span>刀片涂层<input name="ToolCoatBladeXidao" tpye="text" value="${pd.ToolCoatBladeXidao }" /></span>
		<span>刀具材料<input name="ToolMaterialBladeXidao" tpye="text" value="${pd.ToolMaterialBladeXidao }" /></span>
		<span>加工类别
		  <!-- 加工类别(1 精加工 2 粗加工 3 半精加工)  -->
		  <select name="MachiningTypeBladeXidao" class="select" style="width : 100px;">
			<option value="" ${pd.MachiningTypeBladeXidao == '' ? 'selected' : '' }>请选择</option>
			<option value="1" ${pd.MachiningTypeBladeXidao == 1 ? 'selected' : '' }>精加工</option>
			<option value="2" ${pd.MachiningTypeBladeXidao == 2 ? 'selected' : '' }>粗加工</option>
			<option value="3" ${pd.MachiningTypeBladeXidao == 3 ? 'selected' : '' }>半精加工</option>
		  </select>
		</span>
		<span>刀片加工特点<input name="ToolBladeFeatureXidao" tpye="text" value="${pd.ToolBladeFeatureXidao }" /></span>
		<span>刀片厂商<input name="CompanyXidaoBlade" tpye="text" value="${pd.CompanyXidaoBlade }" /></span>
		<span>加工材料<input name="MateriaBladeXidao" tpye="text" value="${pd.MateriaBladeXidao }" /></span>
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
	  <span class="label_wrap"><input type="checkbox" checked="checked" />刀片涂层</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />刀具材料</span>
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
  <div class="addbtn_wrap">
	<a class="btn" onclick="add();">新增</a>
  </div>
  <div class="content_wrap">
  	<div class="each_list_wrap" style="background: white;">
			<span class="list_title skz_hide skz_list0">&nbsp;刀片编号</span> 
 			<span class="list_title skz_hide skz_list1">&nbsp;刀片类型</span> 
 			<span class="list_title skz_hide skz_list2">&nbsp;ISO基准刀片</span> 
 			<span class="list_title skz_hide skz_list3"  >&nbsp;刀片涂层</span> 
 			<span class="list_title skz_hide skz_list4"  >&nbsp;刀具材料</span> 
 			<span class="list_title skz_hide skz_list5" style="display: none;">&nbsp;加工类别</span> 
			<span class="list_title skz_hide skz_list6" style="display: none;">&nbsp;刀片加工特点</span> 
 			<span class="list_title skz_hide skz_list7" style="display: none;">&nbsp;刀片厂商</span> 
 			<span class="list_title skz_hide skz_list8" style="display: none;">&nbsp;加工材料</span> 
			<span class="list_title opera_wrap  skz_hide  skz_list9">&nbsp;&nbsp;&nbsp;操作</span>
	</div>
    <c:choose>
      <c:when test="${not empty xidaoBladeList}">
	    <c:forEach items="${xidaoBladeList}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_XidaoBlade });"></div>
			<span class="skz_hide skz_list0">&nbsp;${var.NumberXidaoBlade }</span> 
 			<span class="skz_hide skz_list1">&nbsp;<c:choose>
						    <c:when test="${var.TypeBTADrill == 1}">外圆切削</c:when>
						    <c:when test="${var.TypeBTADrill == 2}">内孔切削</c:when>
						    <c:when test="${var.TypeBTADrill == 3}">超硬刀具</c:when>
						    <c:when test="${var.TypeBTADrill == 4}">重型加工刀片</c:when>
						  </c:choose></span> 
 			<span class="skz_hide skz_list2">&nbsp;${var.ISOBladeXidao }</span> 
 			<span class="skz_hide skz_list3"  >&nbsp;${var.ToolCoatBladeXidao }</span> 
 			<span class="skz_hide skz_list4"  >&nbsp;${var.ToolMaterialBladeXidao }</span> 
 			<span class="skz_hide skz_list5" style="display: none;">&nbsp;<c:choose>
						    <c:when test="${var.MachiningTypeBladeXidao == 1}">精加工</c:when>
						    <c:when test="${var.MachiningTypeBladeXidao == 2}">粗加工</c:when>
						    <c:when test="${var.MachiningTypeBladeXidao == 3}">半精加工</c:when>
						  </c:choose></span> 
			<span class="skz_hide skz_list6" style="display: none;">&nbsp;${var.ToolBladeFeatureXidao }</span> 
 			<span class="skz_hide skz_list7" style="display: none;">&nbsp;${var.CompanyXidaoBlade }</span> 
 			<span class="skz_hide skz_list8" style="display: none;">&nbsp;${var.MateriaBladeXidao }</span> 
			<span class="opera_wrap  skz_hide  skz_list9">
			  <span class="btn btn_xg" onclick="edit('${var.id_XidaoBlade}');">修改</span>
			  <span class="btn btn_sc" onclick="del('${var.id_XidaoBlade}');">删除</span>
			</span>					
			<div class="clear"></div>
			<!-- 展开详情   -->
			<div id="ulli_${var.id_XidaoBlade}" class="ulli" style="display: none;">
			  <div class="box_xiangxi">
				<!--<img src="images/dtcp_img1.png" class="img1" alt="哈理工刀头" title="哈理工刀头"/> -->
				<div class="box_u1">
				  <ul class="ul1">
					<li><span>刀片编号</span><i>${var.NumberXidaoBlade }</i></li>
					<li><span>刀片名称</span><i>${var.NameXidaoBlade }</i></li>
					<li><span>刀片涂层</span><i>${var.ToolCoatBladeXidao }</i></li>
					<li><span>加工类别</span><div>
						<c:choose>
						    <c:when test="${var.MachiningTypeBladeXidao == 1}">精加工</c:when>
						    <c:when test="${var.MachiningTypeBladeXidao == 2}">粗加工</c:when>
						    <c:when test="${var.MachiningTypeBladeXidao == 3}">半精加工</c:when>
						  </c:choose></div>
					</li>
					<li><span>刀片厂商</span><i>${var.CompanyXidaoBlade } </i></li>
					<li><span>刀柄</span><i>${var.HolderInfo } </i></li>
				  </ul>
				  <ul class="ul1">
					<li><span>刀片类型</span><i>
						<c:choose>
						    <c:when test="${var.TypeBTADrill == 1}">外圆切削</c:when>
						    <c:when test="${var.TypeBTADrill == 2}">内孔切削</c:when>
						    <c:when test="${var.TypeBTADrill == 3}">超硬刀具</c:when>
						    <c:when test="${var.TypeBTADrill == 4}">重型加工刀片</c:when>
						  </c:choose>
						</i>
					</li>
					<li><span>ISO基准刀片</span><i>${var.ISOBladeXidao } </i></li>
					<li><span>刀具材料</span><div>${var.ToolMaterialBladeXidao } </div></li>
					<li><span>刀片加工特点</span><i>${var.ToolBladeFeatureXidao } </i></li>
					<li><span>断屑槽类型</span><i>${var.BreakerBladeXidao } </i></li>
					<li></li>			
				  </ul>
				  <div class="clear"></div>
				  <div class="block">刀片角度信息：</div>
				  <ul class="ul1">
				  	<li><span>后角</span><i>${var.HoujiaoBladeXidao } </i></li>
					<li><span>刀尖圆弧半径</span><i>${var.NoseRadiusXidao } </i></li>
				  </ul>
				  <ul class="ul1">
				  	<li><span>前角</span><i>${var.QianjiaoBladeXidao } </i></li>
					<li><span>刃倾角</span><i>${var.HoujisojiaoBladeXidao } </i></li>
				  </ul>
  				  <div class="clear"></div>
				</div>
			  </div>
			  <c:if test="${fn:contains(var.isPMKNS, 'P')}">
			    <div class="box_p">
			  	  <h4>加工P参数</h4>
			  	  <p>${var.ISOPTextBladeXidao }</p>
			    </div>
			  </c:if>
			  <c:if test="${fn:contains(var.isPMKNS, 'M')}">
			    <div class="box_p">
			  	  <h4>加工M参数</h4>
			  	  <p>${var.ISOMTextBladeXidao }</p>
			    </div>
			  </c:if>
			  <c:if test="${fn:contains(var.isPMKNS, 'K')}">
			    <div class="box_p">
			  	  <h4>加工K参数</h4>
			  	  <p>${var.ISOKTextBladeXidao }</p>
			    </div>
			  </c:if>
			  <c:if test="${fn:contains(var.isPMKNS, 'N')}">
			    <div class="box_p">
			  	  <h4>加工N参数</h4>
			  	  <p>${var.ISONTextBladeXidao }</p>
			    </div>
			  </c:if>
			  <c:if test="${fn:contains(var.isPMKNS, 'S')}">
			    <div class="box_p">
			  	  <h4>加工S参数</h4>
			  	  <p>${var.ISOSTextBladeXidao }</p>
			    </div>
			  </c:if>
			  <div class="box_p">
			    <h4>刀具图片</h4>
			    <p>
			      <c:forEach items="${var.pictureBladeXidaoList}" var="var1" varStatus="vs">
			        <img name='pictureXidaoHolders_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_PictureBladeXidao }' />
			        <a class="btn" onclick="onShowPdf('${var1.url_PictureBladeXidao }');">预览</a>
			        <br/>
			      </c:forEach>
			    </p>
			  </div>
			  <div class="box_p">
			    <h4>详细图片</h4>
			    <p>
			      <c:forEach items="${var.pictureDetailBladeXidaoList}" var="var1" varStatus="vs">
			        <img name='pictureXidaoHolders_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_PictureDetailBladeXidao }' />
			        <a class="btn" onclick="onShowPdf('${var1.url_PictureDetailBladeXidao }');">预览</a>
			        <br/>
			      </c:forEach>
			    </p>
			  </div>
			  
				<div class="box_p">
				  <h4>详细信息</h4>
				  <p>
				    <c:forEach items="${var.informDetailBladeXidaoList}" var="var1" varStatus="vs">
				      <span name='informDetailXidaoHolders_img' >${var1.name_InformDetailBladeXidao }</span>
				      <a class="btn" onclick="onShowPdf('${var1.url_InformDetailBladeXidao }');">下载</a>
				      <br/>
				    </c:forEach>
				  </p>
				</div>
				<div class="box_p">
				  <h4>应用实例</h4>
				  <p>
				    <c:forEach items="${var.applicationBladeXidaoList}" var="var1" varStatus="vs">
				      <span name='informDetailXidaoHolders_img' >${var1.name_ApplicationBladeXidao }</span>
				      <a class="btn" onclick="onShowPdf('${var1.url_ApplicationBladeXidao }');">下载</a>
				      <br/>
				    </c:forEach>
				  </p>
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
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="xidaoBlade/queryXidaoBladeList"/>
	</div>
  </div>
</div>

</body>
</html>


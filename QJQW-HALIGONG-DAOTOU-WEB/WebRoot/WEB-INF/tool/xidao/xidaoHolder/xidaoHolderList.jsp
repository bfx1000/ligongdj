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
		var url = "<%=path%>/xidaoHolder/queryXidaoHolderList";
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
		window.location.href='<%=path%>/xidaoHolder/goAddXidaoHolder?id='; 
  		<%-- window.location.href='<%=path%>/turningHolder/goAddTurningHolder?id='; --%>
	}

	//修改
	function edit(id){
		window.location.href='<%=path%>/xidaoHolder/goAddXidaoHolder?id=' + id;
	}
	
	//展开折叠详细
	function onShowDetial(id_XidaoHolder){
		$("#ulli_" + id_XidaoHolder).toggle();
	}
	
	//删除
	function del(id_XidaoHolder){
		if(confirm("确定要删除吗?")){
			var url = "<%=path%>/xidaoHolder/deleteXidaoHolder?id_XidaoHolder=" + id_XidaoHolder;
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
  <form action="xidaoHolder/queryXidaoHolderList" method="post" name="Form" id="Form">
    <div class="search_wrap">
	  <div class="search_input_wrap">
		<span>刀柄编号<input name="numberXidaoHolder" tpye="text" value="${pd.numberXidaoHolder }" /></span>
		<span>刀柄名称<input name="nameXidaoHolder" tpye="text" value="${pd.nameXidaoHolder }" /></span>
		<span>加工类别
		  <!-- (1 外圆车削 2 内圆车削 3 重型车削 4 断续车削 5 切槽 9 自定义) -->
		  <select name="typeXidaoHolder" class="select" style="width : 100px;">
			<option value="" ${pd.typeXidaoHolder == '' ? 'selected' : '' }>请选择</option>
			<option value="1" ${pd.typeXidaoHolder == 1 ? 'selected' : '' }>外圆车削</option>
			<option value="2" ${pd.typeXidaoHolder == 2 ? 'selected' : '' }>内圆车削</option>
			<option value="3" ${pd.typeXidaoHolder == 3 ? 'selected' : '' }>重型车削</option>
			<option value="4" ${pd.typeXidaoHolder == 4 ? 'selected' : '' }>断续车削</option>
			<option value="5" ${pd.typeXidaoHolder == 5 ? 'selected' : '' }>切槽</option>
			<option value="9" ${pd.typeXidaoHolder == 9 ? 'selected' : '' }>自定义</option>
		  </select>
		</span>
		<span>ISO基准刀片<input name="isoBladeXidao" tpye="text" value="${pd.isoBladeXidao }" /></span>
		<span>刀片类别
		  <!-- (1 正前角刀片 2 负前角刀片 3 陶瓷刀片 4 PCBN刀片 9 自定义) -->
		  <select name="typeBlade" id="typeBlade_userForm" onChange="onShowtypeBladeCustom();" class="select" style="width : 100px;">
			<option value="" ${pd.typeBlade == '' ? 'selected' : '' }>请选择</option>
			<option value="1" ${pd.typeBlade == 1 ? 'selected' : '' }>正前角刀片</option>
			<option value="2" ${pd.typeBlade == 2 ? 'selected' : '' }>负前角刀片</option>
			<option value="3" ${pd.typeBlade == 3 ? 'selected' : '' }>陶瓷刀片</option>
			<option value="4" ${pd.typeBlade == 4 ? 'selected' : '' }>PCBN刀片</option>
			<option value="9" ${pd.typeBlade == 9 ? 'selected' : '' }>自定义</option>
		  </select>
		</span>
		<span>主偏角<input name="diameterXidaoHolder" tpye="text" value="${pd.diameterXidaoHolder }" /></span>
		<span>生产厂家<input name="companyXidaoHolder" tpye="text" value="${pd.companyXidaoHolder }" /></span>
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
	  <span class="label_wrap"><input type="checkbox" checked="checked" />刀柄编号</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />刀柄名称</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />加工类别</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />ISO基准刀片</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />刀片类别</span>
	  <span class="label_wrap"><input type="checkbox" />主偏角</span>
	  <span class="label_wrap"><input type="checkbox" />生产厂家</span>
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
		        <span class="list_title skz_hide  skz_list0">&nbsp;刀柄编号</span>
				<span class="list_title skz_hide skz_list1" >&nbsp;刀柄名称</span>
				<span class="list_title skz_hide  skz_list2" >&nbsp;加工类别</span>
				<span class="list_title skz_hide  skz_list3" >&nbsp;ISO基准刀片</span>
				<span class="list_title skz_hide  skz_list4" >&nbsp;刀片类别</span>
				<span class="list_title skz_hide  skz_list5" style="display: none;">&nbsp;主偏角</span>
				<span class="list_title skz_hide  skz_list6" style="display: none;">&nbsp;生产厂家</span>
				<span class="list_title opera_wrap  skz_hide  skz_list7">&nbsp;&nbsp;&nbsp;操作</span>
			</div>
    <c:choose>
      <c:when test="${not empty xidaoHolderList}">
	    <c:forEach items="${xidaoHolderList}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_XidaoHolder });"></div>
	        <span class="skz_hide  skz_list0">&nbsp;${var.numberXidaoHolder }</span>
			<span class="skz_list1" >&nbsp;${var.nameXidaoHolder}</span>
			<span class="skz_hide  skz_list2" >&nbsp;
			  <c:choose>
			    <c:when test="${var.typeXidaoHolder == 1}">外圆车削</c:when>
			    <c:when test="${var.typeXidaoHolder == 2}">内圆车削</c:when>
			    <c:when test="${var.typeXidaoHolder == 3}">重型车削</c:when>
			    <c:when test="${var.typeXidaoHolder == 4}">断续车削</c:when>
			    <c:when test="${var.typeXidaoHolder == 5}">切槽</c:when>
			    <c:when test="${var.typeXidaoHolder == 9}">自定义</c:when>
			  </c:choose>
			</span>
			<span class="skz_hide  skz_list3" >&nbsp;${var.isoBladeXidao}</span>
			<span class="skz_hide  skz_list4" >&nbsp;
			  <c:choose>
			    <c:when test="${var.typeBlade == 1}">正前角刀片</c:when>
			    <c:when test="${var.typeBlade == 2}">负前角刀片</c:when>
			    <c:when test="${var.typeBlade == 3}">陶瓷刀片</c:when>
			    <c:when test="${var.typeBlade == 4}">PCBN刀片</c:when>
			    <c:when test="${var.typeBlade == 9}">自定义</c:when>
			  </c:choose>
			</span>
			<span class="skz_hide  skz_list5" style="display: none;">&nbsp;${var.diameterXidaoHolder}</span>
			<span class="skz_hide  skz_list6" style="display: none;">&nbsp;${var.companyXidaoHolder}</span>
			<span class="opera_wrap  skz_hide  skz_list7">
			  <span class="btn btn_xg" onclick="edit('${var.id_XidaoHolder}');">修改</span>
			  <span class="btn btn_sc" onclick="del('${var.id_XidaoHolder}');">删除</span>
			</span>
			<div class="clear"></div>	
			  <div id="ulli_${var.id_XidaoHolder}" class="ulli" style="display: none;">
				<div class="box_xiangxi">
				  <div class="box_u1">
					<ul class="ul1">
					  <li><span>刀柄编号</span><i>${var.numberXidaoHolder}</i></li>
					  <li><span>刀柄名称</span><i>${var.nameXidaoHolder}</i></li>
					  <li>
					    <span>加工类别</span>
					    <div>
					      <c:choose>
					        <c:when test="${var.typeXidaoHolder == 1}">外圆车削</c:when>
					        <c:when test="${var.typeXidaoHolder == 2}">内圆车削</c:when>
					        <c:when test="${var.typeXidaoHolder == 3}">重型车削</c:when>
					        <c:when test="${var.typeXidaoHolder == 4}">断续车削</c:when>
					        <c:when test="${var.typeXidaoHolder == 5}">切槽</c:when>
					        <c:when test="${var.typeXidaoHolder == 9}">自定义</c:when>
					      </c:choose>
					    </div>
					  </li>
					  <li><span>ISO基准刀片</span><i>${var.isoBladeXidao }</i></li>
					</ul>
					<ul class="ul1">
					  
					  <li>
					    <span>刀片类别</span>
					    <i>
					      <c:choose>
						    <c:when test="${var.typeBlade == 1}">正前角刀片</c:when>
						    <c:when test="${var.typeBlade == 2}">负前角刀片</c:when>
						    <c:when test="${var.typeBlade == 3}">陶瓷刀片</c:when>
						    <c:when test="${var.typeBlade == 4}">PCBN刀片</c:when>
						    <c:when test="${var.typeBlade == 9}">自定义</c:when>
						  </c:choose>
					    </i>
					  </li>
					  <li><span>主偏角</span><i>${var.diameterXidaoHolder}</i></li>
					  <li><span>生产厂家</span><i>${var.companyXidaoHolder}</i></li>
					</ul>
					<div class="clear"></div>
				  </div>
				</div>
				<div class="box_p">
				  <h4>加工特性简述</h4>
				  <p>
				    ${var.featureXidaoHolder}
				  </p>
				</div>

				<div class="box_p">
				  <h4>刀柄图片</h4>
				  <p>
				    <c:forEach items="${var.pictureXidaoHolderList}" var="var1" varStatus="vs">
				      <img name='pictureXidaoHolders_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_PictureXidaoHolder }' />
				      <a class="btn" onclick="onShowPdf('${var1.url_PictureXidaoHolder }');">预览</a>
				      <br/>
				    </c:forEach>
				  </p>
				</div>
				<div class="box_p">
				  <h4>详细图片</h4>
				  <p>
				    <c:forEach items="${var.pictureDetailXidaoHolderList}" var="var1" varStatus="vs">
				      <img name='pictureDetailXidaoHolders_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_PictureDetailXidaoHolder }' />
				      <a class="btn" onclick="onShowPdf('${var1.url_PictureDetailXidaoHolder }');">预览</a>
				      <br/>
				    </c:forEach>
				  </p>
				</div>
				<div class="box_p">
				  <h4>详细信息</h4>
				  <p>
				    <c:forEach items="${var.informDetailXidaoHolderList}" var="var1" varStatus="vs">
				      <span name='informDetailXidaoHolders_img' >${var1.name_InformDetailXidaoHolder }</span>
				      <a class="btn" onclick="onShowPdf('${var1.url_InformDetailXidaoHolder }');">预览</a>
				      <br/>
				    </c:forEach>
				  </p>
				</div>
				<div class="clear"></div>
				
				
			  </div>
			</div>
		  </c:forEach>
	    </c:when>
	    <c:otherwise>没有相关数据</c:otherwise>
	  </c:choose>
</div>
  <div class="page-header position-relative" style="vertical-align:top;padding-top:10px;padding-left:20px;">
<!-- 	      <a class="btn" onclick="add();">新增</a> -->
<!-- 		  <a class="btn" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" >批量删除</a> -->
	   
	<div class="pagination">
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="xidaoHolder/queryXidaoHolderList"/>
	</div>
  </div>
</div>

</body>
</html>


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
<link href="<%=path%>/resources/css/index/style_a.css" rel="stylesheet" type="text/css" />
<!-- <link href="<%=path%>/resources/css/bootstrap.min.css" rel="stylesheet" /> -->
<!-- <link href="<%=path%>/resources/css/bootstrap-responsive.min.css" rel="stylesheet" /> -->

<script type="text/javascript">
    
	//检索
	function onSearchKey(){
		var url = "<%=path%>/document/documentList";
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
		window.location.href='<%=path%>/document/goAddDocument?id=';
	}
	
	//修改
	function edit(id){
		window.location.href='<%=path%>/document/goAddDocument?id=' + id;
	}
	
	//展开折叠详细
	function onShowDetial(id_StaffManuf){
		$("#ulli_" + id_StaffManuf).toggle();
	}
	
	//删除
	function del(id_Document){
		if(confirm("确定要删除吗?")){
			var url = "<%=path%>/document/deleteDocumentList?id_Document=" + id_Document;
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
  <form action="document/documentList" method="post" name="Form" id="Form">
    <div class="search_wrap">
	  <div class="search_input_wrap" style="width:146px;">
		<span>标题<input name="SuperiorMachineGroup" tpye="text" value="${pd.title }" /></span>
		<div class="clear"></div>
	  </div>
	  <a class="sousuo_btn_min" onclick="onSearchKey();">搜索</a>			  
	  <div class="clear"></div>
	</div>
  </form>
  <!-- 新增按钮   -->
  <div class="addbtn_wrap">
	<a class="btn" onclick="add();">新增</a>
  </div>
  <div class="content_wrap">
    <c:choose>
      <c:when test="${not empty document}">
	    <c:forEach items="${document}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_Document });"></div>
			<span class="list_title skz_hide  skz_list0">&nbsp;${var.title }</span> 
			<span class="opera_wrap  skz_hide  skz_list1">
			  <span class="btn btn_xg" onclick="edit('${var.id_Document}');">修改</span>
			  <span class="btn btn_sc" onclick="del('${var.id_Document}');">删除</span>
			</span>					
			<div class="clear"></div>
			<!-- 展开详情   -->
			<div id="ulli_${var.id_Document}" class="ulli" style="display: none;">
			  <div class="box_xiangxi">
				<!--<img src="images/dtcp_img1.png" class="img1" alt="哈理工刀头" title="哈理工刀头"/> -->
				<div class="box_u1">
				  <ul class="ul1">
					<li><span>标题</span><i>${var.title }</i></li>
					<li><span>内容</span><i style="width:600px;">${var.text } </i></li>
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
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="document/documentList"/>
	</div>
  </div>
</div>

</body>
</html>


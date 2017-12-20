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
  <!-- jsp文件头和头部 -->
  <%@ include file="/WEB-INF/system/admin/top.jsp"%> 
  
		
<script type="text/javascript">
 	//排序
	function onSavePx(materials_id, materials_sort, bg){
		
		$("#pxForm_materials_id").val(materials_id);
		$("#pxForm_materials_sort").val($(bg).val());
		$("#pxForm").ajaxSubmit(function(result){
			 $("#Form").submit();
		});
	}
</script>
</head>
<body>	
<form action="/qjqwmain/materials/updateMaterialsForPx" name="pxForm" id="pxForm" method="post">
  <input type="hidden" name="materials_id"   id="pxForm_materials_id" />
  <input type="hidden" name="materials_sort" id="pxForm_materials_sort" />
</form>		
<div class="container-fluid" id="main-container">
  <div id="breadcrumbs">
	<ul class="breadcrumb">
	  <li><i class="icon-home"></i> <a>发消息</a><span class="divider"><i class="icon-angle-right"></i></span></li>
	  <li class="active">发消息</li>
	</ul><!--.breadcrumb-->
	<div id="nav-search">
	</div><!--#nav-search-->
  </div><!--#breadcrumbs-->
  <div id="page-content" class="clearfix">					
    <div class="row-fluid">
	  <div class="row-fluid">
		<!-- 检索  -->
		
		<form action="/qjqwmain/materials/queryMaterialsList" method="post" name="Form" id="Form">
       	  <c:choose>
       		<c:when test="${ not empty lm}">
       		  <c:forEach items="${lm }" var="var" varStatus="vs">
       			<a class="btn btn-lg btn-success"  href="/qjqwmain/materials/queryMaterialsList?class_id=${var.materials_class_id }">${var.materials_class_name}</a>
       		  </c:forEach>
       		</c:when>
       	  </c:choose>
		  <input type="hidden" name="class_id" value="${pd.class_id }" >
		</form>
		<!-- 检索  -->
		<table id="table_report" class="table table-striped table-bordered table-hover">
		  <thead>
			<tr>
			  <th class="center">
				<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
			  </th>
			  <th>用户id</th>
			  <th>用户头像</th>
			  <th>用户昵称</th>
			  <th>企业介绍</th>
			  <th>合伙人状态</th>
			  <th class="center">操作</th>
			</tr>
		  </thead>
		  <tbody>
			<!-- 开始循环 -->	
			<c:choose>
			  <c:when test="${not empty userList}">
				<c:forEach items="${userList}" var="var" varStatus="vs">
				  <tr>
					<td class='center' style="width: 30px;">
					  <label><input type='checkbox' name='ids' value="${var.user_id}" /><span class="lbl"></span></label>
					</td>
					<td class='center' style="width: 50px;">${var.user_id}</td>
					<td style="width: 60px;">
					  <c:choose>
						<c:when test="${fn:containsIgnoreCase(var.user_head_photo,'http')}">
						  <img src="${var.user_head_photo}" class="user_img" width="53" height="53" />
						</c:when>
						<c:otherwise>
						  <img src="<%=path%>/goods${var.user_head_photo}" class="user_img" width="53" height="53" onerror="nofind();"/>
						</c:otherwise>
					  </c:choose> 
					</td>
					<td style="width: 80px;">${var.user_nick_name}</td>
					<td>${fn:substring(var.user_enterprise_info, 0, 50)}</td>
			  		<td style="width: 80px;">
			  		  <c:choose>
			  		    <c:when test="${var.user_partner_status == 1}">普通会员 </c:when>
			  		    <c:when test="${var.user_partner_status == 2}">待审核</c:when>
			  		    <c:otherwise>合伙人</c:otherwise>
			  		  </c:choose>
			  		</td>
					<td style="width: 30px;" class="center">
					  <div class='hidden-phone visible-desktop btn-group'>
						<button class="btn btn-mini btn-info" data-toggle="dropdown" onclick="goSendMsg('${var.user_id}');" name="编辑">发消息</button>
						
					  </div>
					</td>
				  </tr>
				</c:forEach>
			  </c:when>
			  <c:otherwise>
				<tr class="main_info">
				  <td colspan="100" class="center" >没有相关数据</td>
				</tr>
			  </c:otherwise>
			</c:choose>
		  </tbody>
		</table>
		<div class="page-header position-relative">
		  <table style="width:100%;">
			<tr>
			  <td style="vertical-align:top;">
				<a class="btn btn-small btn-success" onclick="onSendMsgs();">发消息</a>
				
			  </td>
			  <td style="vertical-align:top;">
			    <div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">
			  	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="qjqwmain/systemuser/queryUserList"/>
				</div>
		  	  </td>
			</tr>
		  </table>
		</div>
	  </div>
	<!-- PAGE CONTENT ENDS HERE -->
    </div><!--/row-->
  </div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
	<!-- 返回顶部  -->
	<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
	  <i class="icon-double-angle-up icon-only"></i>
	</a>
		
	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='/resources/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/ace-elements.min.js"></script>
	<script src="/resources/js/ace.min.js"></script>
		
	<script type="text/javascript" src="/resources/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
	<script type="text/javascript" src="/resources/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
	<script type="text/javascript" src="/resources/js/bootbox.min.js"></script><!-- 确认窗口 -->
	<!-- 引入 -->
	<script type="text/javascript" src="/resources/js/jquery.tips.js"></script><!--提示框-->
	<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
	<script type="text/javascript">
		
	    $(window.parent.hangge());
	    
		//检索
		function search(){
			$("#Form").submit();
		}
		

		
		//修改
		function goSendMsg(Id){
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="发消息";
			 diag.URL = '<%=path%>/msg/goSendMsg?ids='+Id;
			 diag.Width = 600;
			 diag.Height = 200;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 jump(${page.pageNo});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		
		</script>
		
		<script type="text/javascript">
		
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
		
		
		
		
		
		
		function onSendMsgs(){
			var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  }
					}
					if(str==''){
						bootbox.dialog("您没有选择任何内容!", 
							[
							  {
								"label" : "关闭",
								"class" : "btn-small btn-success",
								"callback": function() {
									//Example.show("great success");
									}
								}
							 ]
						);
						
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
					 var diag = new top.Dialog();
					 diag.Drag=true;
					 diag.Title ="发消息";
					 diag.URL = '<%=path%>/msg/goSendMsg?ids='+str;
					 diag.Width = 600;
					 diag.Height = 200;
					 diag.CancelEvent = function(){ //关闭事件
						 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
							 jump(${page.pageNo});
						}
					diag.close();
			 	};
			 	diag.show();
			}
		}
		
		//导出excel
		function toExcel(){
			window.location.href='<%=path%>/materials/excel';
		}
	</script>
	<script type="text/javascript" src="/resources/js/jquery.cookie.js"></script>
		
</body>
</html>


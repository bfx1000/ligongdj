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
<link href="<%=path%>/resources/css/index/style_a.css" rel="stylesheet" type="text/css" />
  
		
<script type="text/javascript">
 	
	
	
	//新增
	function add(){
		var msg = '新增';
		parent.parent.add('/qjqwmain/systemuser/goAddU?user_id=&turn_url=qjqwmain/systemuser/queryUserList', msg);

	}
	
	
	//修改
	function editUser(user_id){
		var msg = '修改';
		parent.parent.add('/qjqwmain/systemuser/goEditU?user_id='+user_id+'&turn_url=qjqwmain/systemuser/queryUserList', msg);

	}
	
	
	//检索
	function search(){
		$("#Form").submit();
	}
	
	//删除
	function del(Id){
		if(confirm("确定要删除吗?")){
			var url = "<%=path%>/index/deleteUser?user_id="+Id;
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
		
	//修改密码
	function edit(Id){
		var msg = '修改密码';
		parent.parent.add('/index/goEditPwd?user_id='+Id+'&turn_url=qjqwmain/systemuser/queryUserList', msg);
	}
		
	//审核
	function check(Id){
		var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="审核";
		 diag.URL = '<%=path%>/index/goCheckUser?user_id='+Id;
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
		
		
	//批量操作
	function makeAll(msg){
		if(confirm("确定要删除吗?")){
			var str = '';
			for(var i=0;i < document.getElementsByName('ids').length;i++)
			{
				  if(document.getElementsByName('ids')[i].checked){
				  	if(str=='') str += document.getElementsByName('ids')[i].value;
				  	else str += ',' + document.getElementsByName('ids')[i].value;
				  }
			}
			if(str==''){
				alert("您没有选择任何内容!"); 
				return false;
			}else{
				var url = "<%=path%>/index/deleteUser?user_id=" + str;
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
	}
		
	//授权读
	function onShowquan(id, user_type){
		window.location.href='<%=path%>/qjqwmain/systemuser/queryMenuListForUser?user_id=' + id + '&user_type=' + user_type;
	}
		
</script>
</head>
<body>	
<form action="usertype/queryUserTypeList" method="post" name="Form" id="Form">
</form>

<div class="content_box_table">
  <table width="100%" border="1" cellpadding="0" cellspacing="0" class="box_table">
	<tr class="th">
	  <th class="center" style="width: 30px;">
		<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
	  </th>
	  <th>用户id</th>
	  <th>用户账号</th>
	  <th>用户昵称</th>
	  <th>添加时间</th>
	  <th>是否可用</th>
	  <th>用户类别</th>
	  <th class="th_cz align_c">操作</th>
	</tr>
	<c:choose>
	  <c:when test="${not empty userList}">
		<c:forEach items="${userList}" var="var" varStatus="vs">
		  <tr>
			<td>
			  <label><input type='checkbox' name='ids' value="${var.user_id}" /><span class="lbl"></span></label>
			</td>
			<td class='center' style="width: 50px;">${var.user_id}</td>
			<td >${var.user_account}</td>
			<td >${var.user_nick_name}</td>
			<td >${var.user_add_time}</td>
			<td style="width: 80px;">${var.user_activation == 1 ? '是' : '否'}</td>
			<td style="width: 80px;">
			  ${var.user_type_str}
			</td>
			<td class="align_c">
			  <c:if test="${sessionScope.user_type == 1 }">
			    <a class="btn" onclick="editUser('${var.user_id}');" name="修改">修改</a>
			    <a class="btn" onclick="del('${var.user_id}');" name="删除">删除</a>
			  </c:if>
			  <a class="btn" onclick="edit('${var.user_id}');" name="修改">修改密码</a>
			  <a class="btn" onclick="onShowquan('${var.user_id}', '${var.user_type}');" name="授权">授权</a>
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
  </table>
  <div class="page-header position-relative">
    <table style="width:100%;">
	  <tr>
	    <td style="vertical-align:top;padding-top:10px;">
	      <a class="btn" onclick="add();">新增</a>
		  <a class="btn" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" >批量删除</a>
	    </td>
	    <td style="vertical-align:top;">
	    
  	    </td>
	  </tr>
    </table>
	<div class="pagination">
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="qjqwmain/systemuser/queryUserList"/>
	</div>
  </div>
</div>

</body>
</html>


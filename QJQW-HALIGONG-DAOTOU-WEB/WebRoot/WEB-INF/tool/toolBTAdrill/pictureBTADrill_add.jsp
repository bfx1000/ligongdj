<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		
		<meta charset="utf-8" />
		<title></title>
		
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!--[if IE 7]><link rel="stylesheet" href="/resources/css/font-awesome-ie7.min.css" /><![endif]-->
		<!--[if lt IE 9]><link rel="stylesheet" href="/resources/css/ace-ie.min.css" /><![endif]-->
		

		
		<script type="text/javascript" src="/resources/js/jquery-1.7.2.js"></script>
		  <script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
		
	
	
	
		
<script type="text/javascript">
	$(window.parent.hangge());
	$(document).ready(function(){

	});
	
	//保存
	function save(){
		alert('save');
// 		$("#userForm").ajaxSubmit(function(result){
// 			alert(result);
			$("#userForm").submit();			
// 			if(result.result == 1){
				
// 				alert('操作成功！');
// 				var url_PictureBTADrill = result.url_PictureBTADrill;
// 				alert(url_PictureBTADrill);
// 				var frm1 = window.parent.document.getElementById('wap_login_iframe1');
// 				var frm2 = frm1.contentWindow.document.getElementById('iframe');
// 				$(frm2).text(span_PictureBTADrillList);
// 			}else{
// 				alert('操作失败，请联系管理员！');
// 			}
// 		});
	}
	
	//取消
	function onClose(){
		parent.onClose();
	}
	
</script>
</head>
<body>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
  <form action="/toolBTAdrill/${msg}" name="userForm" id="userForm" method="post" enctype="multipart/form-data">
	<input type="text" name="id_BTADrill" id="id_BTADrill" value="${id_BTADrill}"/>
	<div id="zhongxin">
	  <table>
		<tr>
		  <td><input type="file" name="PictureBTADrill" id="PictureBTADrill" /></td>
		</tr>
		<tr>
		  <td style="text-align: center;padding-top:20px;" colspan="2">
			<a class="btn" onclick="save();">保存</a>
			<a class="btn" onclick="onClose();">取消</a>
		  </td>
		</tr>
	  </table>
	</div>
	<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="/resources/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>	
  </form>
 

</body>
</html>
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
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/resources/css/bootstrap-responsive.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="/resources/css/font-awesome.min.css" />
  <!--[if IE 7]><link rel="stylesheet" href="/resources/css/font-awesome-ie7.min.css" /><![endif]-->
  <!--[if lt IE 9]><link rel="stylesheet" href="/resources/css/ace-ie.min.css" /><![endif]-->
  <!-- 下拉框 -->
  <link rel="stylesheet" href="/resources/css/chosen.css" />

  <link rel="stylesheet" href="/resources/css/ace.min.css" />
  <link rel="stylesheet" href="/resources/css/ace-responsive.min.css" />
  <link rel="stylesheet" href="/resources/css/ace-skins.min.css" />

  <link rel="stylesheet" href="/resources/css/datepicker.css" /><!-- 日期框 -->
  <script type="text/javascript" src="/resources/js/jquery-1.7.2.js"></script>
  <script type="text/javascript" src="/resources/js/jquery.tips.js"></script>
  <script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
  <script type="text/javascript">
	
	$(document).ready(function(){

	});
	
	</script> 
	
</head>
<body>
<form action="/msg/sendMsg" name="Form" id="Form" method="post" >
  <input type="hidden" name="ids" id="user_id" value="${ids}"/>
  <div id="zhongxin">
  <div id="zyupload" class="zyupload"></div>
	<table style="width: 80%; margin: 0 auto;">
	  <tr>
	    <td>标题</td>
		<td>
		  <input type="text" name="msg_title" id="msg_title" />
		  <input type="hidden" name="msg_info" id="msg_info" />
		</td>
	  </tr>
	  <tr>
	    <td>内容</td>
		<td>
		  <textarea rows="4" cols="40" id="textarea_msg_info" style="width:400px;"></textarea>
		</td>
	  </tr>
	  <tr>
		<td style="text-align: center;" colspan="2">
		  <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
		  <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
		</td>
	  </tr>
	</table>
  </div>
  <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="<%=path%>/resources/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
</form>
	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='/resources/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/ace-elements.min.js"></script>
	<script src="/resources/js/ace.min.js"></script>
	<script type="text/javascript" src="/resources/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
	<script type="text/javascript" src="/resources/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
	<script type="text/javascript">
		$(window.parent.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		//保存
		function save(){
			var msg = $("#textarea_msg_info").val();
			if(msg == null || msg == ''){
				alert('请填写消息内容！');
			}else{
		
				$("#msg_info").val(msg);
				$("#Form").ajaxSubmit(function(result){
					if(result == 1){
						alert('操作成功！');
	// 					$("#zhongxin").hide();
	// 					$("#zhongxin2").show();
						top.Dialog.close();
					}else{
						alert('操作失败，请联系管理员！');
					}
				});
			}
		}
		
	</script>
</body>
</html>
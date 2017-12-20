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
		
		<script type="text/javascript" src="/resources/js/jquery-1.7.2.js"></script>
		  <script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
		
		<!--提示框-->
		<script type="text/javascript" src="/resources/js/jquery.tips.js"></script>
	
	
		
<script type="text/javascript">
	$(window.parent.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
	
	//保存
	function save(){
		var turn_url_id = $("#turn_url_id").val();
		if($("#loginname").val()=="" || $("#loginname").val()=="此用户名已存在!"){
			
			$("#loginname").tips({
				side:3,
	            msg:'输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#loginname").focus();
			$("#loginname").val('');
			$("#loginname").css("background-color","white");
			return false;
		}else{
			$("#loginname").val(jQuery.trim($('#loginname').val()));
		}
		
	
		
		if($("#user_id").val()=="" && $("#password").val()==""){
			
			$("#password").tips({
				side:3,
	            msg:'输入密码',
	            bg:'#AE81FF',
	            time:2
	        });
			
			$("#password").focus();
			return false;
		}
		
		if($("#user_id").val()==""){
			if($("#password").val().length < 6 && $("#chkpwd").val().length < 6){
			
				$("#password").tips({
					side:3,
		            msg:'密码不小于六位！',
		            bg:'#AE81FF',
		            time:2
		        });
				
				$("#password").focus();
				return false;
			}
		}
		
		
		if($("#password").val()!=$("#chkpwd").val()){
			
			$("#chkpwd").tips({
				side:3,
	            msg:'两次密码不相同',
	            bg:'#AE81FF',
	            time:3
	        });
			
			$("#chkpwd").focus();
			return false;
		}
		
		
	
		if($("#user_id").val()==""){
			hasU();
		}else{
			$("#userForm").ajaxSubmit(function(result){
				if(result == 1){
					alert('操作成功！');
					//关闭窗口
					parent.onClose();
					//刷新iframe
					parent.reflush(turn_url_id);
				}else{
					alert('操作失败，请联系管理员！');
				}
				
			});

		}
	}
	
	//取消
	function onClose(){
		parent.onClose();
	}
	
	
	//判断用户名是否存在
	function hasU(){
		var turn_url_id = $("#turn_url_id").val();
		var USERNAME = $("#loginname").val();
		var url = "/qjqwmain/systemuser/hasU.do?user_name="+USERNAME+"&tm="+new Date().getTime();
		$.get(url,function(data){
			if(data.result=="error"){
				$("#loginname").css("background-color","#D16E6C");
				
				setTimeout("$('#loginname').val('此用户名已存在!')",500);
				
			}else{
				$("#userForm").ajaxSubmit(function(result){
					if(result == 1){
						alert('操作成功！');
						//关闭窗口
						parent.onClose();
						//刷新iframe
						parent.reflush(turn_url_id);
					}else{
						alert('操作失败，请联系管理员！');
					}
					
				});
			}
		});
	}
	
	
	
	
	
</script>
</head>
<body>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
	<form action="/qjqwmain/systemuser/${msg}" name="userForm" id="userForm" method="post">
		<input type="hidden" name="user_id" id="user_id" value="${user.user_id}"/>
		<div id="zhongxin">
		<table>
			<tr>
				<td width="90px" style="padding-left:10px;">用&nbsp;户&nbsp;名</td>
				<td><input type="text" name="user_name" id="loginname" value="${user.user_account }" maxlength="32" placeholder="这里输入用户名" title="用户名"/></td>
			</tr>
			<tr>
				<td width="90px" style="padding-left:10px;">用户昵称</td>
				<td><input type="text" name="user_nick_name" id="user_nick_name" value="${user.user_nick_name }" maxlength="32" placeholder="这里输入用户昵称" title="用户昵称"/></td>
			</tr>
			<c:if test="${user.user_id == null || user.user_id == ''}">
			<tr>
				<td style="padding-left:10px;">密&nbsp;&nbsp;码</td>
				<td><input type="password" name="password" id="password"  maxlength="32" placeholder="输入密码" title="密码"/></td>
			</tr>
			<tr>
				<td style="padding-left:10px;">确认密码</td>
				<td><input type="password" name="chkpwd" id="chkpwd"  maxlength="32" placeholder="确认密码" title="确认密码" /></td>
			</tr>
			</c:if>
			<tr>
				<td style="padding-left:10px;">用户类型</td>
				<td>
				  <select class="yhlx-select" name="user_type" id="user_type" data-placeholder="用户类型" style='vertical-align:top;'>
					<option value="2" ${user.user_type == 2 ? "selected" : ''}>开发商</option>
					<option value="3" ${user.user_type == 3 ? "selected" : ''}>学生</option>
					<option value="4" ${user.user_type == 4 ? "selected" : ''}>厂家</option>
				  </select>
				</td>
			</tr>
			<tr>
				<td style="padding-left:10px;">是否可用</td>
				<td>
					<select class="chzn-select" name="user_activation" id="user_activation" data-placeholder="请选择是否可用" style='vertical-align:top;'>
						<option value="1" ${user.type == 1 ? "selected" : ''}>可用</option>
						<option value="0" ${user.type == 0 ? "selected" : ''}>不可用</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;padding-top:20px;" colspan="2">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="onClose();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="/resources/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='/resources/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="/resources/js/bootstrap.min.js"></script>
		<script src="/resources/js/ace-elements.min.js"></script>
		<script src="/resources/js/ace.min.js"></script>
		<script type="text/javascript" src="/resources/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		
		<script type="text/javascript">
		
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
	
</body>
</html>
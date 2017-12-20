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

	
	//保存
	function save(){
		var pwd = $("#pwd").val();
		var rq_pwd = $("#rq_pwd").val();
		
		if(pwd == null || pwd == ''){
			alert('请输入密码！');
		}else if(pwd.length < 6){
			alert('密码不小于六位！');
		}else if(rq_pwd == null || rq_pwd == ''){
			alert('请输入确认密码！');
		}else if(rq_pwd.length < 6){
			alert('确认密码不小于六位！');
		}else if(pwd != rq_pwd){
			alert('两次密码输入不一致！');
		}else{
			$("#Form").ajaxSubmit(function(result){
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
</script> 
</head>
<body>

<form action="/index/editPwd" name="Form" id="Form" method="post" >
   <input type="hidden" name="user_id" id="user_id" value="${user_id}"/>
     
   
  <div id="zhongxin">
  <div id="zyupload" class="zyupload"></div>
	<table style="width: 80%; margin: 0 auto;">
	  <tr>
	  <td>新密码:</td>
		<td>
		    <input type="password" name="pwd" id="pwd" value="" maxlength="50" placeholder="这里输入密码" title="密码"/>
		</td>
	  </tr>

	  <tr>
	  <td>确认密码：</td>
		<td>
		  <input type="password" name="rq_pwd" id="rq_pwd" value="" maxlength="50" placeholder="这里输入确认密码" title="密码" />
		</td>
	  </tr>
	  <tr>
		<td style="text-align: center;" colspan="2">
		  <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
		  <a class="btn btn-mini btn-danger" onclick="onClose();">取消</a>
		</td>
	  </tr>
	</table>
  </div>
  <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="<%=path%>/resources/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
</form>

</body>
</html>
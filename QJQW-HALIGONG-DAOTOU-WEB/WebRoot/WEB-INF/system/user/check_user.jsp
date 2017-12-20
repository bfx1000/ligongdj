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
	
	//保存
	function save(){

		

			$("#Form").ajaxSubmit(function(result){
				if(result == 1){
					alert('操作成功！');
					$("#zhongxin").hide();
					$("#zhongxin2").show();
					top.Dialog.close();
				}else{
					alert('操作失败，请联系管理员！');
				}
				
			});
// 			$("#Form").submit();
// 			$("#zhongxin").hide();
// 			$("#zhongxin2").show();

		
		
	}
	
	
	
	
	
	
	
	
	
	</script> 
	
	
	</head>
<body>

<form action="/index/checkUser" name="Form" id="Form" method="post" >
   <input type="hidden" name="user_id" id="user_id" value="${user_id}"/>
     
   
  <div id="zhongxin">
  <div id="zyupload" class="zyupload"></div>
	<table style="width: 80%; margin: 0 auto;">
	  <tr>
	  <td>新密码:</td>
		<td>
		    <select id="user_partner_status" name="user_partner_status" >
		            	<option value="3" >通过</option>
		                <option value="-3">不通过</option>
		                
		            </select>
		</td>
	  </tr>

<!-- 	  <tr> -->
<!-- 	  <td>确认密码：</td> -->
<!-- 		<td> -->
<!-- 		  <input type="password" name="rq_pwd" id="rq_pwd" value="" maxlength="50" placeholder="这里输入确认密码" title="密码" /> -->
<!-- 		</td> -->
<!-- 	  </tr> -->
	  <tr>
		<td style="text-align: center;"  colspan="2">
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
		
	</script>
</body>
</html>
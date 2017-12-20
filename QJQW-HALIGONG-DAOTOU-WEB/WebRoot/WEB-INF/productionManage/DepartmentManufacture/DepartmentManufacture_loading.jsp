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

	/* function loadingChild(NameDepartmentManuf){
		
		$.ajax({
			url:"/DepartmentManufacture/loadingChild",
		    type:"post",
		    data:{NameDepartmentManuf:NameDepartmentManuf},
		    dataType:"json",
		    success:function(data){
		    	if(data.result==1){
		    		//存在子部门
		    		var num = data.DepartmentManufacture.length;
		    		for(var i = 0;i<num;i++){
		    			var html=' <li id = "li_'+data.DepartmentManufacture[i].NameDepartmentManuf+'">    '+
								 '	 <span  onclick="loadingChild('+data.DepartmentManufacture[i].NameDepartmentManuf+');">${var.NameDepartmentManuf}</span>   '+
								 '   <ul id="li_div_'+data.DepartmentManufacture[i].NameDepartmentManuf+'"></ul>'+
								 ' </li>';
						$("#li_div_"+data.NameDepartmentManuf).append(html);
		    		}
		    		
		    		alert(data.DepartmentManufacture[0].NameDepartmentManuf);
		    		
		    	}else if(data.result==0){
		    		//不存在子部门
		    		alert("不存在子部门");
		    	}else{
		    		alert("页面错误，请刷新重试！");
		    	} 
		    }
		});
	} */
/* 	function openAndClose(thiss,name){
		if($(thiss).attr('class')=='on'){
			$("#ul_"+name).hide();
			$(thiss).attr('class','close');
		}else{
			$("#ul_"+name).show();
			$(thiss).attr('class','on');
		}
	} */
	
	function openAndClose(id,name){
		var dataId = $(id).attr("data-id");	
		if(dataId == 0){//关闭状态  0
			$(id).attr("data-id","1");
			$("#ul_"+name).show();
			$(id).addClass('menu_title_active');	
		}else{//展开状态  1
			$(id).attr("data-id","0");
			$("#ul_"+name).hide();
			$(id).removeClass('menu_title_active');	
		}
	}
	
	
</script>
</head>
<body>	
<div class="hd_left  content_menu">
	<div class="h2_title_wrapper">
		<h2>所有部门如下：</h2>
		<input type="button" onclick="window.parent.opt('无',1);"  value = "创建根部门"  class = "btn  create_footer_btn"  />
		<div class="clear"></div>
	</div>
	
<ul  class="menu_ul_1">
	
  <c:forEach items="${DepartmentManufacture}" var="var" varStatus="vs">
  	<li class="menu_ul">
  	  <c:if test="${var.LevelDepartmentManuf == 1 }">
		  <span class="menu_title"  data-id="0"  onclick="openAndClose(this,'${var.id_DepartmentManufacture}');">${var.NameDepartmentManuf}</span>
		  <input type="button" onclick="window.parent.opt('${var.id_DepartmentManufacture}',2);"  class="btn  create_child_btn" value = "选择"/>
		  <div class="clear"></div>
		  <ul id="ul_${var.id_DepartmentManufacture}"  class="menu_ul_2">
		      <c:forEach items="${DepartmentManufacture}" var="var1" varStatus="vs1">
		      	<li class="menu_ul">
			       	 <c:if test="${var1.LevelDepartmentManuf == 2 }">
			       	 	<c:if test="${var.NameDepartmentManuf == var1.SuperiorDepartmentManuf }">
			       	 		<span  class="menu_title"  data-id="0" onclick="openAndClose(this,'${var1.id_DepartmentManufacture}');">${var1.NameDepartmentManuf}</span>
			       	 		<input type="button" onclick="window.parent.opt('${var1.id_DepartmentManufacture}',3);" class="btn  create_child_btn" value = "选择"/>
			       	 		<div class="clear"></div>
				       		<ul id="ul_${var1.id_DepartmentManufacture}"  class="menu_ul_3">
				       			 <c:forEach items="${DepartmentManufacture}" var="var2" varStatus="vs1">
				       			 	<li class="menu_ul">
								       	 <c:if test="${var2.LevelDepartmentManuf == 3 }">
								       	 	<c:if test="${var1.NameDepartmentManuf == var2.SuperiorDepartmentManuf }">
								       	 		<span class="menu_title"  data-id="0" onclick="openAndClose(this,'${var2.id_DepartmentManufacture}');">${var2.NameDepartmentManuf}</span>
								       	 		<input type="button" onclick="window.parent.opt('${var2.id_DepartmentManufacture}',4);"  class="btn  create_child_btn" value = "选择"/>
									       		<div class="clear"></div>
									       		<ul id="ul_${var2.id_DepartmentManufacture}"  class="menu_ul_4">
									       			 <c:forEach items="${DepartmentManufacture}" var="var3" varStatus="vs1">								       		
												       	 <c:if test="${var3.LevelDepartmentManuf == 4 }">
												       	 	<c:if test="${var2.NameDepartmentManuf == var3.SuperiorDepartmentManuf }">
												       	 		<span class="menu_title  menu_title_last" >${var3.NameDepartmentManuf}</span>
												       	 		<div class="clear"></div>
												       		</c:if>
												       	</c:if>
													 </c:forEach>
									       		</ul>
								       		</c:if>
								       	</c:if>
							       	</li>
								 </c:forEach>
				       		</ul>
			       		</c:if>
			       	</c:if>
		       	</li>
			  </c:forEach>
		  </ul>
	  </c:if>
    </li>
    
  </c:forEach>

</ul>
</div>
</body>
</html>










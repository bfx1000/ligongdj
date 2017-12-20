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
		<h2>所有组信息如下：</h2>
		<input type="button" onclick="window.parent.opt('无',1);"  value = "创建根设备组"  class = "btn  create_footer_btn"  />
		<div class="clear"></div>
	</div>
	
<ul  class="menu_ul_1">
	
  <c:forEach items="${MachineGroup}" var="var" varStatus="vs">
  	<li class="menu_ul">
  	  <c:if test="${var.LevelMachineGroup == 1 }">
		  <span class="menu_title"  data-id="0"  onclick="openAndClose(this,'${var.id_MachineGroup}');">${var.NameMachineGroup}</span>
		  <input type="button" onclick="window.parent.opt('${var.NameMachineGroup}',2);"  class="btn  create_child_btn" value = "选择"/>
		  <div class="clear"></div>
		  <ul id="ul_${var.id_MachineGroup}"  class="menu_ul_2">
		      <c:forEach items="${MachineGroup}" var="var1" varStatus="vs1">
		      	<li class="menu_ul">
			       	 <c:if test="${var1.LevelMachineGroup == 2 }">
			       	 	<c:if test="${var.NameMachineGroup == var1.SuperiorMachineGroup }">
			       	 		<span  class="menu_title"  data-id="0" onclick="openAndClose(this,'${var1.id_MachineGroup}');">${var1.NameMachineGroup}</span>
			       	 		<input type="button" onclick="window.parent.opt('${var1.NameMachineGroup}',3);" class="btn  create_child_btn" value = "选择"/>
			       	 		<div class="clear"></div>
				       		<ul id="ul_${var1.id_MachineGroup}"  class="menu_ul_3">
				       			 <c:forEach items="${MachineGroup}" var="var2" varStatus="vs1">
				       			 	<li class="menu_ul">
								       	 <c:if test="${var2.LevelMachineGroup == 3 }">
								       	 	<c:if test="${var1.NameMachineGroup == var2.SuperiorMachineGroup }">
								       	 		<span class="menu_title"  data-id="0" onclick="openAndClose(this,'${var2.id_MachineGroup}');">${var2.NameMachineGroup}</span>
								       	 		<input type="button" onclick="window.parent.opt('${var2.NameMachineGroup}',4);"  class="btn  create_child_btn" value = "选择"/>
									       		<div class="clear"></div>
									       		<ul id="ul_${var2.id_MachineGroup}"  class="menu_ul_4">
									       			 <c:forEach items="${MachineGroup}" var="var3" varStatus="vs1">								       		
												       	 <c:if test="${var3.LevelMachineGroup == 4 }">
												       	 	<c:if test="${var2.NameMachineGroup == var3.SuperiorMachineGroup }">
												       	 		<span class="menu_title  menu_title_last" >${var3.NameMachineGroup}</span>
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










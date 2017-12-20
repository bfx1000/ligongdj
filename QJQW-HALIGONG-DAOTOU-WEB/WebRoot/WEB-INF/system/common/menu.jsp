<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path_default = request.getContextPath();
%>
<link href="<%=path_default%>/resources/css/index/style_a.css?v=897987" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path_default%>/resources/js/jquery/jquery-1.8.2.js"></script>
<script type="text/javascript" src="<%=path_default%>/resources/js/jquery.SuperSlide.2.1.1.source.js"></script>
<script type="text/javascript" src="<%=path_default%>/resources/js/jquery.collapser.js"></script>
<script src="<%=path_default%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var menu_url_id = $("#menu_url_id").val();
// 		alert($(window.parent));
// 		alert($(window.parent).find("iframe[id='iframe']"));
// 		alert($(window.parent).find("iframe[id='iframe']").attr("src"));
// 		$(window.parent).find("iframe").attr("src", menu_url_id);
		
		var iframe = parent.window.document.getElementById("iframe");
		$(iframe).attr("src", menu_url_id);
		
		parent.onChangeMenuTitle("${menu_name}","${parent_menu_name}","${menu_flag}");
	});
	
	function onChangeMenu(menu_id, parent_menu_name, menu_url, menu_name, flag, on){
	
		if(flag == 2){
			$(".on").removeAttr("class");
			$(".on2").removeAttr("class");
			if(on==1){
				$("#li_" + menu_id).attr("class", "on2");
			}else{
				$("#li_" + menu_id).attr("class", "on");
			}
		}else{
			$(".li_on").removeAttr("class");
			$("#li_" + menu_id).attr("class", "li_on");
		}
			var iframe = parent.window.document.getElementById("iframe");
			$(iframe).attr("src", menu_url);
			parent.onChangeMenuTitle(menu_name, parent_menu_name, flag);
	}
	
	//查询三级菜单
	function onShowThirdMenu(menu_id, menu_name){
		var classstr = $("#li_" + menu_id).attr("class");
		$(".on2").removeAttr("class");
		if(classstr == 'on'){//收起
			$("#li_" + menu_id).attr("class", '');
			
		}else{//展开
			$(".on").removeAttr("class");
			$("#li_" + menu_id).attr("class", "on");
			$("#menu_id_menuForm").val(menu_id);
			$("#menuForm").ajaxSubmit(function(result){
				var str = '';
				if(result != null && result.length > 0){
					for(var i = 0; i < result.length; i++){
						var menu = result[i];
						if(menu.menu_url==null || menu.menu_url==''){
							str = str + "<li id=\"li_" + menu.menu_id + "\" onclick=\"onShowFourthMenu(" + menu.menu_id + ", '" + menu_name + "');\">" + menu.menu_name + "</li><ul id = ul_"+menu.menu_id+" class = \"ulboxx\"></ul>";
							
						}else{
							str = str + "<li id=\"li_" + menu.menu_id + "\"  onclick=\"onChangeMenu(" + menu.menu_id + ", '" + menu_name + "', '" + menu.menu_url + "', '" + menu.menu_name + "', 3);\">" + menu.menu_name + "</li>";
						}
					}
					$("#ul_" + menu_id).html(str);
				}
			});
		}
		
	}
	
	function onShowFourthMenu(menu_id,menu_name){
		var classstr = $("#li_" + menu_id).attr("class");
		if(classstr == 'on1'){//收起
			$("#li_" + menu_id).attr("class", '');
			$(".ulboxx").hide();
		}else{
			$(".on1").removeAttr("class");
			$(".li_on").removeAttr("class");
			$("#li_" + menu_id).attr("class", "on1");
			$("#menu_id_menuForm").val(menu_id);
			$(".ulboxx").show();
			$("#menuForm").ajaxSubmit(function(result){
				var str = '';
				if(result != null && result.length > 0){
					for(var i = 0; i < result.length; i++){
						var menu = result[i];
						/* "<li id=\"li_" + menu.menu_id + "\"  onclick=\"onChangeMenu(" + menu.menu_id + ", '" + menu_name + "', '" + menu.menu_url + "', '" + menu.menu_name + "', 3);\">" + menu.menu_name + "</li>" */
						str = str + "<li id=\"li_" + menu.menu_id + "\"  onclick=\"onChangeMenu(" + menu.menu_id + ", '" + menu_name + "', '" + menu.menu_url + "', '" + menu.menu_name + "', 3);\">" + menu.menu_name + "</li>";
					}
					$("#ul_" + menu_id).html(str);
				}
			});
		}
	}
</script>

<input type="hidden" value="${menu_url}" id="menu_url_id" />
<dvi class="hd_left">
<form action="/index/queryThirdMenuList" name="menuForm" id="menuForm" method="post">
<input type="hidden" name="menu_id" id="menu_id_menuForm" />
</form>
<ul>

  <c:forEach items="${menuList}" var="var" varStatus="vs">
  	<li ${vs.index == 0 ? (var.menu_url != null&&var.menu_url != '' ? 'class="on2"': 'class="on"') : ''} id="li_${var.menu_id}" ${menu_id == var.menu_id ? 'class="on"' : ''} >
  	  <c:choose>
  	    <c:when test="${(var.menu_url == null || var.menu_url == '') }">
  	      <sapn onclick="onShowThirdMenu(${var.menu_id}, '${var.menu_name}');" style="display:block;width:100%;height:41px;">${var.menu_name }</sapn>
  	    </c:when>
  	    <c:otherwise>
  	      <sapn onclick="onChangeMenu(${var.menu_id}, '', '${var.menu_url }', '${var.menu_name }', 2,1);" style="display:block;width:100%;height:41px;">${var.menu_name }</sapn>
  	    </c:otherwise>
  	  </c:choose>
	  <ul class="ulbox" id="ul_${var.menu_id}">
	    <c:if test="${vs.index == 0}"><!-- 加载默认的三级菜单 -->
	      <c:forEach items="${var.thirdMenuList}" var="var1" varStatus="vs1">
	      <c:choose>
	       	 <c:when test="${(var1.menu_url == null || var1.menu_url == '')}">
	       		<li ${vs1.index == 0 ? 'class="li_on"' : ''} id="li_${var1.menu_id}"  onclick="onShowFourthMenu(${var1.menu_id}, '${var.menu_name }');">${var1.menu_name }</li>
	       		<ul id="ul_${var1.menu_id}" class="ulboxx"></ul>
	       		
	       	</c:when>
	       	<c:otherwise>
	        <li ${vs1.index == 0 ? 'class="li_on"' : ''} id="li_${var1.menu_id}"  onclick="onChangeMenu(${var1.menu_id}, '${var.menu_name }', '${var1.menu_url}', '${var1.menu_name}', 3);">${var1.menu_name }</li>
	        </c:otherwise>
	        </c:choose>
		  </c:forEach>
	    </c:if>
		
	  </ul>
    </li>
  </c:forEach>

<!--
 	<li><sapn>焊接钻头</span>
		<ul class="ulbox">
			<li class="li_on">焊接钻头1</li>
			<li>焊接钻头2</li>
			<li>焊接钻头3</li>
			<li>焊接钻头4</li>
		</ul>
	</li>
	<li class="on"><span>钻削刀具</span>
		<ul class="ulbox">
			<li class="li_on">钻削刀具1</li>
			<li>钻削刀具2</li>
			<li>钻削刀具3</li>
		</ul>
	</li>
	<li>车削刀具</li>
	<li>切断切槽</li>
	<li>螺纹加工刀具</li>
--> 
</ul>
</div>
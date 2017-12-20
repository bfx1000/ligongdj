<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Long date = System.currentTimeMillis();
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
		<title>哈理工刀头</title>
	    <meta name="description" content="哈理工刀头,专业打造各种类型机械刀头,产品类型齐全,质量放心有保障,联合祈福科技公司打造专业的刀头网站。" />
	    <meta name="keywords" content="哈理工刀头,刀头,刀具,切断切槽,仿形切削,外圆切槽刀,内圆切槽刀,端面切槽。" />
	<link href="<%=path%>/resources/css/index/style_a.css?v=<%=date%>" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/resources/js/jquery-1.7.2.js"></script>
	<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
	<script src="<%=path%>/resources/js/laydate/laydate.js"></script>
	
	<script type="text/javascript">
		 $(document).ready(function(){
			var id = $("#id").val();
			if(id==null||""==id){
				$("#li_table").attr('style','display:none');
			}else{
				$("#id_h2").attr('style','display:none');
			}
			
		}); 
		 
		 
		 function insertResult(id){
			 var html = '<iframe class="result_iframe" id="iframe" frameborder="0" src="/experimentParameterResult/CheckExperimentResultList?id_ExperimentParameterResult='+id+'&&WhetherVariable=0" style="width:100%;height:100%;"></iframe>>';
			 $("#resultList").html(html);
		 }
	</script>
	
	
</head>
<body>
<div class="content_box_text">
<form action = "/experimentParameterResult/goExperimentResult?zT=0" name="userForm" id="userForm" method="post">
  <ul class="box_text">
  	
	 <li>
	    <span id="lititle">实验编号</span>
	    <input name="ExperimentNo" id="ExperimentNo_userForm" type="text" class="input" />
	  </li>
	  <li>
	  	<input type="submit" class = "btn btn_sc"  value = "加载试验编号" />
	  </li>	
	  
	  <div id = "div">
	  	<li>
	  		<span id="lititle">实验名称&nbsp;：&nbsp;</span>${ExperimentManage.ExperimentName}
	  	</li>
	  	<li><span id="lititle" >实验类型&nbsp;：&nbsp;</span>
	  		<c:forEach items="${CategoryExperimentType}" var="var1" varStatus="vs">
					<c:if test="${var1.id_ExperimentType == ExperimentManage.ExperimentType}">${var1.name_ExperimentType }</c:if>	
			</c:forEach>
	  	</li>
	  </div>
  </ul>
  </form>
  
  <input type="hidden" id = "id" value = "${ExperimentManage.id_ExperimentManage }"/>
  <br/>
  <ul>
  <li id="id_h2"><h2>填写正确的编号后可显示参数！</h2></li>
  <li class="block nobor" id="li_table">
			<table border="1" class="box_table li_table" id="table">
			
			
				<c:choose>
					<c:when test="${not empty ExperimentParameterResult}">
						
						<% List<Map> list = (List)request.getAttribute("ExperimentParameterResult");
						   List list1 = (List)request.getAttribute("parameters");%>
						   <tr id = "row_0">
						   	<th class="th" id = "col_row0_th">序号</th>
						   	<%for(int i =0;i<list1.size();i++){%>
						   		<td class="th" id = "col_row0_<%=i%>">
									<select class="select"  disabled = "disabled" onChange="test(this);">
									  <option value="">请选择</option>
									  <option value="ExperimentCuttingSpeed" <%="ExperimentCuttingSpeed".equals(list1.get(i))?"selected":""%> >切削速度</option>
									  <option value="ExperimentCuttingDepth" <%="ExperimentCuttingDepth".equals(list1.get(i))?"selected":""%>>切削深度</option>
									  <option value="ExperimentCuttingWidth" <%="ExperimentCuttingWidth".equals(list1.get(i))?"selected":""%>>切削宽度</option>
									  <option value="ExperimentFeedRate" <%="ExperimentFeedRate".equals(list1.get(i))?"selected":""%>>进给量</option>
									  <option value="ExperimentToolQianjiao" <%="ExperimentToolQianjiao".equals(list1.get(i))?"selected":""%>>刀具前角</option>
									  <option value="ExperimentToolHoujiao" <%="ExperimentToolHoujiao".equals(list1.get(i))?"selected":""%>>刀具后角</option>
									  <option value="ExperimentToolZhupianjiao" <%="ExperimentToolZhupianjiao".equals(list1.get(i))?"selected":""%>>刀具主偏角</option>
									  <option value="ExperimentToolRenqingjiao" <%="ExperimentToolRenqingjiao".equals(list1.get(i))?"selected":""%>>刀具刃倾角</option>
									  <option value="ExperimentToolNoseRadius" <%="ExperimentToolNoseRadius".equals(list1.get(i))?"selected":""%>>刀尖圆弧半径</option>
									  <option value="ExperimentToolBreakerBlade" <%="ExperimentToolBreakerBlade".equals(list1.get(i))?"selected":""%>>断屑槽类型</option>
									  <option value="ExperimentMachiningType" <%="ExperimentMachiningType".equals(list1.get(i))?"selected":""%>>加工类别</option>
									  <option value="ExperimentTool" <%="ExperimentTool".equals(list1.get(i))?"selected":""%>>试验刀具</option>
									  <option value="ExperimentToolMaterial" <%="ExperimentToolMaterial".equals(list1.get(i))?"selected":""%> >刀具材料</option>
									  <option value="ExperimentCuttingFluid" <%="ExperimentCuttingFluid".equals(list1.get(i))?"selected":""%>>切削液</option>
									  <option value="ExperimentPara1" <%="ExperimentPara1".equals(list1.get(i))?"selected":""%>>预留1</option>
									  <option value="ExperimentPara2" <%="ExperimentPara2".equals(list1.get(i))?"selected":""%>>预留2</option>
									</select>
								</td>
						   <%}%>
						   	<th class="th" id = "col_row0">操作</th>
						   </tr>
							<%for(int i =0 ;i<list.size();i++){%>
								<tr id = "row_<%=i+1%>" >
								<th id="col_row<%=i+1%>_th"><%=i+1%></th>
								<%for(int j =0;j<list1.size();j++){%>
									<td id="col_row<%=i+1%>_<%=j%>" ><input type="text" readonly= "readonly" value = "<%=list.get(i).get(list1.get(j))%>"/></td>
								<%}%>
								<th id="col_row<%=i+1%>"><a class="btn btn_bg_orange b_block" onclick="insertResult(<%=list.get(i).get("id_ExperimentParameterResult")%>);">输入结果</a></th>
								</tr>
							<%}%>
					</c:when>
						<c:otherwise>
							  <li id="id_h2"><h2>该实验无参数，请先填写参数！</h2></li>
					</c:otherwise>
				 </c:choose>
			</table>
			
		</li>
		
		<li id="resultList">
			
		</li>
		</ul>
		
</div>


<script type="text/javascript">
function zd(index){
	$("#box_clcs"+index).css("display","block");
	$("#zd_"+index).css("display","none");
	$("#zd1_"+index).css("display","block");
}
function zd1(index){
	$("#box_clcs"+index).css("display","none");
	$("#zd_"+index).css("display","block");
	$("#zd1_"+index).css("display","none");
}
</script>

</body>
</html>




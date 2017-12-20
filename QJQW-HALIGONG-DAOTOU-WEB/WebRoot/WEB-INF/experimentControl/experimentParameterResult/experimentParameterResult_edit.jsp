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
	
	</script>
	
	
</head>
<body>
<div class="content_box_text">
<form action = "/experimentParameterResult/goExperimentParameterResult" name="userForm" id="userForm" method="post">
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
	  		<span id="lititle">实验名称&nbsp;：&nbsp;</span><i>${ExperimentManage.ExperimentName}</i>
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
  <li id="id_h2"><h2>填写编号后可添加参数！</h2></li>
  <li class="block nobor" id="li_table">
  			<input type="button" value="插入行" class="btn_add" id="addRow" onclick="addRow(this);">&nbsp;
  			<input type="button" value="插入列" class="btn_add" id="addColumn" onclick="addColumn(this);">
			<table border="1" class="box_table li_table" id="table">
			
			
				<c:choose>
					<c:when test="${not empty ExperimentParameterResult}">
						
						<% List<Map> list = (List)request.getAttribute("ExperimentParameterResult");
						   List list1 = (List)request.getAttribute("parameters");%>
						   <tr id = "row_0">
						   	<th class="th" id = "col_row0_th">序号</th>
						   	<%for(int i =0;i<list1.size();i++){%>
						   		<td class="th" id = "col_row0_<%=i%>">
									<select class="select" onChange="test(this);">
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
									<td id="col_row<%=i+1%>_<%=j%>" ><input type="text" value = "<%=list.get(i).get(list1.get(j))%>"/></td>
								<%}%>
								<th id="col_row<%=i+1%>"><a class="btn btn_bg_orange b_block" onclick="delRow(<%=i+1%>);">删除</a></th>
								</tr>
							<%}%>
							<tr id = "row_-1">
								<th id = "col_row-1_th"></th>
									<%for(int i =0;i<list1.size();i++){%>
										<th id = "col_row-1_<%=i%>"><a class="btn btn_bg_orange b_block"  onclick="delColumn(<%=i%>)">删除</a></th>
									<%}%>
								<th id = "col_row-1"></th>
						 	</tr>
					</c:when>
						<c:otherwise>
						  <tr id = "row_0">
								<th class="th" id = "col_row0_th">序号</th>
								<td class="th" id = "col_row0_0">
									<select class="select" onChange="test(this);">
									  <option value="">请选择</option>
									  <option value="ExperimentCuttingSpeed" >切削速度</option>
									  <option value="ExperimentCuttingDepth" >切削深度</option>
									  <option value="ExperimentCuttingWidth" >切削宽度</option>
									  <option value="ExperimentFeedRate" >进给量</option>
									  <option value="ExperimentToolQianjiao" >刀具前角</option>
									  <option value="ExperimentToolHoujiao" >刀具后角</option>
									  <option value="ExperimentToolZhupianjiao" >刀具主偏角</option>
									  <option value="ExperimentToolRenqingjiao" >刀具刃倾角</option>
									  <option value="ExperimentToolNoseRadius" >刀尖圆弧半径</option>
									  <option value="ExperimentToolBreakerBlade" >断屑槽类型</option>
									  <option value="ExperimentMachiningType" >加工类别</option>
									  <option value="ExperimentTool" >试验刀具</option>
									  <option value="ExperimentToolMaterial" >刀具材料</option>
									  <option value="ExperimentCuttingFluid" >切削液</option>
									  <option value="ExperimentPara1" >预留1</option>
									  <option value="ExperimentPara2" >预留2</option>
									</select>
								</td>
								<td class="th" id = "col_row0_1">
									<select class="select" onChange="test(this);">
									  <option value="">请选择</option>
									  <option value="ExperimentCuttingSpeed" >切削速度</option>
									  <option value="ExperimentCuttingDepth" >切削深度</option>
									  <option value="ExperimentCuttingWidth" >切削宽度</option>
									  <option value="ExperimentFeedRate" >进给量</option>
									  <option value="ExperimentToolQianjiao" >刀具前角</option>
									  <option value="ExperimentToolHoujiao" >刀具后角</option>
									  <option value="ExperimentToolZhupianjiao" >刀具主偏角</option>
									  <option value="ExperimentToolRenqingjiao" >刀具刃倾角</option>
									  <option value="ExperimentToolNoseRadius" >刀尖圆弧半径</option>
									  <option value="ExperimentToolBreakerBlade" >断屑槽类型</option>
									  <option value="ExperimentMachiningType" >加工类别</option>
									  <option value="ExperimentTool" >试验刀具</option>
									  <option value="ExperimentToolMaterial" >刀具材料</option>
									  <option value="ExperimentCuttingFluid" >切削液</option>
									  <option value="ExperimentPara1" >预留1</option>
									  <option value="ExperimentPara2" >预留2</option>
									</select>
								</td>
								<td class="th" id = "col_row0_2" >
									<select class="select" onChange="test(this);">
								      <option value="">请选择</option>
									  <option value="ExperimentCuttingSpeed" >切削速度</option>
									  <option value="ExperimentCuttingDepth" >切削深度</option>
									  <option value="ExperimentCuttingWidth" >切削宽度</option>
									  <option value="ExperimentFeedRate" >进给量</option>
									  <option value="ExperimentToolQianjiao" >刀具前角</option>
									  <option value="ExperimentToolHoujiao" >刀具后角</option>
									  <option value="ExperimentToolZhupianjiao" >刀具主偏角</option>
									  <option value="ExperimentToolRenqingjiao" >刀具刃倾角</option>
									  <option value="ExperimentToolNoseRadius" >刀尖圆弧半径</option>
									  <option value="ExperimentToolBreakerBlade" >断屑槽类型</option>
									  <option value="ExperimentMachiningType" >加工类别</option>
									  <option value="ExperimentTool" >试验刀具</option>
									  <option value="ExperimentToolMaterial" >刀具材料</option>
									  <option value="ExperimentCuttingFluid" >切削液</option>
									  <option value="ExperimentPara1" >预留1</option>
									  <option value="ExperimentPara2" >预留2</option>
									</select>
								</td>
								<th class="th" id = "col_row0">操作</th>
						  </tr>
						  <tr id = "row_-1">
								<th id = "col_row-1_th"></th>
								<th id = "col_row-1_0"><a class="btn btn_bg_orange b_block"  onclick="delColumn(0)">删除</a></th>
								<th id = "col_row-1_1"><a class="btn btn_bg_orange b_block"  onclick="delColumn(1)">删除</a></th>
								<th id = "col_row-1_2"><a class="btn btn_bg_orange b_block"  onclick="delColumn(2)">删除</a></th>
								<th id = "col_row-1"></th>
						  </tr>
					</c:otherwise>
				 </c:choose>
			</table>
			<input type="button" value="导出参数" class="btn_add"  onclick="exportVal();">
			<input type="button" value="保存参数" class="btn_add" style = "float:right;" onclick="save();">
			<br/><br/>
			<form action = "/experimentParameterResult/importExcel" id = "excelForm" method="post" enctype="multipart/form-data">
				<input type="button" value="导入参数" class="btn_add"  onclick="importExcel();"> 
				<input type = "hidden" value = "${ExperimentManage.ExperimentNo }" name ="ExperimentNo1" id ="ExperimentNo1" >
				<input type="file" name="excel" id="excel" onchange="check();"/>
			</form>
		</li>
		</ul>
		<form id="ceshiForm" action="/experimentParameterResult/exportExperimentParameterResult"><input type = "hidden" name = "json" id = "ceshi" value = ""/></form>
		
</div>


<script type="text/javascript">
	function importExcel(){
		var excel = $("#excel").val();
		if(excel==""){
			alert("请选择文件");
			return false;
		}
		$("#excelForm").submit();
		
	}
	
	function check(){
 		var excel = $("#excel").get(0).files[0];
	 	if (!(/\.(?:xls|xlsx)$/.test(excel.name))) {
		 var obj = document.getElementById('excel') ; 
		 obj.outerHTML=obj.outerHTML; 
		 alert("需要上传excel文件");
		 return	false;		
		}
	 }
	

	/* 添加行 */
	function addRow(){
		var rowNum = $("#table tr").length;//行数
		var colNum = $("#row_0 td").length; //列数
		var html = '';
		html += '<tr id = "row_' + (rowNum-1) + '">';
		html += '<th id="col_row' + (rowNum-1) + '_th">' + (rowNum-1) + '</th>';
		var i = 0;
		for(i;i<colNum;i++){
			html += '<td id="col_row' + (rowNum-1) + '_'+ i +'"><input type="text"/></td>';
		}
		html += '<th id="col_row' + (rowNum-1) +'"><a class="btn btn_bg_orange b_block" onclick="delRow('+(rowNum-1)+');">删除</a></th>';
		html += '</tr>'
		$("#row_"+(rowNum-2)).after(html);
	}
	
	
	/* 删除行 */
	function delRow(id){
		$("#row_"+id).remove();
		var clTdLength = document.getElementById("table").rows.item(0).cells.length;//材料table列数
		var rowNum = $("#table tr").length;	
		for(var j=id;j<(rowNum-1);j++){		
			$("#col_row" + (j+1) + "_th").html(j);//序号重新排列
			$("#col_row" + (j+1) + "_th").attr("id","col_row" + j + "_th");//序号id重新排列

			$("#row_" + (j+1)).attr("id","row_" + j);//该行下的所有行上移一行
			
			$("#col_row" + (j+1) + ">a").attr("onclick","delRow(" + j + ");");//删除事件的参数值随行改变
			$("#col_row" + (j+1)).attr("id","col_row" + j);
			for(var i=0;i<(clTdLength-1);i++){
						
				$("#col_row" + (j+1) + "_" + i).attr("id","col_row" + j + "_" + i);//列上移			
			}	
		}
	}
	/* 添加列 */
	function addColumn(){
		var colNum = $("#row_0 td").length; //列数
		var rowNum = $("#table tr").length;//行数
		var html = '<td class="th" id = "col_row0_'+colNum+'"><select name="TypeBTADrill" onChange="test(this);" class="select" id="TypeBTADrill_userForm" >'+
		'<option value="">请选择</option>'+
		'<option value="ExperimentCuttingSpeed" >切削速度</option>'+
		'<option value="ExperimentCuttingDepth" >切削深度</option>'+
		'<option value="ExperimentCuttingWidth" >切削宽度</option>'+
		'<option value="ExperimentFeedRate" >进给量</option>'+
		'<option value="ExperimentToolQianjiao" >刀具前角</option>'+
		'<option value="ExperimentToolHoujiao" >刀具后角</option>'+
		'<option value="ExperimentToolZhupianjiao" >刀具主偏角</option>'+
		'<option value="ExperimentToolRenqingjiao" >刀具刃倾角</option>'+
		'<option value="ExperimentToolNoseRadius" >刀尖圆弧半径</option>'+
		'<option value="ExperimentToolBreakerBlade" >断屑槽类型</option>'+
		'<option value="ExperimentMachiningType" >加工类别</option>'+
		'<option value="ExperimentTool" >试验刀具</option>'+
		'<option value="ExperimentToolMaterial" >刀具材料</option>'+
		'<option value="ExperimentCuttingFluid" >切削液</option>'+
		'<option value="ExperimentPara1" >预留1</option>'+
		'<option value="ExperimentPara2" >预留2</option>'+
		'</select></td>';
		
		
		$("#col_row0_"+(colNum-1)).after(html);
		
		html = '<th id = "col_row-1_'+colNum+'" ><a class="btn btn_bg_orange b_block"  onclick="delColumn('+colNum+')">删除</a></th>';
		
		$("#col_row-1_"+(colNum-1)).after(html); 
		
		for(var i=1;i<rowNum-1;i++){
			html = '<td id = "col_row'+ i +'_'+ colNum +'"><input type="text"/></td>';
			$("#col_row"+ i +"_"+(colNum-1)).after(html);
		}
		
	}
	/* 删除列 */
	function delColumn(id){
		var colNum = $("#row_0 td").length; //列数
		if((colNum-1)==0){
			alert("至少有一个参数！");
			return false;
		}
		var rowNum = $("#table tr").length;
		$("#col_row0_"+id).remove();
		$("#col_row-1_"+id).remove();
		for(var i=1;i<rowNum-1;i++){
			$("#col_row"+ i +"_"+id).remove();
		}
		
		for(var i=id;i < colNum;i++){
			$("#col_row0_"+(i+1)).attr("id","col_row0_"+i);
			$("#col_row-1_" + (i+1) + ">a").attr("onclick","delColumn(" + i + ");");//删除事件的参数值随行改变
			$("#col_row-1_"+(i+1)).attr("id","col_row-1_"+i);
			for(var j=1;j<rowNum-1;j++){
				$("#col_row"+j+"_"+(i+1)).attr("id","col_row"+j+"_"+i);
			}
		}
		
	}
	
	/* 查看下拉选是否重复 */
	function test(obj){
		var value = $(obj).val();
		var colNum = $("#row_0 td").length; //列数
		var values = new Array(colNum);
		for(var i =0;i<colNum;i++){
			values[i] = $("#col_row0_"+ i).children('select').val();
		}
		var j = 0;
		for(var i=0 ;i<colNum;i++){
			if(values[i]==value){
				j++;
			}
			if(j>=2){
				alert("已有该标签！");
				$(obj).val("");
				return false;
			}
		}
	}
	
	/* 保存   */
	function save(){
		var id = $("#id").val();
		if(id==null||""==id){
			alert("请选择编号！");
			return false;
		}
		var colNum = $("#row_0 td").length; //列数
		var rowNum = $("#table tr").length; //行数
		if(rowNum<=2){
			alert("请填写参数！");
			return false;
		}
		var value = new Array(colNum);
		for(var i =0;i<colNum;i++){
			value[i] = $("#col_row0_"+ i).children('select').val();
		}
		var json = "[";
		for(var j = 1;j<rowNum-1;j++){
			json += "{";
			for(var i =0;i<colNum;i++){
				var key = value[i];
				var values = $("#col_row"+j+"_"+i).children('input').val();
				json += key + ":\"" + values + "\"";
				if(i!=(colNum-1)){
					json += "," ;
				}
			}
			json += "}";
			if(j!=(rowNum-2)){
				json+=",";
			}
		}
		json += "]";
		for(var i =0;i<colNum;i++){
			if(value[i]==""||value[i]==null){
				alert("列头不能为空！");
				return false;	
			}
		}
		$.ajax({  
	          url: '/experimentParameterResult/saveExperimentParameterResult' ,  
	          type: 'POST',  
	          data: {'json':json,'id':id},  
	          success: function (data) {  
	              if(data==1){
	            	  alert("保存成功！");
	              }
	              else if(data==0){
	            	  alert("保存失败！");
	              }
	          }  
	     });  
		
	}
	
	function exportVal(){
		var id = $("#id").val();
		if(id==null||""==id){
			alert("请选择编号！");
			return false;
		}
		var colNum = $("#row_0 td").length; //列数
		var rowNum = $("#table tr").length; //行数
		if(rowNum<=2){
			alert("请填写参数！");
			return false;
		}
		var value = new Array(colNum);
		for(var i =0;i<colNum;i++){
			value[i] = $("#col_row0_"+ i).children('select').val();
		}
		var json = "[";
		for(var j = 1;j<rowNum-1;j++){
			json += "{";
			for(var i =0;i<colNum;i++){
				var key = value[i];
				var values = $("#col_row"+j+"_"+i).children('input').val();
				json += key + ":\"" + values + "\"";
				if(i!=(colNum-1)){
					json += "," ;
				}
			}
			json += "}";
			if(j!=(rowNum-2)){
				json+=",";
			}
		}
		json += "]";
		for(var i =0;i<colNum;i++){
			if(value[i]==""||value[i]==null){
				alert("列头不能为空！");
				return false;	
			}
		}
		$("#ceshi").val(json);
		$("#ceshiForm").submit();
	}

</script>

</body>
</html>




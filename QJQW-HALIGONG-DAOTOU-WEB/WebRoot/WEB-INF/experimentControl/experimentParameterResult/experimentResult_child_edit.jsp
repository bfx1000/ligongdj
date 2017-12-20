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
	<script src="<%=path%>/resources/js/experimentResult_child_edit.js"></script>
	<script type="text/javascript">
	function upExReQianDaoPicture(ascription,obj,index){
		var file = $(obj).get(0).files[0]; //选择上传的文件
		var formData = new FormData();
		formData.append("resultFile",file);
		formData.append("ascription",ascription);
		$.ajax({  
	          url: '/experimentParameterResult/saveResultFile' ,  
	          type: 'POST',  
	          data: formData,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
		            	  $("#div_"+ascription+index).append("<div><img width='100px' height='100px'name='"+ascription+"s_img"+index+"' src='<%=path%>/goods"+data.url+"'/><input name ='"+ascription+"_img"+index+"' value='"+data.url+"' /><a class='btn btn_shanchu' onclick='onDel"+ascription+"Img(\""+data.url+"\","+index+");'>删除</a></div>");
		            	  $("#"+ascription+index).remove();
		            	  $("#span_"+ascription+index).html('<input type="file" name="'+ascription+index+'" id="'+ascription+index+'" onchange="upExReQianDaoPicture(\''+ascription+'\',this,'+index+');"/>');
		            	  var array_ExReForceFile = $("#array_"+ascription+index).val();
		            	  array_ExReForceFile = array_ExReForceFile + data.url + "," ;
		            	  $("#array_"+ascription+index).val(array_ExReForceFile);
	              }
	              else {
	            	  alert("上传失败，请重新选择文件");
	              }
	          }  
	     }); 
	}
	</script>
	
</head>
<body>
<div class="content_box_text">
	<a class = "btn" onclick="save();">保存</a>
	<form id = "MyForm">
		<div  id = "resultInfo_div"> 
			<input type = "hidden" name = "id_ExperimentParameterResult" id = "id_ExperimentParameterResult" value = "${ExperimentResult.id_ExperimentParameterResult }"/>
			<div class="box_xiangxi zhedie">
				<div class="box_zhedie">
					<span class="a_zhedie1" id = "zd_1" onclick = "zd(1);" style="display:block;">基本结果</span>
					<span class="a_zhedie2" id = "zd1_1" onclick = "zd1(1);" style="display:none;">基本结果</span>
				</div>
				<div class="box_u1" id="box_clcs1" style="display:none">
					
					<ul class="box_text">
						<li>
						    <span id="lititle">切削力Fx</span>
						    <input name="ExReForceX" id="ExReForceX_userForm" type="text" class="input" value = "${ExperimentResult.ExReForceX }" />
						  </li>	
						  <li>
						    <span id="lititle">切削力Fy</span>
						    <input name="ExReForceY" id="ExReForceY_userForm" type="text" class="input" value = "${ExperimentResult.ExReForceY }" />
						  </li>
					 	 <li>
						    <span id="lititle">切削力Fz</span>
						    <input name="ExReForceZ" id="ExReForceZ_userForm" type="text" class="input" value = "${ExperimentResult.ExReForceZ }"/>
						  </li>	
						  <li>
						    <span id="lititle">扭矩 N</span>
						    <input name="ExReTorque" id="ExReTorque_userForm" type="text" class="input"  value = "${ExperimentResult.ExReTorque }"/>
						  </li>
						  <li>
						    <span id="lititle">切削温度</span>
						    <input name="ExReTemperature" id="ExReTemperature_userForm" type="text" class="input"  value = "${ExperimentResult.ExReTemperature }"/>
						  </li>
						  <li class="block">
							    <span id="lititle">切削力文件</span>
							    <input type ="hidden" name = "array_ExReForceFile" id = "array_ExReForceFile" value="${array_ExReForceFile }" />
							    <input type ="hidden" name = "array_ExReForceFile_name" id = "array_ExReForceFile_name" value="${array_ExReForceFile_name }" />
						    	<span id="ExReForce">
						    		<input type="file" name="ExReForceFile" id="ExReForceFile" />
						    	</span>
							    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('ExReForceFile');"/>
							    <div class="clear"></div>	
							    <span id="span_ExReForceFile">
						    	</span>
						  </li>
						  <li class="block">
							    <span id="lititle">切削温度文件</span>
							    <input type ="hidden" name = "array_ExReTemperatureFile" id = "array_ExReTemperatureFile" value="${array_ExReTemperatureFile }" />
							    <input type ="hidden" name = "array_ExReTemperatureFile_name" id = "array_ExReTemperatureFile_name" value="${array_ExReTemperatureFile_name }" />
						    	<span id="ExReTemperature">
						    		<input type="file" name="ExReTemperatureFile" id="ExReTemperatureFile" />
						    	</span>
							    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('ExReTemperatureFile');"/>
							    <div class="clear"></div>
							    <span id="span_ExReTemperatureFile">
						    	</span>
						  </li>
					  </ul>
				</div>
				<div class="clear"></div>
			</div>
						
			<div class="box_xiangxi zhedie">
				<div class="box_zhedie">
					<span class="a_zhedie1" id = "zd_2" onclick = "zd(2);" style="display:block;">形貌结果</span>
					<span class="a_zhedie2" id = "zd1_2" onclick = "zd1(2);" style="display:none;">形貌结果</span>
				</div>
				<div class="box_u1" id="box_clcs2" style="display:none">
					<ul class="box_text">
						<li>
						    <span id="lititle">加工表面形态</span>
						    <input name="ExReSurfaceMorphology" id="ExReSurfaceMorphology_userForm" type="text" class="input" value = "${ExperimentResult.ExReSurfaceMorphology }"/>
						  </li>	
						  <li>
						    <span id="lititle">切屑形态</span>
						    <input name="ExReChipShape" id="ExReChipShape_userForm" type="text" class="input"  value = "${ExperimentResult.ExReChipShape}"/>
						  </li>
							<li class="block">
								    <span id="lititle">表面文件</span>
								    <input type ="hidden" name = "array_SurfaceFile" id = "array_SurfaceFile" value="${array_SurfaceFile }" />
								    <input type ="hidden" name = "array_SurfaceFile_name" id = "array_SurfaceFile_name" value="${array_SurfaceFile_name }" />
							    	<span id="Surface">
							    		<input type="file" name="SurfaceFile" id="SurfaceFile" />
							    	</span>
								    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('SurfaceFile');"/>
								    <div class="clear"></div>
								    <span id="span_SurfaceFile">
							    	</span>
							  </li>
							  <li class="block">
								    <span id="lititle">切屑形态文件</span>
								    <input type ="hidden" name = "array_ShapeFile" id = "array_ShapeFile" value="${array_ShapeFile }" />
								    <input type ="hidden" name = "array_ShapeFile_name" id = "array_ShapeFile_name" value="${array_ShapeFile_name }" />
							    	<span id="Shape">
							    		<input type="file" name="ShapeFile" id="ShapeFile" />
							    	</span>
								    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('ShapeFile');"/>
								    <div class="clear"></div>
								    <span id="span_ShapeFile">
							    	</span>
							  </li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			
			<div class="box_xiangxi zhedie">
				<div class="box_zhedie">
					<span class="a_zhedie1" id = "zd_3" onclick = "zd(3);" style="display:block;">表面完整性</span>
					<span class="a_zhedie2" id = "zd1_3" onclick = "zd1(3);" style="display:none;">表面完整性</span>
				</div>
				<div class="box_u1" id="box_clcs3" style="display:none">
					<ul class="box_text">
						<li>
						    <span id="lititle">表面粗糙度</span>
						    <input name="ExReSurfaceRoughness" id="ExReSurfaceRoughness_userForm" type="text" class="input" value = "${ExperimentResult.ExReSurfaceRoughness }"/>
						  </li>	
						  <li>
						    <span id="lititle">表面硬度</span>
						    <input name="ExReSurfaceHardness" id="ExReSurfaceHardness_userForm" type="text" class="input"  value = "${ExperimentResult.ExReSurfaceHardness }"/>
						  </li>
							<li class="block">
								    <span id="lititle">表面粗糙度文件</span>
								    <input type ="hidden" name = "array_SurfaceRoughnessFile" id = "array_SurfaceRoughnessFile" value="${array_SurfaceRoughnessFile }" />
								    <input type ="hidden" name = "array_SurfaceRoughnessFile_name" id = "array_SurfaceRoughnessFile_name" value="${array_SurfaceRoughnessFile_name }" />
							    	<span id="SurfaceRoughness">
							    		<input type="file" name="SurfaceRoughnessFile" id="SurfaceRoughnessFile" />
							    	</span>
								    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('SurfaceRoughnessFile');"/>
								    <div class="clear"></div>
								    <span id="span_SurfaceRoughnessFile">
							    	</span>
							  </li>
							  <li class="block">
								    <span id="lititle">表面硬度文件</span>
								    <input type ="hidden" name = "array_SurfaceHardnessFile" id = "array_SurfaceHardnessFile" value="${array_SurfaceHardnessFile }" />
								    <input type ="hidden" name = "array_SurfaceHardnessFile_name" id = "array_SurfaceHardnessFile_name" value="${array_SurfaceHardnessFile_name }" />
							    	<span id="SurfaceHardness">
							    		<input type="file" name="SurfaceHardnessFile" id="SurfaceHardnessFile" />
							    	</span>
								    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('SurfaceHardnessFile');"/>
								    <div class="clear"></div>
								    <span id="span_SurfaceHardnessFile">
							    	</span>
							  </li>
							  <li class="block nobor">
									<input type="hidden" name="ExReSectionHardness" id="ExReSectionHardness_userForm" value = "${ExperimentResult.ExReSectionHardness }" /> 
									<span id="lititle">截面硬度</span>
									<input type="button" value="点击输入" class="btn_add" id="ExReSectionHardness_btn" data-name="0" onclick="editCl(this);"><!-- data-name : 值为0时对应的状态为“点击输入”  ， 值为1时对应的状态为“保存”-->
									&nbsp;
									<input type="button" value="添加" class="btn_add" id="btn_add_ConstituentsMaterial"  onclick="addCl(this);" style="display: none;"/>
								</li>
							  <li class="block nobor">
									<!--  材料表格  -->
									<table border="1" class="li_table box_table"  id="clTable">
									  <tr class="cl_tr_0">
									    <th class="th">距离表面距离</th>
									    <c:forEach items="${ExperimentResult.ExReSectionHardnessList}" var="var" varStatus="vs">
									    	<td class="td edit_1" id="cl_tr0_td${vs.index }">${var.yuansu }</td>
									    </c:forEach>
									  </tr>
									  <tr class="cl_tr_1">
									    <th class="th">硬度值</th>
									    <c:forEach items="${ExperimentResult.ExReSectionHardnessList}" var="var" varStatus="vs">
									    	<td class="td edit_2" id="cl_tr1_td${vs.index }">${var.baifenbi }</td>
									    </c:forEach>
									  </tr>
									  <tr class="cl_tr_2">
									    <th class="th">操作</th>
									    <c:forEach items="${ExperimentResult.ExReSectionHardnessList}" var="var" varStatus="vs">
									     	<td class="td" id="cl_tr2_td${vs.index }"><a class="btn btn_bg_orange b_block" onclick="delCl(${vs.index })">删除</a></td>
									    </c:forEach>
									  </tr>
									</table>
								</li>
							   <li class="block">
								    <span id="lititle">截面硬度文件</span>
								    <input type ="hidden" name = "array_ExReSectionHardnessFile" id = "array_ExReSectionHardnessFile" value="${array_ExReSectionHardnessFile }" />
								    <input type ="hidden" name = "array_ExReSectionHardnessFile_name" id = "array_ExReSectionHardnessFile_name" value="${array_ExReSectionHardnessFile_name }" />
							    	<span id="ExReSectionHardness">
							    		<input type="file" name="ExReSectionHardnessFile" id="ExReSectionHardnessFile" />
							    	</span>
								    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('ExReSectionHardnessFile');"/>
								    <div class="clear"></div>
								    <span id="span_ExReSectionHardnessFile">
							    	</span>
							  </li>
							  <li class="block">
							    <span id="lititle">表面残余应力</span>
							    <input name="ExReSurfaceStress" id="ExReSurfaceStress_userForm" type="text" class="input" value = "${ExperimentResult.ExReSurfaceStress }"/>
							  </li>	
							  <li class="block">
								    <span id="lititle">表面残余应力</span>
								    <input type ="hidden" name = "array_ExReSurfaceStressFile" id = "array_ExReSurfaceStressFile" value="${array_ExReSurfaceStressFile }" />
								    <input type ="hidden" name = "array_ExReSurfaceStressFile_name" id = "array_ExReSurfaceStressFile_name" value="${array_ExReSurfaceStressFile_name }" />
							    	<span id="ExReSurfaceStress">
							    		<input type="file" name="ExReSurfaceStressFile" id="ExReSurfaceStressFile" />
							    	</span>
								    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('ExReSurfaceStressFile');"/>
								    <div class="clear"></div>
								    <span id="span_ExReSurfaceStressFile">
							    	</span>
							  </li>
							  <li class="block nobor">
									<input type="hidden" name="ExReSectionStress" id="ExReSectionStress_userForm" value = "${ExperimentResult.ExReSectionStress }" /> 
									<span id="lititle">截面残余应力</span>
									<input type="button" value="点击输入" class="btn_add" id="ExReSectionStress_btn" data-name="0" onclick="editCl1(this);"><!-- data-name : 值为0时对应的状态为“点击输入”  ， 值为1时对应的状态为“保存”-->
									&nbsp;
									<input type="button" value="添加" class="btn_add" id="btn_add_ConstituentsMaterial1"  onclick="addCl1(this);" style="display: none;"/>
								</li>
							  <li class="block nobor">
									<!--  材料表格  -->
									<table border="1" class="li_table box_table"  id="clTable1">
									  <tr class="cl1_tr_0">
									    <th class="th">距离表面距离</th>
									    <c:forEach items="${ExperimentResult.ExReSectionStressList}" var="var" varStatus="vs">
									    	<td class="td edit_1" id="cl1_tr0_td${vs.index }">${var.yuansu }</td>
									    </c:forEach>
									  </tr>
									  <tr class="cl1_tr_1">
									    <th class="th">硬度值</th>
									    <c:forEach items="${ExperimentResult.ExReSectionStressList}" var="var" varStatus="vs">
									    	<td class="td edit_2" id="cl1_tr1_td${vs.index }">${var.baifenbi }</td>
									    </c:forEach>
									  </tr>
									  <tr class="cl1_tr_2">
									    <th class="th">操作</th>
									    <c:forEach items="${ExperimentResult.ExReSectionStressList}" var="var" varStatus="vs">
									     	<td class="td" id="cl1_tr2_td${vs.index }"><a class="btn btn_bg_orange b_block" onclick="delCl(${vs.index })">删除</a></td>
									    </c:forEach>
									  </tr>
									</table>
								</li>
							  <li class="block">
								    <span id="lititle">截面硬度文件</span>
								    <input type ="hidden" name = "array_ExReSectionStressFile" id = "array_ExReSectionStressFile" value="${array_ExReSectionStressFile }" />
								    <input type ="hidden" name = "array_ExReSectionStressFile_name" id = "array_ExReSectionStressFile_name" value="${array_ExReSectionStressFile_name }" />
							    	<span id="ExReSectionStress">
							    		<input type="file" name="ExReSectionStressFile" id="ExReSectionStressFile" />
							    	</span>
								    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('ExReSectionStressFile');"/>
								    <div class="clear"></div>
								    <span id="span_ExReSectionStressFile">
							    	</span>
							  </li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			
			<div class="box_xiangxi zhedie">
				<div class="box_zhedie">
					<span class="a_zhedie1" id = "zd_4" onclick = "zd(4);" style="display:block;">自定义结果</span>
					<span class="a_zhedie2" id = "zd1_4" onclick = "zd1(4);" style="display:none;">自定义结果</span>
				</div>
				<div class="box_u1" id="box_clcs4" style="display:none">
					<ul class="box_text">
						<li>
						    <span id="lititle">自定义1参数名称</span>
						    <input name="ExReDefined1" id="ExReDefined1_userForm" type="text" class="input" value = "${ExperimentResult.ExReDefined1 }"/>
						  </li>	
						  <li>
						    <span id="lititle">结果</span>
						    <input name="ExReDefined1Value" id="ExReDefined1Value_userForm" type="text" class="input"  value = "${ExperimentResult.ExReDefined1Value }"/>
						  </li>
							<li class="block">
								    <span id="lititle">表面文件</span>
								    <input type ="hidden" name = "array_ExReDefined1File" id = "array_ExReDefined1File" value="${array_ExReDefined1File }" />
								    <input type ="hidden" name = "array_ExReDefined1File_name" id = "array_ExReDefined1File_name" value="${array_ExReDefined1File_name }" />
							    	<span id="ExReDefined1">
							    		<input type="file" name="ExReDefined1File" id="ExReDefined1File" />
							    	</span>
								    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('ExReDefined1File');"/>
								    <div class="clear"></div>
								    <span id="span_ExReDefined1File">
							    	</span>
							  </li>
						  <li>
					    <span id="lititle">自定义2参数名称</span>
					    <input name="ExReDefined2" id="ExReDefined2_userForm" type="text" class="input" value = "${ExperimentResult.ExReDefined2 }"/>
					  </li>	
					  <li>
					    <span id="lititle">结果</span>
					    <input name="ExReDefined2Value" id="ExReDefined2Value_userForm" type="text" class="input"  value = "${ExperimentResult.ExReDefined2Value }"/>
					  </li>
						<li class="block">
							    <span id="lititle">表面文件</span>
							    <input type ="hidden" name = "array_ExReDefined2File" id = "array_ExReDefined2File" value="${array_ExReDefined2File }" />
							    <input type ="hidden" name = "array_ExReDefined2File_name" id = "array_ExReDefined2File_name" value="${array_ExReDefined2File_name }" />
						    	<span id="ExReDefined2">
						    		<input type="file" name="ExReDefined2File" id="ExReDefined2File" />
						    	</span>
							    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('ExReDefined2File');"/>
							    <div class="clear"></div>
							    <span id="span_ExReDefined2File">
						    	</span>
						  </li>
						  <li>
						    <span id="lititle">自定义3参数名称</span>
						    <input name="ExReDefined3" id="ExReDefined3_userForm" type="text" class="input" value = "${ExperimentResult.ExReDefined3 }"/>
						  </li>	
						  <li>
						    <span id="lititle">结果</span>
						    <input name="ExReDefined3Value" id="ExReDefined3Value_userForm" type="text" class="input"  value = "${ExperimentResult.ExReDefined3Value }"/>
						  </li>
							<li class="block">
								    <span id="lititle">表面文件</span>
								    <input type ="hidden" name = "array_ExReDefined3File" id = "array_ExReDefined3File" value="${array_ExReDefined3File }" />
								    <input type ="hidden" name = "array_ExReDefined3File_name" id = "array_ExReDefined3File_name" value="${array_ExReDefined3File_name }" />
							    	<span id="ExReDefined3">
							    		<input type="file" name="ExReDefined3File" id="ExReDefined3File" />
							    	</span>
								    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('ExReDefined3File');"/>
								    <div class="clear"></div>
								    <span id="span_ExReDefined3File">
							    	</span>
							  </li>
						  <li>
						    <span id="lititle">自定义4参数名称</span>
						    <input name="ExReDefined4" id="ExReDefined4_userForm" type="text" class="input" value = "${ExperimentResult.ExReDefined4 }"/>
						  </li>	
						  <li>
						    <span id="lititle">结果</span>
						    <input name="ExReDefined4Value" id="ExReDefined4Value_userForm" type="text" class="input"  value = "${ExperimentResult.ExReDefined4Value }"/>
						  </li>
							<li class="block">
								    <span id="lititle">表面文件</span>
								    <input type ="hidden" name = "array_ExReDefined4File" id = "array_ExReDefined4File" value="${array_ExReDefined4File }" />
								    <input type ="hidden" name = "array_ExReDefined4File_name" id = "array_ExReDefined4File_name" value="${array_ExReDefined4File_name }" />
							    	<span id="ExReDefined4">
							    		<input type="file" name="ExReDefined4File" id="ExReDefined4File" />
							    	</span>
								    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('ExReDefined4File');"/>
								    <div class="clear"></div>
								    <span id="span_ExReDefined4File">
							    	</span>
							  </li>
							  <li>
						    <span id="lititle">自定义5参数名称</span>
						    <input name="ExReDefined5" id="ExReDefined5_userForm" type="text" class="input" value = "${ExperimentResult.ExReDefined5 }"/>
						  </li>	
						  <li>
						    <span id="lititle">结果</span>
						    <input name="ExReDefined5Value" id="ExReDefined5Value_userForm" type="text" class="input"  value = "${ExperimentResult.ExReDefined5Value }"/>
						  </li>
							<li class="block">
								    <span id="lititle">表面文件</span>
								    <input type ="hidden" name = "array_ExReDefined5File" id = "array_ExReDefined5File" value="${array_ExReDefined5File }" />
								    <input type ="hidden" name = "array_ExReDefined5File_name" id = "array_ExReDefined5File_name" value="${array_ExReDefined5File_name }" />
							    	<span id="ExReDefined5">
							    		<input type="file" name="ExReDefined5File" id="ExReDefined5File" />
							    	</span>
								    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('ExReDefined5File');"/>
								    <div class="clear"></div>
								    <span id="span_ExReDefined5File">
							    	</span>
							  </li>
					 </ul>
				</div>
				<div class="clear"></div>
			</div>
			
			<div class="box_xiangxi zhedie">
				<div class="box_zhedie">
					<span class="a_zhedie1" id = "zd_5" onclick = "zd(5);" style="display:block;">刀具磨损</span>
					<span class="a_zhedie2" id = "zd1_5" onclick = "zd1(5);" style="display:none;">刀具磨损</span>
				</div>
				<div class="box_u1" id="box_clcs5" style="display:none">
					<ul class="box_text">
						<li>
						    <span id="lititle">刀具寿命</span>
						    <input name="ExReToolLife"  id="ExReToolLife_userForm" type="text" class="input" value = "${ExperimentResult.ExReToolLife }"/>min
						  </li>	
						  <li>
						    <span id="lititle">磨钝标准</span>
						    <input name="ExReWearStandard" id="ExReWearStandard_userForm" type="text" class="input" value = "${ExperimentResult.ExReWearStandard }" />VB/mm
						  </li>
						  <li class="block">
							    <span id="lititle">刀具磨损文件</span>
							    <input type ="hidden" name = "array_ExReWearFile" id = "array_ExReWearFile" value="${array_ExReWearFile }" />
							    <input type ="hidden" name = "array_ExReWearFile_name" id = "array_ExReWearFile_name" value="${array_ExReWearFile_name }" />
						    	<span id="ExReWear">
						    		<input type="file" name="ExReWearFile" id="ExReWearFile" />
						    	</span>
							    <input type="button" value="加载文件" class="btn" onclick="onSaveResultFile('ExReWearFile');"/>
							    <div class="clear"></div>
							    <span id="span_ExReWearFile">
						    	</span>
						  </li>
						  
						  <li class="block nobor">
								<span id="lititle">刀具磨损</span>
								<input type="button" value="增加行" id="btn_add_StrainRate" class="btn_add"  onclick="addRow();" >
							</li>
					
							<li class="block nobor">
								
								<table border="1" class="box_table1 li_table1" id="yblTable">
									<input type="hidden" id = "trNum" value = "${Number }" />
									  <tr id="row_-1">
											<th class="th" width="45px">时间</td>
											<td class="th" width="45px">磨损量(mm)</td>
											<td class="th">前刀面图片</td>
											<td class="th">后刀面图片</td>
											<td class="th">刀尖图片</td>
											<td class="th">其他图片</td>
											<td class="th">操作</td>
									  </tr>
									  <c:forEach items="${ExperimentParameterToolWear}" var="var" varStatus="vs" >
									  	<tr id="row_${vs.index }" >
											
											<td class="td edit_1"  id="ybl_td1_tr${vs.index }"><input type="text" value = "${var.ExReWearTime }"/></td>
											<td class="td edit_2"  id="ybl_td2_tr${vs.index }"><input type="text" value = "${var.ExReWearValue }"/></td>
											
											
											<input type ="hidden" id = "array_ExReQianDaoPicture${vs.index }" value="" />
											<td class="td edit_3" id="ybl_td3_tr${vs.index }" width="105px">
												<span id="span_ExReQianDaoPicture${vs.index }">
												<input type="file" name="ExReQianDaoPicture${vs.index }" id="ExReQianDaoPicture${vs.index }" onchange="upExReQianDaoPicture('ExReQianDaoPicture',this,${vs.index });" />
												</span>
												<div id="div_ExReQianDaoPicture${vs.index }">
												<c:forEach items="${var.ExReQianDaoPicture }" var="var1" varStatus="vs1">
												<div>
											     <img width='100px' height='100px' name='ExReQianDaoPictures_img${vs.index }' src= "<%=path%>/goods${var1.url_ExperimentParameterToolWearPicture }" />
											     <input type = "hidden" name ='ExReQianDaoPicture_img${vs.index }' value="${var1.url_ExperimentParameterToolWearPicture }" />
											     <a class="btn btn_shanchu" onclick="onDelExReQianDaoPictureImg('${var1.url_ExperimentParameterToolWearPicture }',${vs.index });">删除</a>
											     </div>
												</c:forEach>
												</div>
											</td>
											
											
											<input type ="hidden" id = "array_ExReHouDaoPicture${vs.index }" value="" />
											<td class="td edit_4" id="ybl_td4_tr${vs.index }" width="106px" >
												<span id="span_ExReHouDaoPicture${vs.index }">
												<input type="file" name="ExReHouDaoPicture${vs.index }" id="ExReHouDaoPicture${vs.index }" onchange="upExReQianDaoPicture('ExReHouDaoPicture',this,${vs.index });" />
												</span>
												<div id="div_ExReHouDaoPicture${vs.index }">
												<c:forEach items="${var.ExReHouDaoPicture }" var="var1" varStatus="vs1">
												<div>
											     <img width='100px' height='100px' name='ExReHouDaoPictures_img${vs.index }' src= "<%=path%>/goods${var1.url_ExperimentParameterToolWearPicture }" />
											     <input type = "hidden" name ='ExReHouDaoPicture_img${vs.index}' value="${var1.url_ExperimentParameterToolWearPicture }" />
											     <a class="btn btn_shanchu" onclick="onDelExReHouDaoPictureImg('${var1.url_ExperimentParameterToolWearPicture }',${vs.index });">删除</a>
											     </div>
												</c:forEach>
												 </div>
											</td>
											
											<input type ="hidden" id = "array_ExReDaojianPicture${vs.index }" value="" />
											<td class="td edit_5" id="ybl_td5_tr${vs.index }" width="106px" >
												<span id="span_ExReDaojianPicture${vs.index }">
												<input type="file" name="ExReDaojianPicture${vs.index }" id="ExReDaojianPicture${vs.index }" onchange="upExReQianDaoPicture('ExReDaojianPicture',this,${vs.index });" />
												</span>
												<div id="div_ExReDaojianPicture${vs.index }">
												<c:forEach items="${var.ExReDaojianPicture }" var="var1" varStatus="vs1">
												<div>
											     <img width='100px' height='100px' name='ExReDaojianPictures_img${vs.index }' src= "<%=path%>/goods${var1.url_ExperimentParameterToolWearPicture }" />
											     <input type = "hidden" name ='ExReDaojianPicture_img${vs.index}' value="${var1.url_ExperimentParameterToolWearPicture }" />
											     <a class="btn btn_shanchu" onclick="onDelExReDaojianPictureImg('${var1.url_ExperimentParameterToolWearPicture }',${vs.index });">删除</a>
											     </div>
												</c:forEach>
												</div>
											</td>
											
											<input type ="hidden" id = "array_ExReotherPicture${vs.index }" value="" />
											<td class="td edit_6" id="ybl_td6_tr${vs.index }" width="106px" >
												<span id="span_ExReotherPicture${vs.index }">
												<input type="file" name="ExReotherPicture${vs.index }" id="ExReotherPicture${vs.index }" onchange="upExReQianDaoPicture('ExReotherPicture',this,${vs.index });" />
												</span>
												<div id="div_ExReotherPicture${vs.index }">
												<c:forEach items="${var.ExReotherPicture }" var="var1" varStatus="vs1">
												<div>
											     <img width='100px' height='100px' name='ExReotherPictures_img${vs.index }' src= "<%=path%>/goods${var1.url_ExperimentParameterToolWearPicture }" />
											     <input type = "hidden" name ='ExReotherPicture_img${vs.index}' value="${var1.url_ExperimentParameterToolWearPicture }" />
											     <a class="btn btn_shanchu" onclick="onDelExReotherPictureImg('${var1.url_ExperimentParameterToolWearPicture }',${vs.index });">删除</a>
											     </div>
												</c:forEach>
												</div>
											</td>
											
											
											<td class="td" id = "ybl_td7_tr${vs.index }"><a class="btn btn_bg_orange b_block" onclick="delRow(${vs.index });">删除</a></td>
											
										</tr>
									  </c:forEach>
								</table>
							</li>
						  
						  
					  </ul>
					  
					  
				</div>
				<div class="clear"></div>
			</div>
		</div>
		</form>
		
</div>

</body>
</html>




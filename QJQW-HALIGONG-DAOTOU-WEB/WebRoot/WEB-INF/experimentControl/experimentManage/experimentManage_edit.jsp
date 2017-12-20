<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Long date = System.currentTimeMillis();
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
	<title>哈理工刀头</title>
    <meta name="description" content="哈理工刀头,专业打造各种类型机械刀头,产品类型齐全,质量放心有保障,联合祈福科技公司打造专业的刀头网站。" />
    <meta name="keywords" content="哈理工刀头,刀头,刀具,切断切槽,仿形切削,外圆切槽刀,内圆切槽刀,端面切槽。" />
<link href="<%=path%>/resources/css/index/style_a.css?v=<%=date%>" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/js/jquery-1.7.2.js"></script>
<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
<script src="<%=path%>/resources/js/laydate/laydate.js"></script>


<script type="text/JavaScript">
	$(document).ready(function(){
		changeValue();
		var num = $("#ExperimentNo_userForm").val();
		if(num!=null&&num!=""){
			$("#ExperimentNo_userForm").attr("readonly","readonly");
			$("#jcBtn").attr("onclick","");
			$("#jcBtn").val("已通过重复检测");
			$("#ExperimentNo_jc").val('0');
			
		}
		//详细信息
		var array_ExperimentReport = $("#array_ExperimentReport").val();
		var array_ExperimentReport_name = $("#array_ExperimentReport_name").val();
		if(array_ExperimentReport != null && array_ExperimentReport != ''){
			var ExperimentReports = array_ExperimentReport.split(',');
			var ExperimentReports_name = array_ExperimentReport_name.split(',');
			var ExperimentReports_str = '';
			for(var i = 0; i < ExperimentReports.length; i++){
				if(ExperimentReports[i] != null && ExperimentReports[i] != ''){
					ExperimentReports_str = ExperimentReports_str + "<div><span name='experimentReports_img' url='"+ExperimentReports[i]+"' >"+ExperimentReports_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelExperimentReportImg(\""+ExperimentReports[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ExperimentReportList").html(ExperimentReports_str);
		}
	});

	function changeValue(){
		document.getElementById('ExperimentType_userForm').value=document.getElementById('selectWrap').options[document.getElementById('selectWrap').selectedIndex].text;
	}

	
	//检测编号是否重复
	function jc(){
		
		var ExperimentNo_userForm = $("#ExperimentNo_userForm").val();
		$.ajax({  
	        url: '/experimentManage/jc' ,  
	        type: 'POST',  
	        data: {ExperimentNo_userForm:ExperimentNo_userForm},  
	        success: function (i) {  
	            if(i == 0){
	            	$("#ExperimentNo_jc").val(i);
	            	$("#ExperimentNo_userForm").attr("readonly","readonly");
	            	alert("恭喜,该编号可用。");
	            }
	            else {
	          	 	alert("编号已存在,请重新输入！");
	            }
	        }  
	   }); 
	}
	
	
	//加载各种信息
	function jz(deputy){
		var html = '<iframe name="content_iframe" class="content_iframe" id="content_iframe" frameborder="0" src="/experimentManage/jzExperimentMachine?deputy='+deputy+'" style="width:100%;height:100%;"></iframe>';
		$("#div").html(html);
	}
	
	function jz1(){
		$("#jzdp").attr('style','display:black;');
		$("#jzskz").attr('style','display:black;');
	}

	function opt(id,deputy,type){
		$("#div").html("");
		if(deputy==1){
			$("#ExperimentMachine_userForm").val(id);
		}
		if(deputy==2){
			$("#ExperimentPart_userForm").val(id);
		}
		if(deputy==3){
			$("#NumberMaterialExperimentPart_userForm").val(id);
			$("#CategoryMaterialExperimentPart_userForm").val(type);
		}
		if(deputy==4){
			var val = $("#ExperimentTool_userForm").val();
			var type1 = $("#ExperimentToolMaterial_userForm").val();
			if(val==null||val==""){
				$("#ExperimentTool_userForm").val(id);
			}else{
				var vals = val +"," + id;
				$("#ExperimentTool_userForm").val(vals);
			}
			if(type1==null||type1==""){
				$("#ExperimentToolMaterial_userForm").val(type);
			}else{
				var types = type1 +"," + type;
				$("#ExperimentToolMaterial_userForm").val(types);
			}
			
		}
		if(deputy==5){
			var val = $("#ExperimentTool_userForm").val();
			var type1 = $("#ExperimentToolMaterial_userForm").val();
			if(val==null||val==""){
				$("#ExperimentTool_userForm").val(id);
			}else{
				var vals = val +"," + id;
				$("#ExperimentTool_userForm").val(vals);
			}
			if(type1==null||type1==""){
				$("#ExperimentToolMaterial_userForm").val(type);
			}else{
				var types = type1 +"," + type;
				$("#ExperimentToolMaterial_userForm").val(types);
			}
		}
		if(deputy==6){
			var val = $("#ExperimentCuttingFluid_userForm").val();
			if(val==null||val==""){
				$("#ExperimentCuttingFluid_userForm").val(id);
			}else{
				var vals = val +"," + id;
				$("#ExperimentCuttingFluid_userForm").val(vals);
			}
		}
	}
	
	function close(){
		$("#div").html("");
	}
	
	//保存文件
	function onSaveExperimentReportList(){
		var formDate = new FormData(document.getElementById("reportForm"));  
	     $.ajax({  
	          url: '/experimentManage/saveExperimentReport' ,  
	          type: 'POST',  
	          data: formDate,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  $("#span_ExperimentReportList").append("<div><span name='experimentReports_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelExperimentReportImg(\""+data.url+"\");'>删除</a><br/></div>");
	            	  $("#ExperimentReport").remove();
	            	  $("#report").html('<input type="file" name="ExperimentReport" id="ExperimentReport" />');
	            	  var array_ExperimentReport = $("#array_ExperimentReport").val();
	            	  var array_ExperimentReport_name = $("#array_ExperimentReport_name").val();
	            	  array_ExperimentReport_name = array_ExperimentReport_name + data.fileName + ",";
	            	  array_ExperimentReport = array_ExperimentReport + data.url + "," ;
	            	  $("#array_ExperimentReport").val(array_ExperimentReport);
	            	  $("#array_ExperimentReport_name").val(array_ExperimentReport_name);
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	
	//删除文件
	function onDelExperimentReportImg(url_partDesignToolBTAdrill){
		var img_array = $("span[name='experimentReports_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_partDesignToolBTAdrill){
				$(img_array[i]).parent().remove();
				var array_ExperimentReport = $("#array_ExperimentReport").val();
				array_ExperimentReport = array_ExperimentReport.replace(url_partDesignToolBTAdrill,'');
				$("#array_ExperimentReport").val(array_ExperimentReport);
			}
		}
	}
	
	//保存
	function save(){
		$("#array_ExperimentReport_userForm").val($("#array_ExperimentReport").val());
		$("#array_ExperimentReport_name_userForm").val($("#array_ExperimentReport_name").val());
		var jc = $("#ExperimentNo_jc").val();
		if(jc!=null&&jc!=""){
			$("#userForm").ajaxSubmit(function(result){
				if(result == 1){
					alert('操作成功！');
					onClose();
				}else{
					alert('操作失败，请联系管理员！');
				}
			}); 
		}else{
			alert("请先检测编号是否重复");
			return false;
		}
	}
	function onClose(){
		window.location.href='<%=path%>/experimentManage/selectResult';
	}
</script>
</head>
<body>
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<div id="div">

</div>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text">
    <form action="/experimentManage/saveExperimentManage" name="userForm" id="userForm" method="post">
    	<input id = "array_ExperimentReport_userForm" name = "array_ExperimentReport" type = "hidden" />
    	<input id = "array_ExperimentReport_name_userForm" name = "array_ExperimentReport_name" type = "hidden" />
	  	<input id = "id_ExperimentManage_userForm" name = "id_ExperimentManage" type = "hidden" value="${(ExperimentManage.id_ExperimentManage== null || ExperimentManage.id_ExperimentManage == '') ? 0 : ExperimentManage.id_ExperimentManage}"/>
	  <li>
	    <span id="lititle">实验编号</span>
	    <input name="ExperimentNo" id="ExperimentNo_userForm" type="text" class="input" value="${ExperimentManage.ExperimentNo}"/>
	    <input type="hidden" id = "ExperimentNo_jc" value = ""/>
	  </li>	
	  <li>
	  	<input type="button" id = "jcBtn" class = "btn btn_sc" onclick="jc();" value = "检测编号是否重复" />
	  </li>	
	  <li>
	    <span id="lititle">实验名称</span>
	    <input name="ExperimentName" id="ExperimentName_userForm" type="text" class="input"  value="${ExperimentManage.ExperimentName}"/>
	  </li>
	  
	  <li>
	    <span id="lititle">实验类型</span>
	    <span class="select_wrap">
				<span class="edit_select">
					<select  name="selectWrap"  id="selectWrap" onChange="changeValue();" class="select" contenteditable="true">
						<option value="0" >请选择</option>
						<c:forEach items="${CategoryExperimentType}" var="var" varStatus="vs">
							<option value="${var.id_ExperimentType }" ${var.id_ExperimentType==ExperimentManage.ExperimentType?'selected':'' }>${var.name_ExperimentType }</option>	
						</c:forEach>
					</select>
				</span>
				<span class="input_select">
				<input type="text" name="ExperimentType"  id="ExperimentType_userForm" value="请选择">
				</span>
		</span>
	  </li>
	  <li>
	    <span id="lititle">实验机床</span>
	    <input name="ExperimentMachine" id="ExperimentMachine_userForm" type="text" class="input" value="${ExperimentManage.ExperimentMachine}"/>
	  </li>
	  <li>
	  	<input type="button" class = "btn" onclick="jz(1);" value = "加载机床节点" />
	  </li>	
	  <li>
	    <span id="lititle">实验人员</span>
	    <input name="ExperimentPerson" id="ExperimentPerson_userForm" type="text" class="input" value="${ExperimentManage.ExperimentPerson}"/>
	  </li>
	  <li>
	    <span id="lititle">责任人</span>
	    <input name="ExperimentTeacher" id="ExperimentTeacher_userForm" type="text" class="input" value="${ExperimentManage.ExperimentTeacher}"/>
	  </li>
	  <li>
	    <span id="lititle">试验件</span>
	    <input name="ExperimentPart" id="ExperimentPart_userForm" type="text" class="input" value="${ExperimentManage.ExperimentPart}"/>
	  </li>
	  <li>
	  	<input type="button" class = "btn" onclick="jz(2);" value = "加载试验件" />
	  </li>	
	  <li>
	    <span id="lititle">试验材料牌号</span>
	    <input name="NumberMaterialExperimentPart" id="NumberMaterialExperimentPart_userForm" type="text" class="input" value="${ExperimentManage.NumberMaterialExperimentPart}"/>
	  
	    <span id="lititle">试验材料种类</span>
	    <input name="CategoryMaterialExperimentPart" id="CategoryMaterialExperimentPart_userForm" type="text" class="input" value="${ExperimentManage.CategoryMaterialExperimentPart}"/>
	  </li>
	  <li>
	  	<input type="button" class = "btn" onclick="jz(3);" value = "加载试验材料" />
	  </li>
	  <li>
	  	&nbsp;
	  </li>	
	  <li>
	    <span id="lititle">试验刀具</span>
	    <input name="ExperimentTool" id="ExperimentTool_userForm" type="text" class="input" value="${ExperimentManage.ExperimentTool}"/>
	  
	    <span id="lititle">刀具材料</span>
	    <input name="ExperimentToolMaterial" id="ExperimentToolMaterial_userForm" type="text" class="input" value="${ExperimentManage.ExperimentToolMaterial}"/>
	  </li>
	  <li>
	  	<input type="button" class = "btn" onclick="jz1();" value = "加载刀具" />
	  	<input type="button" id = "jzdp" class = "btn btn_shanchu" onclick="jz(4);" style="display:none;" value = "刀片" />
	  	<input type="button" id = "jzskz" class = "btn btn_shanchu" onclick="jz(5);" style="display:none;" value = "深孔钻" />
	  </li>	
	   <li>
	  	&nbsp;
	  </li>	
	   <li>
	    <span id="lititle">切削液</span>
	    <input name="ExperimentCuttingFluid" id="ExperimentCuttingFluid_userForm" type="text" class="input" value="${ExperimentManage.ExperimentCuttingFluid}"/>
	  </li>
	  <li>
	  	<input type="button" class = "btn" onclick="jz(6);" value = "加载切削液" />
	  </li>	
	  <li>
	  	<span id="lititle">加工类别：</span>
	  	<input name="ExperimentMachiningType" type="checkbox" value="精加工" />精加工
		<input name="ExperimentMachiningType" type="checkbox" value="半精加工" />半精加工
		<input name="ExperimentMachiningType" type="checkbox" value="粗加工" />粗加工
	  </li>	
	  <li>
	  &nbsp;
	  </li>
	   <li>
	    <span id="lititle">加工形式</span>
	    <input id = "isoArray" type = "hidden" value = '${isoArray}'/>
	    <div class="first">
	    <input name="ExperimentContent" id="kw" type="text" class="input" onKeyup="getContent(this);" value="${ExperimentManage.ExperimentContent}"/>
	    </div>
	    <div id="append">
	    </div>
	  </li>
	   <li>
	    <span id="lititle">实验时间</span>
	    <input name="ExperimentTime" id="ExperimentTime_userForm"  onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" type="text" class="input" value="${ExperimentManage.ExperimentTime}"/>
	  </li>
	   <li>
	    <span id="lititle">实验说明</span>
	    <textarea  cols="" rows="" class="textarea" name="ExperimentCondition" id="ExperimentCondition_userForm" >${ExperimentManage.ExperimentCondition}</textarea>
	  
	    <span id="lititle">实验备注</span>
	    <textarea  cols="" rows="" class="textarea" name="ExperimentRemark" id="ExperimentRemark_userForm" >${ExperimentManage.ExperimentRemark}</textarea>
	  </li>
	</form>
	 <!-- 详细图片 begin  -->
	  <li class="block bor_t">
	  	<form id = "reportForm">
		    <span id="lititle">实验报告</span>
		    <input type ="hidden" id = "array_ExperimentReport" value="${array_ExperimentReport }" />
		    <input type ="hidden" id = "array_ExperimentReport_name" value="${array_ExperimentReport_name }" />
	    	<span id="report">
	    		<input type="file" name="ExperimentReport" id="ExperimentReport" />
	    	</span>
		    <input type="button" value="加载part文件" class="btn" onclick="onSaveExperimentReportList();"/>
		    <span id="span_ExperimentReportList">
	    	</span>
    	</form>
	  </li>
	<!-- 详细图片 end  -->
  </ul>
</div>
</body>
<script type="text/javascript">
    var data = null;

    $(document).ready(function(){

		var isoArray_str = $("#isoArray").val();
		data = eval(JSON.parse(isoArray_str)); 

    	
        $(document).keydown(function(e){
            e = e || window.event;
            var keycode = e.which ? e.which : e.keyCode;
            if(keycode == 38){//up
                if(jQuery.trim($("#append").html())==""){
                    return;
                }
                movePrev();
            }else if(keycode == 40){//down
                if(jQuery.trim($("#append").html())==""){
                    return;
                }
                $("#kw").blur();
                if($(".item").hasClass("addbg")){
                    moveNext();
                }else{
                    $(".item").removeClass('addbg').eq(0).addClass('addbg');
                }

            }else if(keycode == 13){//enter
                dojob();
            }
        });

        var movePrev = function(){
            $("#kw").blur();
            var index = $(".addbg").prevAll().length;
            if(index == 0){
                $(".item").removeClass('addbg').eq($(".item").length-1).addClass('addbg');
            }else{
                $(".item").removeClass('addbg').eq(index-1).addClass('addbg');
            }
        };

        var moveNext = function(){
            var index = $(".addbg").prevAll().length;
            if(index == $(".item").length-1){
                $(".item").removeClass('addbg').eq(0).addClass('addbg');
            }else{
                $(".item").removeClass('addbg').eq(index+1).addClass('addbg');
            }

        };

        var dojob = function(){
            $("#kw").blur();
            var value = $(".addbg").text();
            $("#kw").val(value);
            $("#append").hide().html("");
        }
    });
    function getContent(obj){
        var kw = jQuery.trim($(obj).val());
        if(kw == ""){
            $("#append").hide().html("");
            return false;
        }
        var html = "";
        for (var i = 0; i < data.length; i++) {
            if (data[i].indexOf(kw) >= 0) {
                html = html + "<div class='item' onmouseenter='getFocus(this)' onClick='getCon(this);'>" + data[i] + "</div>"
            }
        }
        if(html != ""){
            $("#append").show().html(html);
        }else{
            $("#append").hide().html("");
        }
    }
    function getFocus(obj){
        $(".item").removeClass("addbg");
        $(obj).addClass("addbg");
    }
    function getCon(obj){
        var value = $(obj).text();
        $("#kw").val(value);
        $("#append").hide().html("");
    }
</script>
</html>
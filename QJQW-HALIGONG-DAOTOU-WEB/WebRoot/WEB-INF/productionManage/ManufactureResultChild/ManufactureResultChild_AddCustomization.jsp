<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="images/dt2.ico">
	<title>哈理工刀头</title>
    <meta name="description" content="哈理工刀头,专业打造各种类型机械刀头,产品类型齐全,质量放心有保障,联合祈福科技公司打造专业的刀头网站。" />
    <meta name="keywords" content="哈理工刀头,刀头,刀具,切断切槽,仿形切削,外圆切槽刀,内圆切槽刀,端面切槽。" />
	
<link href="<%=path%>/resources/css/index/style_a.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/resources/js/jquery-1.7.2.js"></script>
<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
<script src="<%=path%>/resources/js/laydate/laydate.js"></script>

<script type="text/JavaScript">
	
	function save(){
		var name = $("#name").val();
		if(name==""){
			alert("请输入定制名！");
			return false;
		}
		
		var num = $("#div input").length;
		if(num<2){
			alert("定制不能没有字段！");
			return false;
		}
		
		
		$("#name_user").val(name);
		
		$("#userForm").ajaxSubmit(function(result){
			if(result == 1){
				alert('操作成功！');
				onClose();
			}else{
				alert('操作失败，请联系管理员！');
			}
		});
	}
	
	//取消
	function onClose(){
		window.location.href='<%=path%>/ManufactureResultChild/Customization';
	}
	
	function add(){
		var val_english = $("#select").val();
		var val_chinese = $("#select option:selected").text();
		if(val_english==null||val_english==""){
			alert("请选择！");
			return false;
		}
		var div = $("#div input");
		var num = div.length;
		for(var i=0;i<num;i++){
			if($(div[i]).val()==val_english){
				alert("已存在该字段，无需重复添加");
				return false;
			}
		}
		
		var li_html = '<li id ="li_'+val_english+'">'+
		   		   '  <span id="lititle">'+val_chinese+'</span>'+
		           '  <input type="button" value="删除字段" class="btn_add" onclick="del(/"'+val_english+'/");"/>'+
		           '</li>';
		var input_html = '  <input type = "hidden" id = "'+val_english+'" name = "field" value = "'+val_english+'"/>';
		$("#ul").append(li_html);
		$("#div").append(input_html);
	}
	
	function del(val_english){
		if(val_english!=""){
			var li = $("#li_"+val_english);
			$("#ul").find(li).remove();
			$("#"+val_english).remove();
		}
	}

</script>
</head>
<body style="background:#fff;">
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text" id = "ul">
     <li>
	    <span id="lititle">定制名称</span>
	    <input type="text" id="name" class="input" name="name" maxlength="50" />
	  </li>
      <li>
		<select class="select"  id = "select">
			<option value = "">请选择</option>
			<option value = "PartNoManufRS">零件编号</option>
			<option value = "NameManufRS">零件名称</option>
			<option value = "NumberMaterialManufRS">材料牌号</option>
			<option value = "CategoryMaterialManufRS">材料类别</option>
			<option value = "DeviceManufRS">设备编号</option>
			<option value = "IDDeviceManufRS">节点设备编号</option>
			<option value = "NoProcessManufRS">工序编号</option>
			<option value = "NameProcessManufRS">工序名称</option>
			<option value = "NoProcessStepManufRS">工步编号</option>
			<option value = "NameProcessStepManufRS">工步名称</option>
			<option value = "MachiningTypeManufRS">加工类别</option>
			<option value = "MachiningLevelManufRS">加工级别</option>
			<option value = "CuttingFluidManufRS">切削液</option>
			<option value = "CutterSpeedManufRS">切削速度</option>
			<option value = "SpindleSpeedManufRS">主轴转速</option>
			<option value = "FeedManufRS">每齿进给量</option>
			<option value = "CuttingDepthManufRS">切削深度</option>
			<option value = "CuttingWidthManufRS">切削宽度</option>
			<option value = "FeedSpeedManufRS">进给速度</option>
			<option value = "ToolHolderManufRS">刀柄</option>
			<option value = "ToolbladeManufRS">刀片</option>
			<option value = "刀片">刀片/刀具材料</option>
			<option value = "CutterManufRS">刀具</option>
			<option value = "ToollifeManufRS">刀具寿命</option>
			<option value = "ToolWearManufRS">刀具磨损量</option>
			<option value = "RemovalRateManufRS">材料去除率</option>
			<option value = "MachiningSize">加工尺寸</option>
			<option value = "SizePrecision">尺寸精度</option>
			<option value = "MachiningTime">加工时间</option>
			<option value = "SurfaceRoughnessManufRS">表面粗糙度</option>
			<option value = "SurfaceHardnessManufRS">表面硬度</option>
			<option value = "SurfaceStressManufRS">表面残余应力</option>
			<option value = "SurfaceMorphologyManufRS">加工表面形态</option>
			<option value = "ChipShapeManufRS">切屑形态</option>
			<option value = "ManufRSDefined1">参数名称1</option>
			<option value = "ManufRSDefined1Value">结果1</option>
			<option value = "ManufRSDefined2">零件编号</option>
			<option value = "ManufRSDefined2Value">结果2</option>
			<option value = "ManufRSDefined3">参数名称3</option>
			<option value = "ManufRSDefined3Value">结果3</option>
			
		</select>
		<input type="button" value="添加字段" style="margin:0 0 0 20px" class="btn" onclick="add();"/>
 	  </li>
 	  <br/>
 	  		<span style="color:#217fe1;"><h3>以下为添加的字段：</h3></span>
	  
	</ul>
</div>
	<form action="/ManufactureResultChild/saveCustomization" name="userForm" id="userForm" method="post"> 
	  <div id = "div">
	  	<input type = "hidden" id ="name_user" name ="name" value =""/>
	  	
	  </div>
	</form>
</body>
</html>
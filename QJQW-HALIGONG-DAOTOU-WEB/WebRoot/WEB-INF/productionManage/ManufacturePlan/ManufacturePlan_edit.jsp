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

	//取消
	function onClose(){
		window.location.href='<%=path%>/ManufacturePlan/ManufacturePlanList';
	}
	
	
	//保存
	function save(){
		
		$("#userForm").ajaxSubmit(function(result){
			if(result == 1){
				alert('操作成功！');
				onClose();
			}else{
				alert('操作失败，请联系管理员！');
			}
		});
	}
	//加载各种信息
	function jz(i){
		var html = '<iframe name="content_iframe" class="content_iframe" id="content_iframe" frameborder="0" src="/ManufacturePlan/loading?deputy='+i+'" style="width:100%;height:100%;"></iframe>';
		$("#div").html(html);
	}
	function close(){
		$("#div").html("");
	}
	function opt(i,val1,val2,val3,val4){
		$("#div").html("");
		if(i==1){
			$("#PartNoManufPlan_userForm").val(val1);
			$("#NameManufPlan_userForm").val(val2);
			$("#NumberMaterialManufPlan_userForm").val(val3);
			$("#CategoryMaterialManufPlan_userForm").val(val4);
		}
		if(i==2){  
			$("#NoProcessManufPlan_userForm").val(val1);
			$("#NameProcessManufPlan_userForm").val(val2);
		}
		if(i==3){
			$("#NoProcessStepManufPlan_userForm").val(arguments[1]);
			$("#NameProcessStepManufPlan_userForm").val(arguments[2]);
			$("#MachiningTypeManufPlan_userForm").val((arguments[3]==1?'车削':(arguments[3]==2?'铣削':(arguments[3]==3?'镗削':(arguments[3]==4?'钻削':(arguments[3]==5?'磨削':''))))));
			$("#MachiningLevelManufPlan_userForm").val(arguments[4]==1?'精加工':(arguments[4]==2?'粗加工':(arguments[4]==3?'半精加工':'')));
			$("#ToolHolderManufPlan_userForm").val(arguments[5]);
			$("#ToolbladeManufPlan_userForm").val(arguments[6]);
			$("#ToolMaterialManufPlan_userForm").val(arguments[7]);
			$("#CutterManufPlan_userForm").val(arguments[8]);
			$("#CutterSpeedManufPlan_userForm").val(arguments[9]);
			$("#SpindleSpeedManufPlan_userForm").val(arguments[10]);
			$("#FeedManufPlan_userForm").val(arguments[11]);
			$("#FeedSpeedManufPlan_userForm").val(arguments[12]);
			$("#CuttingDepthManufPlan_userForm").val(arguments[13]);
			$("#CuttingWidthManufPlan_userForm").val(arguments[14]);
			$("#CuttingFluidManufPlan_userForm").val(arguments[15]);
		}
		if(i==4){
			$("#StaffManufPlan_userForm").val(arguments[1]);
		}
		if(i==5){
			$("#BranchManufPlan_userForm").val(arguments[1]);
		}
		if(i==6){
			$("#IDDeviceManufPlan_userForm").val(arguments[1]);
			$("#DeviceManufPlan_userForm").val(arguments[2]);
		}
		
		
	}
</script>
</head>
<body>
<div id="div">
</div>
<div></div>
<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text">
    <form action="/ManufacturePlan/saveManufacturePlan" name="userForm" id="userForm" method="post">
	 
	  <input type="hidden" name="id_ManufacturePlan" id="id_ManufacturePlan_userForm" value="${(ManufacturePlan.id_ManufacturePlan == null || ManufacturePlan.id_ManufacturePlan == '') ? 0 : ManufacturePlan.id_ManufacturePlan}"/>
	  
	  <li>
	  <span style="color:#217fe1;"><h3>加工计划：</h3></span>
	  </li>
	  <li>&nbsp;</li>
	  <li>
	    <span id="lititle">生产编号</span>
	    <input name="NoManufPlan" id="NoManufPlan_userForm" type="text" value="${ManufacturePlan.NoManufPlan}" class="input"/>
	  </li>		
	  <li>
	    <span id="lititle">生产数量</span>
	    <input name="QuantityManufPlan" id="QuantityManufPlan_userForm" type="text" value="${ManufacturePlan.QuantityManufPlan}" class="input"  />
	  </li>
	  <li>
	    <span id="lititle">生产日期</span>
	    <input name="DateStartManufPlan" id="DateStartManufPlan_userForm"  onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" type="text" value="${ManufacturePlan.DateStartManufPlan}" class="input"  />
	  </li>
	  <li>
	    <span id="lititle">完成日期</span>
	    <input name="DateFinishManufPlan" id="DateFinishManufPlan_userForm"  onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" type="text" value="${ManufacturePlan.DateFinishManufPlan}" class="input"  />
	  </li>
	  <li>
	    <span id="lititle">备注</span>
	    <input name="RemarkManufPlan" id="RemarkManufPlan_userForm" type="text" value="${ManufacturePlan.RemarkManufPlan}" class="input"  />
	  </li>
	  <li>&nbsp;</li>
	  <li>
		<span style="color:#217fe1;"><h3>零件信息及设备：</h3></span>
	  </li>
	  <li>
	 	<input type="button" value="加载零件" class="btn" onclick="jz(1);"/>
	  </li>
	  <li>
	    <span id="lititle">零件编号</span>
	    <input name="PartNoManufPlan" id="PartNoManufPlan_userForm" type="text" value="${ManufacturePlan.PartNoManufPlan}" class="input"  />
	  </li>
	  
	  <li>
	    <span id="lititle">零件名称</span>
	    <input name="NameManufPlan" id="NameManufPlan_userForm" type="text" value="${ManufacturePlan.NameManufPlan}" class="input"  />
	  </li>
	  
	  <li>
	    <span id="lititle">材料牌号</span>
	    <input name="NumberMaterialManufPlan" id="NumberMaterialManufPlan_userForm" type="text" value="${ManufacturePlan.NumberMaterialManufPlan }" class="input"  />
	  </li>
	  
	  <li>
	    <span id="lititle">材料类别</span>
	    <input name="CategoryMaterialManufPlan" id="CategoryMaterialManufPlan_userForm" type="text" value="${ManufacturePlan.CategoryMaterialManufPlan }" class="input"  />
	  </li>
	  <li>
	    <span id="lititle">节点设备编号</span>
	    <input name="IDDeviceManufPlan" id="IDDeviceManufPlan_userForm" type="text" value="${ManufacturePlan.IDDeviceManufPlan}" class="input"  />
	  </li>
	  
	  <li>
	  	<input type="button" value="加载设备信息" class="btn" onclick="jz(6);"/>
	  </li>
	  <li>
	    <span id="lititle">设备型号</span>
	    <input name="DeviceManufPlan" id="DeviceManufPlan_userForm" type="text" value="${ManufacturePlan.DeviceManufPlan }" class="input"  />
	  </li>
	  <li>&nbsp;</li>
	  <li>
	    <span id="lititle">部门分厂</span>
	    <input name="BranchManufPlan" id="BranchManufPlan_userForm" type="text" value="${ManufacturePlan.BranchManufPlan}" class="input"  />
	  </li>
	  <li>
	  	<input type="button" value="加载部门分厂" class="btn" onclick="jz(5);"/>
	  </li>
	  <li>
	    <span id="lititle">生产人员</span>
	    <input name="StaffManufPlan" id="StaffManufPlan_userForm" type="text" value="${ManufacturePlan.StaffManufPlan }" class="input"  />
	  </li>
	  <li>
	  	<input type="button" value="加载人员" class="btn" onclick="jz(4);"/>
	  </li>
		  
	 <div class="clear"></div>
	  
	  
	  <div class="box_xiangxi zhedie">
		<div class="box_zhedie">
			<span class="a_zhedie1" id = "zd1" onclick = "zd(1);" style="display:block;">工艺信息</span>
			<span class="a_zhedie2" id = "zd11" onclick = "zd1(1);" style="display:none;">工艺信息</span>
		</div>
		<div class="box_u1" id="box_clcs1" style="display:none">
			
			<ul class="box_text">
			  <li>
			  	<span style="color:#217fe1;"><h3>工序信息：</h3></span>
			  </li>
			  <li>
		  		<input type="button" value="加载工序信息" class="btn" onclick="jz(2);"/>
		 	  </li>
			  <li>
			    <span id="lititle">工序编号</span>
			    <input name="NoProcessManufPlan" id="NoProcessManufPlan_userForm" type="text" value="${ManufacturePlan.NoProcessManufPlan }" class="input"  />
			  </li>
			  
			  <li>
			    <span id="lititle">工序名称</span>
			    <input name="NameProcessManufPlan" id="NameProcessManufPlan_userForm" type="text" value="${ManufacturePlan.NameProcessManufPlan}" class="input"  />
			  </li>
			  
			   <li>
			  	<span style="color:#217fe1;"><h3>工步信息：</h3></span>
			  </li>
			  <li>
		  		<input type="button" value="加载工步信息" class="btn" onclick="jz(3);"/>
		 	  </li>
		 	  
			   <li>
			    <span id="lititle">工步编号</span>
			    <input name="NoProcessStepManufPlan" id="NoProcessStepManufPlan_userForm" type="text" value="${ManufacturePlan.NoProcessStepManufPlan}" class="input"  />
			  </li>
			  
			  <li>
			    <span id="lititle">工步名称</span>
			    <input name="NameProcessStepManufPlan" id="NameProcessStepManufPlan_userForm" type="text" value="${ManufacturePlan.NameProcessStepManufPlan}" class="input"  />
			  </li>
			  
			   <li>
			    <span id="lititle">加工类别</span>
			    <input name="MachiningTypeManufPlan" id="MachiningTypeManufPlan_userForm" type="text" value="${ManufacturePlan.MachiningTypeManufPlan }" class="input"  />
			  </li>
			  
			  <li>
			    <span id="lititle">加工级别</span>
			    <input name="MachiningLevelManufPlan" id="MachiningLevelManufPlan_userForm" type="text" value="${ManufacturePlan.MachiningLevelManufPlan }" class="input"  />
			  </li>
			  
			  <li>
			    <span id="lititle">切削液</span>
			    <input name="CuttingFluidManufPlan" id="CuttingFluidManufPlan_userForm" type="text" value="${ManufacturePlan.CuttingFluidManufPlan}" class="input" />
			  </li>		
			  <li>
			    <span id="lititle">切削速度</span>
			    <input name="CutterSpeedManufPlan" id="CutterSpeedManufPlan_userForm" type="text" value="${ManufacturePlan.CutterSpeedManufPlan}" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">主轴转速</span>
			    <input name="SpindleSpeedManufPlan" id="SpindleSpeedManufPlan_userForm" type="text" value="${ManufacturePlan.SpindleSpeedManufPlan}" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">每齿进给量</span>
			    <input name="FeedManufPlan" id="FeedManufPlan_userForm" type="text" value="${ManufacturePlan.FeedManufPlan}" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">切削深度</span>
			    <input name="CuttingDepthManufPlan" id="CuttingDepthManufPlan_userForm" type="text" value="${ManufacturePlan.CuttingDepthManufPlan}" class="input"  />
			  </li>
			  
			  
			  <li>
			    <span id="lititle">切削宽度</span>
			    <input name="CuttingWidthManufPlan" id="CuttingWidthManufPlan_userForm" type="text" value="${ManufacturePlan.CuttingWidthManufPlan}" class="input" />
			  </li>		
			  <li>
			    <span id="lititle">进给速度</span>
			    <input name="FeedSpeedManufPlan" id="FeedSpeedManufPlan_userForm" type="text" value="${ManufacturePlan.FeedSpeedManufPlan}" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">刀柄</span>
			    <input name="ToolHolderManufPlan" id="ToolHolderManufPlan_userForm" type="text" value="${ManufacturePlan.ToolHolderManufPlan}" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">刀片</span>
			    <input name="ToolbladeManufPlan" id="ToolbladeManufPlan_userForm" type="text" value="${ManufacturePlan.ToolbladeManufPlan}" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">刀片/刀具材料</span>
			    <input name="ToolMaterialManufPlan" id="ToolMaterialManufPlan_userForm" type="text" value="${ManufacturePlan.ToolMaterialManufPlan}" class="input"  />
			  </li>
			  <li>
			    <span id="lititle">刀具</span>
			    <input name="CutterManufPlan" id="CutterManufPlan_userForm" type="text" value="${ManufacturePlan.CutterManufPlan}" class="input" />
			  </li>
			  </ul>
		</div>
		<div class="clear"></div>
	</div>
	
			
			
			
	</form>
  </ul>
</div>
<div>
	
</div>
</body>
<script type="text/javascript">
	function zd(i){
		$("#box_clcs"+i).css("display","block");
		$("#zd"+i).css("display","none");
		$("#zd1"+i).css("display","block");
	}
	function zd1(i){
		$("#box_clcs"+i).css("display","none");
		$("#zd"+i).css("display","block");
		$("#zd1"+i).css("display","none");
	}
</script>
</html>
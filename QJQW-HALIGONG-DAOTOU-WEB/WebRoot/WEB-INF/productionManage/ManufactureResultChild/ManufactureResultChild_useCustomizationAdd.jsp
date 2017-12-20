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
		window.location.href='<%=path%>/ManufactureResultChild/Customization';
	}
	
	//保存
	function save(){
		
		$("#userForm").ajaxSubmit(function(result){
			if(result == 1){
				alert('操作成功！');
				onClose_ManufactureResultChild();
			}else{
				alert('操作失败，请联系管理员！');
			}
		});
	}
	function onClose_ManufactureResultChild(){
		window.location.href='<%=path%>/ManufactureResultChild/ManufactureResultChildList';
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
    <form action="/ManufactureResultChild/saveManufactureResultChild" name="userForm" id="userForm" method="post">
	 
	  <input type="hidden" name="id_ManufactureResultChild" id="id_ManufactureResultChild_userForm" value="${(ManufactureResultChild.id_ManufactureResultChild == null || ManufactureResultChild.id_ManufactureResultChild == '') ? 0 : ManufactureResultChild.id_ManufactureResultChild}"/>
	  
	  <li>
	    <span id="lititle">生产编号</span>
	    <input name="NoManufRS" id="NoManufRS_userForm" type="text" value="${ManufactureResultChild.NoManufRS}" class="input"/>
	  </li>		
	  <li>
	    <span id="lititle">生产序号ID</span>
	    <input name="QuantityManufRS" id="QuantityManufRS_userForm" type="text" value="${ManufactureResultChild.QuantityManufRS}" class="input"  />
	  </li>
	  <li>
	    <span id="lititle">生产日期</span>
	    <input name="DateStartManufRS" id="DateStartManufRS_userForm" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"  type="text" value="${ManufactureResultChild.DateStartManufRS}" class="input"  />
	  </li>
	  <li>
	    <span id="lititle">完成日期</span>
	    <input name="DateFinishManufRS" id="DateFinishManufRS_userForm" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"  type="text" value="${ManufactureResultChild.DateFinishManufRS}" class="input"  />
	  </li>
	  <li>
	    <span id="lititle">备注</span>
	    <input name="RemarkManufRS" id="RemarkManufRS_userForm" type="text" value="${ManufactureResultChild.RemarkManufRS}" class="input"  />
	  </li>
	  <li>&nbsp;</li>
	  <li><h3>以下为定制字段:</h3></li>
	  <li>&nbsp;</li>
	  <c:forEach items="${Customization.names_Customization}" var="var" varStatus="vs">
	 
	  <c:if test="${var == 'PartNoManufRS'}">
		  <li>
		    <span id="lititle">零件编号</span>
		    <input name="PartNoManufRS" id="PartNoManufRS_userForm" type="text" class="input"  />
		  </li>
	  </c:if>
	  <c:if test="${var == 'NameManufRS'}">
	  <li>
	    <span id="lititle">零件名称</span>
	    <input name="NameManufRS" id="NameManufRS_userForm" type="text"  class="input"  />
	  </li>
	  </c:if>
	  <c:if test="${var == 'NumberMaterialManufRS'}">
	  <li>
	    <span id="lititle">材料牌号</span>
	    <input name="NumberMaterialManufRS" id="NumberMaterialManufRS_userForm" type="text"  class="input"  />
	  </li>
	  </c:if>
	  <c:if test="${var == 'CategoryMaterialManufRS'}">
	  <li>
	    <span id="lititle">材料类别</span>
	    <input name="CategoryMaterialManufRS" id="CategoryMaterialManufRS_userForm" type="text" class="input"  />
	  </li>
	  </c:if>
	  <c:if test="${var == 'DeviceManufRS'}">
	  <li>
	    <span id="lititle">设备编号</span>
	    <input name="DeviceManufRS" id="DeviceManufRS_userForm" type="text"  class="input"  />
	  </li>
	  </c:if>
	  <c:if test="${var == 'IDDeviceManufRS'}">
	  <li>
	    <span id="lititle">节点设备编号</span>
	    <input name="IDDeviceManufRS" id="IDDeviceManufRS_userForm" type="text" class="input"  />
	  </li>
	  </c:if>
	  
		 	  <c:if test="${var == 'NoProcessManufRS'}">
			  <li>
			    <span id="lititle">工序编号</span>
			    <input name="NoProcessManufRS" id="NoProcessManufRS_userForm" type="text"  class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'NameProcessManufRS'}">
			  <li>
			    <span id="lititle">工序名称</span>
			    <input name="NameProcessManufRS" id="NameProcessManufRS_userForm" type="text" class="input"  />
			  </li>
			  </c:if>
		 	  <c:if test="${var == 'NoProcessStepManufRS'}">
			   <li>
			    <span id="lititle">工步编号</span>
			    <input name="NoProcessStepManufRS" id="NoProcessStepManufRS_userForm" type="text"  class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'NameProcessStepManufRS'}">
			  <li>
			    <span id="lititle">工步名称</span>
			    <input name="NameProcessStepManufRS" id="NameProcessStepManufRS_userForm" type="text" class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'MachiningTypeManufRS'}">
			   <li>
			    <span id="lititle">加工类别</span>
			    <input name="MachiningTypeManufRS" id="MachiningTypeManufRS_userForm" type="text"  class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'MachiningLevelManufRS'}">
			  <li>
			    <span id="lititle">加工级别</span>
			    <input name="MachiningLevelManufRS" id="MachiningLevelManufRS_userForm" type="text"  class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'CuttingFluidManufRS'}">
			  <li>
			    <span id="lititle">切削液</span>
			    <input name="CuttingFluidManufRS" id="CuttingFluidManufRS_userForm" type="text"  class="input" />
			  </li>	
			  </c:if>
			  <c:if test="${var == 'CutterSpeedManufRS'}">	
			  <li>
			    <span id="lititle">切削速度</span>
			    <input name="CutterSpeedManufRS" id="CutterSpeedManufRS_userForm" type="text"  class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'SpindleSpeedManufRS'}">
			  <li>
			    <span id="lititle">主轴转速</span>
			    <input name="SpindleSpeedManufRS" id="SpindleSpeedManufRS_userForm" type="text"  class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'FeedManufRS'}">
			  <li>
			    <span id="lititle">每齿进给量</span>
			    <input name="FeedManufRS" id="FeedManufRS_userForm" type="text" class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'CuttingDepthManufRS'}">
			  <li>
			    <span id="lititle">切削深度</span>
			    <input name="CuttingDepthManufRS" id="CuttingDepthManufRS_userForm" type="text"  class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'CuttingWidthManufRS'}">
			  <li>
			    <span id="lititle">切削宽度</span>
			    <input name="CuttingWidthManufRS" id="CuttingWidthManufRS_userForm" type="text"  class="input" />
			  </li>	
			  </c:if>
			  <c:if test="${var == 'FeedSpeedManufRS'}">	
			  <li>
			    <span id="lititle">进给速度</span>
			    <input name="FeedSpeedManufRS" id="FeedSpeedManufRS_userForm" type="text" class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var== 'ToolHolderManufRS'}">
			  <li>
			    <span id="lititle">刀柄</span>
			    <input name="ToolHolderManufRS" id="ToolHolderManufRS_userForm" type="text"  class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'ToolbladeManufRS'}">
			  <li>
			    <span id="lititle">刀片</span>
			    <input name="ToolbladeManufRS" id="ToolbladeManufRS_userForm" type="text"  class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'ToolMaterialManufRS'}">
			  <li>
			    <span id="lititle">刀片/刀具材料</span>
			    <input name="ToolMaterialManufRS" id="ToolMaterialManufRS_userForm" type="text" class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'CutterManufRS'}">
			  <li>
			    <span id="lititle">刀具</span>
			    <input name="CutterManufRS" id="CutterManufRS_userForm" type="text"  class="input" />
			  </li>
			  </c:if>
			<c:if test="${var == 'ToollifeManufRS'}">
			  <li>
			    <span id="lititle">刀具寿命</span>
			    <input name="ToollifeManufRS" id="ToollifeManufRS_userForm" type="text"  class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'ToolWearManufRS'}">
			  <li>
			    <span id="lititle">刀具磨损量</span>
			    <input name="ToolWearManufRS" id="ToolWearManufRS_userForm" type="text" class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'RemovalRateManufRS'}">
			   <li>
			    <span id="lititle">材料去除率</span>
			    <input name="RemovalRateManufRS" id="RemovalRateManufRS_userForm" type="text"  class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'MachiningSize'}">
			  <li>
			    <span id="lititle">加工尺寸</span>
			    <input name="MachiningSize" id="MachiningSize_userForm" type="text" class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'SizePrecision'}">
			   <li>
			    <span id="lititle">尺寸精度</span>
			    <input name="SizePrecision" id="SizePrecision_userForm" type="text"  class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'MachiningTime'}">
			  <li>
			    <span id="lititle">加工时间</span>
			    <input name="MachiningTime" id="MachiningTime_userForm" type="text" class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'SurfaceRoughnessManufRS'}">
			  <li>
			    <span id="lititle">表面粗糙度</span>
			    <input name="SurfaceRoughnessManufRS" id="SurfaceRoughnessManufRS_userForm" type="text" class="input"  />
			  </li>
		 	  </c:if>
		 	  <c:if test="${var == 'SurfaceHardnessManufRS'}">
		 	  <li>
			    <span id="lititle">表面硬度</span>
			    <input name="SurfaceHardnessManufRS" id="SurfaceHardnessManufRS_userForm" type="text"  class="input"  />
			  </li>
		 	  </c:if>
		 	  <c:if test="${var == 'SurfaceStressManufRS'}">
		 	  <li>
			    <span id="lititle">表面残余应力</span>
			    <input name="SurfaceStressManufRS" id="SurfaceStressManufRS_userForm" type="text"  class="input"  />
			  </li>
		 	  </c:if>
		 	  <c:if test="${var == 'SurfaceMorphologyManufRS'}">
		 	  <li>
			    <span id="lititle">加工表面形态</span>
			    <input name="SurfaceMorphologyManufRS" id="SurfaceMorphologyManufRS_userForm" type="text"  class="input"  />
			  </li>
		 	  </c:if>
		 	  <c:if test="${var == 'ChipShapeManufRS'}">
		 	  <li>
			    <span id="lititle">切屑形态</span>
			    <input name="ChipShapeManufRS" id="ChipShapeManufRS_userForm" type="text"  class="input"  />
			  </li>
			  </c:if>
	
	
			<c:if test="${var == 'ManufRSDefined1'}">
			  <li>
			    <span id="lititle">参数名称1</span>
			    <input name="ManufRSDefined1" id="ManufRSDefined1_userForm" type="text" class="input"  />
			  </li>
			 </c:if>
			 <c:if test="${var == 'ManufRSDefined1Value'}">
			  <li>
			    <span id="lititle">结果1</span>
			    <input name="ManufRSDefined1Value" id="ManufRSDefined1Value_userForm" type="text"  class="input"  />
			  </li>
		 	  </c:if>
		 	  <c:if test="${var == 'ManufRSDefined2'}">
		 	  <li>
			    <span id="lititle">参数名称2</span>
			    <input name="ManufRSDefined2" id="ManufRSDefined2_userForm" type="text"  class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'ManufRSDefined2Value'}">
			  <li>
			    <span id="lititle">结果2</span>
			    <input name="ManufRSDefined2Value" id="ManufRSDefined2Value_userForm" type="text"  class="input"  />
			  </li>
		 	  </c:if>
		 	  <c:if test="${var == 'ManufRSDefined3'}">
		 	  <li>
			    <span id="lititle">参数名称3</span>
			    <input name="ManufRSDefined3" id="ManufRSDefined3_userForm" type="text"  class="input"  />
			  </li>
			  </c:if>
			  <c:if test="${var == 'ManufRSDefined3Value'}">
			  <li>
			    <span id="lititle">结果3</span>
			    <input name="ManufRSDefined3Value" id="ManufRSDefined3Value_userForm" type="text"  class="input"  />
			  </li>
			  
			  </c:if>
			   </c:forEach>
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
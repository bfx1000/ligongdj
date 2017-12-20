<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="<%=path%>/resources/images/dt2.ico">
<title>汽轮机专用</title>
<meta name="description" content="哈理工刀头,专业打造各种类型机械刀头,产品类型齐全,质量放心有保障,联合祈福科技公司打造专业的刀头网站。" />
<meta name="keywords" content="哈理工刀头,刀头,刀具,切断切槽,仿形切削,外圆切槽刀,内圆切槽刀,端面切槽。" />
<style>
	.body_bg table{border-collapse:collapse;}
	.body_bg table td{border:1px solid #000;}
</style>
</head>
  
<body class="body_bg">  
<table >
<tr>
  	<td>
	159
  	</td>
  	<td>
  	/ManufactureResultApp/ManufactureResultList
  	</td>
  	<td>
  	查看生产结果信息
  	</td>
  	<td>
  	int pageNo, 第几页<br/>
  	int pageSize,每页几条<br/>
  	String "NoManufRS":生产编号<br/>
  	String "PartNoManufRS":零件编号<br/>
  	String "NameManufRS":零件名称<br/>
  	String "NumberMaterialManufRS":材料牌号<br/>
  	String "CategoryMaterialManufRS":材料类别<br/>
  	String "NoProcessManufRS":工序编号<br/>
  	String "NoProcessStepManufRS":工步编号<br/>
  	</td>
  	<td>
  	{<br/>
  		"result":成功1 失败0<br/>
  		"para":{<br/>
  			"NoManufRS":生产编号<br/>
  			"PartNoManufRS":零件编号<br/>
  			"NameManufRS":零件名称<br/>
  			"NumberMaterialManufRS":材料牌号<br/>
  			"CategoryMaterialManufRS":材料类别<br/>
  			"NoProcessManufRS":工序编号<br/>
  			"NoProcessStepManufRS":工步编号<br/>
  		},<br/>
  		"page":{<br/>
  			"pageCount":总页数<br/>
  		},<br/>
  		"list":[{<br/>
  			"id_ManufactureResult": 生产结果ID<br/>
  			"NoManufRS":"生产编号",<br/>
  			"QuantityManufRS":"生产数量",<br/>
  			"DateStartManufRS":"生产日期",<br/>
  			"DateFinishManufRS":"完成日期",<br/>
  			"RemarkManufRS":"备注",<br/>
  			"PartNoManufRS":"零件编号"<br/>
  			"NameManufRS":"零件名称",<br/>
  			"NumberMaterialManufRS":"材料牌号",<br/>
  			"CategoryMaterialManufRS":"材料类别",<br/>
  			"DeviceManufRS":"设备编号",<br/>
  			"IDDeviceManufRS":"节点设备编号",<br/>
  			"NoProcessManufRS":"工序编号",<br/>
  			"NameProcessManufRS":"工序名称",<br/>
  			"NoProcessStepManufRS":"工步编号",<br/>
  			"NameProcessStepManufRS":"工步名称",<br/>
  			"MachiningTypeManufRS":"加工类别",<br/>
  			"MachiningLevelManufRS":"加工级别",<br/>
  			"CuttingFluidManufRS":"切削液",<br/>
  			"CutterSpeedManufRS":"切削速度",<br/>
  			"SpindleSpeedManufRS":"主轴转速",<br/>
  			"FeedManufRS":"每齿进给量",<br/>
  			"CuttingDepthManufRS":"切削深度",<br/>
  			"CuttingWidthManufRS":"切削宽度",<br/>
  			"FeedSpeedManufRS":"进给速度",<br/>
  			"ToolHolderManufRS":"刀柄",<br/>
  			"ToolbladeManufRS":"刀片",<br/>
  			"ToolMaterialManufRS":"刀片/刀具材料",<br/>
  			"CutterManufRS":"刀具",<br/>
  			"ToollifeManufRS":"刀具寿命",<br/>
  			"ToolWearManufRS":"刀具磨损量",<br/>
  			"RemovalRateManufRS":"材料去除率",<br/>
  			"MachiningSize":"加工尺寸",<br/>
  			"SizePrecision":"尺寸精度",<br/>
  			"MachiningTime":"加工时间",<br/>
  			"SurfaceRoughnessManufRS":"表面粗糙度",<br/>
  			"SurfaceHardnessManufRS":"表面硬度",<br/>
  			"SurfaceStressManufRS":"表面残余应力",<br/>
  			"SurfaceMorphologyManufRS":"加工表面形态",<br/>
  			"ChipShapeManufRS":"切屑形态",<br/>
  			"ManufRSDefined1":"参数名称1",<br/>
  			"ManufRSDefined1Value":"结果1",<br/>
  			"ManufRSDefined2":"参数名称2",<br/>
  			"ManufRSDefined2Value":"结果2",<br/>
  			"ManufRSDefined3":"参数名称3",<br/>
  			"ManufRSDefined3Value":"结果3",<br/>
  			"PictureManufRS":[{<br/>
  				"id_FileManufactureResult":加工结果图片ID<br/>
  				"id_ManufactureResult": int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":加工结果图片url<br/>
  				"ascription": 归属   加工结果图片标识为："PictureManufRS",<br/>
  			}],<br/>
  			"PictureToolWearManufRS":[{<br/>
  				"id_FileManufactureResult":刀具磨损图片ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":刀具磨损图片url<br/>
  				"ascription":归属 刀具磨损图片标识为："PictureToolWearManufRS",<br/>
  			}]<br/>
  			"SurfaceRoughnessFileManufRS":[{<br/>
  				"id_FileManufactureResult":表面粗糙度文件ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":表面粗糙度文件url<br/>
  				"name_FileManufactureResult":表面粗糙度文件name<br/>
  				"ascription":归属 表面粗糙度文件标识为："SurfaceRoughnessFileManufRS",<br/>
  			}],<br/>
  			"SurfaceHardnessFileManufRS":[{<br/>
  				"id_FileManufactureResult":表面硬度文件ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":表面硬度文件url<br/>
  				"name_FileManufactureResult":表面硬度文件name<br/>
  				"ascription":归属 表面硬度文件标识为："SurfaceHardnessFileManufRS",<br/>
  			}],<br/>
  			"SurfaceStressFileManufRS":[{<br/>
  				"id_FileManufactureResult":表面参与应力文件ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":表面参与应力文件url<br/>
  				"name_FileManufactureResult":表面参与应力文件name<br/>
  				"ascription":归属 表面参与应力文件标识为："SurfaceStressFileManufRS",<br/>
  			}],<br/>
  			"SurfaceMorphologyFileManufRS":[{<br/>
  				"id_FileManufactureResult":表面文件ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":表面文件url<br/>
  				"name_FileManufactureResult":表面文件name<br/>
  				"ascription":归属 表面文件标识为："SurfaceMorphologyFileManufRS",<br/>
  			}],<br/>
  			"ChipShapeFileManufRS":[{<br/>
  				"id_FileManufactureResult":切屑形态文件ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":切屑形态文件url<br/>
  				"name_FileManufactureResult":切屑形态文件name<br/>
  				"ascription":归属 切屑形态文件标识为："ChipShapeFileManufRS",<br/>
  			}],<br/>
  			"ManufRSDefined1File":[{<br/>
  				"id_FileManufactureResult":结果文件1 ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":结果文件1 url<br/>
  				"name_FileManufactureResult":结果文件1 name<br/>
  				"ascription":归属 结果文件1标识为："ManufRSDefined1File",<br/>
  			}],<br/>
  			"ManufRSDefined2File":[{<br/>
  				"id_FileManufactureResult":结果文件2 ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":结果文件2 url<br/>
  				"name_FileManufactureResult":结果文件2 name<br/>
  				"ascription":归属 结果文件2标识为："ManufRSDefined2File",<br/>
  			}],<br/>
  			"ManufRSDefined3File":[{<br/>
  				"id_FileManufactureResult":结果文件3 ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":结果文件3 url<br/>
  				"name_FileManufactureResult":结果文件3 name<br/>
  				"ascription":归属 结果文件3标识为："ManufRSDefined3File",<br/>
  			}],<br/>
  		}]<br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
	160
  	</td>
  	<td>
  	/ManufactureResultApp/goAddManufactureResult
  	</td>
  	<td>
  	去添加生产结果页面
  	</td>
  	<td>
  	String id 生产结果ID
  	</td>
  	<td>
  	{<br/>
  		"result":成功1 失败0<br/>
  		"ManufactureResult":[{<br/>
  			"id_ManufactureResult": 生产结果ID<br/>
  			"NoManufRS":"生产编号",<br/>
  			"QuantityManufRS":"生产数量",<br/>
  			"DateStartManufRS":"生产日期",<br/>
  			"DateFinishManufRS":"完成日期",<br/>
  			"RemarkManufRS":"备注",<br/>
  			"PartNoManufRS":"零件编号"<br/>
  			"NameManufRS":"零件名称",<br/>
  			"NumberMaterialManufRS":"材料牌号",<br/>
  			"CategoryMaterialManufRS":"材料类别",<br/>
  			"DeviceManufRS":"设备编号",<br/>
  			"IDDeviceManufRS":"节点设备编号",<br/>
  			"NoProcessManufRS":"工序编号",<br/>
  			"NameProcessManufRS":"工序名称",<br/>
  			"NoProcessStepManufRS":"工步编号",<br/>
  			"NameProcessStepManufRS":"工步名称",<br/>
  			"MachiningTypeManufRS":"加工类别",<br/>
  			"MachiningLevelManufRS":"加工级别",<br/>
  			"CuttingFluidManufRS":"切削液",<br/>
  			"CutterSpeedManufRS":"切削速度",<br/>
  			"SpindleSpeedManufRS":"主轴转速",<br/>
  			"FeedManufRS":"每齿进给量",<br/>
  			"CuttingDepthManufRS":"切削深度",<br/>
  			"CuttingWidthManufRS":"切削宽度",<br/>
  			"FeedSpeedManufRS":"进给速度",<br/>
  			"ToolHolderManufRS":"刀柄",<br/>
  			"ToolbladeManufRS":"刀片",<br/>
  			"ToolMaterialManufRS":"刀片/刀具材料",<br/>
  			"CutterManufRS":"刀具",<br/>
  			"ToollifeManufRS":"刀具寿命",<br/>
  			"ToolWearManufRS":"刀具磨损量",<br/>
  			"RemovalRateManufRS":"材料去除率",<br/>
  			"MachiningSize":"加工尺寸",<br/>
  			"SizePrecision":"尺寸精度",<br/>
  			"MachiningTime":"加工时间",<br/>
  			"SurfaceRoughnessManufRS":"表面粗糙度",<br/>
  			"SurfaceHardnessManufRS":"表面硬度",<br/>
  			"SurfaceStressManufRS":"表面残余应力",<br/>
  			"SurfaceMorphologyManufRS":"加工表面形态",<br/>
  			"ChipShapeManufRS":"切屑形态",<br/>
  			"ManufRSDefined1":"参数名称1",<br/>
  			"ManufRSDefined1Value":"结果1",<br/>
  			"ManufRSDefined2":"参数名称2",<br/>
  			"ManufRSDefined2Value":"结果2",<br/>
  			"ManufRSDefined3":"参数名称3",<br/>
  			"ManufRSDefined3Value":"结果3",<br/>
  			"PictureManufRS":[{<br/>
  				"id_FileManufactureResult":加工结果图片ID<br/>
  				"id_ManufactureResult": int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":加工结果图片url<br/>
  				"ascription": 归属   加工结果图片标识为："PictureManufRS",<br/>
  			}],<br/>
  			"PictureToolWearManufRS":[{<br/>
  				"id_FileManufactureResult":刀具磨损图片ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":刀具磨损图片url<br/>
  				"ascription":归属 刀具磨损图片标识为："PictureToolWearManufRS",<br/>
  			}]<br/>
  			"SurfaceRoughnessFileManufRS":[{<br/>
  				"id_FileManufactureResult":表面粗糙度文件ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":表面粗糙度文件url<br/>
  				"name_FileManufactureResult":表面粗糙度文件name<br/>
  				"ascription":归属 表面粗糙度文件标识为："SurfaceRoughnessFileManufRS",<br/>
  			}],<br/>
  			"SurfaceHardnessFileManufRS":[{<br/>
  				"id_FileManufactureResult":表面硬度文件ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":表面硬度文件url<br/>
  				"name_FileManufactureResult":表面硬度文件name<br/>
  				"ascription":归属 表面硬度文件标识为："SurfaceHardnessFileManufRS",<br/>
  			}],<br/>
  			"SurfaceStressFileManufRS":[{<br/>
  				"id_FileManufactureResult":表面参与应力文件ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":表面参与应力文件url<br/>
  				"name_FileManufactureResult":表面参与应力文件name<br/>
  				"ascription":归属 表面参与应力文件标识为："SurfaceStressFileManufRS",<br/>
  			}],<br/>
  			"SurfaceMorphologyFileManufRS":[{<br/>
  				"id_FileManufactureResult":表面文件ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":表面文件url<br/>
  				"name_FileManufactureResult":表面文件name<br/>
  				"ascription":归属 表面文件标识为："SurfaceMorphologyFileManufRS",<br/>
  			}],<br/>
  			"ChipShapeFileManufRS":[{<br/>
  				"id_FileManufactureResult":切屑形态文件ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":切屑形态文件url<br/>
  				"name_FileManufactureResult":切屑形态文件name<br/>
  				"ascription":归属 切屑形态文件标识为："ChipShapeFileManufRS",<br/>
  			}],<br/>
  			"ManufRSDefined1File":[{<br/>
  				"id_FileManufactureResult":结果文件1 ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":结果文件1 url<br/>
  				"name_FileManufactureResult":结果文件1 name<br/>
  				"ascription":归属 结果文件1标识为："ManufRSDefined1File",<br/>
  			}],<br/>
  			"ManufRSDefined2File":[{<br/>
  				"id_FileManufactureResult":结果文件2 ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":结果文件2 url<br/>
  				"name_FileManufactureResult":结果文件2 name<br/>
  				"ascription":归属 结果文件2标识为："ManufRSDefined2File",<br/>
  			}],<br/>
  			"ManufRSDefined3File":[{<br/>
  				"id_FileManufactureResult":结果文件3 ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":结果文件3 url<br/>
  				"name_FileManufactureResult":结果文件3 name<br/>
  				"ascription":归属 结果文件3标识为："ManufRSDefined3File",<br/>
  			}],<br/>
  		}]<br/>
  		array_PictureManufRS 加工结果图片url（以逗号分隔）<br/>
  		array_PictureToolWearManufRS 刀具磨损图片url（以逗号分隔）<br/>
  		array_SurfaceRoughnessFileManufRS 表面粗糙度文件url（以逗号分隔）<br/>
  		array_SurfaceRoughnessFileManufRS_name 表面粗糙度文件name （以逗号分隔）<br/>
  		array_SurfaceHardnessFileManufRS 表面硬度文件url （以逗号分隔）<br/>
  		array_SurfaceHardnessFileManufRS_name 表面硬度文件name （以逗号分隔）<br/>
  		array_SurfaceStressFileManufRS 表面参与应力文件url（以逗号分隔）<br/>
  		array_SurfaceStressFileManufRS_name 表面参与应力文件name （以逗号分隔）<br/>
  		array_SurfaceMorphologyFileManufRS 表面文件url（以逗号分隔）<br/>
  		array_SurfaceMorphologyFileManufRS_name 表面文件name （以逗号分隔）<br/>
  		array_ChipShapeFileManufRS 切屑形态文件url （以逗号分隔）<br/>
  		array_ChipShapeFileManufRS_name 切屑形态文件name（以逗号分隔） <br/>
  		array_ManufRSDefined1File 结果文件1 url（以逗号分隔） <br/>
  		array_ManufRSDefined1File_name 结果文件1 name（以逗号分隔） <br/>
  		array_ManufRSDefined2File 结果文件2 url（以逗号分隔）<br/>
  		array_ManufRSDefined2File_name 结果文件2 name（以逗号分隔）<br/>
  		array_ManufRSDefined3File 结果文件3 url（以逗号分隔）<br/>
  		array_ManufRSDefined3File_name 结果文件3 name（以逗号分隔）<br/>
  		
  	}<br/>
  	</td>
  </tr>
  
   <tr>
  	<td>
	161
  	</td>
  	<td>
  	/ManufactureResultApp/saveManufactureResult
  	</td>
  	<td>
  	添加生产结果信息
  	</td>
  	<td>
  	String array_PictureManufRS 加工结果图片url（以逗号分隔）<br/>
	String array_PictureToolWearManufRS 刀具磨损图片url（以逗号分隔）<br/>
	String array_SurfaceRoughnessFileManufRS 表面粗糙度文件url（以逗号分隔）<br/>
	String array_SurfaceRoughnessFileManufRS_name 表面粗糙度文件name（以逗号分隔） <br/>
	String array_SurfaceHardnessFileManufRS 表面硬度文件url（以逗号分隔） <br/>
	String array_SurfaceHardnessFileManufRS_name 表面硬度文件name （以逗号分隔）<br/>
	String array_SurfaceStressFileManufRS 表面参与应力文件url（以逗号分隔）<br/>
	String array_SurfaceStressFileManufRS_name 表面参与应力文件name （以逗号分隔）<br/>
	String array_SurfaceMorphologyFileManufRS 表面文件url（以逗号分隔）<br/>
	String array_SurfaceMorphologyFileManufRS_name 表面文件name（以逗号分隔） <br/>
	String array_ChipShapeFileManufRS 切屑形态文件url（以逗号分隔） <br/>
	String array_ChipShapeFileManufRS_name 切屑形态文件name（以逗号分隔） <br/>
	String array_ManufRSDefined1File 结果文件1 url（以逗号分隔） <br/>
	String array_ManufRSDefined1File_name 结果文件1 name（以逗号分隔） <br/>
	String array_ManufRSDefined2File 结果文件2 url（以逗号分隔）<br/>
	String array_ManufRSDefined2File_name 结果文件2 name（以逗号分隔）<br/>
	String array_ManufRSDefined3File 结果文件3 url（以逗号分隔）<br/>
	String array_ManufRSDefined3File_name 结果文件3 name（以逗号分隔）<br/>
	int id_ManufactureResult, 生产结果ID<br/>
	String NoManufRS, 生产编号<br/>
	String QuantityManufRS, 生产数量<br/>
	String DateStartManufRS, 生产日期<br/>
	String DateFinishManufRS,完成日期<br/>
	String RemarkManufRS, 备注<br/>
	String PartNoManufRS,  零件编号<br/>
	String NameManufRS, 零件名称<br/>
	String NumberMaterialManufRS,  材料牌号<br/>
	String CategoryMaterialManufRS,  材料类别<br/>
	String DeviceManufRS, 设备编号<br/>
	String IDDeviceManufRS, 节点设备编号<br/>
	String NoProcessManufRS, 工序编号<br/>
	String NameProcessManufRS, 工序名称<br/>
	String NoProcessStepManufRS, 工步编号<br/>
	String NameProcessStepManufRS, 工步名称<br/>
	String MachiningTypeManufRS, 加工类别<br/>
	String MachiningLevelManufRS, 加工级别<br/>
	String CuttingFluidManufRS, 切削液<br/>
	String CutterSpeedManufRS, 切削速度<br/>
	String SpindleSpeedManufRS, 主轴转速<br/>
	String FeedManufRS, 每齿进给量<br/>
	String CuttingDepthManufRS, 切削深度<br/>
	String CuttingWidthManufRS, 切削宽度<br/>
	String FeedSpeedManufRS, 进给速度<br/>
	String ToolHolderManufRS, 刀柄<br/>
	String ToolbladeManufRS,  刀片<br/>
	String ToolMaterialManufRS, 刀片/刀具材料<br/>
	String CutterManufRS, 刀具<br/>
	String ToollifeManufRS, 刀具寿命<br/>
	String ToolWearManufRS, 刀具磨损量<br/>
	String RemovalRateManufRS, 材料去除率<br/>
	String MachiningSize ,  加工尺寸<br/>
	String SizePrecision, 尺寸精度<br/>
	String MachiningTime, 加工时间<br/>
	String SurfaceRoughnessManufRS, 表面粗糙度<br/>
	String SurfaceHardnessManufRS, 表面硬度<br/>
	String SurfaceStressManufRS, 表面残余应力<br/>
	String SurfaceMorphologyManufRS, 加工表面形态<br/>
	String ChipShapeManufRS , 切屑形态<br/>
	String ManufRSDefined1 , 参数名称1<br/>
	String ManufRSDefined1Value, 结果1<br/>
	String ManufRSDefined2, 参数名称2<br/>
	String ManufRSDefined2Value, 结果2<br/>
	String ManufRSDefined3 , 参数名称3<br/>
	String ManufRSDefined3Value 结果3<br/>
  	</td>
  	<td>
  	{<br/>
  		"result":成功1 失败0<br/>
  		"msg":返回信息<br/>
  	}<br/>
  	</td>
  </tr>
  
   <tr>
  	<td>
	162
  	</td>
  	<td>
  	/ManufactureResultApp/savePictureManufactureResult
  	</td>
  	<td>
  	保存图片文件（加工结果图片及刀具磨损图片都是这个口、文件都叫PictureManufactureResult）
  	</td>
  	<td>
  	String PictureManufactureResult , 需要上传的图片<br/>
  	String fileSuffix, 后缀<br/>
  	String filename  文件名带后缀<br/>
  	</td>
  	<td>
  	{<br/>
  		"result":成功1 失败0<br/>
  		"url":图片地址<br/>
  	}<br/>
  	</td>
  </tr>
  
   <tr>
  	<td>
	163
  	</td>
  	<td>
  	/ManufactureResultApp/saveFileManufactureResult
  	</td>
  	<td>
  	保存文件（除了图片保存所有文件都是这个口）
  	</td>
  	<td>
  	String FileManufactureResult , 需要上传的文件<br/>
  	String fileSuffix, 后缀<br/>
  	String filename  文件名带后缀<br/>
  	</td>
  	<td>
  	{<br/>
  		"result":成功1 失败0<br/>
  		"url":图片地址<br/>
  	}<br/>
  	</td>
  </tr>
  
   <tr>
  	<td>
	164
  	</td>
  	<td>
  	/ManufactureResultApp/deleteManufactureResultList
  	</td>
  	<td>
  	删除生产结果信息
  	</td>
  	<td>
  	String id_ManufactureResult 生产结果ID
  	</td>
  	<td>
  	{<br/>
  		"result":成功1 失败0<br/>
  		"msg":返回信息<br/>
  	}<br/>
  	</td>
  </tr>
  
   <tr>
  	<td>
	165
  	</td>
  	<td>
  	/ManufactureResultApp/loading
  	</td>
  	<td>
  	加载生产计划页面
  	</td>
  	<td>
  	int pageNo, 第几页<br/>
	int pageSize, 每页几条<br/>
	String "NoManufPlan": 生产编号<br/>
	String "DateStartManufPlan": 生产日期<br/>
	String "DateFinishManufPlan": 完成日期<br/>
	String "PartNoManufPlan": 零件编号<br/>
	String "DeviceManufPlan": 设备编号<br/>
  	</td>
  	<td>
  	{<br/>
		"result":成功1 失败0<br/>
		"para":{<br/>
			"NoManufPlan": 生产编号<br/>
			"DateStartManufPlan": 生产日期<br/>
			"DateFinishManufPlan": 完成日期<br/>
			"PartNoManufPlan": 零件编号<br/>
			"DeviceManufPlan": 设备编号<br/>
		},<br/>
		"page":{<br/>
			"pageCount":总页数<br/>
		},<br/>
		"list":[{<br/>
			"id_ManufacturePlan":生产ID<br/>
			"NoManufPlan":"生产编号",<br/>
			"QuantityManufPlan":"生产数量",<br/>
			"DateStartManufPlan":"生产日期",<br/>
			"DateFinishManufPlan":"完成日期",<br/>
			"RemarkManufPlan":"备注",<br/>
			"PartNoManufPlan":"零件编号",<br/>
			"NameManufPlan":"零件名称",<br/>
			"NumberMaterialManufPlan":"材料牌号",<br/>
			"CategoryMaterialManufPlan":"材料类别",<br/>
			"DeviceManufPlan":"设备编号",<br/>
			"IDDeviceManufPlan":"节点设备编号",<br/>
			"BranchManufPlan":"部门分厂",<br/>
			"StaffManufPlan":"生产人员",<br/>
			"NoProcessManufPlan":"工序编号",<br/>
			"NameProcessManufPlan":"工序名称",<br/>
			"NoProcessStepManufPlan":"工步编号",<br/>
			"NameProcessStepManufPlan":"工步名称",<br/>
			"MachiningTypeManufPlan":"加工类别"<br/>
			"MachiningLevelManufPlan":"加工级别",<br/>
			"CuttingFluidManufPlan":"切削液",<br/>
			"CutterSpeedManufPlan":"切削速度",<br/>
			"SpindleSpeedManufPlan":"主轴转速",<br/>
			"FeedManufPlan":"每齿进给量",<br/>
			"CuttingDepthManufPlan":"切削深度",<br/>
			"CuttingWidthManufPlan":"切削宽度",<br/>
			"FeedSpeedManufPlan":"进给速度",<br/>
			"ToolHolderManufPlan":"刀柄",<br/>
			"ToolbladeManufPlan":"刀片",<br/>
			"ToolMaterialManufPlan":"刀片/刀具材料",<br/>
			"CutterManufPlan":"刀具",<br/>
		}]<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		166
  	</td>
  	<td>
  		/StaffManufApp/StaffManufList
  	</td>
  	<td>
  		查看人员页面
  	</td>
  	<td>
  		int pageNo, 第几页<br/>
  		int pageSize, 每页几条<br/>
		String NameStaffManuf, 员工姓名<br/>
		String DepartStaffManuf, 员工部门<br/>
		String NoStaffManuf, 员工编号<br/>
		String JobStaffManuf 职务<br/>
  	</td>
  	<td>
  		{<br/>
  			"result": 成功1 失败0<br/>
  			"para":{<br/>
  				"NameStaffManuf": 员工姓名,<br/>
  				"DepartStaffManuf": 员工部门,<br/>
  				"NoStaffManuf": 员工编号<br/>
  				"JobStaffManuf": 职务,<br/>
  			},<br/>
  			"page":{<br/>
  				"pageCount":总页数<br/>
  			},<br/>
  			"CategoryTitlesStaffManuf":[{<br/>
  				"id_TitlesStaffManuf":职称ID<br/>
  				"name_TitlesStaffManuf":"职称Name",<br/>
  			}],<br/>
  			"list":[{<br/>
  				"id_StaffManuf":人员ID<br/>
  				"NameStaffManuf":"员工姓名",<br/>
  				"DepartStaffManuf":"员工部门",<br/>
  				"NoStaffManuf":"员工编号"<br/>
  				BirthStaffManuf:出生日期<br/>
  				"JobStaffManuf":"职务",<br/>
  				"TitlesStaffManuf":职称<br/>
  				"StatusStaffManuf":"状态",<br/>
  				"RemarkStaffManuf":"备注",<br/>
  			}]<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		167
  	</td>
  	<td>
  		/StaffManufApp/goAddStaffManuf
  	</td>
  	<td>
  		去添加人员页面
  	</td>
  	<td>
  		String id 人员ID
  	</td>
  	<td>
  		{
  			"result": 成功1 失败0<br/>
  			"StaffManuf":[{<br/>
  				"id_StaffManuf":人员ID<br/>
  				"NameStaffManuf":"员工姓名",<br/>
  				"DepartStaffManuf":"员工部门",<br/>
  				"NoStaffManuf":"员工编号"<br/>
  				BirthStaffManuf:出生日期<br/>
  				"JobStaffManuf":"职务",<br/>
  				"TitlesStaffManuf":职称<br/>
  				"StatusStaffManuf":"状态",<br/>
  				"RemarkStaffManuf":"备注",<br/>
  			}]<br/>
  			"CategoryTitlesStaffManuf":[{<br/>
  				"id_TitlesStaffManuf":职称ID<br/>
  				"name_TitlesStaffManuf":"职称Name",<br/>
  			}],<br/>
  		}
  	</td>
  </tr>
  
  <tr>
  	<td>
  		168
  	</td>
  	<td>
  		/StaffManufApp/saveStaffManuf
  	</td>
  	<td>
  		保存人员信息
  	</td>
  	<td>
  		String "id_StaffManuf":人员ID<br/>
  		String "NameStaffManuf":"员工姓名",<br/>
  		String "DepartStaffManuf":"员工部门",<br/>
  		String "NoStaffManuf":"员工编号"<br/>
  		String BirthStaffManuf:出生日期<br/>
  		String "JobStaffManuf":"职务",<br/>
  		String "TitlesStaffManuf":职称<br/>
  		String "StatusStaffManuf":"状态",<br/>
  		String "RemarkStaffManuf":"备注",<br/>
  	</td>
  	<td>
  	{<br/>
  		"result":"1",<br/>
  		"msg":"操作成功"<br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		169
  	</td>
  	<td>
  		/StaffManufApp/deleteStaffManufList
  	</td>
  	<td>
  		删除人员信息
  	</td>
  	<td>
  		String id_StaffManuf 人员ID
  	</td>
  	<td>
  	{<br/>
  		"result":"1",<br/>
  		"msg":"操作成功"<br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		170
  	</td>
  	<td>
  		/DepartmentManufactureApp/DepartmentManufactureList
  	</td>
  	<td>
  		部门分厂列表
  	</td>
  	<td>
  		int pageNo, 第几页<br/>
  		int pageSize, 每页几条<br/>
		String "SuperiorDepartmentManuf":"上级部门"<br/>
  		String "NameDepartmentManuf":"部门名称",<br/>
  		String "NoDepartmentManuf":"部门编号",<br/>
  		String "AddressDepartmentManuf":"地址",<br/>
  	</td>
  	<td>
  	{<br/>
  		"result":成功1 失败0<br/>
  		"para":{<br/>
  			"SuperiorDepartmentManuf":"上级部门"<br/>
  			"NameDepartmentManuf":"部门名称",<br/>
  			"NoDepartmentManuf":"部门编号",<br/>
  			"AddressDepartmentManuf":"地址",<br/>
  		},<br/>
  		"page":{<br/>
  			"pageCount":总页数<br/>
  		},<br/>
  		"list":[{<br/>
  			"id_DepartmentManufacture":部门分厂ID<br/>
  			"SuperiorDepartmentManuf":"上级部门"<br/>
  			"NameDepartmentManuf":"部门名称",<br/>
  			"NoDepartmentManuf":"部门编号",<br/>
  			"AddressDepartmentManuf":"地址",<br/>
  			"TeleNoDepartmentManuf":"电话",<br/>
  			"PrincipalDepartmentManuf":"负责人",<br/>
  			"RemarkDepartmentManuf":"备注",<br/>
  		}]<br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		171
  	</td>
  	<td>
  		/DepartmentManufactureApp/goAddDepartmentManufacture
  	</td>
  	<td>
  		去添加部门工厂页面
  	</td>
  	<td>
  		String id 部门工厂ID
  	</td>
  	<td>
  		{<br/>
  		"result":成功1 失败0<br/>
  		"list":{<br/>
  			"id_DepartmentManufacture":部门分厂ID<br/>
  			"SuperiorDepartmentManuf":"上级部门"<br/>
  			"NameDepartmentManuf":"部门名称",<br/>
  			"NoDepartmentManuf":"部门编号",<br/>
  			"AddressDepartmentManuf":"地址",<br/>
  			"TeleNoDepartmentManuf":"电话",<br/>
  			"PrincipalDepartmentManuf":"负责人",<br/>
  			"RemarkDepartmentManuf":"备注",<br/>
  		}<br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		172
  	</td>
  	<td>
  		/DepartmentManufactureApp/saveDepartmentManufacture
  	</td>
  	<td>
  		添加部门分厂
  	</td>
  	<td>
  		int "id_DepartmentManufacture":部门分厂ID<br/>
  		String "SuperiorDepartmentManuf":"上级部门"<br/>
  		String "NameDepartmentManuf":"部门名称",<br/>
  		String "NoDepartmentManuf":"部门编号",<br/>
  		String "AddressDepartmentManuf":"地址",<br/>
  		String "TeleNoDepartmentManuf":"电话",<br/>
  		String "PrincipalDepartmentManuf":"负责人",<br/>
  		String "RemarkDepartmentManuf":"备注",<br/>
  	</td>
  	<td>
  		{<br/>
  			"result":"1",<br/>
  			"msg":"操作成功"<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		173
  	</td>
  	<td>
  		/DepartmentManufactureApp/deleteDepartmentManufactureList
  	</td>
  	<td>
  		删除部门分厂
  	</td>
  	<td>
  		String id_DepartmentManufacture 部门分厂ID
  	</td>
  	<td>
  		{<br/>
  			"result":"1",<br/>
  			"msg":"操作成功"<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		174
  	</td>
  	<td>
  		/ManufactureResultChildApp/ManufactureResultChildList
  	</td>
  	<td>
  		查看子结果列表
  	</td>
  	<td>
  		int pageNo, 第几页<br/>
  		int pageSize,每页几条<br/>
  		String "NoManufRS":生产编号<br/>
		String "PartNoManufRS":零件编号<br/>
		String "NameManufRS":零件名称<br/>
		String "NumberMaterialManufRS":材料牌号<br/>
		String "CategoryMaterialManufRS":材料类别<br/>
		String "NoProcessManufRS":工序编号<br/>
		String "NoProcessStepManufRS":工步编号<br/>
  	</td>
  	<td>
  		{<br/>
  			"result":成功1 失败0 <br/>
  			"para":{<br/>
  				"NoManufRS":生产编号,<br/>
  				"PartNoManufRS":零件编号<br/>
  				"NameManufRS":零件名称,<br/>
  				"NumberMaterialManufRS":材料牌号,<br/>
  				"CategoryMaterialManufRS":材料类别,<br/>
  				"NoProcessManufRS":工序编号,<br/>
  				"NoProcessStepManufRS":工步编号,<br/>
  			},<br/>
  			"page":{<br/>
  				"pageCount":总页数<br/>
  			},<br/>
  			"list":[{<br/>
  				"id_ManufactureResultChild":子结果ID<br/>
  				"NoManufRS":"生产编号",<br/>
  				"QuantityManufRS":"生产序号ID",<br/>
  				"DateStartManufRS":"生产日期",<br/>
  				"DateFinishManufRS":"完成日期",<br/>
  				"RemarkManufRS":"备注",<br/>
  				"PartNoManufRS":"零件编号"<br/>
  				"NameManufRS":"零件名称",<br/>
  				"NumberMaterialManufRS":"材料牌号",<br/>
  				"CategoryMaterialManufRS":"材料类别",<br/>
  				"DeviceManufRS":"设备编号",<br/>
  				"IDDeviceManufRS":"节点设备编号",<br/>
  				"NoProcessManufRS":"工序编号",<br/>
  				"NameProcessManufRS":"工序名称",<br/>
  				"NoProcessStepManufRS":"工步编号",<br/>
  				"NameProcessStepManufRS":"工步名称",<br/>
  				"MachiningTypeManufRS":"加工类别",<br/>
  				"MachiningLevelManufRS":"加工级别",<br/>
  				"CuttingFluidManufRS":"切削液",<br/>
  				"CutterSpeedManufRS":"切削速度",<br/>
  				"SpindleSpeedManufRS":"主轴转速",<br/>
  				"FeedManufRS":"每齿进给量",<br/>
  				"CuttingDepthManufRS":"切削深度",<br/>
  				"CuttingWidthManufRS":"切削宽度",<br/>
  				"FeedSpeedManufRS":"进给速度",<br/>
  				"ToolHolderManufRS":"刀柄",<br/>
  				"ToolbladeManufRS":"刀片",<br/>
  				"ToolMaterialManufRS":"刀片/刀具材料",<br/>
  				"CutterManufRS":"刀具",<br/>
  				"ToollifeManufRS":"刀具寿命",<br/>
  				"ToolWearManufRS":"刀具磨损量",<br/>
  				"RemovalRateManufRS":"材料去除率",<br/>
  				"MachiningSize":"加工尺寸",<br/>
  				"SizePrecision":"尺寸精度",<br/>
  				"MachiningTime":"加工时间",<br/>
  				"SurfaceRoughnessManufRS":"表面粗糙度",<br/>
  				"SurfaceHardnessManufRS":"表面硬度",<br/>
  				"SurfaceStressManufRS":"表面残余应力",<br/>
  				"SurfaceMorphologyManufRS":"加工表面形态",<br/>
  				"ChipShapeManufRS":"切屑形态",<br/>
  				"ManufRSDefined1":"参数名称1",<br/>
  				"ManufRSDefined1Value":"结果1",<br/>
  				"ManufRSDefined2":"参数名称2",<br/>
  				"ManufRSDefined2Value":"结果2",<br/>
  				"ManufRSDefined3":"参数名称3",<br/>
  				"ManufRSDefined3Value":"结果3",<br/>
  				
  				"PictureManufRS":[{<br/>
					"id_FileManufactureResult":加工结果图片ID<br/>
					"id_ManufactureResult": int ManufactureResult.id_ManufactureResult<br/>
					"url_FileManufactureResult":加工结果图片url<br/>
					"ascription": 归属 加工结果图片标识为："PictureManufRS",<br/>
				}],<br/>
				"PictureToolWearManufRS":[{<br/>
					"id_FileManufactureResult":刀具磨损图片ID<br/>
					"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
					"url_FileManufactureResult":刀具磨损图片url<br/>
					"ascription":归属 刀具磨损图片标识为："PictureToolWearManufRS",<br/>
				}]<br/>
				"SurfaceRoughnessFileManufRS":[{<br/>
					"id_FileManufactureResult":表面粗糙度文件ID<br/>
					"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
					"url_FileManufactureResult":表面粗糙度文件url<br/>
					"name_FileManufactureResult":表面粗糙度文件name<br/>
					"ascription":归属 表面粗糙度文件标识为："SurfaceRoughnessFileManufRS",<br/>
				}],<br/>
				"SurfaceHardnessFileManufRS":[{<br/>
					"id_FileManufactureResult":表面硬度文件ID<br/>
					"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
					"url_FileManufactureResult":表面硬度文件url<br/>
					"name_FileManufactureResult":表面硬度文件name<br/>
					"ascription":归属 表面硬度文件标识为："SurfaceHardnessFileManufRS",<br/>
				}],<br/>
				"SurfaceStressFileManufRS":[{<br/>
					"id_FileManufactureResult":表面参与应力文件ID<br/>
					"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
					"url_FileManufactureResult":表面参与应力文件url<br/>
					"name_FileManufactureResult":表面参与应力文件name<br/>
					"ascription":归属 表面参与应力文件标识为："SurfaceStressFileManufRS",<br/>
				}],<br/>
				"SurfaceMorphologyFileManufRS":[{<br/>
					"id_FileManufactureResult":表面文件ID<br/>
					"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
					"url_FileManufactureResult":表面文件url<br/>
					"name_FileManufactureResult":表面文件name<br/>
					"ascription":归属 表面文件标识为："SurfaceMorphologyFileManufRS",<br/>
				}],<br/>
				"ChipShapeFileManufRS":[{<br/>
					"id_FileManufactureResult":切屑形态文件ID<br/>
					"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
					"url_FileManufactureResult":切屑形态文件url<br/>
					"name_FileManufactureResult":切屑形态文件name<br/>
					"ascription":归属 切屑形态文件标识为："ChipShapeFileManufRS",<br/>
				}],<br/>
				"ManufRSDefined1File":[{<br/>
					"id_FileManufactureResult":结果文件1 ID<br/>
					"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
					"url_FileManufactureResult":结果文件1 url<br/>
					"name_FileManufactureResult":结果文件1 name<br/>
					"ascription":归属 结果文件1标识为："ManufRSDefined1File",<br/>
				}],<br/>
				"ManufRSDefined2File":[{<br/>
					"id_FileManufactureResult":结果文件2 ID<br/>
					"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
					"url_FileManufactureResult":结果文件2 url<br/>
					"name_FileManufactureResult":结果文件2 name<br/>
					"ascription":归属 结果文件2标识为："ManufRSDefined2File",<br/>
				}],<br/>
				"ManufRSDefined3File":[{<br/>
					"id_FileManufactureResult":结果文件3 ID<br/>
					"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
					"url_FileManufactureResult":结果文件3 url<br/>
					"name_FileManufactureResult":结果文件3 name<br/>
					"ascription":归属 结果文件3标识为："ManufRSDefined3File",<br/>
				}],<br/>
			}]<br/>
		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		175
  	</td>
  	<td>
  		/ManufactureResultChildApp/goAddManufactureResultChild
  	</td>
  	<td>
  		去添加页面
  	</td>
  	<td>
  		String ID 子结果ID
  	</td>
  	<td>
  	{<br/>
  		"result":成功1 失败0<br/>
  		"ManufactureResult":[{<br/>
  			"id_ManufactureResultChild": 子结果ID<br/>
  			"NoManufRS":"生产编号",<br/>
  			"QuantityManufRS":"生产序号ID",<br/>
  			"DateStartManufRS":"生产日期",<br/>
  			"DateFinishManufRS":"完成日期",<br/>
  			"RemarkManufRS":"备注",<br/>
  			"PartNoManufRS":"零件编号"<br/>
  			"NameManufRS":"零件名称",<br/>
  			"NumberMaterialManufRS":"材料牌号",<br/>
  			"CategoryMaterialManufRS":"材料类别",<br/>
  			"DeviceManufRS":"设备编号",<br/>
  			"IDDeviceManufRS":"节点设备编号",<br/>
  			"NoProcessManufRS":"工序编号",<br/>
  			"NameProcessManufRS":"工序名称",<br/>
  			"NoProcessStepManufRS":"工步编号",<br/>
  			"NameProcessStepManufRS":"工步名称",<br/>
  			"MachiningTypeManufRS":"加工类别",<br/>
  			"MachiningLevelManufRS":"加工级别",<br/>
  			"CuttingFluidManufRS":"切削液",<br/>
  			"CutterSpeedManufRS":"切削速度",<br/>
  			"SpindleSpeedManufRS":"主轴转速",<br/>
  			"FeedManufRS":"每齿进给量",<br/>
  			"CuttingDepthManufRS":"切削深度",<br/>
  			"CuttingWidthManufRS":"切削宽度",<br/>
  			"FeedSpeedManufRS":"进给速度",<br/>
  			"ToolHolderManufRS":"刀柄",<br/>
  			"ToolbladeManufRS":"刀片",<br/>
  			"ToolMaterialManufRS":"刀片/刀具材料",<br/>
  			"CutterManufRS":"刀具",<br/>
  			"ToollifeManufRS":"刀具寿命",<br/>
  			"ToolWearManufRS":"刀具磨损量",<br/>
  			"RemovalRateManufRS":"材料去除率",<br/>
  			"MachiningSize":"加工尺寸",<br/>
  			"SizePrecision":"尺寸精度",<br/>
  			"MachiningTime":"加工时间",<br/>
  			"SurfaceRoughnessManufRS":"表面粗糙度",<br/>
  			"SurfaceHardnessManufRS":"表面硬度",<br/>
  			"SurfaceStressManufRS":"表面残余应力",<br/>
  			"SurfaceMorphologyManufRS":"加工表面形态",<br/>
  			"ChipShapeManufRS":"切屑形态",<br/>
  			"ManufRSDefined1":"参数名称1",<br/>
  			"ManufRSDefined1Value":"结果1",<br/>
  			"ManufRSDefined2":"参数名称2",<br/>
  			"ManufRSDefined2Value":"结果2",<br/>
  			"ManufRSDefined3":"参数名称3",<br/>
  			"ManufRSDefined3Value":"结果3",<br/>
  			"PictureManufRS":[{<br/>
  				"id_FileManufactureResult":加工结果图片ID<br/>
  				"id_ManufactureResult": int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":加工结果图片url<br/>
  				"ascription": 归属   加工结果图片标识为："PictureManufRS",<br/>
  			}],<br/>
  			"PictureToolWearManufRS":[{<br/>
  				"id_FileManufactureResult":刀具磨损图片ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":刀具磨损图片url<br/>
  				"ascription":归属 刀具磨损图片标识为："PictureToolWearManufRS",<br/>
  			}]<br/>
  			"SurfaceRoughnessFileManufRS":[{<br/>
  				"id_FileManufactureResult":表面粗糙度文件ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":表面粗糙度文件url<br/>
  				"name_FileManufactureResult":表面粗糙度文件name<br/>
  				"ascription":归属 表面粗糙度文件标识为："SurfaceRoughnessFileManufRS",<br/>
  			}],<br/>
  			"SurfaceHardnessFileManufRS":[{<br/>
  				"id_FileManufactureResult":表面硬度文件ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":表面硬度文件url<br/>
  				"name_FileManufactureResult":表面硬度文件name<br/>
  				"ascription":归属 表面硬度文件标识为："SurfaceHardnessFileManufRS",<br/>
  			}],<br/>
  			"SurfaceStressFileManufRS":[{<br/>
  				"id_FileManufactureResult":表面参与应力文件ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":表面参与应力文件url<br/>
  				"name_FileManufactureResult":表面参与应力文件name<br/>
  				"ascription":归属 表面参与应力文件标识为："SurfaceStressFileManufRS",<br/>
  			}],<br/>
  			"SurfaceMorphologyFileManufRS":[{<br/>
  				"id_FileManufactureResult":表面文件ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":表面文件url<br/>
  				"name_FileManufactureResult":表面文件name<br/>
  				"ascription":归属 表面文件标识为："SurfaceMorphologyFileManufRS",<br/>
  			}],<br/>
  			"ChipShapeFileManufRS":[{<br/>
  				"id_FileManufactureResult":切屑形态文件ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":切屑形态文件url<br/>
  				"name_FileManufactureResult":切屑形态文件name<br/>
  				"ascription":归属 切屑形态文件标识为："ChipShapeFileManufRS",<br/>
  			}],<br/>
  			"ManufRSDefined1File":[{<br/>
  				"id_FileManufactureResult":结果文件1 ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":结果文件1 url<br/>
  				"name_FileManufactureResult":结果文件1 name<br/>
  				"ascription":归属 结果文件1标识为："ManufRSDefined1File",<br/>
  			}],<br/>
  			"ManufRSDefined2File":[{<br/>
  				"id_FileManufactureResult":结果文件2 ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":结果文件2 url<br/>
  				"name_FileManufactureResult":结果文件2 name<br/>
  				"ascription":归属 结果文件2标识为："ManufRSDefined2File",<br/>
  			}],<br/>
  			"ManufRSDefined3File":[{<br/>
  				"id_FileManufactureResult":结果文件3 ID<br/>
  				"id_ManufactureResult":int ManufactureResult.id_ManufactureResult<br/>
  				"url_FileManufactureResult":结果文件3 url<br/>
  				"name_FileManufactureResult":结果文件3 name<br/>
  				"ascription":归属 结果文件3标识为："ManufRSDefined3File",<br/>
  			}],<br/>
  		}]<br/>
  		array_PictureManufRS 加工结果图片url（以逗号分隔）<br/>
  		array_PictureToolWearManufRS 刀具磨损图片url（以逗号分隔）<br/>
  		array_SurfaceRoughnessFileManufRS 表面粗糙度文件url（以逗号分隔）<br/>
  		array_SurfaceRoughnessFileManufRS_name 表面粗糙度文件name （以逗号分隔）<br/>
  		array_SurfaceHardnessFileManufRS 表面硬度文件url （以逗号分隔）<br/>
  		array_SurfaceHardnessFileManufRS_name 表面硬度文件name （以逗号分隔）<br/>
  		array_SurfaceStressFileManufRS 表面参与应力文件url（以逗号分隔）<br/>
  		array_SurfaceStressFileManufRS_name 表面参与应力文件name （以逗号分隔）<br/>
  		array_SurfaceMorphologyFileManufRS 表面文件url（以逗号分隔）<br/>
  		array_SurfaceMorphologyFileManufRS_name 表面文件name （以逗号分隔）<br/>
  		array_ChipShapeFileManufRS 切屑形态文件url （以逗号分隔）<br/>
  		array_ChipShapeFileManufRS_name 切屑形态文件name（以逗号分隔） <br/>
  		array_ManufRSDefined1File 结果文件1 url（以逗号分隔） <br/>
  		array_ManufRSDefined1File_name 结果文件1 name（以逗号分隔） <br/>
  		array_ManufRSDefined2File 结果文件2 url（以逗号分隔）<br/>
  		array_ManufRSDefined2File_name 结果文件2 name（以逗号分隔）<br/>
  		array_ManufRSDefined3File 结果文件3 url（以逗号分隔）<br/>
  		array_ManufRSDefined3File_name 结果文件3 name（以逗号分隔）<br/>
  		
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		176
  	</td>
  	<td>
  		/ManufactureResultChildApp/saveManufactureResultChild
  	</td>
  	<td>
  		添加页面
  	</td>
  	<td>
  		String array_PictureManufRS 加工结果图片url（以逗号分隔）<br/>
		String array_PictureToolWearManufRS 刀具磨损图片url（以逗号分隔）<br/>
		String array_SurfaceRoughnessFileManufRS 表面粗糙度文件url（以逗号分隔）<br/>
		String array_SurfaceRoughnessFileManufRS_name 表面粗糙度文件name（以逗号分隔） <br/>
		String array_SurfaceHardnessFileManufRS 表面硬度文件url（以逗号分隔） <br/>
		String array_SurfaceHardnessFileManufRS_name 表面硬度文件name （以逗号分隔）<br/>
		String array_SurfaceStressFileManufRS 表面参与应力文件url（以逗号分隔）<br/>
		String array_SurfaceStressFileManufRS_name 表面参与应力文件name （以逗号分隔）<br/>
		String array_SurfaceMorphologyFileManufRS 表面文件url（以逗号分隔）<br/>
		String array_SurfaceMorphologyFileManufRS_name 表面文件name（以逗号分隔） <br/>
		String array_ChipShapeFileManufRS 切屑形态文件url（以逗号分隔） <br/>
		String array_ChipShapeFileManufRS_name 切屑形态文件name（以逗号分隔） <br/>
		String array_ManufRSDefined1File 结果文件1 url（以逗号分隔） <br/>
		String array_ManufRSDefined1File_name 结果文件1 name（以逗号分隔） <br/>
		String array_ManufRSDefined2File 结果文件2 url（以逗号分隔）<br/>
		String array_ManufRSDefined2File_name 结果文件2 name（以逗号分隔）<br/>
		String array_ManufRSDefined3File 结果文件3 url（以逗号分隔）<br/>
		String array_ManufRSDefined3File_name 结果文件3 name（以逗号分隔）<br/>
		int id_ManufactureResult, 子结果ID<br/>
		String NoManufRS, 生产编号<br/>
		String QuantityManufRS, 生产序号ID<br/>
		String DateStartManufRS, 生产日期<br/>
		String DateFinishManufRS,完成日期<br/>
		String RemarkManufRS, 备注<br/>
		String PartNoManufRS,  零件编号<br/>
		String NameManufRS, 零件名称<br/>
		String NumberMaterialManufRS,  材料牌号<br/>
		String CategoryMaterialManufRS,  材料类别<br/>
		String DeviceManufRS, 设备编号<br/>
		String IDDeviceManufRS, 节点设备编号<br/>
		String NoProcessManufRS, 工序编号<br/>
		String NameProcessManufRS, 工序名称<br/>
		String NoProcessStepManufRS, 工步编号<br/>
		String NameProcessStepManufRS, 工步名称<br/>
		String MachiningTypeManufRS, 加工类别<br/>
		String MachiningLevelManufRS, 加工级别<br/>
		String CuttingFluidManufRS, 切削液<br/>
		String CutterSpeedManufRS, 切削速度<br/>
		String SpindleSpeedManufRS, 主轴转速<br/>
		String FeedManufRS, 每齿进给量<br/>
		String CuttingDepthManufRS, 切削深度<br/>
		String CuttingWidthManufRS, 切削宽度<br/>
		String FeedSpeedManufRS, 进给速度<br/>
		String ToolHolderManufRS, 刀柄<br/>
		String ToolbladeManufRS,  刀片<br/>
		String ToolMaterialManufRS, 刀片/刀具材料<br/>
		String CutterManufRS, 刀具<br/>
		String ToollifeManufRS, 刀具寿命<br/>
		String ToolWearManufRS, 刀具磨损量<br/>
		String RemovalRateManufRS, 材料去除率<br/>
		String MachiningSize ,  加工尺寸<br/>
		String SizePrecision, 尺寸精度<br/>
		String MachiningTime, 加工时间<br/>
		String SurfaceRoughnessManufRS, 表面粗糙度<br/>
		String SurfaceHardnessManufRS, 表面硬度<br/>
		String SurfaceStressManufRS, 表面残余应力<br/>
		String SurfaceMorphologyManufRS, 加工表面形态<br/>
		String ChipShapeManufRS , 切屑形态<br/>
		String ManufRSDefined1 , 参数名称1<br/>
		String ManufRSDefined1Value, 结果1<br/>
		String ManufRSDefined2, 参数名称2<br/>
		String ManufRSDefined2Value, 结果2<br/>
		String ManufRSDefined3 , 参数名称3<br/>
		String ManufRSDefined3Value 结果3<br/>
  	</td>
  	<td>
  		{<br/>
  			"result":成功1 失败0,<br/>
  			"msg":返回信息<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		177
  	</td>
  	<td>
  		/ManufactureResultChildApp/savePictureManufactureResultChild
  	</td>
  	<td>
  		保存图片
  	</td>
  	<td>
  		String PictureManufactureResultChild ,  图片文件<br/>
  		String fileSuffix,  文件后缀<br/>
  		String filename 	文件名带后缀<br/>
  	</td>
  	<td>
  		{<br/>
  			"result":成功1 失败0 <br/>
  			"url":图片url<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		178
  	</td>
  	<td>
  		/ManufactureResultChildApp/saveFileManufactureResultChild
  	</td>
  	<td>
  		保存文件
  	</td>
  	<td>
  		String FileManufactureResultChild , 文件<br/>
  		String fileSuffix, 文件后缀<br/>
  		String filename	文件名带后缀<br/>
  	</td>
  	<td>
  		{<br/>
  			"result":成功1 失败0 <br/>
  			"url":文件url<br/>
  			"name":文件name<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		179
  	</td>
  	<td>
  		/ManufactureResultChildApp/deleteManufactureResultChildList
  	</td>
  	<td>
  		删除子结果信息
  	</td>
  	<td>
  		String id_ManufactureResultChild 子结果ID
  	</td>
  	<td>
  		{<br/>
  			"result":成功1 失败0<br/>
  			"msg":返回信息<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		180
  	</td>
  	<td>
  		/ManufactureResultChildApp/loading
  	</td>
  	<td>
  		加载生产计划页面
  	</td>
  	<td>
  	int pageNo, 第几页<br/>
	int pageSize, 每页几条<br/>
	String "NoManufPlan": 生产编号<br/>
	String "DateStartManufPlan": 生产日期<br/>
	String "DateFinishManufPlan": 完成日期<br/>
	String "PartNoManufPlan": 零件编号<br/>
	String "DeviceManufPlan": 设备编号<br/>
  	</td>
  	<td>
  	{<br/>
		"result":成功1 失败0<br/>
		"para":{<br/>
			"NoManufPlan": 生产编号<br/>
			"DateStartManufPlan": 生产日期<br/>
			"DateFinishManufPlan": 完成日期<br/>
			"PartNoManufPlan": 零件编号<br/>
			"DeviceManufPlan": 设备编号<br/>
		},<br/>
		"page":{<br/>
			"pageCount":总页数<br/>
		},<br/>
		"list":[{<br/>
			"id_ManufacturePlan":生产ID<br/>
			"NoManufPlan":"生产编号",<br/>
			"QuantityManufPlan":"生产数量",<br/>
			"DateStartManufPlan":"生产日期",<br/>
			"DateFinishManufPlan":"完成日期",<br/>
			"RemarkManufPlan":"备注",<br/>
			"PartNoManufPlan":"零件编号",<br/>
			"NameManufPlan":"零件名称",<br/>
			"NumberMaterialManufPlan":"材料牌号",<br/>
			"CategoryMaterialManufPlan":"材料类别",<br/>
			"DeviceManufPlan":"设备编号",<br/>
			"IDDeviceManufPlan":"节点设备编号",<br/>
			"BranchManufPlan":"部门分厂",<br/>
			"StaffManufPlan":"生产人员",<br/>
			"NoProcessManufPlan":"工序编号",<br/>
			"NameProcessManufPlan":"工序名称",<br/>
			"NoProcessStepManufPlan":"工步编号",<br/>
			"NameProcessStepManufPlan":"工步名称",<br/>
			"MachiningTypeManufPlan":"加工类别"<br/>
			"MachiningLevelManufPlan":"加工级别",<br/>
			"CuttingFluidManufPlan":"切削液",<br/>
			"CutterSpeedManufPlan":"切削速度",<br/>
			"SpindleSpeedManufPlan":"主轴转速",<br/>
			"FeedManufPlan":"每齿进给量",<br/>
			"CuttingDepthManufPlan":"切削深度",<br/>
			"CuttingWidthManufPlan":"切削宽度",<br/>
			"FeedSpeedManufPlan":"进给速度",<br/>
			"ToolHolderManufPlan":"刀柄",<br/>
			"ToolbladeManufPlan":"刀片",<br/>
			"ToolMaterialManufPlan":"刀片/刀具材料",<br/>
			"CutterManufPlan":"刀具",<br/>
		}]<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		181
  	</td>
  	<td>
  		/ManufactureResultChildApp/Customization
  	</td>
  	<td>
  		查看定制字段页面
  	</td>
  	<td>
  		int pageNo,  第几页<br/>
  		int pageSize 每页几条<br/>
  	</td>
  	<td>
  		{<br/>
  			"result":成功1 失败0 <br/>
  			"page":{<br/>
  				"pageCount":总页数<br/>
  			},<br/>
  			"list":[{<br/>
  				"id_Customization":定制ID,<br/>
  				"name":"定制名字",<br/>
  				"name_Customization":该定制下的字段,<br/>
  				"names_Chinese":字段汉语<br/>
  			}]<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		182
  	</td>
  	<td>
  		/ManufactureResultChildApp/deleteCustomization
  	</td>
  	<td>
  		删除定制
  	</td>
  	<td>
  		String id_Customization 定制ID
  	</td>
  	<td>
  		{<br/>
  			"result":"1",<br/>
  			"msg":"操作成功"<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		183
  	</td>
  	<td>
  		/ManufactureResultChildApp/saveCustomization
  	</td>
  	<td>
  		保存定制
  	</td>
  	<td>
  		String[] field, 定制的字段 （是一个数组）<br/>
  		String name	 定制名<br/>
  	</td>
  	<td>
  		{<br/>
  			"result":"1",<br/>
  			"msg":"操作成功"<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		184
  	</td>
  	<td>
  		/ManufactureResultChildApp/useCustomization
  	</td>
  	<td>
  		利用该定制，返回的是该定制下的字段信息。
  	</td>
  	<td>
  		String id_Customization 定制ID
  	</td>
  	<td>
  		{<br/>
  			"result":"1",<br/>
  			"Customization":{<br/>
  				"id_Customization":定制ID<br/>
  				"name_Customization":定制下的字段（是一个字符串以逗号分割）<br/>
  				"name":定制名字<br/>
  				"names_Customization":定制下的字段（是一个数组，和上面的字符串用哪个方便就用哪个便可）<br/>
  			}<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		185
  	</td>
  	<td>
  		/DepartmentManufactureApp/loading
  	</td>
  	<td>
  		查询所有部门信息
  	</td>
  	<td>
  		无参数
  	</td>
  	<td>
  		{<br/>
	  		"result":成功1 失败0<br/>
	  		"DepartmentManufacture":[{<br/>
	  			"id_DepartmentManufacture":ID<br/>
	  			"NameDepartmentManuf":"部门名称",<br/>
	  			"SuperiorDepartmentManuf":上级部门<br/>
	  			"LevelDepartmentManuf":层次等级,<br/>
	  		}]<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		186
  	</td>
  	<td>
  		/MachineGroupApp/MachineGroupList
  	</td>
  	<td>
  		管理组页面
  	</td>
  	<td>
  		int pageNo, 第几页<br/>
  		int pageSize, 每页几条<br/>
		String SuperiorMachineGroup,  上级设备组<br/>
		String NameMachineGroup, 设备组名称<br/>
		String NoMachineGroup, 设备组编号<br/>
		String AddressMachineGroup 地址<br/>
  	</td>
  	<td>
  		{<br/>
  			"result":成功1 失败0<br/>
  			"para":{<br/>
  				SuperiorMachineGroup,  上级设备组<br/>
				NameMachineGroup, 设备组名称<br/>
				NoMachineGroup, 设备组编号<br/>
				AddressMachineGroup 地址<br/>
  			},<br/>
  			"page":{<br/>
  				"pageCount":总页数<br/>
  			},<br/>
  			"list":[{<br/>
  				"id_MachineGroup":ID,<br/>
  				"SuperiorMachineGroup":"上级设备组",<br/>
  				"NameMachineGroup":"设备组名称"<br/>
  				"NoMachineGroup":"设备组编号",<br/>
  				"PrincipalMachineGroup":"负责人",<br/>
  				"AddressMachineGroup":"地址",<br/>
  				"RemarkMachineGroup":"备注",<br/>
  				"LevelMachineGroup":"层次等级",<br/>
  			}]<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		187
  	</td>
  	<td>
  		/MachineGroupApp/goAddMachineGroup
  	</td>
  	<td>
  		去添加页面
  	</td>
  	<td>
  		String id 设备组ID
  	</td>
  	<td>
  		{<br/>
  			"result":"1",<br/>
  			"MachineGroup":{<br/>
  				"LevelMachineGroup":"1",<br/>
  				"NoMachineGroup":"设备组编号",<br/>
  				"id_MachineGroup":1,<br/>
  				"RemarkMachineGroup":"备注",<br/>
  				"SuperiorMachineGroup":"无",<br/>
  				"AddressMachineGroup":"地址1",<br/>
  				"PrincipalMachineGroup":"负责人",<br/>
  				"NameMachineGroup":"设备组名称1"<br/>
  			}<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		188
  	</td>
  	<td>
  		/MachineGroupApp/saveMachineGroup
  	</td>
  	<td>
  		保存设备组
  	</td>
  	<td>
  		int id_MachineGroup, <br/>
  		String SuperiorMachineGroup, <br/>
  		String NameMachineGroup, <br/>
  		String NoMachineGroup,  <br/>
		String AddressMachineGroup,<br/>
		String PrincipalMachineGroup, <br/>
		String RemarkMachineGroup,<br/>
		String LevelMachineGroup<br/>
  	</td>
  	<td>
  		{<br/>
  			result :  成功1 失败0 <br/> 
  			msg ：返回信息<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		189
  	</td>
  	<td>
  		/MachineGroupApp/deleteMachineGroupList
  	</td>
  	<td>
  		删除设备组
  	</td>
  	<td>
  		String id_MachineGroup 设备组ID
  	</td>
  	<td>
  		{<br/> 
  			"result":成功1 失败0 <br/> 
  			"msg":返回信息<br/> 
  		}<br/> 
  	</td>
  </tr>
  
  <tr>
  	<td>
  		190
  	</td>
  	<td>
  		/MachineGroupApp/loading
  	</td>
  	<td>
  		加载所有设备组
  	</td>
  	<td>
  		无参数
  	</td>
  	<td>
  		{<br/> 
  			"result":成功1 失败0<br/> 
  			"MachineGroup":[{<br/> 
  				"id_MachineGroup":ID<br/> 
  				"SuperiorMachineGroup":上级设备组<br/> 
  				"NameMachineGroup":"设备组名称"<br/> 
  				"LevelMachineGroup":层次等级<br/> 
  			}]<br/> 
  		}<br/> 
  	</td>
  </tr>
  
  <tr>
  	<td>
  		191
  	</td>
  	<td>
  		/MachineUseRecordApp/MachineUseRecordList
  	</td>
  	<td>
  		查看使用记录
  	</td>
  	<td>
  		int pageNo, 第几页<br/> 
  		int pageSize, 每页几条 <br/> 
		String NumberMachGrNode, 机床编号<br/> 
		String DateStartManufGr, 生产日期<br/> 
		String DateFinishManufGr 完成日期<br/> 
  	</td>
  	<td>
  		{<br/> 
  			"result":成功1 失败0,<br/> 
  			"para":{<br/> 
  				"NumberMachGrNode":机床编号,<br/> 
  				"DateFinishManufGr":生产日期,<br/> 
  				"DateStartManufGr":完成日期<br/> 
  			},<br/> 
  			"page":{<br/> 
  				"pageCount":总页数<br/> 
  			},<br/> 
  			"list":[{<br/> 
  				"id_MachineUseRecord":使用记录ID,<br/> 
  				"id_ManufacturePlan":计划ID,<br/> 
  				"NumberMachGrNode":"机床编号",<br/> 
  				"DateFinishManufGr":"生产日期",<br/> 
  				"DateStartManufGr":"完成日期"<br/> 
  			}]<br/> 
  		}<br/> 
  	</td>
  </tr>
  
  <tr>
  	<td>
  		192
  	</td>
  	<td>
  		/InquireMachineGroupApp/InquireMachineGroupList
  	</td>
  	<td>
  		查看设备信息
  	</td>
  	<td>
  		int pageNo, 第几页<br/> 
  		int pageSize, 每页几条<br/> 
		String NumberMachGrNode, 机床编号<br/> 
		String ModelMachGrNode, 机床型号<br/> 
		String TypeMachGrNode, 机床类别<br/> 
		String DepartmentMachGrNode 机床所在单位<br/> 
  	</td>
  	<td>
  		{<br/> 
  			"result":"1",<br/> 
  			"para":{<br/> 
  				NumberMachGrNode, 机床编号<br/> 
				ModelMachGrNode, 机床型号<br/> 
				TypeMachGrNode, 机床类别<br/> 
				DepartmentMachGrNode 机床所在单位<br/> 
  			},<br/> 
  			"page":{<br/> 
  				"pageCount":2<br/> 
  			},<br/> 
  			"list":[{<br/> 
  				"id_InquireMachineGroup":ID<br/> 
  				"NumberMachGrNode":"机床编号",<br/> 
  				"ModelMachGrNode":"机床型号",<br/> 
  				"TypeMachGrNode":"机床类别",<br/> 
  				"DepartmentMachGrNode":"机床所在单位",<br/> 
  				"WorkshopMachGrNode":"机床车间",<br/> 
  				"PositionMachGrNode":"机床位置",<br/> 
  				"NameMachineGroup":"设备组名称",<br/> 
  				"PartNoMachGr":"目前加工零件编号",<br/> 
  				"PartNameMachGr":"目前加工零件名称"<br/> 
  				"SetMachGrStatus":"设定设备状态",<br/> 
  				"InquireMachGrStatus":"查询设备状态",<br/> 
  				"displayMachGrStatus":"显示设备状态",<br/> 
  			}]<br/> 
  		}<br/> 
  	</td>
  </tr>
  
  <tr>
  	<td>
  		193
  	</td>
  	<td>
  		/InquireMachineGroupApp/goAddInquireMachineGroup
  	</td>
  	<td>
  		去添加设备信息页面
  	</td>
  	<td>
  		String id 设备信息ID
  	</td>
  	<td>
  		{<br/> 
  			"result":成功1 失败0<br/> 
  			"InquireMachineGroup":{<br/> 
  				"id_InquireMachineGroup":ID<br/> 
  				"NumberMachGrNode":"机床编号",<br/> 
  				"ModelMachGrNode":"机床型号",<br/> 
  				"TypeMachGrNode":"机床类别",<br/> 
  				"DepartmentMachGrNode":"机床所在单位",<br/> 
  				"WorkshopMachGrNode":"机床车间",<br/> 
  				"PositionMachGrNode":"机床位置",<br/> 
  				"NameMachineGroup":"设备组名称",<br/> 
  				"PartNoMachGr":"目前加工零件编号",<br/> 
  				"PartNameMachGr":"目前加工零件名称"<br/> 
  				"SetMachGrStatus":"设定设备状态",<br/> 
  				"InquireMachGrStatus":"查询设备状态",<br/> 
  				"displayMachGrStatus":"显示设备状态",<br/> 
  			}<br/> 
  		}<br/> 
  	</td>
  </tr>
  
  <tr>
  	<td>
  		194
  	</td>
  	<td>
  		/InquireMachineGroupApp/saveInquireMachineGroup
  	</td>
  	<td>
  		保存设备信息
  	</td>
  	<td>
  		int id_InquireMachineGroup, 设备信息ID<br/> 
  		String NumberMachGrNode, 机床编号<br/> 
  		String ModelMachGrNode, 机床型号<br/> 
  		String TypeMachGrNode,  机床类别<br/> 
		String DepartmentMachGrNode, 机床所在单位<br/> 
		String WorkshopMachGrNode,  机床车间<br/> 
		String PositionMachGrNode, 机床位置<br/> 
		String NameMachineGroup, 设备组名称<br/> 
		String PartNoMachGr, 目前加工零件编号<br/> 
		String PartNameMachGr, 目前加工零件名称<br/> 
		String SetMachGrStatus, 设定设备状态<br/> 
		String InquireMachGrStatus, 查询设备状态<br/> 
		String displayMachGrStatus 显示设备状态<br/> 
		int id_ManufacturePlan 生产计划ID<br/> 
  	</td>
  	<td>
  		{<br/> 
  			"result":成功1 失败0<br/> 
  			"msg":返回信息<br/> 
  		}<br/> 
  	</td>
  </tr>
  
  <tr>
  	<td>
  		195
  	</td>
  	<td>
  		/InquireMachineGroupApp/deleteInquireMachineGroupList
  	</td>
  	<td>
  		删除设备信息
  	</td>
  	<td>
  		String id_InquireMachineGroup 设备信息ID
  	</td>
  	<td>
  		{<br/> 
  			"result":成功1 失败0<br/> 
  			"msg":返回信息<br/> 
  		}<br/> 
  	</td>
  </tr>
  
  <tr>
  	<td>
  		196
  	</td>
  	<td>
  		/InquireMachineGroupApp/loading
  	</td>
  	<td>
  		加载信息、通过deputy的值来判断加载的页面
  	</td>
  	<td>
  		int deputy,  1为 机床节点信息页面  2为 加载设备组页面  3为 加载状态页面<br/>
  		int pageNo, 第几页<br/>
  		int pageSize, 每页几条<br/>
  		以下为机床页面所需参数：<br/>
		String NumberMachineNode, 机床编号<br/>
		String NumberMachine, 机床型号<br/>
		String TypeMachineNode, 机床类别<br/>
		String DepartmentMachineNode, 机床所在单位<br/>
		String WorkshopMachineNode, 机床车间<br/>
		以下为设备组页面所需参数：<br/>
		String SuperiorMachineGroup, 上级设备组<br/>
		String NameMachineGroup, 设备组名称<br/>
		String NoMachineGroup, 设备组编号<br/>
		String AddressMachineGroup, 地址<br/>
		以下为加载生产计划页面所需参数：<br/>
		String IDDeviceManufPlan, 节点设备编号 （传的是该页面填写的设备编号，必须传值）<br/>
		String NoManufPlan, 生产编号<br/>
		String DateStartManufPlan, 生产日期<br/>
		String DateFinishManufPlan, 完成日期<br/>
		String PartNoManufPlan, 零件编号<br/>
		String DeviceManufPlan 设备编号<br/>
  	</td>
  	<td>
  		机床页面：<br/>
  		{<br/>
  			"result": 成功1 失败0 <br/>
  			"para":{<br/>
  				NumberMachineNode, 机床编号<br/>
				NumberMachine, 机床型号<br/>
				TypeMachineNode, 机床类别<br/>
				DepartmentMachineNode, 机床所在单位<br/>
				WorkshopMachineNode, 机床车间<br/>
  			},<br/>
  			"page":{<br/>
  				"pageCount":总页数<br/>
  			},<br/>
  			"list":[{<br/>
  				"id_MachineNodeInform":ID<br/>
  				"NumberMachineNode":"机床编号",<br/>
  				"NumberMachine":"机床型号",<br/>
  				"PositionMachineNode":"机床位置",<br/>
  				"TypeMachineNode":类别<br/>
  				"WorkshopMachineNode":"机床车间",<br/>
  				"DepartmentMachineNode":"机床所在单位"<br/>
  				"UseFrequencyMachineNode":"机床使用强度",<br/>
  				"TimeUseMachineNode":使用时间<br/>
  				"TimeDestroyMachineNode":结束时间<br/>
  			}]<br/>
  		}<br/>
  		设备组页面：<br/>
  		{	<br/>
  			"result": 成功1 失败0<br/>
  			"para":{<br/>
  				SuperiorMachineGroup, 上级设备组<br/>
				NameMachineGroup, 设备组名称<br/>
				NoMachineGroup, 设备组编号<br/>
				AddressMachineGroup, 地址<br/>
  			},<br/>
  			"page":{<br/>
  				"pageCount":总页数<br/>
  			},<br/>
  			"list":[{<br/>
  				"id_MachineGroup":ID<br/>
  				"SuperiorMachineGroup":上级设备组<br/>
  				"NameMachineGroup":"设备组名称"<br/>
  				"NoMachineGroup":"设备组编号",<br/>
  				"PrincipalMachineGroup":"负责人",<br/>
  				"AddressMachineGroup":"地址",<br/>
  				"RemarkMachineGroup":"备注",<br/>
  				"LevelMachineGroup":"级别",<br/>
  			}]<br/>
  		}<br/>
  		加载计划页面：<br/>
  		{<br/>
  			"result":成功1 失败0<br/>
  			"para":{<br/>
  				IDDeviceManufPlan, 节点设备编号 （传的是该页面填写的设备编号，必须传值）<br/>
				NoManufPlan, 生产编号<br/>
				DateStartManufPlan, 生产日期<br/>
				DateFinishManufPlan, 完成日期<br/>
				PartNoManufPlan, 零件编号<br/>
				DeviceManufPlan 设备编号<br/>
  			},<br/>
  			"page":{<br/>
  				"pageCount":总页数<br/>
  			},<br/>
  			"list":[{<br/>
  				"id_ManufacturePlan":生产ID<br/>
				"NoManufPlan":"生产编号",<br/>
				"QuantityManufPlan":"生产数量",<br/>
				"DateStartManufPlan":"生产日期",<br/>
				"DateFinishManufPlan":"完成日期",<br/>
				"RemarkManufPlan":"备注",<br/>
				"PartNoManufPlan":"零件编号",<br/>
				"NameManufPlan":"零件名称",<br/>
				"NumberMaterialManufPlan":"材料牌号",<br/>
				"CategoryMaterialManufPlan":"材料类别",<br/>
				"DeviceManufPlan":"设备编号",<br/>
				"IDDeviceManufPlan":"节点设备编号",<br/>
				"BranchManufPlan":"部门分厂",<br/>
				"StaffManufPlan":"生产人员",<br/>
				"NoProcessManufPlan":"工序编号",<br/>
				"NameProcessManufPlan":"工序名称",<br/>
				"NoProcessStepManufPlan":"工步编号",<br/>
				"NameProcessStepManufPlan":"工步名称",<br/>
				"MachiningTypeManufPlan":"加工类别"<br/>
				"MachiningLevelManufPlan":"加工级别",<br/>
				"CuttingFluidManufPlan":"切削液",<br/>
				"CutterSpeedManufPlan":"切削速度",<br/>
				"SpindleSpeedManufPlan":"主轴转速",<br/>
				"FeedManufPlan":"每齿进给量",<br/>
				"CuttingDepthManufPlan":"切削深度",<br/>
				"CuttingWidthManufPlan":"切削宽度",<br/>
				"FeedSpeedManufPlan":"进给速度",<br/>
				"ToolHolderManufPlan":"刀柄",<br/>
				"ToolbladeManufPlan":"刀片",<br/>
				"ToolMaterialManufPlan":"刀片/刀具材料",<br/>
				"CutterManufPlan":"刀具",<br/>
  			}]<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		197
  	</td>
  	<td>
  		/InquireMachineGroupApp/judgingState
  	</td>
  	<td>
  		判断状态页面
  	</td>
  	<td>
  		String startDate, 生产时间<br/>
  		String endDate 结束时间<br/>
  	</td>
  	<td>
  		{<br/>
  			"result":1 正在使用   0 未在使用   -1 时间格式出错<br/>
  			"msg":"返回信息"<br/>
  		}<br/>
  	</td>
  </tr>
  	
  <tr>
  	<td>
  		198
  	</td>
  	<td>
  		/InquireMachineGroupApp/MachineStatus
  	</td>
  	<td>
  		设备信息状态查询页
  	</td>
  	<td>
  		int pageNo, 第几页 <br/>
  		int pageSize, 每页几条<br/>
  		String NameMachineGroup 设备组名称<br/>
		String NumberMachGrNode 机床编号<br/>
		String ModelMachGrNode 机床型号<br/>
		String TypeMachGrNode  机床类别<br/>
		String DepartmentMachGrNode 机床所在单位<br/>
  	</td>
  	<td>
  		{<br/>
  			"result": 成功1 失败0<br/>
  			"para":{<br/>
  				NameMachineGroup 设备组名称<br/>
				NumberMachGrNode 机床编号<br/>
				ModelMachGrNode 机床型号<br/>
				TypeMachGrNode  机床类别<br/>
				DepartmentMachGrNode 机床所在单位<br/>
  			},<br/>
  			"page":{<br/>
  				"pageCount":总页数<br/>
  			},<br/>
  			"list":[{<br/>
  				"id_InquireMachineGroup":Id<br/>
  				"NumberMachGrNode":"设备编号",<br/>
  				"ModelMachGrNode":"机床型号",<br/>
  				"TypeMachGrNode":"机床类别",<br/>
  				"DepartmentMachGrNode":"机床所在单位",<br/>
  				"PositionMachGrNode":"机床位置",<br/>
  				"WorkshopMachGrNode":"机床车间",<br/>
  				"NameMachineGroup":"设备组名称",<br/>
  				"PartNoMachGr":"目前加工零件编号",<br/>
  				"PartNameMachGr":"目前加工零件名称"<br/>
  				"SetMachGrStatus": 设定设备状态<br/>
  				"InquireMachGrStatus":查询设备状态<br/>
  				"displayMachGrStatus":显示设备状态<br/>
  			}]<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		199
  	</td>
  	<td>
  		/InquireMachineGroupApp/renovateState
  	</td>
  	<td>
  		刷新设备状态
  	</td>
  	<td>
  		无参数
  	</td>
  	<td>
  		{<br/>
  			"result":成功1 失败0<br/>
  			"msg":返回状态<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		200
  	</td>
  	<td>
  		/documentApp/documentList
  	</td>
  	<td>
  		查看文档
  	</td>
  	<td>
  		int pageNo, 第几页<br/>
  		int pageSize, 每页几条<br/>
		String title 标题<br/>
  	</td>
  	<td>
  		{<br/>
  			"result":成功1 失败0<br/>
  			"para":{<br/>
  				"title":标题<br/>
  			},<br/>
  			"page":{<br/>
  				"pageCount":总页数<br/>
  			},<br/>
  			"list":[{<br/>
	  			"id_Document":ID<br/>
	  			"title":标题<br/>
	  			"text":内容<br/>
  			}]<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		201
  	</td>
  	<td>
  		/documentApp/goAddDocument
  	</td>
  	<td>
  		去添加文档页面
  	</td>
  	<td>
  		String id 文档信息ID
  	</td>
  	<td>
  		{<br/>
  			"result":成功1 失败0<br/>
  			"document":{<br/>
  				"id_Document":ID<br/>
	  			"title":标题<br/>
	  			"text":内容<br/>
  			}<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		202
  	</td>
  	<td>
  		/documentApp/saveDocument
  	</td>
  	<td>
  		保存文档信息
  	</td>
  	<td>
  		int id_Document, 文档ID<br/>
  		String title, 文档标题<br/>
  		String text 文档内容<br/>
  	</td>
  	<td>
  		{<br/>
  			"result":成功1 失败0,<br/>
  			"msg":"返回信息"<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		203
  	</td>
  	<td>
  		/documentApp/deleteDocumentList
  	</td>
  	<td>
  		删除文档信息
  	</td>
  	<td>
  		String id_Document 文档ID
  	</td>
  	<td>
  		{<br/>
  			"result":成功1 失败0,<br/>
  			"msg":"返回信息"<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	
  	</td>
  	<td>
  	
  	</td>
  	<td>
  	
  	</td>
  	<td>
  	
  	</td>
  	<td>
  	
  	</td>
  </tr>
  
  <tr>
  	<td>
  	
  	</td>
  	<td>
  	
  	</td>
  	<td>
  	
  	</td>
  	<td>
  	
  	</td>
  	<td>
  	
  	</td>
  </tr>
  
  <tr>
  	<td>
  	
  	</td>
  	<td>
  	
  	</td>
  	<td>
  	
  	</td>
  	<td>
  	
  	</td>
  	<td>
  	
  	</td>
  </tr>
  
  
 </table>
 </body>
 </html>
 
 
 
 
 
 
 
 
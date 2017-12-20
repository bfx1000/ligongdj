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
<title>模具加工</title>
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
    <td>序号</td>
    <td>名称</td>
    <td>接口</td>
    <td>传参</td>
    <td>返回值</td>
  </tr>
  <tr>
    <td>1</td>
    <td>深孔钻列表</td>
    <td>/toolBTAdrillApp/queryToolBTAdrillList</td>
    <td>
      int pageNo 第几页 <br/>
      int pageSize 每页几条<br/>
      String NumberBTADrill 钻头编号<br/>
      String TypeBTADrill 钻头类型<br/>
      String NameBTADrill 钻头名称<br/>
	  String DiameterBTADrill 加工直径<br/>
	  String MateriaBTAlDrill 加工材料<br/>
	  String ToolMaterialBTADrill 刀具材料<br/>
	  String ToolCoatBTADrill 刀具涂层<br/>
	  String BreakerBTADrill 断屑槽类型<br/>
	  String CompanyBTADrill 生产厂家<br/>
    </td>
    <td>
      {<br/>
		&nbsp;&nbsp;"result":"1",<br/>
		&nbsp;&nbsp;"list":{<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"id_BTADrill" : int <br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"NumberBTADrill" : string 钻头编号<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"TypeBTADrill" : string 钻头类型(1 焊接钻头  2 可转位钻头)<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"NameBTADrill" : string 钻头名称<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"DiameterBTADrill" : string 加工直径<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"MateriaBTAlDrill" : string 加工材料<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ToolMaterialBTADrill" : string 刀具材料<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ToolCoatBTADrill" : string 刀具涂层<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"BreakerBTADrill" : string 断屑槽类型<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"CompanyBTADrill" : string 生产厂家<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"isPMKNS" : string （传值类似为"P,M,N"）P 加工P , M 加工M , K 加工K , N 加工N , S 加工S<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOPBTADrill" : string 加工P<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOPTextBTADrill" : string 加工P参数<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOMBTADrill" : string 加工M<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOMTextBTADrill" : string 加工M参数<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOKBTADrill" : string 加工K<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOKTextBTADrill" : string 加工K参数<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISONBTADrill" : string 加工N<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISONTextBTADrill" : string 加工N参数<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOSBTADrill" :  string 加工S<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOSTextBTADrill" : string 加工S参数<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"pictureBTADrillList" : {<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_PictureBTADrill" : int<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_BTADrill" : int BTADrill.id_BTADrill<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_PictureBTADrill" : String 刀具图片url  <br/>
			&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"pictureDetailBTADrill" : {<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_PictureDetailBTADrill" : int<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_BTADrill" : int BTADrill.id_BTADrill<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_PictureDetailBTADrill" : String 详细图片url  <br/>
			&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"informDetailBTADrillList" ： {<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_InformDetailBTADrill" : int<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_BTADrill" : int BTADrill.id_BTADrill<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_InformDetailBTADrill" : String 详细信息url<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"name_InformDetailBTADrill" : String 详细信息文件名称<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"applicationBTADrillList" ：{<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_ApplicationBTADrill" : int<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_BTADrill" : int BTADrill.id_BTADrill<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_ApplicationBTADrill" : String 应用实例url <br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"name_ApplicationBTADrill" : String 应用实例文件名称 <br/>
			&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
		&nbsp;&nbsp;}<br/>
		&nbsp;&nbsp;"page" : {<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;pageCount : int 总页数<br/>
		&nbsp;&nbsp;}<br/>
		&nbsp;&nbsp;"para" : {
				&nbsp;&nbsp;&nbsp;&nbsp;NumberBTADrill : String  钻头编号<br/>
		      	&nbsp;&nbsp;&nbsp;&nbsp;TypeBTADrill : String 钻头类型<br/>
		      	&nbsp;&nbsp;&nbsp;&nbsp;NameBTADrill : String 钻头名称<br/>
			  	&nbsp;&nbsp;&nbsp;&nbsp;DiameterBTADrill : String 加工直径<br/>
			  	&nbsp;&nbsp;&nbsp;&nbsp;MateriaBTAlDrill : String 加工材料<br/>
			  	&nbsp;&nbsp;&nbsp;&nbsp;ToolMaterialBTADrill : String 刀具材料<br/>
			  	&nbsp;&nbsp;&nbsp;&nbsp;ToolCoatBTADrill : String 刀具涂层<br/>
			  	&nbsp;&nbsp;&nbsp;&nbsp;BreakerBTADrill : String 断屑槽类型<br/>
			  	&nbsp;&nbsp;&nbsp;&nbsp;CompanyBTADrill :String 生产厂家<br/>
		&nbsp;&nbsp;}<br/>
	  }<br/>
	</td>
  </tr>
  <tr>
    <td>2</td>
    <td>去新增/修改深孔钻页面(查询深孔钻详细信息)</td>
    <td>/toolBTAdrillApp/goAddToolBTAdrill</td>
    <td>
      String id 深孔钻id(id_BTADrill) <br/>
    </td>
    <td>
      {<br/>
		&nbsp;&nbsp;"result":"1",<br/>
		&nbsp;&nbsp;"toolBTAdrill":{<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"id_BTADrill" : int <br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"NumberBTADrill" : string 钻头编号<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"TypeBTADrill" : string 钻头类型(1 焊接钻头  2 可转位钻头)<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"NameBTADrill" : string 钻头名称<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"DiameterBTADrill" : string 加工直径<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"MateriaBTAlDrill" : string 加工材料<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ToolMaterialBTADrill" : string 刀具材料<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ToolCoatBTADrill" : string 刀具涂层<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"BreakerBTADrill" : string 断屑槽类型<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"CompanyBTADrill" :String 生产厂家<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"isPMKNS" : string （传值类似为"P,M,N"）P 加工P , M 加工M , K 加工K , N 加工N , S 加工S<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOPBTADrill" : string 加工P<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOPTextBTADrill" : string 加工P参数<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOMBTADrill" : string 加工M<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOMTextBTADrill" : string 加工M参数<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOKBTADrill" : string 加工K<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOKTextBTADrill" : string 加工K参数<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISONBTADrill" : string 加工N<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISONTextBTADrill" : string 加工N参数<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOSBTADrill" :  string 加工S<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOSTextBTADrill" : string 加工S参数<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"pictureBTADrillList" : {<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_PictureBTADrill" : int<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_BTADrill" : int BTADrill.id_BTADrill<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_PictureBTADrill" : String 刀具图片url  <br/>
			&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"pictureDetailBTADrill" : {<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_PictureDetailBTADrill" : int<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_BTADrill" : int BTADrill.id_BTADrill<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_PictureDetailBTADrill" : String 详细图片url  <br/>
			&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"informDetailBTADrillList" ： {<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_InformDetailBTADrill" : int<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_BTADrill" : int BTADrill.id_BTADrill<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_InformDetailBTADrill" : String 详细信息url<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"name_InformDetailBTADrill" : String 详细信息文件名称<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"applicationBTADrillList" ：{<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_ApplicationBTADrill" : int<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_BTADrill" : int BTADrill.id_BTADrill<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_ApplicationBTADrill" : String 应用实例url <br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"name_ApplicationBTADrill" : String 应用实例文件名称 <br/>
			&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
		&nbsp;&nbsp;}<br/>
		&nbsp;&nbsp;"array_PictureBTADrill" : String  pictureBTADrillList的刀具图片url（以,分割）<br/>
		&nbsp;&nbsp;"array_PictureDetailBTADrill" : String  pictureDetailBTADrill的详细图片url（以,分割）<br/>
		&nbsp;&nbsp;"array_InformDetailBTADrill" : String  informDetailBTADrillList的详细信息url（以,分割）<br/>
		&nbsp;&nbsp;"array_InformDetailBTADrill_name" : String  informDetailBTADrillList的详细信息文件名称（以,分割）<br/>
		&nbsp;&nbsp;"array_ApplicationBTADrill" : String  applicationBTADrillList的应用实例url（以,分割）<br/>
		&nbsp;&nbsp;"array_ApplicationBTADrill_name" : String  applicationBTADrillList的应用实例文件名称（以,分割）<br/>
	  }<br/>
	</td>
  </tr>
  <tr>
    <td>3</td>
    <td>保存深孔钻数据（新增、修改）</td>
    <td>/toolBTAdrillApp/saveToolBTAdrill</td>
    <td>
      String user_id 当前登录用户的用户id（未登录传"0"）<br/>
      int id_BTADrill 深孔钻id(id_BTADrill)<br/>
      String NumberBTADrill 钻头编号<br/>
      String TypeBTADrill 钻头类型(1 焊接钻头  2 可转位钻头)<br/>
      String NameBTADrill 钻头名称<br/>
      String DiameterBTADrill 加工直径(double类型的，传给我的时候转成string)<br/>
	  String MateriaBTAlDrill 加工材料<br/>
	  String ToolMaterialBTADrill 刀具材料<br/>
	  String ToolCoatBTADrill 刀具涂层<br/>
	  String BreakerBTADrill 断屑槽类型<br/>
	  String CompanyBTADrill 生产厂家<br/>
	  String isPMKNS （传值类似为"P,M,N"）（P 加工P , M 加工M , K 加工K , N 加工N , S 加工S）<br/>
	  String ISOPTextBTADrill 加工P参数<br/>
	  String ISOMTextBTADrill 加工M参数<br/>
	  String ISOKTextBTADrill 加工K参数<br/>
	  String ISONTextBTADrill 加工N参数 <br/>
	  String ISOSTextBTADrill 加工S参数<br/>
	  
	  String array_PictureBTADrill 			pictureBTADrillList的刀具图片url（以,分割）（当前深孔钻所有刀具图片的url）<br/>
	  String array_PictureDetailBTADrill 	pictureDetailBTADrill的详细图片url（以,分割）（当前深孔钻所有详细图片url）<br/>
	  String array_InformDetailBTADrill 	informDetailBTADrillList的详细信息url（以,分割）（当前深孔钻所有详细信息url）<br/>
	  String array_InformDetailBTADrill_name informDetailBTADrillList的详细信息文件名称（以,分割）（当前深孔钻所有详细信息文件名称）<br/>
	  String array_ApplicationBTADrill  	applicationBTADrillList的应用实例url（以,分割）（当前深孔钻所有应用实例url）<br/>
	  String array_ApplicationBTADrill_name  applicationBTADrillList的应用实例文件名称（以,分割）（当前深孔钻所有应用实例文件名称）<br/>
    </td>
    <td>
      {<br/>
		&nbsp;&nbsp;"result":"1", （1 操作成功 0 操作失败）<br/>
		&nbsp;&nbsp;"msg": 返回信息<br/>
		}<br/>
	</td>
  </tr>
  <tr>
    <td>4</td>
    <td>保存刀具图片</td>
    <td>/toolBTAdrillApp/savePictureBTADrill</td>
    <td>
      String id_BTADrill 深孔钻id(id_BTADrill)<br/>
      String array_PictureBTADrill 			pictureBTADrillList的刀具图片url（以,分割）（当前深孔钻所有刀具图片的url）<br/>
	  String array_PictureDetailBTADrill 	pictureDetailBTADrill的详细图片url（以,分割）（当前深孔钻所有详细图片url）<br/>
	  String array_ApplicationBTADrill 		informDetailBTADrillList的详细信息url（以,分割）（当前深孔钻所有详细信息url）<br/>
	  String array_ApplicationBTADrill_name informDetailBTADrillList的详细信息文件名称（以,分割）（当前深孔钻所有详细信息文件名称）<br/>
	  String array_InformDetailBTADrill 	applicationBTADrillList的应用实例url（以,分割）（当前深孔钻所有应用实例url）<br/>
	  String array_InformDetailBTADrill_name applicationBTADrillList的应用实例文件名称（以,分割）（当前深孔钻所有应用实例文件名称）<br/>
	  String PictureBTADrill 刀具图片文件<br/>
	  String fileSuffix 刀具图片文件后缀 （类似jpg，gif）<br/>
	  String filename 刀具图片文件名（带后缀）（类似1.jpg）<br/>
    </td>
    <td>
      {<br/>
		&nbsp;&nbsp;"result":"1", （1 操作成功 0 操作失败）<br/>
		&nbsp;&nbsp;"array_PictureBTADrill" : String  		pictureBTADrillList的刀具图片url（以,分割）<br/>
		&nbsp;&nbsp;"array_PictureDetailBTADrill" : String  pictureDetailBTADrill的详细图片url（以,分割）<br/>
		&nbsp;&nbsp;"array_InformDetailBTADrill" : String  	informDetailBTADrillList的详细信息url（以,分割）<br/>
		&nbsp;&nbsp;"array_InformDetailBTADrill_name" : String  informDetailBTADrillList的详细信息文件名称（以,分割）<br/>
		&nbsp;&nbsp;"array_ApplicationBTADrill" : String  	applicationBTADrillList的应用实例url（以,分割）<br/>
		&nbsp;&nbsp;"array_ApplicationBTADrill_name" : String  applicationBTADrillList的应用实例文件名称（以,分割）<br/>
	  }<br/>
	</td>
  </tr>
  <tr>
    <td>5</td>
    <td>保存详细图片</td>
    <td>/toolBTAdrillApp/savePictureDetailBTADrill</td>
    <td>
      String id_BTADrill 深孔钻id(id_BTADrill)<br/>
      String array_PictureBTADrill 			pictureBTADrillList的刀具图片url（以,分割）（当前深孔钻所有刀具图片的url）<br/>
	  String array_PictureDetailBTADrill 	pictureDetailBTADrill的详细图片url（以,分割）（当前深孔钻所有详细图片url）<br/>
	  String array_ApplicationBTADrill 		informDetailBTADrillList的详细信息url（以,分割）（当前深孔钻所有详细信息url）<br/>
	  String array_ApplicationBTADrill_name informDetailBTADrillList的详细信息文件名称（以,分割）（当前深孔钻所有详细信息文件名称）<br/>
	  String array_InformDetailBTADrill 	applicationBTADrillList的应用实例url（以,分割）（当前深孔钻所有应用实例url）<br/>
	  String array_InformDetailBTADrill_name applicationBTADrillList的应用实例文件名称（以,分割）（当前深孔钻所有应用实例文件名称）<br/>
	  String PictureDetailBTADrill 刀具图片文件<br/>
	  String fileSuffix 刀具图片文件后缀 （类似jpg，gif）<br/>
	  String filename 刀具图片文件名（带后缀）（类似1.jpg）<br/>
    </td>
    <td>
      {<br/>
		&nbsp;&nbsp;"result":"1", （1 操作成功 0 操作失败）<br/>
		&nbsp;&nbsp;"array_PictureBTADrill" : String  		pictureBTADrillList的刀具图片url（以,分割）<br/>
		&nbsp;&nbsp;"array_PictureDetailBTADrill" : String  pictureDetailBTADrill的详细图片url（以,分割）<br/>
		&nbsp;&nbsp;"array_InformDetailBTADrill" : String  	informDetailBTADrillList的详细信息url（以,分割）<br/>
		&nbsp;&nbsp;"array_InformDetailBTADrill_name" : String  informDetailBTADrillList的详细信息文件名称（以,分割）<br/>
		&nbsp;&nbsp;"array_ApplicationBTADrill" : String  	applicationBTADrillList的应用实例url（以,分割）<br/>
		&nbsp;&nbsp;"array_ApplicationBTADrill_name" : String  applicationBTADrillList的应用实例文件名称（以,分割）<br/>
	  }<br/>
	</td>
  </tr>
  <tr>
    <td>6</td>
    <td>保存应用实例</td>
    <td>/toolBTAdrillApp/saveApplicationBTADrill</td>
    <td>
      String id_BTADrill 深孔钻id(id_BTADrill)<br/>
      String array_PictureBTADrill 			pictureBTADrillList的刀具图片url（以,分割）（当前深孔钻所有刀具图片的url）<br/>
	  String array_PictureDetailBTADrill 	pictureDetailBTADrill的详细图片url（以,分割）（当前深孔钻所有详细图片url）<br/>
	  String array_ApplicationBTADrill 		informDetailBTADrillList的详细信息url（以,分割）（当前深孔钻所有详细信息url）<br/>
	  String array_ApplicationBTADrill_name informDetailBTADrillList的详细信息文件名称（以,分割）（当前深孔钻所有详细信息文件名称）<br/>
	  String array_InformDetailBTADrill 	applicationBTADrillList的应用实例url（以,分割）（当前深孔钻所有应用实例url）<br/>
	  String array_InformDetailBTADrill_name applicationBTADrillList的应用实例文件名称（以,分割）（当前深孔钻所有应用实例文件名称）<br/>
	  String ApplicationBTADrill 刀具图片文件<br/>
	  String fileSuffix 刀具图片文件后缀 （类似jpg，gif）<br/>
	  String filename 刀具图片文件名（带后缀）（类似1.jpg）<br/>
    </td>
    <td>
      {<br/>
		&nbsp;&nbsp;"result":"1", （1 操作成功 0 操作失败）<br/>
		&nbsp;&nbsp;"array_PictureBTADrill" : String  		pictureBTADrillList的刀具图片url（以,分割）<br/>
		&nbsp;&nbsp;"array_PictureDetailBTADrill" : String  pictureDetailBTADrill的详细图片url（以,分割）<br/>
		&nbsp;&nbsp;"array_InformDetailBTADrill" : String  	informDetailBTADrillList的详细信息url（以,分割）<br/>
		&nbsp;&nbsp;"array_InformDetailBTADrill_name" : String  informDetailBTADrillList的详细信息文件名称（以,分割）<br/>
		&nbsp;&nbsp;"array_ApplicationBTADrill" : String  	applicationBTADrillList的应用实例url（以,分割）<br/>
		&nbsp;&nbsp;"array_ApplicationBTADrill_name" : String  applicationBTADrillList的应用实例文件名称（以,分割）<br/>
	  }<br/>
	</td>
  </tr>
    <tr>
    <td>7</td>
    <td>保存详细信息</td>
    <td>/toolBTAdrillApp/saveInformDetailBTADrill</td>
    <td>
      String id_BTADrill 深孔钻id(id_BTADrill)<br/>
      String array_PictureBTADrill 			pictureBTADrillList的刀具图片url（以,分割）（当前深孔钻所有刀具图片的url）<br/>
	  String array_PictureDetailBTADrill 	pictureDetailBTADrill的详细图片url（以,分割）（当前深孔钻所有详细图片url）<br/>
	  String array_ApplicationBTADrill 		informDetailBTADrillList的详细信息url（以,分割）（当前深孔钻所有详细信息url）<br/>
	  String array_ApplicationBTADrill_name informDetailBTADrillList的详细信息文件名称（以,分割）（当前深孔钻所有详细信息文件名称）<br/>
	  String array_InformDetailBTADrill 	applicationBTADrillList的应用实例url（以,分割）（当前深孔钻所有应用实例url）<br/>
	  String array_InformDetailBTADrill_name applicationBTADrillList的应用实例文件名称（以,分割）（当前深孔钻所有应用实例文件名称）<br/>
	  String InformDetailBTADrill 刀具图片文件<br/>
	  String fileSuffix 刀具图片文件后缀 （类似jpg，gif）<br/>
	  String filename 刀具图片文件名（带后缀）（类似1.jpg）<br/>
    </td>
    <td>
      {<br/>
		&nbsp;&nbsp;"result":"1", （1 操作成功 0 操作失败）<br/>
		&nbsp;&nbsp;"array_PictureBTADrill" : String  		pictureBTADrillList的刀具图片url（以,分割）<br/>
		&nbsp;&nbsp;"array_PictureDetailBTADrill" : String  pictureDetailBTADrill的详细图片url（以,分割）<br/>
		&nbsp;&nbsp;"array_InformDetailBTADrill" : String  	informDetailBTADrillList的详细信息url（以,分割）<br/>
		&nbsp;&nbsp;"array_InformDetailBTADrill_name" : String  informDetailBTADrillList的详细信息文件名称（以,分割）<br/>
		&nbsp;&nbsp;"array_ApplicationBTADrill" : String  	applicationBTADrillList的应用实例url（以,分割）<br/>
		&nbsp;&nbsp;"array_ApplicationBTADrill_name" : String  applicationBTADrillList的应用实例文件名称（以,分割）<br/>
	  }<br/>
	</td>
  </tr>
  <tr>
    <td>8</td>
    <td>删除深孔钻数据</td>
    <td>/toolBTAdrillApp/deleteToolBTAdrill</td>
    <td>
      String id_BTADrill 深孔钻id(id_BTADrill)<br/>
    </td>
    <td>
      {<br/>
		&nbsp;&nbsp;"result":"1", （1 操作成功 0 操作失败）<br/>
		&nbsp;&nbsp;"msg": 返回信息<br/>
	  }<br/>
	</td>
  </tr>
  <tr>
    <td>9</td>
    <td>查询车刀数据-刀柄列表</td>
    <td>/turningHolderApp/queryTurningHolderList</td>
    <td>
      int pageNo 第几页<br/>
      int pageSize 每页几条<br/>
	  String NumberTurningHolder 刀柄编号<br/>
	  String NameTurningHolder 刀柄名称<br/>
	  String TypeTurningHolder 加工类别(1 外圆车削 2 内圆车削 3 重型车削 4 断续车削 5 切槽 9 自定义)<br/>
	  String ISOBladeTurning ISO基准刀片<br/>
	  String TypeBlade 刀片类别(1 正前角刀片 2 负前角刀片 3 陶瓷刀片 4 PCBN刀片 9 自定义)<br/>
	  String DiameterTurningHolder 主偏角<br/>
	  String CompanyTurningHolder 生产厂家<br/>
    </td>
    <td>
      {
  		&nbsp;&nbsp;"result":"1",<br/>
  		&nbsp;&nbsp;"list":{ <br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"id_TurningHolder" : int<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"NumberTurningHolder" : String 刀柄编号<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"NameTurningHolder" : String 刀柄名称<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"TypeTurningHolder" : String 加工类别(1 外圆车削 2 内圆车削 3 重型车削 4 断续车削 5 切槽 9 自定义)<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISOBladeTurning" : String ISO基准刀片<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"TypeBlade" : String 刀片类别(1 正前角刀片 2 负前角刀片 3 陶瓷刀片 4 PCBN刀片 9 自定义)<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"DiameterTurningHolder" : String 主偏角<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"CompanyTurningHolder" : String 生产厂家<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"FeatureTurningHolder" : String 加工特性简述<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"TypeCustomTurningHolder" : String 加工类别自定义<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"TypeCustomBlade" : String 刀片类别自定义<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"pictureTurningHolderList" : {<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_PictureTurningHolder" : int<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_TurningHolder" : int TurningHolder.id_TurningHolder<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_PictureTurningHolder" : String 刀柄图片url <br/>
			&nbsp;&nbsp;&nbsp;&nbsp;} <br/>
		    &nbsp;&nbsp;&nbsp;&nbsp;"pictureDetailTurningHolderList" : {<br/>
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_PictureDetailTurningHolder" : int<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_TurningHolder" : int TurningHolder.id_TurningHolder<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_PictureDetailTurningHolder" : String 详细图片url <br/>
		    &nbsp;&nbsp;&nbsp;&nbsp;} <br/>
		    &nbsp;&nbsp;&nbsp;&nbsp;"informDetailTurningHolderList" : {<br/>
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_InformDetailTurningHolder" : int<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_TurningHolder" : int TurningHolder.id_TurningHolder<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_InformDetailTurningHolder" : String 详细信息url <br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"name_InformDetailTurningHolder" : String 详细信息name<br/>
		    &nbsp;&nbsp;&nbsp;&nbsp;} <br/>
  		&nbsp;&nbsp;}<br/>
	  &nbsp;&nbsp;"page" : {<br/>
	    pageCount : int 总页数<br/>
	  &nbsp;&nbsp;}<br/>
	  &nbsp;&nbsp;"para" : {     <br/>
	  	  &nbsp;&nbsp;&nbsp;&nbsp;NumberTurningHolder : String 刀柄编号<br/>
		  &nbsp;&nbsp;&nbsp;&nbsp;NameTurningHolder : String 刀柄名称<br/>
		  &nbsp;&nbsp;&nbsp;&nbsp;TypeTurningHolder : String 加工类别(1 外圆车削 2 内圆车削 3 重型车削 4 断续车削 5 切槽 9 自定义)<br/>
		  &nbsp;&nbsp;&nbsp;&nbsp;ISOBladeTurning : String ISO基准刀片<br/>
		  &nbsp;&nbsp;&nbsp;&nbsp;TypeBlade : String 刀片类别(1 正前角刀片 2 负前角刀片 3 陶瓷刀片 4 PCBN刀片 9 自定义)<br/>
		  &nbsp;&nbsp;&nbsp;&nbsp;DiameterTurningHolder : String 主偏角<br/>
		  &nbsp;&nbsp;&nbsp;&nbsp;CompanyTurningHolder : String 生产厂家<br/>
	  &nbsp;&nbsp;}<br/>
		}<br/>
	</td>
  </tr>
  <tr>
    <td>10</td>
    <td>去新增车刀数据-刀柄页面(查询刀柄详细信息)</td>
    <td>/turningHolderApp/goAddTurningHolder</td>
    <td>
      String id 刀柄id(id_TurningHolder) 
    </td>
    <td>
      {<br/>
  		&nbsp;&nbsp;"result":"1",<br/>
  		&nbsp;&nbsp;"turningHolder":{ <br/>
		    &nbsp;&nbsp;&nbsp;&nbsp;"id_TurningHolder" : int<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"NumberTurningHolder" : String 刀柄编号<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"NameTurningHolder" : String 刀柄名称<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"TypeTurningHolder" : String 加工类别(1 外圆车削 2 内圆车削 3 重型车削 4 断续车削 5 切槽 9 自定义)<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISOBladeTurning" : String ISO基准刀片<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"TypeBlade" : String 刀片类别(1 正前角刀片 2 负前角刀片 3 陶瓷刀片 4 PCBN刀片 9 自定义)<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"DiameterTurningHolder" : String 主偏角<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"CompanyTurningHolder" : String 生产厂家<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"FeatureTurningHolder" : String 加工特性简述<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"TypeCustomTurningHolder" : String 加工类别自定义<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"TypeCustomBlade" : String 刀片类别自定义<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"pictureTurningHolderList" : {<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_PictureTurningHolder" : int<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_TurningHolder" : int TurningHolder.id_TurningHolder<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_PictureTurningHolder" : String 刀柄图片url <br/>
			&nbsp;&nbsp;&nbsp;&nbsp;} <br/>
		    &nbsp;&nbsp;&nbsp;&nbsp;"pictureDetailTurningHolderList" : {<br/>
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_PictureDetailTurningHolder" : int<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_TurningHolder" : int TurningHolder.id_TurningHolder<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_PictureDetailTurningHolder" : String 详细图片url <br/>
		    &nbsp;&nbsp;&nbsp;&nbsp;} <br/>
		    &nbsp;&nbsp;&nbsp;&nbsp;"informDetailTurningHolderList" : {<br/>
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_InformDetailTurningHolder" : int<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_TurningHolder" : int TurningHolder.id_TurningHolder<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_InformDetailTurningHolder" : String 详细信息url <br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"name_InformDetailTurningHolder" : String 详细信息name<br/>
		    &nbsp;&nbsp;&nbsp;&nbsp;} <br/>
		  &nbsp;&nbsp;}<br/>
		  "ISOList" : List\<String\> 用于ISO字段加载已有信息，做类似百度筛选列表用
		  &nbsp;&nbsp;"array_PictureTurningHolder" : String pictureTurningHolderList的刀具图片url（以,分割）<br/>
		  &nbsp;&nbsp;"array_PictureDetailTurningHolder" : String pictureDetailTurningHolderList的详细图片url（以,分割）<br/>
		  &nbsp;&nbsp;"array_InformDetailTurningHolder" : String informDetailTurningHolderList的详细信息url（以,分割）<br/>
		  &nbsp;&nbsp;"array_InformDetailTurningHolder_name" : String informDetailTurningHolderList的详细信息文件名称（以,分割）<br/>
		}
	</td>
  </tr>
  <tr>
    <td>11</td>
    <td>保存刀柄数据（新增、修改）</td>
    <td>/turningHolderApp/saveTurningHolder</td>
    <td>
      String user_id 当前登录用户的用户id（未登录传"0"）<br/>
	  int id_TurningHolder <br/>
	  String array_PictureTurningHolder pictureTurningHolderList的刀柄图片url（以,分割）（当前刀柄所有刀柄图片的url）<br/>
	  String array_PictureDetailTurningHolder pictureDetailTurningHolder的详细图片url（以,分割）（当前刀柄所有详细图片url）<br/>
	  String array_InformDetailTurningHolder informDetailTurningHolderList的详细信息url（以,分割）（当前刀柄所有详细信息url）<br/>
	  String array_InformDetailTurningHolder_name informDetailTurningHolderList的详细信息文件名称（以,分割）（当前刀柄所有详细信息文件名称）<br/>
	  String NumberTurningHolder 刀柄编号<br/>
	  String NameTurningHolder 刀柄名称<br/>
	  String TypeTurningHolder 加工类别(1 外圆车削 2 内圆车削 3 重型车削 4 断续车削 5 切槽 9 自定义)<br/>
	  String TypeCustomTurningHolder 加工类别自定义<br/>
	  String ISOBladeTurning ISO基准刀片<br/>
	  String TypeBlade 刀片类别(1 正前角刀片 2 负前角刀片 3 陶瓷刀片 4 PCBN刀片 9 自定义)<br/>
	  String TypeCustomBlade 刀片类别自定义<br/>
	  String DiameterTurningHolder 主偏角<br/>
	  String CompanyTurningHolder 生产厂家<br/>
	  String FeatureTurningHolder 加工特性简述<br/>
    </td>
    <td>
      {<br/>
		  &nbsp;&nbsp;"result":"1", （1 操作成功 0 操作失败）<br/>
		  &nbsp;&nbsp;"msg": 返回信息<br/>
	  }<br/>
	</td>
  </tr>
  <tr>
    <td>12</td>
    <td>保存刀柄图片</td>
    <td>/turningHolderApp/savePictureTurningHolder</td>
    <td>
      String id_TurningHolder<br/>
	  String array_PictureTurningHolder pictureTurningHolderList的刀柄图片url（以,分割）（当前刀柄所有刀柄图片的url）<br/>
	  String array_PictureDetailTurningHolder pictureDetailTurningHolder的详细图片url（以,分割）（当前刀柄所有详细图片url）<br/>
	  String array_InformDetailTurningHolder informDetailTurningHolderList的详细信息url（以,分割）（当前刀柄所有详细信息url）<br/>
	  String array_InformDetailTurningHolder_name informDetailTurningHolderList的详细信息文件名称（以,分割）（当前刀柄所有详细信息文件名称）<br/>
	  String PictureTurningHolder 刀柄图片文件<br/>
	  String fileSuffix 刀柄图片文件后缀 （类似jpg，gif）<br/>
	  String filename 刀柄图片文件名（带后缀）（类似1.jpg）<br/>
    </td>
    <td>
      {
		  &nbsp;&nbsp;"result":"1", （1 操作成功 0 操作失败）<br/>
		  &nbsp;&nbsp;"array_PictureTurningHolder" : String pictureTurningHolderList的刀柄图片url（以,分割）（当前刀柄所有刀柄图片的url）<br/>
		  &nbsp;&nbsp;"array_PictureDetailTurningHolder" : String pictureDetailTurningHolder的详细图片url（以,分割）（当前刀柄所有详细图片url）<br/>
		  &nbsp;&nbsp;"array_InformDetailTurningHolder" : String informDetailTurningHolderList的详细信息url（以,分割）（当前刀柄所有详细信息url）<br/>
		  &nbsp;&nbsp;"array_InformDetailTurningHolder_name" : String informDetailTurningHolderList的详细信息文件名称（以,分割）（当前刀柄所有详细信息文件名称）<br/>
	  }
	</td>
  </tr>
  <tr>
    <td>13</td>
    <td>保存详细图片</td>
    <td>/turningHolderApp/savePictureDetailTurningHolder</td>
    <td>
      String id_TurningHolder<br/>
	  String array_PictureTurningHolder pictureTurningHolderList的刀柄图片url（以,分割）（当前刀柄所有刀柄图片的url）<br/>
	  String array_PictureDetailTurningHolder pictureDetailTurningHolder的详细图片url（以,分割）（当前刀柄所有详细图片url）<br/>
	  String array_InformDetailTurningHolder informDetailTurningHolderList的详细信息url（以,分割）（当前刀柄所有详细信息url）<br/>
	  String array_InformDetailTurningHolder_name informDetailTurningHolderList的详细信息文件名称（以,分割）（当前刀柄所有详细信息文件名称）<br/>
	  String PictureDetailTurningHolder 详细图片文件<br/>
	  String fileSuffix 刀柄图片文件后缀 （类似jpg，gif）<br/>
	  String filename 刀柄图片文件名（带后缀）（类似1.jpg）<br/>
    </td>
    <td>
      {
		  &nbsp;&nbsp;"result":"1", （1 操作成功 0 操作失败）<br/>
		  &nbsp;&nbsp;"array_PictureTurningHolder" : String pictureTurningHolderList的刀柄图片url（以,分割）（当前刀柄所有刀柄图片的url）<br/>
		  &nbsp;&nbsp;"array_PictureDetailTurningHolder" : String pictureDetailTurningHolder的详细图片url（以,分割）（当前刀柄所有详细图片url）<br/>
		  &nbsp;&nbsp;"array_InformDetailTurningHolder" : String informDetailTurningHolderList的详细信息url（以,分割）（当前刀柄所有详细信息url）<br/>
		  &nbsp;&nbsp;"array_InformDetailTurningHolder_name" : String informDetailTurningHolderList的详细信息文件名称（以,分割）（当前刀柄所有详细信息文件名称）<br/>
	  }
	</td>
  </tr>
  <tr>
    <td>14</td>
    <td>保存详细信息</td>
    <td>/turningHolderApp/saveInformDetailTurningHolder</td>
    <td>
      String id_TurningHolder<br/>
	  String array_PictureTurningHolder pictureTurningHolderList的刀柄图片url（以,分割）（当前刀柄所有刀柄图片的url）<br/>
	  String array_PictureDetailTurningHolder pictureDetailTurningHolder的详细图片url（以,分割）（当前刀柄所有详细图片url）<br/>
	  String array_InformDetailTurningHolder informDetailTurningHolderList的详细信息url（以,分割）（当前刀柄所有详细信息url）<br/>
	  String array_InformDetailTurningHolder_name informDetailTurningHolderList的详细信息文件名称（以,分割）（当前刀柄所有详细信息文件名称）<br/>
	  String InformDetailTurningHolder 详细信息文件<br/>
	  String fileSuffix 刀柄图片文件后缀 （类似jpg，gif）<br/>
	  String filename 刀柄图片文件名（带后缀）（类似1.jpg）<br/>
    </td>
    <td>
      {
		  &nbsp;&nbsp;"result":"1", （1 操作成功 0 操作失败）<br/>
		  &nbsp;&nbsp;"array_PictureTurningHolder" : String pictureTurningHolderList的刀柄图片url（以,分割）（当前刀柄所有刀柄图片的url）<br/>
		  &nbsp;&nbsp;"array_PictureDetailTurningHolder" : String pictureDetailTurningHolder的详细图片url（以,分割）（当前刀柄所有详细图片url）<br/>
		  &nbsp;&nbsp;"array_InformDetailTurningHolder" : String informDetailTurningHolderList的详细信息url（以,分割）（当前刀柄所有详细信息url）<br/>
		  &nbsp;&nbsp;"array_InformDetailTurningHolder_name" : String informDetailTurningHolderList的详细信息文件名称（以,分割）（当前刀柄所有详细信息文件名称）<br/>
	  }
	</td>
  </tr>
  <tr>
    <td>15</td>
    <td>删除车刀数据-刀柄</td>
    <td>/turningHolderApp/goAddTurningHolderdeleteTurningHolder</td>
    <td>
      String id 刀柄id(id_TurningHolder) 
    </td>
    <td>
      {
		  &nbsp;&nbsp;"result":"1", （1 操作成功 0 操作失败）<br/>
		  &nbsp;&nbsp;"msg": 返回信息<br/>
	  }
	</td>
  </tr>
  <tr>
    <td>
   			16
    </td>
    <td>
    		查询刀片列表
    </td>
    <td>
    		/turningBladeApp/queryTurningBladeList
    </td>
    <td>
     		int pageNo 第几页<br/> 
     		int pageSize 每页几条<br/> 
			String NumberTurningBlade 刀片编号<br/>
			String TypeBTADrill 刀片类型(1 外圆切削  2 内孔切削 3 超硬刀具 4 重型加工刀片)<br/>
			String ISOBladeTurning ISO基准刀片<br/>
			String ToolCoatBladeTurning 刀片涂层<br/>
			String ToolMaterialBladeTurning 刀片材料<br/>
			String MachiningTypeBladeTurning 加工类别<br/>
			String ToolBladeFeatureTurning 刀片加工特点<br/>
			String CompanyTurningBlade 刀片厂商<br/>
			String MateriaBladeTurning 加工材料<br/>
    </td>
    <td>
     		{<br/>
  			&nbsp;&nbsp;"result":"1",(1 操作成功 0 操作失败)<br/>
  			&nbsp;&nbsp;"list":{<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"id_TurningBlade":int<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"NumberTurningBlade":String 刀片编号<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"TypeBTADrill":String 刀片类型(1 外圆切削 2 内孔切削 3 超硬刀具 4 重型加工刀片)<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"NameTurningBlade":String 刀片名称<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISOBladeTurning":String ISO基准刀片<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ToolCoatBladeTurning":String 刀片涂层<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ToolMaterialBladeTurning":String 刀具材料<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"MachiningTypeBladeTurning":String 加工类别(1 精加工 2 粗加工 3 半精加工)<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ToolBladeFeatureTurning":String 刀片加工特点<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"CompanyTurningBlade":String 刀片厂商<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"QianjiaoBladeTurning":double 前角<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"HoujiaoBladeTurning":double 后角<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"HoujisojiaoBladeTurning":double 刃倾角<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"NoseRadiusTurning":double 刀尖圆弧半径<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"BreakerBladeTurning":String 断屑槽类型<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"MateriaBladeTurning":String 加工材料<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"isPMKNS":String （传值类似为"P,M,N"）P 加工P , M 加工M , K 加工K , N 加工N , S 加工S<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISOPBladeTurning":String 加工P<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISOPTextBladeTurning":String 加工P参数<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISOMBladeTurning":String 加工M<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISOMTextBladeTurning":String 加工M参数<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISOKBladeTurning":String 加工K<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISOKTextBladeTurning":String 加工K参数<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISONBladeTurning":String 加工N<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISONTextBladeTurning": String 加工N参数<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOSBladeTurning":String 加工S<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOSTextBladeTurning":String 加工S参数<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"add_time":bigint 添加时间<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"user_id":int 用户id<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"pictureBladeTurningList":{<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_PictureBladeTurning":int<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_TurningBlade":int TurningBlade.id_TurningBlade<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_PictureBladeTurning":String 刀片图片url<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"pictureDetailBladeTurningList":{<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_PictureDetailBladeTurning":int<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_TurningBlade":int TurningBlade.id_TurningBlade<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_PictureDetailBladeTurning":String 详细图片url<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"informDetailBladeTurningList":{<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_InformDetailBladeTurning":int <br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_TurningBlade":int TurningBlade.id_TurningBlade<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_InformDetailBladeTurning":String 详细信息url<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"name_InformDetailBladeTurning":String 详细信息文件名称<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"applicationBladeTurningList":{<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_ApplicationBladeTurning":int <br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_TurningBlade":int TurningBlade.id_TurningBlade<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_ApplicationBladeTurning":String 应用实例url<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"name_ApplicationBladeTurning":String 应用实例文件名称<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
  			&nbsp;&nbsp;}<br/>
  			&nbsp;&nbsp;"page":{<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;pageCount : int 总页数<br/>
  			&nbsp;&nbsp;}<br/>
  			&nbsp;&nbsp;"para":{<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;NumberTurningBlade:String 刀片编号<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;TypeBTADrill:String 刀片类型(1 外圆切削  2 内孔切削 3 超硬刀具 4 重型加工刀片)<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;ISOBladeTurning:String ISO基准刀片<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;ToolCoatBladeTurning:String 刀片涂层<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;ToolMaterialBladeTurning:String 刀具材料<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;MachiningTypeBladeTurning:String 加工类别(1 精加工 2  粗加工 3 半精加工)<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;ToolBladeFeatureTurning：String 刀片加工特点<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;CompanyTurningBlade：String 刀片厂商<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;MateriaBladeTurning：String 加工材料<br/>
  			&nbsp;&nbsp;}<br/>
     		}<br/>
	</td>
  </tr>
  <tr>
  	<td>
  		17
  	</td>
  	<td>
  		查询刀片详细信息
  	</td>
  	<td>
  		/turningBladeApp/goAddTurningBlade
  	</td>
  	<td>
  		String id 刀片ID(id_TurningBlade)<br/>
  	</td>
  	<td>
  		{<br/>
  			&nbsp;&nbsp;"result":"1",<br/>
  			&nbsp;&nbsp;"turningBlade":{<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"id_TurningBlade":int<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"NumberTurningBlade":String 刀片编号<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"TypeBTADrill":String 刀片类型(1 外圆切削 2 内孔切削 3 超硬刀具 4 重型加工刀片)<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"NameTurningBlade":String 刀片名称<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISOBladeTurning":String ISO基准刀片<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ToolCoatBladeTurning":String 刀片涂层<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ToolMaterialBladeTurning":String 刀具材料<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"MachiningTypeBladeTurning":String 加工类别(1 精加工 2 粗加工 3 半精加工)<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ToolBladeFeatureTurning":String 刀片加工特点<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"CompanyTurningBlade":String 刀片厂商<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"QianjiaoBladeTurning":double 前角<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"HoujiaoBladeTurning":double 后角<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"HoujisojiaoBladeTurning":double 刃倾角<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"NoseRadiusTurning":double 刀尖圆弧半径<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"BreakerBladeTurning":String 断屑槽类型<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"MateriaBladeTurning":String 加工材料<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"isPMKNS":String （传值类似为"P,M,N"）P 加工P , M 加工M , K 加工K , N 加工N , S 加工S<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISOPBladeTurning":String 加工P<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISOPTextBladeTurning":String 加工P参数<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISOMBladeTurning":String 加工M<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISOMTextBladeTurning":String 加工M参数<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISOKBladeTurning":String 加工K<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISOKTextBladeTurning":String 加工K参数<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISONBladeTurning":String 加工N<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;"ISONTextBladeTurning": String 加工N参数<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOSBladeTurning":String 加工S<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"ISOSTextBladeTurning":String 加工S参数<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"add_time":bigint 添加时间<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"user_id":int 用户id<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"pictureBladeTurningList":{<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_PictureBladeTurning":int<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_TurningBlade":int TurningBlade.id_TurningBlade<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_PictureBladeTurning":String 刀片图片url<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"pictureDetailBladeTurningList":{<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_PictureDetailBladeTurning":int<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_TurningBlade":int TurningBlade.id_TurningBlade<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_PictureDetailBladeTurning":String 详细图片url<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"informDetailBladeTurningList":{<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_InformDetailBladeTurning":int <br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_TurningBlade":int TurningBlade.id_TurningBlade<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_InformDetailBladeTurning":String 详细信息url<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"name_InformDetailBladeTurning":String 详细信息文件名称<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;"applicationBladeTurningList":{<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_ApplicationBladeTurning":int <br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_TurningBlade":int TurningBlade.id_TurningBlade<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_ApplicationBladeTurning":String 应用实例url<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"name_ApplicationBladeTurning":String 应用实例文件名称<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
  			&nbsp;&nbsp;}<br/>
  			&nbsp;&nbsp;"ISOList" : List\ 用于ISO字段加载已有信息，做类似百度筛选列表用 <br/>
  			&nbsp;&nbsp;"array_PictureBladeTurning":String PictureBladeTurningList的刀具图片url（以,分割）<br/>
    		&nbsp;&nbsp;"array_PictureDetailBladeTurning":String PictureDetailBladeTurningList的详细图片url（以,分割）<br/>
    		&nbsp;&nbsp;"array_InformDetailBladeTurning":String InformDetailBladeTurningList的详细信息url（以,分割）<br/>
    		&nbsp;&nbsp;"array_InformDetailBladeTurning_name":String InformDetailBladeTurning的详细信息文件名称（以,分割）<br/>
   			&nbsp;&nbsp;"array_ApplicationBladeTurning":String ApplicationBladeTurningList的应用实例url（以,分割）<br/>
    		&nbsp;&nbsp;"array_ApplicationBladeTurning_name":String ApplicationBladeTurningList的应用实例文件名称（以,分割）<br/>
    		&nbsp;&nbsp;"ISOBladeTurning":String ISO基准刀片<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		18
  	</td>
  	<td>
  		添加刀片信息
  	</td>
  	<td>
  		/turningBladeApp/saveTurningBlade
  	</td>
  	<td>
  			String user_id 当前登录用户的用户id（未登录传"0"）<br/>
			int id_TurningBlade 刀片id(id_TurningBlade)<br/>
			String NumberTurningBlade 刀片编号<br/>
			String TypeBTADrill 刀片类型(1 外圆切削  2 内孔切削 3 超硬刀具 4 重型加工刀片)<br/>
			String NameTurningBlade 刀片名称<br/>
			String ISOBladeTurning ISO基准刀片<br/>
			String ToolCoatBladeTurning 刀片涂层<br/>
			String ToolMaterialBladeTurning 刀具材料<br/>
			String MachiningTypeBladeTurning 加工类别(1 精加工 2 粗加工 3 半精加工)<br/>
			String ToolBladeFeatureTurning 刀片加工特点<br/>
			String CompanyTurningBlade 刀片厂商<br/>
			String QianjiaoBladeTurning 前角<br/>
			String HoujiaoBladeTurning 后角 <br/>
			String HoujisojiaoBladeTurning 刃倾角<br/>
			String NoseRadiusTurning 刀尖圆弧半径<br/>
			String BreakerBladeTurning 断屑槽类型<br/>
			String MateriaBladeTurning 加工材<br/>
			String isPMKNS (传值类似为"P,M,N")(P加工P , M加工M , K加工K , N加工N , S加工S) <br/>
			String ISOPBladeTurning 加工P<br/>
			String ISOPTextBladeTurning 加工P参数<br/>
			String ISOMBladeTurning 加工M<br/>
			String ISOMTextBladeTurning 加工M参数 <br/>
			String ISOKBladeTurning 加工K<br/>
			String ISOKTextBladeTurning 加工K参数 <br/>
			String ISONBladeTurning 加工N<br/>
			String ISONTextBladeTurning 加工N参数 <br/>
			String ISOSBladeTurning 加工S<br/>
			String ISOSTextBladeTurning 加工S参数 <br/>
			String array_PictureBladeTurning 刀具图片url (以,分割)(当前所有刀片图片的ur)<br/>
			String array_PictureDetailBladeTurning 详细图片url (以,分割)(当前所有刀片的详细图片的url)<br/>
			String array_InformDetailBladeTurning 详细信息url (以,分割)(当前所有刀片的详细信息的url)<br/>
			String array_InformDetailBladeTurning_name 详细信息文件名称  (以,分割)(当前所有刀片的详细信息文件名称)<br/>
			String array_ApplicationBladeTurning 应用实例url (以,分割)(当前所有刀片的应用实例的url)<br/>
			String array_ApplicationBladeTurning_name 应用实例文件名称(以,分割)(当前所有刀片的应用实例文件名称)<br/>
  	</td>
  	<td>
  		{<br/>
 		&nbsp;&nbsp;"result":"1", （1 操作成功 0 操作失败）<br/>
  		&nbsp;&nbsp;"msg": 返回信息<br/>
		}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  		19
  	</td>
  	<td>
  		保存刀具图片
  	</td>
  	<td>
  		/turningBladeApp/savePictureBladeTurning
  	</td>
  	<td>
  			String array_PictureBladeTurning 刀具图片url (以,分割)(当前所有刀片图片的ur)<br/>
			String array_PictureDetailBladeTurning 详细图片url (以,分割)(当前所有刀片的详细图片的url)<br/>
			String array_InformDetailBladeTurning 详细信息url (以,分割)(当前所有刀片的详细信息的url)<br/>
			String array_InformDetailBladeTurning_name 详细信息文件名称  (以,分割)(当前所有刀片的详细信息文件名称)<br/>
			String array_ApplicationBladeTurning 应用实例url (以,分割)(当前所有刀片的应用实例的url)<br/>
			String array_ApplicationBladeTurning_name 应用实例文件名称(以,分割)(当前所有刀片的应用实例文件名称)<br/>
			String PictureBladeTurning 刀具图片文件<br/>
			String fileSuffix 刀具图片文件后缀 (类似jpg，gif)<br/>
			String filename 刀具图片文件名(带后缀)(类似1.jpg)<br/>
  	</td>
  	<td>
  		{<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"result":"1", (1 操作成功 0 操作失败)<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_PictureBladeTurning":String PictureBladeTurningList的刀具图片url（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_PictureDetailBladeTurning":String PictureDetailBladeTurningList的详细图片url（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_InformDetailBladeTurning":String InformDetailBladeTurningList的详细信息url（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_InformDetailBladeTurning_name":String InformDetailBladeTurning的详细信息文件名称（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_ApplicationBladeTurning":String ApplicationBladeTurningList的应用实例url（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_ApplicationBladeTurning_name":String ApplicationBladeTurningList的应用实例文件名称（以,分割）<br/>
		}<br/>
  	</td>
  </tr>
  
  
  
  <tr>
  	<td>
  		20
  	</td>
  	<td>
  		保存详细图片
  	</td>
  	<td>
  		/turningBladeApp/savePictureDetailBladeTurning
  	</td>
  	<td>
  			String array_PictureBladeTurning 刀具图片url (以,分割)(当前所有刀片图片的ur)<br/>
			String array_PictureDetailBladeTurning 详细图片url (以,分割)(当前所有刀片的详细图片的url)<br/>
			String array_InformDetailBladeTurning 详细信息url (以,分割)(当前所有刀片的详细信息的url)<br/>
			String array_InformDetailBladeTurning_name 详细信息文件名称  (以,分割)(当前所有刀片的详细信息文件名称)<br/>
			String array_ApplicationBladeTurning 应用实例url (以,分割)(当前所有刀片的应用实例的url)<br/>
			String array_ApplicationBladeTurning_name 应用实例文件名称(以,分割)(当前所有刀片的应用实例文件名称)<br/>
			String PictureDetailBladeTurning 详细图片文件<br/>
			String fileSuffix 详细图片文件后缀 (类似jpg，gif)<br/>
			String filename 详细图片文件名(带后缀)(类似1.jpg)<br/>
  	</td>
  	<td>
  		{<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"result":"1", (1 操作成功 0 操作失败)<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_PictureBladeTurning":String PictureBladeTurningList的刀具图片url（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_PictureDetailBladeTurning":String PictureDetailBladeTurningList的详细图片url（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_InformDetailBladeTurning":String InformDetailBladeTurningList的详细信息url（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_InformDetailBladeTurning_name":String InformDetailBladeTurning的详细信息文件名称（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_ApplicationBladeTurning":String ApplicationBladeTurningList的应用实例url（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_ApplicationBladeTurning_name":String ApplicationBladeTurningList的应用实例文件名称（以,分割）<br/>
		}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  		21
  	</td>
  	<td>
  		保存应用实例
  	</td>
  	<td>
  		/turningBladeApp/saveApplicationBladeTurning
  	</td>
  	<td>
  			String array_PictureBladeTurning 刀具图片url (以,分割)(当前所有刀片图片的ur)<br/>
			String array_PictureDetailBladeTurning 详细图片url (以,分割)(当前所有刀片的详细图片的url)<br/>
			String array_InformDetailBladeTurning 详细信息url (以,分割)(当前所有刀片的详细信息的url)<br/>
			String array_InformDetailBladeTurning_name 详细信息文件名称  (以,分割)(当前所有刀片的详细信息文件名称)<br/>
			String array_ApplicationBladeTurning 应用实例url (以,分割)(当前所有刀片的应用实例的url)<br/>
			String array_ApplicationBladeTurning_name 应用实例文件名称(以,分割)(当前所有刀片的应用实例文件名称)<br/>
			String ApplicationBladeTurning 应用实例文件<br/>
			String fileSuffix 应用实例文件后缀 (类似jpg，gif)<br/>
			String filename 应用实例文件名(带后缀)(类似1.jpg)<br/>
  	</td>
  	<td>
  		{<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"result":"1", (1 操作成功 0 操作失败)<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_PictureBladeTurning":String PictureBladeTurningList的刀具图片url（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_PictureDetailBladeTurning":String PictureDetailBladeTurningList的详细图片url（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_InformDetailBladeTurning":String InformDetailBladeTurningList的详细信息url（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_InformDetailBladeTurning_name":String InformDetailBladeTurning的详细信息文件名称（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_ApplicationBladeTurning":String ApplicationBladeTurningList的应用实例url（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_ApplicationBladeTurning_name":String ApplicationBladeTurningList的应用实例文件名称（以,分割）<br/>
		}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  		22
  	</td>
  	<td>
  		保存详细信息
  	</td>
  	<td>
  		/turningBladeApp/saveInformDetailBladeTurning
  	</td>
  	<td>
  			String array_PictureBladeTurning 刀具图片url (以,分割)(当前所有刀片图片的ur)<br/>
			String array_PictureDetailBladeTurning 详细图片url (以,分割)(当前所有刀片的详细图片的url)<br/>
			String array_InformDetailBladeTurning 详细信息url (以,分割)(当前所有刀片的详细信息的url)<br/>
			String array_InformDetailBladeTurning_name 详细信息文件名称  (以,分割)(当前所有刀片的详细信息文件名称)<br/>
			String array_ApplicationBladeTurning 应用实例url (以,分割)(当前所有刀片的应用实例的url)<br/>
			String array_ApplicationBladeTurning_name 应用实例文件名称(以,分割)(当前所有刀片的应用实例文件名称)<br/>
			String InformDetailBladeTurning 详细信息文件<br/>
			String fileSuffix 详细信息文件后缀 (类似jpg，gif)<br/>
			String filename 详细信息文件名(带后缀)(类似1.jpg)<br/>
  	</td>
  	<td>
  		{<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"result":"1", (1 操作成功 0 操作失败)<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_PictureBladeTurning":String PictureBladeTurningList的刀具图片url（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_PictureDetailBladeTurning":String PictureDetailBladeTurningList的详细图片url（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_InformDetailBladeTurning":String InformDetailBladeTurningList的详细信息url（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_InformDetailBladeTurning_name":String InformDetailBladeTurning的详细信息文件名称（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_ApplicationBladeTurning":String ApplicationBladeTurningList的应用实例url（以,分割）<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;"array_ApplicationBladeTurning_name":String ApplicationBladeTurningList的应用实例文件名称（以,分割）<br/>
		}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  		23
  	</td>
  	<td>
  		删除刀片数据
  	</td>
  	<td>
  		/turningBladeApp/deleteTurningBlade
  	</td>
  	<td>
  		String id_TurningBlade 刀片id(id_TurningBlade)<br/>
  	</td>
  	<td>
  		{<br/>
 		&nbsp;&nbsp;"result":"1", （1 操作成功 0 操作失败）<br/>
  		&nbsp;&nbsp;"msg": 返回信息<br/>
		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		24
  	</td>
  	<td>
  		查询工件材料列表
  	</td>
  	<td>
  		/materialApp/queryMaterialList
  	</td>
  	<td>
  			int pageNo 第几页<br/>
  			int pageSize 每页几条 <br/>
			String NameMaterial 材料名称<br/>
			String NumberMaterial 材料牌号<br/>
			String id_CategoryMaterial 材料类别id<br/>
			String ISOCuttingMaterial ISO加工分类<br/>
			String CategoryMaterial 热处理方式<br/>
			String CompanyMaterial 供应商<br/>
  	</td>
  	<td>
  			{<br/>
  			&nbsp;&nbsp;"result":"1"<br/>
  			&nbsp;&nbsp;"page" : {<br/>
    		&nbsp;&nbsp;&nbsp;&nbsp;	pageCount : int 总页数<br/>
  			&nbsp;&nbsp;}<br/>
  			&nbsp;&nbsp;"list":{<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	id_Material: int<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	NameMaterial: String 材料名称<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	NumberMaterial ： String 材料牌号<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	id_CategoryMaterial： String 材料类别id<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	ISOCuttingMaterial：String ISO加工分类 <br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	CategoryMaterial ：String 热处理方式<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	CompanyMaterial ： String 供应商<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	ConstituentsMaterial：String 材料主要成分(元素-百分比，  例如{1-1,2-2，}) <br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	MachineableMaterial ：String 材料加工性<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	DensityMaterial ：String 材料密度 <br/>
	     	&nbsp;&nbsp;&nbsp;&nbsp;	ModulusMaterial： String 弹性模量<br/>
	     	&nbsp;&nbsp;&nbsp;&nbsp;	HardnessMaterial： String 材料硬度<br/>
	     	&nbsp;&nbsp;&nbsp;&nbsp;	ConductivityMaterial ：String 材料热导率<br/>
	     	&nbsp;&nbsp;&nbsp;&nbsp;	SpecificheatMaterial： String 材料比热<br/>
	     	&nbsp;&nbsp;&nbsp;&nbsp;	StrengthMaterial ：String 抗拉强度<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	ThermalExpansionMaterial ：String 热膨胀系数<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	JCMaterial： String JC模型(ABnCm)(A,B,n,C,m  例如1,2,,4,5,)<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	StrainRate:String 应变率(数据点-温度-应变-应变率,例如{1-1-1-1，2-2-2-2，})<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	add_time： bigint 添加时间<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	user_id ：int 用户id<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	pictureMaterialList ：{<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		id_PictureMaterial ： int <br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		id_Material ：  int WorkpieceMaterial.id_material <br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		url_PictureMaterial ： String 素材图片url<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	}<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	informDetailMaterialList：{<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		id_InformDetailMaterial：int<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		id_Material: int WorkpieceMaterial.id_material<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		url_InformDetailMaterial: String 详细信息url <br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		name_InformDetailMaterial: String 详细信息名称<br/>
		    &nbsp;&nbsp;&nbsp;&nbsp;	}<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	applicationMaterialList：{<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	id_ApplicationMaterial:int <br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	id_Material : int WorkpieceMaterial.id_material<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	url_ApplicationMaterial: String 应用实例url<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	name_ApplicationMaterial: String 应用实例名称<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;simulationMaterialList：{<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	d_SimulationMaterial:int<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	id_Material : int WorkpieceMaterial.id_material<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	url_SimulationMaterial : String 仿真参数url <br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	name_SimulationMaterial : String 仿真参数名称<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	}<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;ConstituentsMaterialList：{<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	yuansu : String 元素<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	baifenbi : String 百分比<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;StrainRateList：{<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	shujudian：String 数据点<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	wendu： String 温度<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	yingbian：String 应变<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;yingbianlv：String 应变率<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;JCMaterials ： String[] JC模型<br/>
  			&nbsp;&nbsp;}<br/>
  			&nbsp;&nbsp;"categoryMaterialList":{<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	id_CategoryMaterial: int 材料类别id<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	name_CategoryMaterial : String 材料类别名称<br/>
  			&nbsp;&nbsp;}<br/>
  			&nbsp;&nbsp;"para":{<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	NameMaterial: String 材料名称<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	NumberMaterial ： String 材料牌号<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	id_CategoryMaterial： String 材料类别id<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	ISOCuttingMaterial：String ISO加工分类 <br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	CategoryMaterial ：String 热处理方式<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	CompanyMaterial ： String 供应商<br/>
  			&nbsp;&nbsp;}<br/>
  			}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  		25
  	</td>
  	<td>
  		查询工件材料详细信息
  	</td>
  	<td>
  		/materialApp/goAddMaterial
  	</td>
  	<td>
  		String id 材料ID(id_Material)
  	</td>
  	<td>
  		{<br>
  		&nbsp;&nbsp;"result":"1" <br>
  		&nbsp;&nbsp;"material":{<br>
  			&nbsp;&nbsp;&nbsp;&nbsp;	id_Material: int<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	NameMaterial: String 材料名称<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	NumberMaterial ： String 材料牌号<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	id_CategoryMaterial： String 材料类别id<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	ISOCuttingMaterial：String ISO加工分类 <br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	CategoryMaterial ：String 热处理方式<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	CompanyMaterial ： String 供应商<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	ConstituentsMaterial：String 材料主要成分(元素-百分比，  例如{1-1,2-2，}) <br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	MachineableMaterial ：String 材料加工性<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	DensityMaterial ：String 材料密度 <br/>
	     	&nbsp;&nbsp;&nbsp;&nbsp;	ModulusMaterial： String 弹性模量<br/>
	     	&nbsp;&nbsp;&nbsp;&nbsp;	HardnessMaterial： String 材料硬度<br/>
	     	&nbsp;&nbsp;&nbsp;&nbsp;	ConductivityMaterial ：String 材料热导率<br/>
	     	&nbsp;&nbsp;&nbsp;&nbsp;	SpecificheatMaterial： String 材料比热<br/>
	     	&nbsp;&nbsp;&nbsp;&nbsp;	StrengthMaterial ：String 抗拉强度<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	ThermalExpansionMaterial ：String 热膨胀系数<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	JCMaterial： String JC模型(ABnCm)(A,B,n,C,m  例如1,2,,4,5,)<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	StrainRate:String 应变率(数据点-温度-应变-应变率,例如{1-1-1-1，2-2-2-2，})<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	add_time： bigint 添加时间<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	user_id ：int 用户id<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	pictureMaterialList ：{<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		id_PictureMaterial ： int <br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		id_Material ：  int WorkpieceMaterial.id_material <br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		url_PictureMaterial ： String 素材图片url<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	}<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	informDetailMaterialList：{<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		id_InformDetailMaterial：int<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		id_Material: int WorkpieceMaterial.id_material<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		url_InformDetailMaterial: String 详细信息url <br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		name_InformDetailMaterial: String 详细信息名称<br/>
		    &nbsp;&nbsp;&nbsp;&nbsp;	}<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	applicationMaterialList：{<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	id_ApplicationMaterial:int <br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	id_Material : int WorkpieceMaterial.id_material<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	url_ApplicationMaterial: String 应用实例url<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	name_ApplicationMaterial: String 应用实例名称<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;simulationMaterialList：{<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	d_SimulationMaterial:int<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	id_Material : int WorkpieceMaterial.id_material<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	url_SimulationMaterial : String 仿真参数url <br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	name_SimulationMaterial : String 仿真参数名称<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;	}<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;ConstituentsMaterialList：{<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	yuansu : String 元素<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	baifenbi : String 百分比<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;StrainRateList：{<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	shujudian：String 数据点<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	wendu： String 温度<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	yingbian：String 应变<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;yingbianlv：String 应变率<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;}<br/>
		   	&nbsp;&nbsp;&nbsp;&nbsp;JCMaterials ： String[] JC模型<br/>
  			&nbsp;&nbsp;}<br/>
  			&nbsp;&nbsp;"categoryMaterialList":{<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	id_CategoryMaterial: int 材料类别id<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	name_CategoryMaterial : String 材料类别名称<br/>
  			&nbsp;&nbsp;}<br/>
  			&nbsp;&nbsp;"array_PictureMaterial":String pictureMaterialList的材料图片url（以，分割）<br/>
  			&nbsp;&nbsp;"array_InformDetailMaterial":informDetailMaterialList的详细信息url（以，分割）<br/>
  			&nbsp;&nbsp;"array_InformDetailMaterial_name":informDetailMaterialList的详细信息名字（以，分割）<br/>
  			&nbsp;&nbsp;"array_ApplicationMaterial":applicationMaterialList的应用实例url（以，分割）<br/>
  			&nbsp;&nbsp;"array_ApplicationMaterial_name":applicationMaterialList的应用实例名字（以，分割）<br/>
  			&nbsp;&nbsp;"array_SimulationMaterial":simulationMaterialList的仿真参数url（以，分割）<br/>
  			&nbsp;&nbsp;"array_SimulationMaterial_name":simulationMaterialList的仿真参数名字（以，分割）<br/>
  		}<br>
  	</td>
  </tr>
  <tr>
  	<td>
  		26
  	</td>
  	<td>
  		保存工件材料信息
  	</td>
  	<td>
  		/materialApp/saveMaterial
  	</td>
  	<td>
  			String user_id 当前登录用户的用户id（未登录传"0"）<br/>
			int id_Material  材料id<br/>
			String array_PictureMaterial  材料图片的url(以,分割)(当前所有材料图片的url)<br/>
			String array_InformDetailMaterial  详细信息url(以,分割)(当前所有详细信息的url)<br/>
			String array_InformDetailMaterial_name  详细信息名字(以,分割)(当前所有详细信息名字)<br/>
			String array_ApplicationMaterial  应用实例url(以,分割)(当前所有应用实例url)<br/>
			String array_ApplicationMaterial_name  应用实例名字(以,分割)(当前所有应用实例名字)<br/>
			String array_SimulationMaterial  仿真参数url(以,分割)(当前所有仿真参数url)<br/>
			String array_SimulationMaterial_name  仿真参数名字(以,分割)(当前所有仿真参数名字)<br/>
			String NameMaterial 材料名称<br/>
			String NumberMaterial 材料牌号<br/>
			String id_CategoryMaterial 材料类别id(CategoryMaterial.id_CategoryMaterial)<br/>
			String ISOCuttingMaterial ISO加工分类(PMKNSH)<br/>
			String CategoryMaterial 热处理方式<br/>
			String CompanyMaterial 供应商<br/>
			String ConstituentsMaterial 材料主要成分(元素-百分比，  例如{1-1,2-2，})<br/>
			String MachineableMaterial 材料加工性<br/>
			String DensityMaterial 材料密度<br/>
			String ModulusMaterial 弹性模量<br/>
			String HardnessMaterial 材料硬度<br/>
			String ConductivityMaterial	材料热导率<br/>
			String SpecificheatMaterial 材料比热<br/>
			String StrengthMaterial 抗拉强度<br/>
			String ThermalExpansionMaterial 热膨胀系数<br/>
			String JCMaterial JC模型(ABnCm)(A,B,n,C,m  例如1,2,,4,5,)<br/>
			String StrainRate 应变率(数据点-温度-应变-应变率，  例如{1-1-1-1，2-2-2-2，})<br/>
  	</td>
  	<td>
  			{<br/>
 			&nbsp;&nbsp; "result":"1", （1 操作成功 0 操作失败）<br/>
 			&nbsp;&nbsp; "msg": 返回信息<br/>
			}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  		27
  	</td>
  	<td>
  		保存材料图片
  	</td>
  	<td>
  		/materialApp/savePictureMaterial
  	</td>
  	<td>
			String array_PictureMaterial  材料图片的url(以,分割)(当前所有材料图片的url)<br/>
			String array_InformDetailMaterial  详细信息url(以,分割)(当前所有详细信息的url)<br/>
			String array_InformDetailMaterial_name  详细信息名字(以,分割)(当前所有详细信息名字)<br/>
			String array_ApplicationMaterial  应用实例url(以,分割)(当前所有应用实例url)<br/>
			String array_ApplicationMaterial_name  应用实例名字(以,分割)(当前所有应用实例名字)<br/>
			String array_SimulationMaterial  仿真参数url(以,分割)(当前所有仿真参数url)<br/>
			String array_SimulationMaterial_name  仿真参数名字(以,分割)(当前所有仿真参数名字)<br/>
			String PictureMaterial 材料图片文件<br/>
			String fileSuffix 材料图片文件后缀(类似jpg，gif)<br/>
			String filename 材料图片文件名(带后缀)(类似1.jpg)<br/>
  	</td>
  	<td>	{<br/>
  			&nbsp;&nbsp;"result":"1", （1 操作成功 0 操作失败）<br/>
  			&nbsp;&nbsp;"categoryMaterialList":{<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	id_CategoryMaterial: int 材料类别id<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	name_CategoryMaterial : String 材料类别名称<br/>
  			&nbsp;&nbsp;}<br/>
  			&nbsp;&nbsp;"array_PictureMaterial":String pictureMaterialList的材料图片url（以，分割）<br/>
  			&nbsp;&nbsp;"array_InformDetailMaterial":informDetailMaterialList的详细信息url（以，分割）<br/>
  			&nbsp;&nbsp;"array_InformDetailMaterial_name":informDetailMaterialList的详细信息名字（以，分割）<br/>
  			&nbsp;&nbsp;"array_ApplicationMaterial":applicationMaterialList的应用实例url（以，分割）<br/>
  			&nbsp;&nbsp;"array_ApplicationMaterial_name":applicationMaterialList的应用实例名字（以，分割）<br/>
  			&nbsp;&nbsp;"array_SimulationMaterial":simulationMaterialList的仿真参数url（以，分割）<br/>
  			&nbsp;&nbsp;"array_SimulationMaterial_name":simulationMaterialList的仿真参数名字（以，分割）<br/>
  			}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  		28
  	</td>
  	<td>
  		保存详细信息
  	</td>
  	<td>
  		/materialApp/saveInformDetailMaterial
  	</td>
  	<td>
  			String array_PictureMaterial  材料图片的url(以,分割)(当前所有材料图片的url)<br/>
			String array_InformDetailMaterial  详细信息url(以,分割)(当前所有详细信息的url)<br/>
			String array_InformDetailMaterial_name  详细信息名字(以,分割)(当前所有详细信息名字)<br/>
			String array_ApplicationMaterial  应用实例url(以,分割)(当前所有应用实例url)<br/>
			String array_ApplicationMaterial_name  应用实例名字(以,分割)(当前所有应用实例名字)<br/>
			String array_SimulationMaterial  仿真参数url(以,分割)(当前所有仿真参数url)<br/>
			String array_SimulationMaterial_name  仿真参数名字(以,分割)(当前所有仿真参数名字)<br/>
			String InformDetailMaterial 详细信息文件<br/>
			String fileSuffix 详细信息文件后缀(类似jpg，gif)<br/>
			String filename 详细信息文件名(带后缀)(类似1.jpg)<br/>
  	</td>
  	<td>
  			{<br/>
  			&nbsp;&nbsp;"result":"1", （1 操作成功 0 操作失败）<br/>
  			&nbsp;&nbsp;"categoryMaterialList":{<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	id_CategoryMaterial: int 材料类别id<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	name_CategoryMaterial : String 材料类别名称<br/>
  			&nbsp;&nbsp;}<br/>
  			&nbsp;&nbsp;"array_PictureMaterial":String pictureMaterialList的材料图片url（以，分割）<br/>
  			&nbsp;&nbsp;"array_InformDetailMaterial":informDetailMaterialList的详细信息url（以，分割）<br/>
  			&nbsp;&nbsp;"array_InformDetailMaterial_name":informDetailMaterialList的详细信息名字（以，分割）<br/>
  			&nbsp;&nbsp;"array_ApplicationMaterial":applicationMaterialList的应用实例url（以，分割）<br/>
  			&nbsp;&nbsp;"array_ApplicationMaterial_name":applicationMaterialList的应用实例名字（以，分割）<br/>
  			&nbsp;&nbsp;"array_SimulationMaterial":simulationMaterialList的仿真参数url（以，分割）<br/>
  			&nbsp;&nbsp;"array_SimulationMaterial_name":simulationMaterialList的仿真参数名字（以，分割）<br/>
  			}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  		29
  	</td>
  	<td>
  		保存应用实例
  	</td>
  	<td>
  		/materialApp/saveApplicationMaterial
  	</td>
  	<td>
  			String array_PictureMaterial  材料图片的url(以,分割)(当前所有材料图片的url)<br/>
			String array_InformDetailMaterial  详细信息url(以,分割)(当前所有详细信息的url)<br/>
			String array_InformDetailMaterial_name  详细信息名字(以,分割)(当前所有详细信息名字)<br/>
			String array_ApplicationMaterial  应用实例url(以,分割)(当前所有应用实例url)<br/>
			String array_ApplicationMaterial_name  应用实例名字(以,分割)(当前所有应用实例名字)<br/>
			String array_SimulationMaterial  仿真参数url(以,分割)(当前所有仿真参数url)<br/>
			String array_SimulationMaterial_name  仿真参数名字(以,分割)(当前所有仿真参数名字)<br/>
			String ApplicationMaterial 应用实例文件<br/>
			String fileSuffix 应用实例文件后缀(类似jpg，gif)<br/>
			String filename 应用实例文件名(带后缀)(类似1.jpg)<br/>
  	</td>
  	<td>
  			{<br/>
  			&nbsp;&nbsp;"result":"1", （1 操作成功 0 操作失败）<br/>
  			&nbsp;&nbsp;"categoryMaterialList":{<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	id_CategoryMaterial: int 材料类别id<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	name_CategoryMaterial : String 材料类别名称<br/>
  			&nbsp;&nbsp;}<br/>
  			&nbsp;&nbsp;"array_PictureMaterial":String pictureMaterialList的材料图片url（以，分割）<br/>
  			&nbsp;&nbsp;"array_InformDetailMaterial":informDetailMaterialList的详细信息url（以，分割）<br/>
  			&nbsp;&nbsp;"array_InformDetailMaterial_name":informDetailMaterialList的详细信息名字（以，分割）<br/>
  			&nbsp;&nbsp;"array_ApplicationMaterial":applicationMaterialList的应用实例url（以，分割）<br/>
  			&nbsp;&nbsp;"array_ApplicationMaterial_name":applicationMaterialList的应用实例名字（以，分割）<br/>
  			&nbsp;&nbsp;"array_SimulationMaterial":simulationMaterialList的仿真参数url（以，分割）<br/>
  			&nbsp;&nbsp;"array_SimulationMaterial_name":simulationMaterialList的仿真参数名字（以，分割）<br/>
  			}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  		30
  	</td>
  	<td>
  		保存仿真参数
  	</td>
  	<td>
  		/materialApp/saveSimulationMaterial
  	</td>
  	<td>
  			String array_PictureMaterial  材料图片的url(以,分割)(当前所有材料图片的url)<br/>
			String array_InformDetailMaterial  详细信息url(以,分割)(当前所有详细信息的url)<br/>
			String array_InformDetailMaterial_name  详细信息名字(以,分割)(当前所有详细信息名字)<br/>
			String array_ApplicationMaterial  应用实例url(以,分割)(当前所有应用实例url)<br/>
			String array_ApplicationMaterial_name  应用实例名字(以,分割)(当前所有应用实例名字)<br/>
			String array_SimulationMaterial  仿真参数url(以,分割)(当前所有仿真参数url)<br/>
			String array_SimulationMaterial_name  仿真参数名字(以,分割)(当前所有仿真参数名字)<br/>
			String SimulationMaterial 仿真参数文件<br/>
			String fileSuffix 仿真参数文件后缀(类似jpg，gif)<br/>
			String filename 仿真参数文件名(带后缀)(类似1.jpg)<br/>
  	</td>
  	<td>
  			{<br/>
  			&nbsp;&nbsp;"result":"1", （1 操作成功 0 操作失败）<br/>
  			&nbsp;&nbsp;"categoryMaterialList":{<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	id_CategoryMaterial: int 材料类别id<br/>
  			&nbsp;&nbsp;&nbsp;&nbsp;	name_CategoryMaterial : String 材料类别名称<br/>
  			&nbsp;&nbsp;}<br/>
  			&nbsp;&nbsp;"array_PictureMaterial":String pictureMaterialList的材料图片url（以，分割）<br/>
  			&nbsp;&nbsp;"array_InformDetailMaterial":informDetailMaterialList的详细信息url（以，分割）<br/>
  			&nbsp;&nbsp;"array_InformDetailMaterial_name":informDetailMaterialList的详细信息名字（以，分割）<br/>
  			&nbsp;&nbsp;"array_ApplicationMaterial":applicationMaterialList的应用实例url（以，分割）<br/>
  			&nbsp;&nbsp;"array_ApplicationMaterial_name":applicationMaterialList的应用实例名字（以，分割）<br/>
  			&nbsp;&nbsp;"array_SimulationMaterial":simulationMaterialList的仿真参数url（以，分割）<br/>
  			&nbsp;&nbsp;"array_SimulationMaterial_name":simulationMaterialList的仿真参数名字（以，分割）<br/>
  			}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  		31
  	</td>
  	<td>
  		删除工件材料
  	</td>
  	<td>
  		/materialApp/deleteTurningBlade
  	</td>
  	<td>
  		String id_Material 材料ID
  	</td>
  	<td>
  			{<br/>
 			&nbsp;&nbsp; "result":"1", （1 操作成功 0 操作失败）<br/>
 			&nbsp;&nbsp; "msg": 返回信息<br/>
			}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  		32
  	</td>
  	<td>
  		温度相关
  	</td>
  	<td>
  		/materialApp/queryWDXG
  	</td>
  	<td>
  		String id 材料id<br/>
  		String str  温度相关表的字符串 <br/>
  	</td>
  	<td>
  		{<br/>
 			&nbsp;&nbsp; "result":"1", （1 操作成功 0 操作失败）<br/>
 			&nbsp;&nbsp; "msg": 返回信息<br/>
 			&nbsp;&nbsp; "id": 材料id<br/>
 			&nbsp;&nbsp;"list":{<br/>
 			&nbsp;&nbsp;&nbsp;&nbsp;wendu:String 温度<br/>
 			&nbsp;&nbsp;&nbsp;&nbsp;canshu:String 参数<br/>
 			&nbsp;&nbsp;}<br/>
			}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		33
  	</td>
  	<td>
  		查询机床列表
  	</td>
  	<td>
  		/standarMachineApp/queryStandarMachineList
  	</td>
  	<td>
  		int pageNo	第几页  <br/>
  		int pageSize 每页几条<br/>
		String NameMachine 机床名称<br/>
		String NumberMachine 机床型号<br/>
		String TypeMachine 机床类别<br/>
		String ControlSystemMachine 数控系统<br/>
		String SpindleSpeedMachine 主轴最大转速<br/>
		String CompanyMachine 生产厂家<br/>
  	</td>
  	<td>
  			{<br/>
  				&nbsp;&nbsp;"result":"1",<br/>
  		 		&nbsp;&nbsp;"para":{<br/>
  		 			&nbsp;&nbsp;&nbsp;&nbsp;"NumberMachine":String 机床型号<br/>
  		 			&nbsp;&nbsp;&nbsp;&nbsp;"NameMachine":String 机床名称<br/>
  		 			&nbsp;&nbsp;&nbsp;&nbsp;"TypeMachine":String 机床类别<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"ControlSystemMachine":String 数控系统<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"SpindleSpeedMachine":int 主轴最大转速<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"CompanyMachine":String 生产厂家<br/>	
  		 		&nbsp;&nbsp;},<br/>
  		 		&nbsp;&nbsp;"page":{<br/>
  		 			&nbsp;&nbsp;&nbsp;&nbsp;"pageCount":int 总页数<br/>
  		 		&nbsp;&nbsp;},<br/>
  		 		&nbsp;&nbsp;"categoryMachineInform":{<br/>
  				&nbsp;&nbsp;&nbsp;&nbsp;"name_CategoryMachineInform":String 机床类别名字<br/>
  				&nbsp;&nbsp;&nbsp;&nbsp;"id_CategoryMachineInform":int 机床类别ID<br/>
  				&nbsp;&nbsp;}<br/>
  		 		&nbsp;&nbsp;"list":[{<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"id_MachineInform":int <br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"NumberMachine":String 机床型号<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"NameMachine":String 机床名称<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"TypeMachine":String 机床类别<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"ControlSystemMachine":String 数控系统<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"SpindleSpeedMachine":int 主轴最大转速<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"CompanyMachine":String 生产厂家<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"CuttingDiameterMachine":String 最大斜切直径<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"MaxweightMachine":String 最大承重,<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"TypeTurningHolderMachine":String 工作台尺寸<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"TypeCustomMachineInform":String 自定义机床类别<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"user_id":int 用户id<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"add_time":bigint 添加时间<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"pictureMachineInformList":[{<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_PictureMachineInform": int <br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_MachineInform": int MachineInform.id_MachineInform <br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_PictureMachineInform": String 标准机床url <br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;}]<br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;"informDetailMachineInformList":[{<br/>
		  		 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_InformDetailMachineInform": int <br/>
		  		 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"id_MachineInform": int MachineInform.id_MachineInform <br/>
		  		 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"url_InformDetailMachineInform": String 详细信息url <br/>
		  		 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"name_InformDetailMachineInform": String 详细信息文件name <br/>
		  		 	&nbsp;&nbsp;&nbsp;&nbsp;}]<br/>
		  		 	
  		 		&nbsp;&nbsp;}]<br/>
  		 	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  		34
  	</td>
  	<td>
  		去添加机床页面
  	</td>
  	<td>
  		/standarMachineApp/goAddMachineInform
  	</td>
  	<td>
  		String id：机床ID
  	</td>
  	<td>
  		{<br/>
  		&nbsp;&nbsp;	"result":"1"<br/>
  		&nbsp;&nbsp;	"MachineInform":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"id_MachineInform": int <br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"NumberMachine": String 机床型号<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"NameMachine": String 机床名称<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"TypeMachine": String 机床类别<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"ControlSystemMachine": String 数控系统<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"CuttingDiameterMachine": String 最大切削直径<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"SpindleSpeedMachine": int 主轴最大转速<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"CompanyMachine": String 生产厂家<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"MaxweightMachine": String 最大承重<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"TypeTurningHolderMachine": String 工作台尺寸<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"pictureMachineInformList":[{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"id_PictureMachineInform":int<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"id_MachineInform":int MachineInform.id_MachineInform <br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"url_PictureMachineInform": String 机床图片Url<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		}],<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"informDetailMachineInformList":[{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"id_InformDetailMachineInform":int<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"id_MachineInform":int MachineInform.id_MachineInform <br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"url_InformDetailMachineInform":String 机床详细信息Url<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"name_InformDetailMachineInform":String 详细信息name<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		}],<br/>
  		&nbsp;&nbsp;	},<br/>
  		&nbsp;&nbsp;	"categoryMachineInform":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;	"name_CategoryMachineInform":String 机床类别名字<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;	"id_CategoryMachineInform":int 机床类别ID<br/>
  		&nbsp;&nbsp;	}<br/>
  		&nbsp;&nbsp;	"array_PictureMachineInform":String pictureMachineInformList的机床图片url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_InformDetailMachineInform":String informDetailMachineInformList的机床详细信息url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_InformDetailMachineInform_name":String informDetailMachineInformList的机床详细信息name(以,分割)<br/>
  		}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  		35
  	</td>
  	<td>
  		添加/修改标准机床信息
  	</td>
  	<td>
  		/standarMachineApp/saveMachineInform
  	</td>
  	<td>
  			String user_id 当前登录id，未登录传0<br/>
			int id_MachineInform 标准机床id<br/>
			String NumberMachine 机床型号<br/>
			String NameMachine 机床名称<br/>
			String TypeMachine 机床类别<br/>
			String TypeCustomMachineInform 自定义机床类别<br/>
			String ControlSystemMachine 数控系统<br/>
			String SpindleSpeedMachine  主轴最大转速(该值只能是数字，不接收字符)<br/>
			String CompanyMachine 生产厂家<br/>
			String CuttingDiameterMachine 最大切削直径 <br/>
			String MaxweightMachine 最大承重<br/>
			String TypeTurningHolderMachine 工作台尺寸<br/>
			String array_PictureMachineInform 机床图片url(以,分割)<br/>
			String array_InformDetailMachineInform 机床详细信息url(以,分割)<br/>
			String array_InformDetailMachineInform_name 机床详细信息name(以,分割)<br/>
  	</td>
  	<td>
  		{<br/>
 			&nbsp;&nbsp; "result":"1", （1 操作成功 0 操作失败）<br/>
 			&nbsp;&nbsp; "msg": 返回信息<br/>
		}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  		36
  	</td>
  	<td>
  		保存标准机床图片
  	</td>
  	<td>
  		/standarMachineApp/savePictureMachineInform
  	</td>
  	<td>
  			String id_MachineInform 标准机床id  <br/>
  			String array_PictureMachineInform 机床图片url(以,分割)<br/>
			String array_InformDetailMachineInform 机床详细信息url(以,分割)<br/>
			String array_InformDetailMachineInform_name 机床详细信息name(以,分割)<br/>
			String PictureMachineInform 机床图片文件<br/>
			String fileSuffix  机床图片文件后缀(类似jpg)<br/>
			String filename 机床图片文件名   带后缀<br/>
  	</td>
  	<td>{<br/>
  		&nbsp;&nbsp;	"result":"1", （1 操作成功 0 操作失败）<br/>
  		&nbsp;&nbsp;	"categoryMachineInform":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;	"name_CategoryMachineInform":String 机床类别名字<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;	"id_CategoryMachineInform":int 机床类别ID<br/>
  		&nbsp;&nbsp;	}<br/>
  		&nbsp;&nbsp;	"array_PictureMachineInform":String pictureMachineInformList的机床图片url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_InformDetailMachineInform":String informDetailMachineInformList的机床详细信息url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_InformDetailMachineInform_name":String informDetailMachineInformList的机床详细信息name(以,分割)<br/>
  		}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  		37
  	</td>
  	<td>
  		保存详细信息
  	</td>
  	<td>
  		/standarMachineApp/saveInformDetailMachineInform
  	</td>
  	<td>
  			String id_MachineInform 标准机床id  <br/>
  			String array_PictureMachineInform 机床图片url(以,分割)<br/>
			String array_InformDetailMachineInform 机床详细信息url(以,分割)<br/>
			String array_InformDetailMachineInform_name 机床详细信息name(以,分割)<br/>
			String InformDetailMachineInform 详细信息文件<br/>
			String fileSuffix  详细信息文件后缀(类似jpg)<br/>
			String filename 详细信息文件名   带后缀<br/>
  	</td>
  	<td>
  		{<br/>
  		&nbsp;&nbsp;	"result":"1", （1 操作成功 0 操作失败）<br/>
  		&nbsp;&nbsp;	"categoryMachineInform":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;	"name_CategoryMachineInform":String 机床类别名字<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;	"id_CategoryMachineInform":int 机床类别ID<br/>
  		&nbsp;&nbsp;	}<br/>
  		&nbsp;&nbsp;	"array_PictureMachineInform":String pictureMachineInformList的机床图片url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_InformDetailMachineInform":String informDetailMachineInformList的机床详细信息url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_InformDetailMachineInform_name":String informDetailMachineInformList的机床详细信息name(以,分割)<br/>
  		}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  		38
  	</td>
  	<td>
  		删除标准机床信息
  	</td>
  	<td>
  		/standarMachineApp/deleteMachineInform
  	</td>
  	<td>
  		String id_MachineInform 标准机床id  <br/>
  	</td>
  	<td>
  		{<br/>
 			&nbsp;&nbsp; "result":"1", （1 操作成功 0 操作失败）<br/>
 			&nbsp;&nbsp; "msg": 返回信息<br/>
		}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  		39
  	</td>
  	<td>
  		/CoatingMaterialApp/queryCoatingMaterialList
  	</td>
  	<td>
  		涂层材料列表
  	</td>
  	<td>
  		int pageNo	第几页<br/>
  		int pageSize 每页几条<br/>
		String NameToolCoating 涂层名称<br/>
		String NumberToolCoating 涂层编号<br/>
		String CategoryToolCoating 涂层类别<br/>
		String ProcessingToolCoating 涂层工艺<br/>
		String CompanyToolCoating 供应商<br/>
  	</td>
  	<td>
  		{<br/>
  		&nbsp;&nbsp;	"result":"1" <br/>
  		&nbsp;&nbsp;	"para":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"NameToolCoating":String 涂层名称<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"NumberToolCoating":String 涂层编号<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"CategoryToolCoating":String 涂层类别<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"ProcessingToolCoating":String 涂层工艺<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"CompanyToolCoating":String 供应商<br/>
  		&nbsp;&nbsp;	}<br/>
  		&nbsp;&nbsp;	"categoryToolCoatingList":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"name_CategoryToolCoating":String 涂层材料类别名字<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"id_CategoryToolCoating":int 涂层材料类别ID<br/>
  		&nbsp;&nbsp;	}<br/>
  		&nbsp;&nbsp;"page":{<br/>
  		 			&nbsp;&nbsp;&nbsp;&nbsp;"pageCount":int 总页数<br/>
  		 		&nbsp;&nbsp;},<br/>
  		&nbsp;&nbsp;	"list":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"id_ToolCoatingMaterial":int <br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"NameToolCoating":String 涂层名称<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"NumberToolCoating":String 涂层编号<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"CategoryToolCoating":String 涂层类别<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"ProcessingToolCoating":String 涂层工艺<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"CompanyToolCoating":String 供应商<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"ISOToolCoating":String 涂层主要成分<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"ColourToolCoating":String 涂层颜色<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"HardnessToolCoating":String 涂层硬度<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"ThicknessToolCoating":String 涂层厚度<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"FrictionToolCoating":String 摩擦系数<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"TemperatureToolCoating":String 使用温度<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"CharacterToolCoating":String 涂层特点<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"add_time":bigint 添加时间<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"user_id":int 用户id<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"pictureCoatingMaterialList":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"id_PictureToolCoating":int <br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"id_ToolCoatingMaterial":int ToolCoatingMaterial.id_ToolCoatingMaterial<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"url_PictureToolCoating":String 涂层材料图片url<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		}<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"applicationCoatingMaterialList":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"id_ApplicationToolCoating":int<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"id_ToolCoatingMaterial":int ToolCoatingMaterial.id_ToolCoatingMaterial<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"url_ApplicationToolCoating":String 涂层材料应用实例url<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"name_ApplicationToolCoating":String 涂层材料应用实例name<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		}<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"informDetailCoatingMaterialList":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"id_InformDetailToolCoating":int <br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"id_ToolCoatingMaterial":int ToolCoatingMaterial.id_ToolCoatingMaterial<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"url_InformDetailToolCoating":String 涂层材料详细信息Url<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"name_InformDetailToolCoating":String 涂层材料详细信息name<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		}<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"ISOToolCoatingList":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"yuansu":String 元素<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"baifenbi":String 百分比<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		}<br/>
  		&nbsp;&nbsp;	}<br/>
  		}<br/>
  	</td>
  </tr>
  
   <tr>
  	<td>
  		40
  	</td>
  	<td>
  		/CoatingMaterialApp/goAddCoatingMaterial
  	</td>
  	<td>
  		去添加涂层材料
  	</td>
  	<td>
  		String id
  	</td>
  	<td>
  		{
  		&nbsp;&nbsp;	"result":"1",<br/>
  		&nbsp;&nbsp;	"CoatingMaterial":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"id_ToolCoatingMaterial":int <br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"NameToolCoating":String 涂层名称<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"NumberToolCoating":String 涂层编号<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"CategoryToolCoating":String 涂层类别<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"ProcessingToolCoating":String 涂层工艺<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"CompanyToolCoating":String 供应商<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"ISOToolCoating":String 涂层主要成分<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"ColourToolCoating":String 涂层颜色<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"HardnessToolCoating":String 涂层硬度<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"ThicknessToolCoating":String 涂层厚度<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"FrictionToolCoating":String 摩擦系数<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"TemperatureToolCoating":String 使用温度<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"CharacterToolCoating":String 涂层特点<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"add_time":bigint 添加时间<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"user_id":int 用户id<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"pictureCoatingMaterialList":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"id_PictureToolCoating":int <br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"id_ToolCoatingMaterial":int ToolCoatingMaterial.id_ToolCoatingMaterial<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"url_PictureToolCoating":String 涂层材料图片url<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		}<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"applicationCoatingMaterialList":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"id_ApplicationToolCoating":int<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"id_ToolCoatingMaterial":int ToolCoatingMaterial.id_ToolCoatingMaterial<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"url_ApplicationToolCoating":String 涂层材料应用实例url<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"name_ApplicationToolCoating":String 涂层材料应用实例name<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		}<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"informDetailCoatingMaterialList":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"id_InformDetailToolCoating":int <br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"id_ToolCoatingMaterial":int ToolCoatingMaterial.id_ToolCoatingMaterial<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"url_InformDetailToolCoating":String 涂层材料详细信息Url<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"name_InformDetailToolCoating":String 涂层材料详细信息name<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		}<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"ISOToolCoatingList":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"yuansu":String 元素<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			"baifenbi":String 百分比<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		}<br/>
  		&nbsp;&nbsp;	}<br/>
  		&nbsp;&nbsp;	"categoryToolCoatingList":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"name_CategoryToolCoating":String 涂层材料类别名字<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"id_CategoryToolCoating":int 涂层材料类别ID<br/>
  		&nbsp;&nbsp;	}<br/>
  		&nbsp;&nbsp;	"array_PictureCoatingMaterial":String pictureCoatingMaterialList的涂层材料图片url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_InformDetailCoatingMaterial":String informDetailCoatingMaterialList的涂层材料详细信息url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_InformDetailCoatingMaterial_name":String informDetailCoatingMaterialList的涂层材料详细信息name(以,分割)<br/>
  		&nbsp;&nbsp;	"array_ApplicationCoatingMaterial":String applicationCoatingMaterialList的涂层材料应用实例url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_ApplicationCoatingMaterial_name":String applicationCoatingMaterialList的涂层材料应用实例name(以,分割)<br/>
  		}
  	</td>
  </tr>
   <tr>
  	<td>
  		41
  	</td>
  	<td>
  		/CoatingMaterialApp/saveCoatingMaterial
  	</td>
  	<td>
  		保存/修改涂层材料
  	</td>
  	<td>
  		String user_id 当前登录id，未登录传0 <br/>
		int id_ToolCoatingMaterial <br/>
		String NameToolCoating 涂层名称<br/>
		String NumberToolCoating 涂层编号 <br/>
		String CategoryToolCoating 涂层类别 <br/>
		String ProcessingToolCoating 涂层工艺 <br/>
		String CompanyToolCoating 供应商<br/>
		String ISOToolCoating 涂层主要成分 <br/>
		String ColourToolCoating 涂层颜色 <br/>
		String HardnessToolCoating 涂层硬度 <br/>
		String ThicknessToolCoating 涂层厚度<br/>
		String FrictionToolCoating 摩擦系数<br/>
		String TemperatureToolCoating 使用温度 <br/>
		String CharacterToolCoating 涂层特点<br/>
		String array_PictureCoatingMaterial 涂层材料图片url（以，分割）<br/>
		String array_InformDetailCoatingMaterial 涂层材料详细信息url（以，分割）<br/>
		String array_InformDetailCoatingMaterial_name 涂层材料详细信息name（以，分割）<br/>
		String array_ApplicationCoatingMaterial 涂层材料应用实例url（以，分割）<br/>
		String array_ApplicationCoatingMaterial_name 涂层材料应用实例name（以，分割）<br/>
  	</td>
  	<td>
  		{<br/>
   		&nbsp;&nbsp;	"result":"1", （1 操作成功 0 操作失败）<br/>
   		&nbsp;&nbsp;	"msg": 返回信息<br/>
		}<br/>
  	</td>
  </tr>
   <tr>
  	<td>
  		42
  	</td>
  	<td>
  		/CoatingMaterialApp/savePictureCoatingMaterial
  	</td>
  	<td>
  		保存涂层材料图片
  	</td>
  	<td>
  		String array_PictureCoatingMaterial 涂层材料图片url（以，分割）<br/>
		String array_InformDetailCoatingMaterial 涂层材料详细信息url（以，分割）<br/>
		String array_InformDetailCoatingMaterial_name 涂层材料详细信息name（以，分割）<br/>
		String array_ApplicationCoatingMaterial 涂层材料应用实例url（以，分割）<br/>
		String array_ApplicationCoatingMaterial_name 涂层材料应用实例name（以，分割）<br/>
		String PictureCoatingMaterial 涂层材料图片文件 <br/>
		String fileSuffix 涂层材料文件后缀<br/>
		String filename	涂层材料文件名 带后缀<br/>
  	</td>
  	<td>
  		{<br/>
  		&nbsp;&nbsp;	"result":"1", （1 操作成功 0 操作失败）<br/>
  		&nbsp;&nbsp;	"array_PictureCoatingMaterial":String pictureCoatingMaterialList的涂层材料图片url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_InformDetailCoatingMaterial":String informDetailCoatingMaterialList的涂层材料详细信息url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_InformDetailCoatingMaterial_name":String informDetailCoatingMaterialList的涂层材料详细信息name(以,分割)<br/>
  		&nbsp;&nbsp;	"array_ApplicationCoatingMaterial":String applicationCoatingMaterialList的涂层材料应用实例url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_ApplicationCoatingMaterial_name":String applicationCoatingMaterialList的涂层材料应用实例name(以,分割)<br/>
  		&nbsp;&nbsp;	"categoryToolCoatingList":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"name_CategoryToolCoating":String 涂层材料类别名字<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"id_CategoryToolCoating":int 涂层材料类别ID<br/>
  		&nbsp;&nbsp;	}<br/>
		}<br/>
  	</td>
  </tr>
 
   <tr>
  	<td>
 		43 		
  	</td>
  	<td>
  		/CoatingMaterialApp/saveInformDetailCoatingMaterial
  	</td>
  	<td>
  		保存涂层材料详细信息
  	</td>
  	<td>
  		String array_PictureCoatingMaterial 涂层材料图片url（以，分割）<br/>
		String array_InformDetailCoatingMaterial 涂层材料详细信息url（以，分割）<br/>
		String array_InformDetailCoatingMaterial_name 涂层材料详细信息name（以，分割）<br/>
		String array_ApplicationCoatingMaterial 涂层材料应用实例url（以，分割）<br/>
		String array_ApplicationCoatingMaterial_name 涂层材料应用实例name（以，分割）<br/>
		String InformDetailCoatingMaterial 涂层材料详细信息文件 <br/>
		String fileSuffix 涂层材料文件后缀<br/>
		String filename	涂层材料文件名 带后缀<br/>
  	</td>
  	<td>
  		{<br/>
  		&nbsp;&nbsp;	"result":"1", （1 操作成功 0 操作失败）<br/>
  		&nbsp;&nbsp;	"array_PictureCoatingMaterial":String pictureCoatingMaterialList的涂层材料图片url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_InformDetailCoatingMaterial":String informDetailCoatingMaterialList的涂层材料详细信息url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_InformDetailCoatingMaterial_name":String informDetailCoatingMaterialList的涂层材料详细信息name(以,分割)<br/>
  		&nbsp;&nbsp;	"array_ApplicationCoatingMaterial":String applicationCoatingMaterialList的涂层材料应用实例url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_ApplicationCoatingMaterial_name":String applicationCoatingMaterialList的涂层材料应用实例name(以,分割)<br/>
  		&nbsp;&nbsp;	"categoryToolCoatingList":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"name_CategoryToolCoating":String 涂层材料类别名字<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"id_CategoryToolCoating":int 涂层材料类别ID<br/>
  		&nbsp;&nbsp;	}<br/>
		}<br/>
  	</td>
  </tr>
   <tr>
  	<td>
  		44
  	</td>
  	<td>
  		/CoatingMaterialApp/saveApplicationCoatingMaterial
  	</td>
  	<td>
  		保存涂层材料应用实例
  	</td>
  	<td>
  		String array_PictureCoatingMaterial 涂层材料图片url（以，分割）<br/>
		String array_InformDetailCoatingMaterial 涂层材料详细信息url（以，分割）<br/>
		String array_InformDetailCoatingMaterial_name 涂层材料详细信息name（以，分割）<br/>
		String array_ApplicationCoatingMaterial 涂层材料应用实例url（以，分割）<br/>
		String array_ApplicationCoatingMaterial_name 涂层材料应用实例name（以，分割）<br/>
		String ApplicationCoatingMaterial 涂层材料应用实例文件 <br/>
		String fileSuffix 涂层材料文件后缀<br/>
		String filename	涂层材料文件名 带后缀<br/>
  	</td>
  	<td>
  		{<br/>
  		&nbsp;&nbsp;	"result":"1", （1 操作成功 0 操作失败）<br/>
  		&nbsp;&nbsp;	"array_PictureCoatingMaterial":String pictureCoatingMaterialList的涂层材料图片url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_InformDetailCoatingMaterial":String informDetailCoatingMaterialList的涂层材料详细信息url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_InformDetailCoatingMaterial_name":String informDetailCoatingMaterialList的涂层材料详细信息name(以,分割)<br/>
  		&nbsp;&nbsp;	"array_ApplicationCoatingMaterial":String applicationCoatingMaterialList的涂层材料应用实例url(以,分割)<br/>
  		&nbsp;&nbsp;	"array_ApplicationCoatingMaterial_name":String applicationCoatingMaterialList的涂层材料应用实例name(以,分割)<br/>
  		&nbsp;&nbsp;	"categoryToolCoatingList":{<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"name_CategoryToolCoating":String 涂层材料类别名字<br/>
  		&nbsp;&nbsp;&nbsp;&nbsp;		"id_CategoryToolCoating":int 涂层材料类别ID<br/>
  		&nbsp;&nbsp;	}<br/>
		}<br/>
  	</td>
  </tr>
   <tr>
  	<td>
  		45
  	</td>
  	<td>
  		/CoatingMaterialApp/deleteCoatingMaterial
  	</td>
  	<td>
  		删除涂层材料
  	</td>
  	<td>
  		String id_ToolCoatingMaterial 涂层材料ID
  	</td>
  	<td>
  		{<br/>
   		&nbsp;&nbsp;	"result":"1", （1 操作成功 0 操作失败）<br/>
   		&nbsp;&nbsp;	"msg": 返回信息<br/>
		}<br/>
  	</td>
  </tr>
   <tr>
  	<td>
  		46
  	</td>
  	<td>
  		/cuttingToolMaterialApp/queryCuttingToolMaterialList
  	</td>
  	<td>
  		刀具材料列表
  	</td>
  	<td>
  		int pageNo, 第几页 <br/>
  		int pageSize, 每页几条<br/>
		String NameToolMaterial, 刀具材料名称<br/>
		String NumberToolMaterial, 刀具材料牌号<br/>
		String CategoryToolMaterial, 材料类别<br/>
		String CompanyToolMaterial, 供应商<br/>
  	</td>
  	<td>
  	{<br/>
    "result": "1", 状态<br/>
    "page": {<br/>
    &nbsp;&nbsp;    "pageCount": int 总页数<br/>
    },<br/>
    "categoryToolMaterialList": [{<br/>
    &nbsp;&nbsp;        "name_CategoryToolMaterial": 刀具材料类别名称<br/>
    &nbsp;&nbsp;        "id_CategoryToolMaterial": 刀具材料类别ID<br/>
    }]<br/>
    "list": [{<br/>
   	&nbsp;&nbsp;		"id_CuttingToolMaterialD": 刀具材料ID<br/>
   	&nbsp;&nbsp;		"NameToolMaterial": 刀具材料名称<br/>
    &nbsp;&nbsp;        "NumberToolMaterial": 刀具材料牌号<br/>
    &nbsp;&nbsp;        "CategoryToolMaterial": 材料类别<br/>
    &nbsp;&nbsp;        "CompanyToolMaterial": 供应商<br/>
    &nbsp;&nbsp;        "ISOCuttingMaterial": 材料主要成分<br/>
    &nbsp;&nbsp;        "MachineableMaterial": 刀具材料特点<br/>
    &nbsp;&nbsp;        "DensityToolMaterial": 刀具材料密度<br/>
    &nbsp;&nbsp;        "HardnessToolMaterial": 刀具材料硬度<br/>
    &nbsp;&nbsp;        "BendingStrengthToolMaterial": 抗弯强度<br/>
    &nbsp;&nbsp;        "ImpactToughnessToolMaterial": 冲击韧性<br/>
    &nbsp;&nbsp;        "ModulusToolMaterial": 弹性模量<br/>
    &nbsp;&nbsp;        "ConductivityToolMaterial": 材料热导率<br/>
    &nbsp;&nbsp;        "HeatResistanceToolMaterial": 耐热性<br/>
    &nbsp;&nbsp;        "ThermalexpansionToolMaterial": 热膨胀系数<br/>
    &nbsp;&nbsp;        "pictureToolMaterialList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;       			"id_PictureToolMaterial": 材料图片ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_CuttingToolMaterialD": int CuttingToolMaterialD.id_CuttingToolMaterialD<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "url_PictureToolMaterial": 刀具材料图片Url<br/>
    &nbsp;&nbsp;         }],<br/>
    &nbsp;&nbsp;        "informToolMaterialList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;        		"id_InformToolMaterial": 详细信息ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;               "id_CuttingToolMaterialD": int CuttingToolMaterialD.id_CuttingToolMaterialD<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "name_InformToolMaterial": 详细信息文件name<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "url_InformToolMaterial": 详细信息文件url<br/>
    &nbsp;&nbsp;         }],<br/>
    &nbsp;&nbsp;        "applicationToolMaterialList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_ApplicationToolMaterial": 应用实例ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_CuttingToolMaterialD": int CuttingToolMaterialD.id_CuttingToolMaterialD<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "url_ApplicationToolMaterial": 应用实例文件url<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "name_ApplicationToolMaterial": 应用实例文件name<br/>
    &nbsp;&nbsp;         }],<br/>
    &nbsp;&nbsp;"ISOCuttingMaterialList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "baifenbi": 百分比<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "yuansu": 元素<br/>
     &nbsp;&nbsp;        }]<br/>
    }],<br/>
    "para": {<br/>
    &nbsp;&nbsp;	"NameToolMaterial": 刀具材料名称<br/>
    &nbsp;&nbsp;	"NumberToolMaterial": 刀具材料牌号<br/>
    &nbsp;&nbsp;	"CategoryToolMaterial": 材料类别<br/>
    &nbsp;&nbsp;    "CompanyToolMaterial": 供应商<br/>
    }<br/>
}<br/>
  	</td>
  </tr>
  <tr>
   	<td>
   		47
   	</td>
  	<td>
  		/cuttingToolMaterialApp/goAddCuttingToolMaterial
  	</td>
  	<td>
  		去添加页面
  	</td>
  	<td>
  		String id ： 刀具材料ID
  	</td>
  	<td>
  		{<br/>
    "result": "1", 状态<br/>
    "categoryToolMaterialList": [{<br/>
    &nbsp;&nbsp;        "name_CategoryToolMaterial": 刀具材料类别名称<br/>
    &nbsp;&nbsp;        "id_CategoryToolMaterial": 刀具材料类别ID<br/>
    }]<br/>
    "cuttingToolMaterial": [{<br/>
   	&nbsp;&nbsp;		"id_CuttingToolMaterialD": 刀具材料ID<br/>
   	&nbsp;&nbsp;		"NameToolMaterial": 刀具材料名称<br/>
    &nbsp;&nbsp;        "NumberToolMaterial": 刀具材料牌号<br/>
    &nbsp;&nbsp;        "CategoryToolMaterial": 材料类别<br/>
    &nbsp;&nbsp;        "CompanyToolMaterial": 供应商<br/>
    &nbsp;&nbsp;        "ISOCuttingMaterial": 材料主要成分<br/>
    &nbsp;&nbsp;        "MachineableMaterial": 刀具材料特点<br/>
    &nbsp;&nbsp;        "DensityToolMaterial": 刀具材料密度<br/>
    &nbsp;&nbsp;        "HardnessToolMaterial": 刀具材料硬度<br/>
    &nbsp;&nbsp;        "BendingStrengthToolMaterial": 抗弯强度<br/>
    &nbsp;&nbsp;        "ImpactToughnessToolMaterial": 冲击韧性<br/>
    &nbsp;&nbsp;        "ModulusToolMaterial": 弹性模量<br/>
    &nbsp;&nbsp;        "ConductivityToolMaterial": 材料热导率<br/>
    &nbsp;&nbsp;        "HeatResistanceToolMaterial": 耐热性<br/>
    &nbsp;&nbsp;        "ThermalexpansionToolMaterial": 热膨胀系数<br/>
    &nbsp;&nbsp;        "pictureToolMaterialList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;       			"id_PictureToolMaterial": 材料图片ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_CuttingToolMaterialD": int CuttingToolMaterialD.id_CuttingToolMaterialD<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "url_PictureToolMaterial": 刀具材料图片Url<br/>
    &nbsp;&nbsp;         }],<br/>
    &nbsp;&nbsp;        "informToolMaterialList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;        		"id_InformToolMaterial": 详细信息ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;               "id_CuttingToolMaterialD": int CuttingToolMaterialD.id_CuttingToolMaterialD<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "name_InformToolMaterial": 详细信息文件name<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "url_InformToolMaterial": 详细信息文件url<br/>
    &nbsp;&nbsp;         }],<br/>
    &nbsp;&nbsp;        "applicationToolMaterialList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_ApplicationToolMaterial": 应用实例ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_CuttingToolMaterialD": int CuttingToolMaterialD.id_CuttingToolMaterialD<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "url_ApplicationToolMaterial": 应用实例文件url<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "name_ApplicationToolMaterial": 应用实例文件name<br/>
    &nbsp;&nbsp;         }],<br/>
    &nbsp;&nbsp;"ISOCuttingMaterialList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "baifenbi": 百分比<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "yuansu": 元素<br/>
    &nbsp;&nbsp;        }]<br/>
    "array_PictureToolMaterial":刀具材料图片url(以，分割)<br/>
    "array_InformToolMaterial": 刀具材料详细信息url(以，分割)<br/>
    "array_InformToolMaterial_name":刀具材料详细信息name(以，分割)<br/>
    "array_ApplicationToolMaterial":刀具材料应用实例url(以，分割)<br/>
    "array_ApplicationToolMaterial_name": 刀具材料应用实例name(以，分割)<br/>
    }],<br/>
}<br/>
  	</td>
  </tr>
  	
  <tr>
  	<td>
  		48
  	</td>
  	<td>
  		/cuttingToolMaterialApp/saveCuttingToolMaterial
  	</td>
  	<td>
  		添加页面
  	</td>
  	<td>
  		String user_id, 用户ID<br/>
		int id_CuttingToolMaterialD, 刀具材料ID<br/>
		String array_PictureToolMaterial, 刀具材料图片url(以，分割)<br/>
		String array_InformToolMaterial, 刀具材料详细信息url(以，分割)<br/>
		String array_InformToolMaterial_name,刀具材料详细信息name(以，分割)<br/>
		String array_ApplicationToolMaterial, 刀具材料应用实例url(以，分割)<br/>
		String array_ApplicationToolMaterial_name, 刀具材料应用实例name(以，分割)<br/>
		String NameToolMaterial, 刀具材料名称<br/>
		String NumberToolMaterial, 刀具材料牌号	<br/>
		String CategoryToolMaterial, 材料类别<br/>
		String CompanyToolMaterial, 供应商<br/>
		String ISOCuttingMaterial,材料主要成分<br/>
		String MachineableMaterial, 刀具材料特点<br/>
		String DensityToolMaterial, 刀具材料密度<br/>
		String HardnessToolMaterial, 刀具材料硬度<br/>
		String BendingStrengthToolMaterial, 抗弯强度<br/>
		String ImpactToughnessToolMaterial,冲击韧性<br/>
		String ModulusToolMaterial, 弹性模量<br/>
		String HeatResistanceToolMaterial,	耐热性<br/>
		String ConductivityToolMaterial, 材料热导率<br/>
		String ThermalexpansionToolMaterial 热膨胀系数<br/>
  	</td>
  	<td>
  		{<br/>
    	 &nbsp;&nbsp;"result": "1",<br/>
   		 &nbsp;&nbsp;"msg": 返回信息<br/>
		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		49
  	</td>
  	<td>
  		/cuttingToolMaterialApp/savePictureMaterial
  	</td>
  	<td>
  		保存刀具材料图片
  	</td>
  	<td>
  		int id_CuttingToolMaterialD,   刀具材料ID<br/>
		String array_PictureToolMaterial, 刀具材料图片url(以，分割)<br/>
		String array_InformToolMaterial, 刀具材料详细信息url(以，分割)<br/>
		String array_InformToolMaterial_name,刀具材料详细信息name(以，分割)<br/>
		String array_ApplicationToolMaterial, 刀具材料应用实例url(以，分割)<br/>
		String array_ApplicationToolMaterial_name, 刀具材料应用实例name(以，分割)<br/>
		String PictureToolMaterial ,图片文件<br/>
		String fileSuffix, 文件后缀<br/>
		String filename 文件名带后缀<br/>
  	</td>
  	<td>
  		{<br/>
  		"result": "1", 状态<br/>
  		"array_PictureToolMaterial":刀具材料图片url(以，分割)<br/>
    	"array_InformToolMaterial": 刀具材料详细信息url(以，分割)<br/>
    	"array_InformToolMaterial_name":刀具材料详细信息name(以，分割)<br/>
    	"array_ApplicationToolMaterial":刀具材料应用实例url(以，分割)<br/>
   		"array_ApplicationToolMaterial_name": 刀具材料应用实例name(以，分割)<br/>
  		"categoryToolMaterialList": [{<br/>
    	 &nbsp;&nbsp;        "name_CategoryToolMaterial": 刀具材料类别名称<br/>
   		 &nbsp;&nbsp;        "id_CategoryToolMaterial": 刀具材料类别ID<br/>
    	}]<br/>
  		}
  	</td>
  </tr>
  
  <tr>
  	<td>
  		50
  	</td>
  	<td>
  		/cuttingToolMaterialApp/saveInformToolMaterial
  	</td>
  	<td>
  		保存刀具材料详细信息
  	</td>
  	<td>
  		int id_CuttingToolMaterialD,   刀具材料ID<br/>
		String array_PictureToolMaterial, 刀具材料图片url(以，分割)<br/>
		String array_InformToolMaterial, 刀具材料详细信息url(以，分割)<br/>
		String array_InformToolMaterial_name,刀具材料详细信息name(以，分割)<br/>
		String array_ApplicationToolMaterial, 刀具材料应用实例url(以，分割)<br/>
		String array_ApplicationToolMaterial_name, 刀具材料应用实例name(以，分割)<br/>
		String InformToolMaterial ,详细信息文件<br/>
		String fileSuffix, 文件后缀<br/>
		String filename 文件名带后缀<br/>
  	</td>
  	<td>
  		{<br/>
  		"result": "1", 状态<br/>
  		"array_PictureToolMaterial":刀具材料图片url(以，分割)<br/>
    	"array_InformToolMaterial": 刀具材料详细信息url(以，分割)<br/>
    	"array_InformToolMaterial_name":刀具材料详细信息name(以，分割)<br/>
    	"array_ApplicationToolMaterial":刀具材料应用实例url(以，分割)<br/>
   		"array_ApplicationToolMaterial_name": 刀具材料应用实例name(以，分割)<br/>
  		"categoryToolMaterialList": [{<br/>
    	 &nbsp;&nbsp;        "name_CategoryToolMaterial": 刀具材料类别名称<br/>
   		 &nbsp;&nbsp;        "id_CategoryToolMaterial": 刀具材料类别ID<br/>
    	}]<br/>
  		}
  	</td>
  </tr>
  
  <tr>
  	<td>
  		51
  	</td>
  	<td>
  		/cuttingToolMaterialApp/saveApplicationToolMaterial
  	</td>
  	<td>
  		保存应用实例
  	</td>
  	<td>
  		int id_CuttingToolMaterialD,   刀具材料ID<br/>
		String array_PictureToolMaterial, 刀具材料图片url(以，分割)<br/>
		String array_InformToolMaterial, 刀具材料详细信息url(以，分割)<br/>
		String array_InformToolMaterial_name,刀具材料详细信息name(以，分割)<br/>
		String array_ApplicationToolMaterial, 刀具材料应用实例url(以，分割)<br/>
		String array_ApplicationToolMaterial_name, 刀具材料应用实例name(以，分割)<br/>
		String ApplicationToolMaterial ,应用实例文件<br/>
		String fileSuffix, 文件后缀<br/>
		String filename 文件名带后缀<br/>
  	</td>
  	<td>
  		{<br/>
  		"result": "1", 状态<br/>
  		"array_PictureToolMaterial":刀具材料图片url(以，分割)<br/>
    	"array_InformToolMaterial": 刀具材料详细信息url(以，分割)<br/>
    	"array_InformToolMaterial_name":刀具材料详细信息name(以，分割)<br/>
    	"array_ApplicationToolMaterial":刀具材料应用实例url(以，分割)<br/>
   		"array_ApplicationToolMaterial_name": 刀具材料应用实例name(以，分割)<br/>
  		"categoryToolMaterialList": [{<br/>
    	 &nbsp;&nbsp;        "name_CategoryToolMaterial": 刀具材料类别名称<br/>
   		 &nbsp;&nbsp;        "id_CategoryToolMaterial": 刀具材料类别ID<br/>
    	}]<br/>
  		}
  	</td>
  </tr>
  
  <tr>
  	<td>
  	52
  	</td>
  	<td>
  	/cuttingToolMaterialApp/deleteCuttingToolMaterial
  	</td>
  	<td>
  	删除刀具材料信息
  	</td>
  	<td>
  	String id_CuttingToolMaterialD 刀具材料ID
  	</td>
  	<td>
  		{<br/>
    	 &nbsp;&nbsp;"result": "1",<br/>
   		 &nbsp;&nbsp;"msg": 返回信息<br/>
		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		53
  	</td>
  	<td>
  		/machineNodeInformApp/queryMachineNodeInformList
  	</td>
  	<td>
  		机床节点列表
  	</td>
  	<td>
	  	int pageNo, 第几页<br/>
	  	int pageSize, 每页几条<br/>
		String NumberMachineNode, 机床编号<br/>
		String NumberMachine, 机床型号<br/>
		String TypeMachineNode, 机床类别<br/>
		String DepartmentMachineNode, 机床所在单位<br/>
		String WorkshopMachineNode 机床车间<br/>
  	</td>
  	<td>
  	{<br/>
    "result": "1",状态<br/>
    "categoryMachineNodeInform":[{<br/>
    &nbsp;&nbsp;        "id_CategoryMachineNodeInform": 机床结点类别ID<br/>
    &nbsp;&nbsp;        "name_CategoryMachineNodeInform": 机床结点类别名称<br/>
     }],<br/>
    "para": {<br/>
    &nbsp;&nbsp;    "NumberMachineNode": 机床编号<br/>
    &nbsp;&nbsp;    "NumberMachine": 机床型号<br/>
    &nbsp;&nbsp;    "WorkshopMachineNode": 机床车间<br/>
    &nbsp;&nbsp;    "TypeMachineNode": 机床类别<br/>
    &nbsp;&nbsp;    "DepartmentMachineNode": 机床所在单位<br/>
    },<br/>
    "page": {<br/>
    &nbsp;&nbsp;    "pageCount": int 总页数<br/>
    },<br/>
    "list":[{	<br/>
     &nbsp;&nbsp;   	"id_MachineNodeInform": 机床结点ID<br/>
     &nbsp;&nbsp;   	"NumberMachineNode": 机床编号<br/>
     &nbsp;&nbsp;       "NumberMachine": 机床型号<br/>
     &nbsp;&nbsp;       "TypeMachineNode": 机床类别<br/>
     &nbsp;&nbsp;       "DepartmentMachineNode": 机床所在单位<br/>
     &nbsp;&nbsp;       "WorkshopMachineNode": 机床车间<br/>
     &nbsp;&nbsp;       "PositionMachineNode": 机床位置<br/>
     &nbsp;&nbsp;       "UseFrequencyMachineNode": 机床使用强度<br/>
     &nbsp;&nbsp;       "TimeUseMachineNode": 机床投入使用时间<br/>
     &nbsp;&nbsp;       "TimeDestroyMachineNode": 机床报废时间<br/>
    &nbsp;&nbsp;        "add_time": 添加时间<br/>
     &nbsp;&nbsp;   	"user_id": 用户Id<br/>
      &nbsp;&nbsp;      "informDetailMachineNodeInformList":[{<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;              "url_InformDetailMachineNodeInform": 详细信息url<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;              "id_InformDetailMachineNodeInform": 详细信息ID<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "id_MachineNodeInform": int MachineNodeInform.id_MachineNodeInform<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "name_InformDetailMachineNodeInform": 详细信息name<br/>
     &nbsp;&nbsp;       }],<br/>
     }]<br/>
	}<br/>
  	</td>
  </tr>
  
   <tr>
  	<td>
  		54
  	</td>
  	<td>
  		/machineNodeInformApp/goAddMachineNodeInform
  	</td>
  	<td>
  		去添加机床结点页面
  	</td>
  	<td>
  		String id 机床节点ID
  	</td>
  	<td>
  		{<br/>
    "result": "1",状态<br/>
    "categoryMachineNodeInform":[{<br/>
    &nbsp;&nbsp;        "id_CategoryMachineNodeInform": 机床结点类别ID<br/>
    &nbsp;&nbsp;        "name_CategoryMachineNodeInform": 机床结点类别名称<br/>
     }],<br/>
    "MachineNodeInform":[{	<br/>
     &nbsp;&nbsp;   	"id_MachineNodeInform": 机床结点ID<br/>
     &nbsp;&nbsp;   	"NumberMachineNode": 机床编号<br/>
     &nbsp;&nbsp;       "NumberMachine": 机床型号<br/>
     &nbsp;&nbsp;       "TypeMachineNode": 机床类别<br/>
     &nbsp;&nbsp;       "DepartmentMachineNode": 机床所在单位<br/>
     &nbsp;&nbsp;       "WorkshopMachineNode": 机床车间<br/>
     &nbsp;&nbsp;       "PositionMachineNode": 机床位置<br/>
     &nbsp;&nbsp;       "UseFrequencyMachineNode": 机床使用强度<br/>
     &nbsp;&nbsp;       "TimeUseMachineNode": 机床投入使用时间<br/>
     &nbsp;&nbsp;       "TimeDestroyMachineNode": 机床报废时间<br/>
    &nbsp;&nbsp;        "add_time": 添加时间<br/>
     &nbsp;&nbsp;   	"user_id": 用户Id<br/>
      &nbsp;&nbsp;      "informDetailMachineNodeInformList":[{<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;              "url_InformDetailMachineNodeInform": 详细信息url<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;              "id_InformDetailMachineNodeInform": 详细信息ID<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "id_MachineNodeInform": int MachineNodeInform.id_MachineNodeInform<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "name_InformDetailMachineNodeInform": 详细信息name<br/>
     &nbsp;&nbsp;       }],<br/>
     }]<br/>
     "array_InformDetailMachineNodeInform": 详细信息url（以，分割）<br/>
     "array_InformDetailMachineNodeInform_name": 详细信息name（以，分割）<br/>
     "DwList": List\ 用于机床所在单位字段加载已有信息，做类似百度筛选列表用 <br/>
     "CjList": List\ 用于机床车间字段加载已有信息，做类似百度筛选列表用 <br/>
	}<br/>
  	</td>
  </tr>
  
   <tr>
  	<td>
  		55
  	</td>
  	<td>
  		/machineNodeInformApp/saveMachineNodeInform
  	</td>
  	<td>
  		添加机床节点数据
  	</td>
  	<td>
  		String user_id, 用户Id<br/>
		int id_MachineNodeInform, 机床结点Id<br/>
		String array_InformDetailMachineNodeInform, 详细信息url（以，分割）<br/>
		String array_InformDetailMachineNodeInform_name,  详细信息name（以，分割）<br/>
		String NumberMachineNode, 机床编号<br/>
		String NumberMachine, 机床型号<br/>
		String TypeMachineNode, 机床类别<br/>
		String DepartmentMachineNode, 机床所在单位<br/>
		String WorkshopMachineNode, 机床车间<br/>
		String PositionMachineNode, 机床位置<br/>
		String UseFrequencyMachineNode, 机床使用强度<br/>
		String TimeUseMachineNode, 机床投入使用时间<br/>
		String TimeDestroyMachineNode, 机床报废时间<br/>
  	</td>
  	<td>
  		{<br/>
    	 &nbsp;&nbsp;"result": "1",<br/>
   		 &nbsp;&nbsp;"msg": 返回信息<br/>
		}<br/>
  	</td>
  </tr>
   <tr>
  	<td>
  		56
  	</td>
  	<td>
  		/machineNodeInformApp/saveInformDetailMachineNodeInform
  	</td>
  	<td>
  		保存机床节点详细信息
  	</td>
  	<td>
  		String id_MachineNodeInform, 机床结点Id<br/>
		String array_InformDetailMachineNodeInform, 详细信息url（以，分割）<br/>
		String array_InformDetailMachineNodeInform_name,  详细信息name（以，分割）<br/>
		String InformDetailMachineNodeInform ,   详细信息文件<br/>
		String fileSuffix, 文件后缀 <br/>
		String filename 文件名带后缀  <br/>
  	</td>
  	<td>
  		{<br/>
    	 &nbsp;&nbsp;"result": "1",<br/>
    	 &nbsp;&nbsp;"array_InformDetailMachineNodeInform": 详细信息url（以，分割）<br/>
    	 &nbsp;&nbsp;"array_InformDetailMachineNodeInform_name": 详细信息name（以，分割）<br/>
    	&nbsp;&nbsp;  "categoryMachineNodeInform":[{<br/>
    	&nbsp;&nbsp; &nbsp;&nbsp;        "id_CategoryMachineNodeInform": 机床结点类别ID<br/>
    	&nbsp;&nbsp; &nbsp;&nbsp;        "name_CategoryMachineNodeInform": 机床结点类别名称<br/>
     	&nbsp;&nbsp; }],<br/>
		}<br/>
  	</td>
  	
  </tr>
   <tr>
  	<td>
  		57
  	</td>
  	<td>
  		/machineNodeInformApp/deleteMachineInform
  	</td>
  	<td>
  		删除机床节点
  	</td>
  	<td>
  		String id_MachineNodeInform, 机床结点Id<br/>
  	</td>
  	<td>
  		{<br/>
    	 &nbsp;&nbsp;"result": "1",<br/>
   		 &nbsp;&nbsp;"msg": 返回信息<br/>
		}<br/>
  	</td>
  </tr>
  
   <tr>
  	<td>
  		58
  	</td>
  	<td>
  		/machineNodeInformApp/loadingTool
  	</td>
  	<td>
  		去选择   类别和型号  页面
  	</td>
  	<td>
  		int pageNo, 第几页<br/>
  		int pageSize,每页几条<br/>
		String NameMachine, 标准机床型号<br/>
		String NumberMachine1, 标准机床名称<br/>
		String TypeMachine,标准机床类别<br/>
		String ControlSystemMachine,标准机床数控系统<br/>
		String SpindleSpeedMachine,标准机床主轴最大转速<br/>
		String CompanyMachine 标准机床生产厂家<br/>
  	</td>
  	<td>
  		{<br/>
   		 "machineInformList": [{<br/>
   		&nbsp;&nbsp; 	"id_MachineInform": 标准机床Id<br/>
   		&nbsp;&nbsp; 	"NumberMachine": 标准机床型号<br/>
   		&nbsp;&nbsp; 	"NameMachine": 标准机床名称<br/>
   		&nbsp;&nbsp; 	"TypeMachine": 标准机床类别<br/>
        &nbsp;&nbsp;    "ControlSystemMachine": 标准机床数控系统<br/>
        &nbsp;&nbsp;    "SpindleSpeedMachine": 标准机床主轴最大转速<br/>
        &nbsp;&nbsp;    "CompanyMachine": 标准机床生产厂家<br/>
        &nbsp;&nbsp;    "CuttingDiameterMachine": 标准机床最大切削直径<br/>
        &nbsp;&nbsp;    "MaxweightMachine": 标准机床最大承重<br/>
        &nbsp;&nbsp;    "TypeTurningHolderMachine": 标准机床工作台尺寸<br/>
        &nbsp;&nbsp;    "user_id": 用户ID<br/>
        &nbsp;&nbsp;    "add_time": 添加时间<br/>
        }],<br/>
    	 "categoryMachineInform": [{<br/>
        &nbsp;&nbsp;    "id_CategoryMachineInform": 标准机床类别ID<br/>
        &nbsp;&nbsp;    "name_CategoryMachineInform": 标准机床名称<br/>
        }]<br/>
}<br/>
  	</td>
  </tr>
  
   <tr>
  	<td>
  		59
  	</td>
  	<td>
  		/machineNodeInformApp/goLoading
  	</td>
  	<td>
  		选择后回到添加页面
  	</td>
  	<td>
  		String id   选择的标准机床ID
  	</td>
  	<td>
  		{<br/>
   		 "machineInformList": [{<br/>
   		&nbsp;&nbsp; 	"id_MachineInform": 标准机床Id<br/>
   		&nbsp;&nbsp; 	"NumberMachine": 标准机床型号<br/>
   		&nbsp;&nbsp; 	"NameMachine": 标准机床名称<br/>
   		&nbsp;&nbsp; 	"TypeMachine": 标准机床类别<br/>
        &nbsp;&nbsp;    "ControlSystemMachine": 标准机床数控系统<br/>
        &nbsp;&nbsp;    "SpindleSpeedMachine": 标准机床主轴最大转速<br/>
        &nbsp;&nbsp;    "CompanyMachine": 标准机床生产厂家<br/>
        &nbsp;&nbsp;    "CuttingDiameterMachine": 标准机床最大切削直径<br/>
        &nbsp;&nbsp;    "MaxweightMachine": 标准机床最大承重<br/>
        &nbsp;&nbsp;    "TypeTurningHolderMachine": 标准机床工作台尺寸<br/>
        &nbsp;&nbsp;    "user_id": 用户ID<br/>
        &nbsp;&nbsp;    "add_time": 添加时间<br/>
        }],<br/>
    	 "categoryMachineInform": [{<br/>
        &nbsp;&nbsp;    "id_CategoryMachineInform": 标准机床类别ID<br/>
        &nbsp;&nbsp;    "name_CategoryMachineInform": 标准机床名称<br/>
        }]<br/>
        "NumberMachine": 标准机床型号（为了方便直接使用，我已经把型号和类别单独拿出来了，如果不能使用可以从上面集合中自己取）<br/>
        "TypeMachine_name": 标准机床类别（为了方便直接使用，我已经把型号和类别单独拿出来了，如果不能使用可以从上面集合中自己取）<br/>
        }<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	60
  	</td>
  	<td>
  	/experimentItemApp/experimentItemList
  	</td>
  	<td>
  	试验件列表
  	</td>
  	<td>
  	int pageNo, 第几页
  	int pageSize, 每页几条
	String nameExperimentPart, 零件名称
	String numberExperimentPart, 零件编号
	String typeExperimentPart, 零件类别
	String numberMaterialExperimentPart, 材料编号
	String categoryMaterialExperimentPart  材料类别
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "para": {<br/>
    &nbsp;&nbsp;		nameExperimentPart, 零件名称<br/>
	&nbsp;&nbsp;		numberExperimentPart, 零件编号<br/>
	&nbsp;&nbsp;		typeExperimentPart, 零件类别<br/>
	&nbsp;&nbsp;		numberMaterialExperimentPart, 材料编号<br/>
	&nbsp;&nbsp;		categoryMaterialExperimentPart  材料类别<br/>
    },	<br/>
    "categoryMaterialExperimentPartList": [{<br/>
    &nbsp;&nbsp;       "id_CategoryMaterialExperimentPart": 材料类别ID<br/>
    &nbsp;&nbsp;       "name_CategoryMaterialExperimentPart": 材料类别名称<br/>
        }],<br/>
    "CategoryExperimentPart": [{<br/>
    &nbsp;&nbsp;		"id_typeExperimentPart": 零件类别ID<br/>
    &nbsp;&nbsp;        "name_typeExperimentPart": 零件类别名称<br/>
        }],<br/>
    "page": {<br/>
    &nbsp;&nbsp;    "pageCount":  总页数<br/>
    },<br/>
    "list": [{<br/>
    &nbsp;&nbsp;		"id_experimentPart": 零件ID<br/>
    &nbsp;&nbsp;		"nameExperimentPart": 零件名称<br/>
    &nbsp;&nbsp;		"numberExperimentPart": 零件编号<br/>
    &nbsp;&nbsp;		"typeExperimentPart": 零件类别<br/>
    &nbsp;&nbsp;		"numberMaterialExperimentPart": 材料编号<br/>
    &nbsp;&nbsp;		"categoryMaterialExperimentPart": 材料类别<br/>
    &nbsp;&nbsp;        "remarkExperimentPart": 备注<br/>
    &nbsp;&nbsp;        "add_time": 添加时间<br/>
    &nbsp;&nbsp;        "user_id": 用户ID<br/>
            
    &nbsp;&nbsp;        "pictureExperimentPartList": [<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;             	"url_pictureExperimentPart": 零件图片url<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_pictureExperimentPart": 图片ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_experimentPart": experimentPart.id_experimentPart<br/>
    &nbsp;&nbsp;        ],<br/>
    &nbsp;&nbsp;        "partExperimentPartList": [<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;            	"url_partExperimentPart": part文件url地址<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "name_partExperimentPart": part文件名称<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_partExperimentPart": part文件ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_experimentPart": experimentPart.id_experimentPart<br/>
    &nbsp;&nbsp;        ],<br/>
    &nbsp;&nbsp;        "informDetailExperimentPartList": [<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;            	"name_informDetailExperimentPart": 详细信息名称<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_informDetailExperimentPart": 详细信息ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_experimentPart": experimentPart.id_experimentPart<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "url_informDetailExperimentPart": 详细信息url<br/>
    &nbsp;&nbsp;        ]<br/>
     }]<br/>
}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	61
  	</td>
  	<td>
  	/experimentItemApp/goAddExperimentPart
  	</td>
  	<td>
  	去添加页面
  	</td>
  	<td>
  	String id  零件ID
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "categoryMaterialExperimentPartList": [{<br/>
    &nbsp;&nbsp;       "id_CategoryMaterialExperimentPart": 材料类别ID<br/>
    &nbsp;&nbsp;       "name_CategoryMaterialExperimentPart": 材料类别名称<br/>
        }],<br/>
    "CategoryExperimentPart": [{<br/>
    &nbsp;&nbsp;		"id_typeExperimentPart": 零件类别ID<br/>
    &nbsp;&nbsp;        "name_typeExperimentPart": 零件类别名称<br/>
        }],<br/>
    "ExperimentItem": [{<br/>
    &nbsp;&nbsp;		"id_experimentPart": 零件ID<br/>
    &nbsp;&nbsp;		"nameExperimentPart": 零件名称<br/>
    &nbsp;&nbsp;		"numberExperimentPart": 零件编号<br/>
    &nbsp;&nbsp;		"typeExperimentPart": 零件类别<br/>
    &nbsp;&nbsp;		"numberMaterialExperimentPart": 材料编号<br/>
    &nbsp;&nbsp;		"categoryMaterialExperimentPart": 材料类别<br/>
    &nbsp;&nbsp;        "remarkExperimentPart": 备注<br/>
    &nbsp;&nbsp;        "add_time": 添加时间<br/>
    &nbsp;&nbsp;        "user_id": 用户ID<br/>
    &nbsp;&nbsp;        "pictureExperimentPartList": [<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;             	"url_pictureExperimentPart": 零件图片url<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_pictureExperimentPart": 图片ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_experimentPart": experimentPart.id_experimentPart<br/>
    &nbsp;&nbsp;        ],<br/>
    &nbsp;&nbsp;        "partExperimentPartList": [<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;            	"url_partExperimentPart": part文件url地址<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "name_partExperimentPart": part文件名称<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_partExperimentPart": part文件ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_experimentPart": experimentPart.id_experimentPart<br/>
    &nbsp;&nbsp;        ],<br/>
    &nbsp;&nbsp;        "informDetailExperimentPartList": [<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;            	"name_informDetailExperimentPart": 详细信息名称<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_informDetailExperimentPart": 详细信息ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_experimentPart": experimentPart.id_experimentPart<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "url_informDetailExperimentPart": 详细信息url<br/>
    &nbsp;&nbsp;        ]<br/>
     }]<br/>
    "array_PictureExperimentPart": 图片url（以，分割）<br/>
    "array_InformDetailExperimentPart": 详细信息url（以，分割）<br/>
    "array_InformDetailExperimentPart_name": 详细信息name（以，分割）<br/>
    "array_PartExperimentPart": part文件url（以，分割）<br/>
    "array_PartExperimentPart_name": part文件name（以，分割）<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	62
  	</td>
  	<td>
  	/experimentItemApp/saveExperimentPart
  	</td>
  	<td>
  	添加零件信息
  	</td>
  	<td>
  	String user_id, 用户ID<br/>
	int id_experimentPart, 零件ID<br/>
	String array_PictureExperimentPart， 图片url（以，分割）<br/>
    String array_InformDetailExperimentPart， 详细信息url（以，分割）<br/>
    String array_InformDetailExperimentPart_name， 详细信息name（以，分割）<br/>
    String array_PartExperimentPart， part文件url（以，分割）<br/>
    String array_PartExperimentPart_name， part文件name（以，分割）<br/>
	String nameExperimentPart, 零件名称<br/>
	String numberExperimentPart, 零件编号<br/>
	String typeExperimentPart, 零件类别<br/>
	String numberMaterialExperimentPart, 材料编号<br/>
	String categoryMaterialExperimentPart, 材料类别<br/>
	String remarkExperimentPart 备注<br/>
  	</td>
  	<td>
  	{<br/>
    &nbsp;&nbsp;"result": "1",<br/>
    &nbsp;&nbsp;"msg": "操作成功"<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	63
  	</td>
  	<td>
  	/experimentItemApp/savePictureExperimentItem
  	</td>
  	<td>
  	保存图片信息
  	</td>
  	<td>
  	String id_experimentPart, 零件ID <br/>
	String array_PictureExperimentPart， 图片url（以，分割）<br/>
    String array_InformDetailExperimentPart， 详细信息url（以，分割）<br/>
    String array_InformDetailExperimentPart_name， 详细信息name（以，分割）<br/>
    String array_PartExperimentPart， part文件url（以，分割）<br/>
    String array_PartExperimentPart_name， part文件name（以，分割）<br/>
	String PictureExperimentPart ,  图片文件<br/>
	String fileSuffix, 文件后缀<br/>
	String filename	文件名带后缀<br/>
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "categoryMaterialExperimentPartList": [{<br/>
    &nbsp;&nbsp;       "id_CategoryMaterialExperimentPart": 材料类别ID<br/>
    &nbsp;&nbsp;       "name_CategoryMaterialExperimentPart": 材料类别名称<br/>
        }],<br/>
    "CategoryExperimentPart": [{<br/>
    &nbsp;&nbsp;		"id_typeExperimentPart": 零件类别ID<br/>
    &nbsp;&nbsp;        "name_typeExperimentPart": 零件类别名称<br/>
        }],<br/>
    "array_PictureExperimentPart": 图片url（以，分割）<br/>
    "array_InformDetailExperimentPart": 详细信息url（以，分割）<br/>
    "array_InformDetailExperimentPart_name": 详细信息name（以，分割）<br/>
    "array_PartExperimentPart": part文件url（以，分割）<br/>
    "array_PartExperimentPart_name": part文件name（以，分割）<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	64
  	</td>
  	<td>
  	/experimentItemApp/saveInformDetailExperimentPart
  	</td>
  	<td>
  	保存详细信息
  	</td>
  	<td>
  	String id_experimentPart, 零件ID <br/>
	String array_PictureExperimentPart， 图片url（以，分割）<br/>
    String array_InformDetailExperimentPart， 详细信息url（以，分割）<br/>
    String array_InformDetailExperimentPart_name， 详细信息name（以，分割）<br/>
    String array_PartExperimentPart， part文件url（以，分割）<br/>
    String array_PartExperimentPart_name， part文件name（以，分割）<br/>
	String InformDetailExperimentPart ,  详细信息文件<br/>
	String fileSuffix, 文件后缀<br/>
	String filename	文件名带后缀<br/>
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "categoryMaterialExperimentPartList": [{<br/>
    &nbsp;&nbsp;       "id_CategoryMaterialExperimentPart": 材料类别ID<br/>
    &nbsp;&nbsp;       "name_CategoryMaterialExperimentPart": 材料类别名称<br/>
        }],<br/>
    "CategoryExperimentPart": [{<br/>
    &nbsp;&nbsp;		"id_typeExperimentPart": 零件类别ID<br/>
    &nbsp;&nbsp;        "name_typeExperimentPart": 零件类别名称<br/>
        }],<br/>
    "array_PictureExperimentPart": 图片url（以，分割）<br/>
    "array_InformDetailExperimentPart": 详细信息url（以，分割）<br/>
    "array_InformDetailExperimentPart_name": 详细信息name（以，分割）<br/>
    "array_PartExperimentPart": part文件url（以，分割）<br/>
    "array_PartExperimentPart_name": part文件name（以，分割）<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	65
  	</td>
  	<td>
  	/experimentItemApp/savePartExperimentPart
  	</td>
  	<td>
  	保存part文件
  	</td>
  	<td>
  	String id_experimentPart, 零件ID <br/>
	String array_PictureExperimentPart， 图片url（以，分割）<br/>
    String array_InformDetailExperimentPart， 详细信息url（以，分割）<br/>
    String array_InformDetailExperimentPart_name， 详细信息name（以，分割）<br/>
    String array_PartExperimentPart， part文件url（以，分割）<br/>
    String array_PartExperimentPart_name， part文件name（以，分割）<br/>
	String PartExperimentPart ,  part文件<br/>
	String fileSuffix, 文件后缀<br/>
	String filename	文件名带后缀<br/>
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "categoryMaterialExperimentPartList": [{<br/>
    &nbsp;&nbsp;       "id_CategoryMaterialExperimentPart": 材料类别ID<br/>
    &nbsp;&nbsp;       "name_CategoryMaterialExperimentPart": 材料类别名称<br/>
        }],<br/>
    "CategoryExperimentPart": [{<br/>
    &nbsp;&nbsp;		"id_typeExperimentPart": 零件类别ID<br/>
    &nbsp;&nbsp;        "name_typeExperimentPart": 零件类别名称<br/>
        }],<br/>
    "array_PictureExperimentPart": 图片url（以，分割）<br/>
    "array_InformDetailExperimentPart": 详细信息url（以，分割）<br/>
    "array_InformDetailExperimentPart_name": 详细信息name（以，分割）<br/>
    "array_PartExperimentPart": part文件url（以，分割）<br/>
    "array_PartExperimentPart_name": part文件name（以，分割）<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	66
  	</td>
  	<td>
  	/experimentItemApp/deleteExperimentItemList
  	</td>
  	<td>
  	删除零件信息
  	</td>
  	<td>
  	String id_experimentPart 零件ID
  	</td>
  	<td>
  	{<br/>
    &nbsp;&nbsp;"result": "1",<br/>
    &nbsp;&nbsp;"msg": "操作成功"<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	67
  	</td>
  	<td>
  	/experimentItemApp/loadingTool
  	</td>
  	<td>
  	去选择材料牌号及类别页面
  	</td>
  	<td>
  	int pageNo, 第几页<br/>
  	int pageSize, 每页几条<br/>
	String NameMaterial, 材料名称<br/>
	String NumberMaterial, 材料牌号<br/>
	String id_CategoryMaterial,材料类别id<br/>
	String ISOCuttingMaterial,ISO加工分类<br/>
	String CategoryMaterial,热处理方式<br/>
	String CompanyMaterial 供应商<br/>
  	</td>
  	<td>
  	{<br/>
    "categoryMaterialList": [{<br/>
     &nbsp;&nbsp;        "name_CategoryMaterial": 材料类别名称<br/>
     &nbsp;&nbsp;        "id_CategoryMaterial": 材料类别ID<br/>
        }],<br/>
    "materialList": [{<br/>
      &nbsp;&nbsp;   	"id_Material": 材料ID<br/>
      &nbsp;&nbsp;   	"NameMaterial": 材料名称<br/>
      &nbsp;&nbsp;   	"NumberMaterial": 材料牌号<br/>
      &nbsp;&nbsp;   	"id_CategoryMaterial": 材料类别id<br/>
      &nbsp;&nbsp;   	"ISOCuttingMaterial": ISO加工分类<br/>
      &nbsp;&nbsp;   	"CategoryMaterial": 热处理方式<br/>
      &nbsp;&nbsp;    	"CompanyMaterial": 供应商<br/>
      &nbsp;&nbsp;  	"ConstituentsMaterial": 材料主要成分<br/>
      &nbsp;&nbsp;    	"MachineableMaterial": 材料加工性<br/>
      &nbsp;&nbsp;  	"DensityMaterial": 材料密度<br/>
      &nbsp;&nbsp;  	"ModulusMaterial": 弹性模量<br/>
      &nbsp;&nbsp;   	"HardnessMaterial": 材料硬度<br/>
      &nbsp;&nbsp;  	"ConductivityMaterial": 材料热导率<br/>
      &nbsp;&nbsp;   	"SpecificheatMaterial": 材料比热<br/>
      &nbsp;&nbsp;  	"StrengthMaterial": 抗拉强度<br/>
      &nbsp;&nbsp;  	"ThermalExpansionMaterial": 热膨胀系数<br/>
      &nbsp;&nbsp;   	"JCMaterial": JC模型<br/>
      &nbsp;&nbsp;      "StrainRate": 应变率<br/>
      &nbsp;&nbsp;       "user_id": 用户ID<br/>
      &nbsp;&nbsp;      "add_time": 添加时间<br/>
        }]<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	68
  	</td>
  	<td>
  	/experimentItemApp/goLoading
  	</td>
  	<td>
  	选择后回到添加页面
  	</td>
  	<td>
  	String id 材料ID
  	</td>
  	<td>
  	{<br/>
    "categoryMaterialList": [{<br/>
     &nbsp;&nbsp;        "name_CategoryMaterial": 材料类别名称<br/>
     &nbsp;&nbsp;        "id_CategoryMaterial": 材料类别ID<br/>
        }],<br/>
    "materialList": [{<br/>
      &nbsp;&nbsp;   	"id_Material": 材料ID<br/>
      &nbsp;&nbsp;   	"NameMaterial": 材料名称<br/>
      &nbsp;&nbsp;   	"NumberMaterial": 材料牌号<br/>
      &nbsp;&nbsp;   	"id_CategoryMaterial": 材料类别id<br/>
      &nbsp;&nbsp;   	"ISOCuttingMaterial": ISO加工分类<br/>
      &nbsp;&nbsp;   	"CategoryMaterial": 热处理方式<br/>
      &nbsp;&nbsp;    	"CompanyMaterial": 供应商<br/>
      &nbsp;&nbsp;  	"ConstituentsMaterial": 材料主要成分<br/>
      &nbsp;&nbsp;    	"MachineableMaterial": 材料加工性<br/>
      &nbsp;&nbsp;  	"DensityMaterial": 材料密度<br/>
      &nbsp;&nbsp;  	"ModulusMaterial": 弹性模量<br/>
      &nbsp;&nbsp;   	"HardnessMaterial": 材料硬度<br/>
      &nbsp;&nbsp;  	"ConductivityMaterial": 材料热导率<br/>
      &nbsp;&nbsp;   	"SpecificheatMaterial": 材料比热<br/>
      &nbsp;&nbsp;  	"StrengthMaterial": 抗拉强度<br/>
      &nbsp;&nbsp;  	"ThermalExpansionMaterial": 热膨胀系数<br/>
      &nbsp;&nbsp;   	"JCMaterial": JC模型<br/>
      &nbsp;&nbsp;      "StrainRate": 应变率<br/>
      &nbsp;&nbsp;       "user_id": 用户ID<br/>
      &nbsp;&nbsp;      "add_time": 添加时间<br/>
        }]<br/>
       NumberMaterial：材料牌号<br/>
       name_CategoryMaterial:材料类别<br/> 
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	69
  	</td>
  	<td>
  	/designTurningBladeApp/queryDesignTurningBladeList
  	</td>
  	<td>
  	查询刀片设计列表
  	</td>
  	<td>
  	int pageNo, 第几页<br/>
  	int pageSize, 每页几条<br/>
	String DesignNumberTurningBlade, 刀片设计编号<br/>
	String DesignTypeBTADrill, 刀片类型<br/>
	String DesignISOBladeTurning, ISO基准刀片<br/>
	String DesignMachiningTypeBladeTurning, 加工类别<br/>
	String DesignCompanyTurningBlade, 刀片设计厂商<br/>
	String DesignToolBladeFeatureTurning 刀片特点<br/>
  	</td>
  	<td>
  	{<br/>
    result: "1",<br/>
    para: {<br/>
    &nbsp;&nbsp;    DesignNumberTurningBlade, 刀片设计编号<br/>
	&nbsp;&nbsp;	DesignTypeBTADrill, 刀片类型<br/>
	&nbsp;&nbsp;	DesignISOBladeTurning, ISO基准刀片<br/>
	&nbsp;&nbsp;	DesignMachiningTypeBladeTurning, 加工类别<br/>
	&nbsp;&nbsp;	DesignCompanyTurningBlade, 刀片设计厂商<br/>
	&nbsp;&nbsp;	DesignToolBladeFeatureTurning 刀片特点<br/>
    },<br/>
    page: {<br/>
    &nbsp;&nbsp;    pageCount: 总页数<br/>
    },<br/>
    list: [{<br/>
    &nbsp;&nbsp;     id_DesignTurningBlade: 刀片设计ID,<br/>
    &nbsp;&nbsp;     DesignNumberTurningBlade: 刀片设计编号,<br/>
    &nbsp;&nbsp;     DesignNameTurningBlade: 刀片名称,<br/>
    &nbsp;&nbsp;     DesignTypeBTADrill: 刀片类型,<br/>
    &nbsp;&nbsp;     DesignISOBladeTurning: ISO基准刀片,<br/>
    &nbsp;&nbsp;     DesignMachiningTypeBladeTurning: 加工类别,<br/>
    &nbsp;&nbsp;     DesignCompanyTurningBlade: 刀片设计厂商,<br/>
    &nbsp;&nbsp;     DesignToolBladeFeatureTurning: 刀片特点,<br/>
    &nbsp;&nbsp;     DesignQianjiaoBladeTurning: 前角,<br/>
    &nbsp;&nbsp;     DesignHoujiaoBladeTurning: 后角,<br/>
    &nbsp;&nbsp;     DesignRenqingjiaoBladeTurning: 刃倾角,<br/>
    &nbsp;&nbsp;     DesignNoseRadiusTurning: 刀尖圆弧半径,<br/>
    &nbsp;&nbsp;     DesignBreakerBladeTurning: 断屑槽类型,<br/>
         
    &nbsp;&nbsp;     pictureDesignTurningBladeList: [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;     		 "id_PictureDesignTurningBlade": 刀片设计图片ID,<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;    		 "id_DesignTurningBlade": int DesignTurningBlade.id_DesignTurningBlade,<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;             "url_PictureDesignTurningBlade": 刀片设计图片url<br/>
    &nbsp;&nbsp;     }],<br/>
         
    &nbsp;&nbsp;     partDesignTurningBladeList: [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;    		 "id_PartDesignTurningBlade": part文件ID,<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;    		 "id_DesignTurningBlade": int DesignTurningBlade.id_DesignTurningBlade,<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;    		 "url_PartDesignTurningBlade": part文件url,<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;             "name_PartDesignTurningBlade": part文件name<br/>
    &nbsp;&nbsp;    }],<br/>
         
    &nbsp;&nbsp;     informDetailDesignTurningBladeList: [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;             "id_InformDetailDesignTurningBlade": 详细信息ID,<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;             "id_DesignTurningBlade": int DesignTurningBlade.id_DesignTurningBlade,<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;             "url_InformDetailDesignTurningBlade": 详细信息url<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;             "name_InformDetailDesignTurningBlade": 详细信息name<br/>
    &nbsp;&nbsp;     }],<br/>
     }]<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	70
  	</td>
  	<td>
  	/designTurningBladeApp/goAddDesignTurningBlade
  	</td>
  	<td>
  	去添加刀片设计页面
  	</td>
  	<td>
  	String id 刀片设计ID
  	</td>
  	<td>
  	
  	{<br/>
    result: "1",<br/>
    designturningBlade: [{<br/>
    &nbsp;&nbsp;     id_DesignTurningBlade: 刀片设计ID,<br/>
    &nbsp;&nbsp;     DesignNumberTurningBlade: 刀片设计编号,<br/>
    &nbsp;&nbsp;     DesignNameTurningBlade: 刀片名称,<br/>
    &nbsp;&nbsp;     DesignTypeBTADrill: 刀片类型,<br/>
    &nbsp;&nbsp;     DesignISOBladeTurning: ISO基准刀片,<br/>
    &nbsp;&nbsp;     DesignMachiningTypeBladeTurning: 加工类别,<br/>
    &nbsp;&nbsp;     DesignCompanyTurningBlade: 刀片设计厂商,<br/>
    &nbsp;&nbsp;     DesignToolBladeFeatureTurning: 刀片特点,<br/>
    &nbsp;&nbsp;     DesignQianjiaoBladeTurning: 前角,<br/>
    &nbsp;&nbsp;     DesignHoujiaoBladeTurning: 后角,<br/>
    &nbsp;&nbsp;     DesignRenqingjiaoBladeTurning: 刃倾角,<br/>
    &nbsp;&nbsp;     DesignNoseRadiusTurning: 刀尖圆弧半径,<br/>
    &nbsp;&nbsp;     DesignBreakerBladeTurning: 断屑槽类型,<br/>
         
    &nbsp;&nbsp;     pictureDesignTurningBladeList: [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;     		 "id_PictureDesignTurningBlade": 刀片设计图片ID,<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;    		 "id_DesignTurningBlade": int DesignTurningBlade.id_DesignTurningBlade,<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;             "url_PictureDesignTurningBlade": 刀片设计图片url<br/>
    &nbsp;&nbsp;     }],<br/>
         
    &nbsp;&nbsp;     partDesignTurningBladeList: [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;    		 "id_PartDesignTurningBlade": part文件ID,<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;    		 "id_DesignTurningBlade": int DesignTurningBlade.id_DesignTurningBlade,<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;    		 "url_PartDesignTurningBlade": part文件url,<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;             "name_PartDesignTurningBlade": part文件name<br/>
    &nbsp;&nbsp;    }],<br/>
         
    &nbsp;&nbsp;     informDetailDesignTurningBladeList: [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;             "id_InformDetailDesignTurningBlade": 详细信息ID,<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;             "id_DesignTurningBlade": int DesignTurningBlade.id_DesignTurningBlade,<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;             "url_InformDetailDesignTurningBlade": 详细信息url<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;             "name_InformDetailDesignTurningBlade": 详细信息name<br/>
    &nbsp;&nbsp;     }],<br/>
     }]<br/>
    ISOList: List 用于ISO字段加载已有信息，做类似百度筛选列表用<br/>
    array_PictureDesignTurningBlade: 刀片设计图片url（以，分割）<br/>
    array_InformDetailDesignTurningBlade: 详细信息url（以，分割）<br/>
    array_InformDetailDesignTurningBlade_name: 详细信息name（以，分割）<br/>
    array_PartDesignTurningBlade: part文件url（以，分割）<br/>
    array_PartDesignTurningBlade_name: part文件name（以，分割）<br/>
	}<br/>
	
  	</td>
  </tr>
  <tr>
  	<td>
  	71
  	</td>
  	<td>
  	/designTurningBladeApp/saveDesignTurningBlade
  	</td>
  	<td>
  	添加刀片设计信息
  	</td>
  	<td>
  	String user_id, 用户ID<br/>
	int id_DesignTurningBlade, 刀片设计ID<br/>
	String DesignNumberTurningBlade, 刀片设计编号<br/>
	String DesignNameTurningBlade, 刀片名称<br/>
	String DesignTypeBTADrill, 刀片类型<br/>
	String DesignISOBladeTurning, ISO基准刀片<br/>
	String DesignMachiningTypeBladeTurning, 加工类别<br/>
	String DesignCompanyTurningBlade, 刀片设计厂商<br/>
	String DesignToolBladeFeatureTurning, 刀片特点<br/>
	String DesignQianjiaoBladeTurning, 前角<br/>
	String DesignHoujiaoBladeTurning, 后角<br/>
	String DesignRenqingjiaoBladeTurning, 刃倾角<br/>
	String DesignNoseRadiusTurning, 刀尖圆弧半径<br/>
	String DesignBreakerBladeTurning, 断屑槽类型<br/>
	String array_PictureDesignTurningBlade: 刀片设计图片url（以，分割）<br/>
    String array_InformDetailDesignTurningBlade: 详细信息url（以，分割）<br/>
    String array_InformDetailDesignTurningBlade_name: 详细信息name（以，分割）<br/>
    String array_PartDesignTurningBlade: part文件url（以，分割）<br/>
    String array_PartDesignTurningBlade_name: part文件name（以，分割）<br/>
  	</td>
  	<td>
  	{<br/>
    &nbsp;&nbsp;"result": "1",<br/>
    &nbsp;&nbsp;"msg": "操作成功"<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	72
  	</td>
  	<td>
  	/designTurningBladeApp/savePictureDesignTurningBlade
  	</td>
  	<td>
  	保存刀片设计图片
  	</td>
  	<td>
  	String array_PictureDesignTurningBlade: 刀片设计图片url（以，分割）<br/>
    String array_InformDetailDesignTurningBlade: 详细信息url（以，分割）<br/>
    String array_InformDetailDesignTurningBlade_name: 详细信息name（以，分割）<br/>
    String array_PartDesignTurningBlade: part文件url（以，分割）<br/>
    String array_PartDesignTurningBlade_name: part文件name（以，分割）<br/>
	String PictureDesignTurningBlade ,图片文件<br/>
	String fileSuffix, 图片文件后缀<br/>
	String filename 图片文件名字带后缀<br/>
  	</td>
  	<td>
  	{<br/>
  	result: "1",<br/>
  	ISOList: List 用于ISO字段加载已有信息，做类似百度筛选列表用<br/>
    array_PictureDesignTurningBlade: 刀片设计图片url（以，分割）<br/>
    array_InformDetailDesignTurningBlade: 详细信息url（以，分割）<br/>
    array_InformDetailDesignTurningBlade_name: 详细信息name（以，分割）<br/>
    array_PartDesignTurningBlade: part文件url（以，分割）<br/>
    array_PartDesignTurningBlade_name: part文件name（以，分割）<br/>
    }<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	73
  	</td>
  	<td>
  	/designTurningBladeApp/savePartDesignTurningBlade
  	</td>
  	<td>
  	保存刀片设计part文件
  	</td>
  	<td>
  	String array_PictureDesignTurningBlade: 刀片设计图片url（以，分割）<br/>
    String array_InformDetailDesignTurningBlade: 详细信息url（以，分割）<br/>
    String array_InformDetailDesignTurningBlade_name: 详细信息name（以，分割）<br/>
    String array_PartDesignTurningBlade: part文件url（以，分割）<br/>
    String array_PartDesignTurningBlade_name: part文件name（以，分割）<br/>
	String PartDesignTurningBlade ,图片文件<br/>
	String fileSuffix, 图片文件后缀<br/>
	String filename 图片文件名字带后缀<br/>
  	</td>
  	<td>
  	{<br/>
  	result: "1",<br/>
  	ISOList: List 用于ISO字段加载已有信息，做类似百度筛选列表用<br/>
    array_PictureDesignTurningBlade: 刀片设计图片url（以，分割）<br/>
    array_InformDetailDesignTurningBlade: 详细信息url（以，分割）<br/>
    array_InformDetailDesignTurningBlade_name: 详细信息name（以，分割）<br/>
    array_PartDesignTurningBlade: part文件url（以，分割）<br/>
    array_PartDesignTurningBlade_name: part文件name（以，分割）<br/>
    }<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	74
  	</td>
  	<td>
  	/designTurningBladeApp/saveInformDetailDesignTurningBlade
  	</td>
  	<td>
  	保存刀片设计详细信息
  	</td>
  	<td>
  	String array_PictureDesignTurningBlade: 刀片设计图片url（以，分割）<br/>
    String array_InformDetailDesignTurningBlade: 详细信息url（以，分割）<br/>
    String array_InformDetailDesignTurningBlade_name: 详细信息name（以，分割）<br/>
    String array_PartDesignTurningBlade: part文件url（以，分割）<br/>
    String array_PartDesignTurningBlade_name: part文件name（以，分割）<br/>
	String InformDetailDesignTurningBlade ,图片文件<br/>
	String fileSuffix, 图片文件后缀<br/>
	String filename 图片文件名字带后缀<br/>
  	</td>
  	<td>
  	{<br/>
  	result: "1",<br/>
  	ISOList: List 用于ISO字段加载已有信息，做类似百度筛选列表用<br/>
    array_PictureDesignTurningBlade: 刀片设计图片url（以，分割）<br/>
    array_InformDetailDesignTurningBlade: 详细信息url（以，分割）<br/>
    array_InformDetailDesignTurningBlade_name: 详细信息name（以，分割）<br/>
    array_PartDesignTurningBlade: part文件url（以，分割）<br/>
    array_PartDesignTurningBlade_name: part文件name（以，分割）<br/>
    }<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	75
  	</td>
  	<td>
  	/designTurningBladeApp/deleteDesignTurningBlade
  	</td>
  	<td>
  	删除刀片设计信息
  	</td>
  	<td>
  	String id_DesignTurningBlade 刀片设计ID<br/>
  	</td>
  	<td>
  	{<br/>
    &nbsp;&nbsp;"result": "1",<br/>
    &nbsp;&nbsp;"msg": "操作成功"<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	76
  	</td>
  	<td>
  	/designTurningHolderApp/queryDesignTurningHolderList
  	</td>
  	<td>
  	查询刀柄设计页面信息
  	</td>
  	<td>
  	int pageNo, 第几页 <br/>
  	int pageSize, 每页几条<br/>
	String DesignNumberTurningHolder, 刀柄设计编号<br/>
	String DesignNameTurningHolder, 刀柄名称<br/>
	String DesignTypeTurningHolder, 加工类别<br/>
	String DesignISOBladeTurning, ISO基准刀片<br/>
	String DesignBladecategoryTurningHolder, 刀片类别<br/>
	String DesignEdgeAngleTurningHolder, 主偏角<br/>
	String DesignCompanyTurningHolder 生产厂家<br/>
  	</td>
  	<td>
  	{<br/>
    "result": "1",状态<br/>
    "para": {<br/>
    &nbsp;&nbsp;   	DesignNumberTurningHolder, 刀柄设计编号<br/>
	&nbsp;&nbsp;	DesignNameTurningHolder, 刀柄名称<br/>
	&nbsp;&nbsp;	DesignTypeTurningHolder, 加工类别<br/>
	&nbsp;&nbsp;	DesignISOBladeTurning, ISO基准刀片<br/>
	&nbsp;&nbsp;	DesignBladecategoryTurningHolder, 刀片类别<br/>
	&nbsp;&nbsp;	DesignEdgeAngleTurningHolder, 主偏角<br/>
	&nbsp;&nbsp;	DesignCompanyTurningHolder 生产厂家<br/>
    },<br/>
    "page": {<br/>
    &nbsp;&nbsp;    "pageCount": 总页数<br/>
    },<br/>
    "list": [{<br/>
    &nbsp;&nbsp;		"id_DesignTurningHolder": 刀柄设计ID<br/>
    &nbsp;&nbsp;		"DesignNumberTurningHolder": 刀柄设计编号<br/>
    &nbsp;&nbsp;		"DesignNameTurningHolder": 刀柄名称<br/>
    &nbsp;&nbsp;		"DesignTypeTurningHolder": 加工类别<br/>
    &nbsp;&nbsp;		"DesignISOBladeTurning": ISO基准刀片<br/>
    &nbsp;&nbsp;		"DesignBladecategoryTurningHolder": 刀片类别<br/>
    &nbsp;&nbsp;		"DesignEdgeAngleTurningHolder": 主偏角<br/>
    &nbsp;&nbsp;        "DesignFeatureTurningHolder": 加工特性简述<br/>
    &nbsp;&nbsp;        "DesignCompanyTurningHolder": 生产厂家<br/>
    &nbsp;&nbsp;        "DesignTypeCustomBlade": 自定义刀片类别<br/>
            
    &nbsp;&nbsp;        "pictureDesignTurningHolderList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;        		"id_PictureDesignTurningHolder": 刀柄设计图片ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;        		"id_DesignTurningHolder": int DesignTurningHolder.id_DesignTurningHolder<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "url_PictureDesignTurningHolder": 刀柄设计图片Url<br/>
    &nbsp;&nbsp;            }]<br/>
                
    &nbsp;&nbsp;        "partDesignTurningHolderList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;        		"id_PartDesignTurningHolder": part文件ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;        		"id_DesignTurningHolder": int DesignTurningHolder.id_DesignTurningHolder<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "name_PartDesignTurningHolder": part文件name<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "url_PartDesignTurningHolder": part文件url<br/>
    &nbsp;&nbsp;            }],<br/>
            
    &nbsp;&nbsp;        "informDetailDesignTurningHolderList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_InformDetailDesignTurningHolder": 详细信息ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_DesignTurningHolder": int DesignTurningHolder.id_DesignTurningHolder<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "url_InformDetailDesignTurningHolder": 详细信息url<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "name_InformDetailDesignTurningHolder": 详细信息name<br/>
    &nbsp;&nbsp;            }],<br/>
                
      }],<br/>
    "categoryDesignTurningHolder": [{<br/>
    &nbsp;&nbsp;        "id_CategoryDesignTurningHolder": 刀柄设计加工类别ID<br/>
    &nbsp;&nbsp;        "name_CategoryDesignTurningHolder": 刀柄设计加工类别name<br/>
      }]<br/>
}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	77
  	</td>
  	<td>
  	/designTurningHolderApp/goAddDesignTurningHolder
  	</td>
  	<td>
  	去添加刀柄设计页面
  	</td>
  	<td>
  	String id 刀柄设计ID
  	</td>
  	<td>
  	{<br/>
    "result": "1",状态<br/>
    "designturningHolder": [{<br/>
    &nbsp;&nbsp;		"id_DesignTurningHolder": 刀柄设计ID<br/>
    &nbsp;&nbsp;		"DesignNumberTurningHolder": 刀柄设计编号<br/>
    &nbsp;&nbsp;		"DesignNameTurningHolder": 刀柄名称<br/>
    &nbsp;&nbsp;		"DesignTypeTurningHolder": 加工类别<br/>
    &nbsp;&nbsp;		"DesignISOBladeTurning": ISO基准刀片<br/>
    &nbsp;&nbsp;		"DesignBladecategoryTurningHolder": 刀片类别<br/>
    &nbsp;&nbsp;		"DesignEdgeAngleTurningHolder": 主偏角<br/>
    &nbsp;&nbsp;        "DesignFeatureTurningHolder": 加工特性简述<br/>
    &nbsp;&nbsp;        "DesignCompanyTurningHolder": 生产厂家<br/>
    &nbsp;&nbsp;        "DesignTypeCustomBlade": 自定义刀片类别<br/>
            
    &nbsp;&nbsp;        "pictureDesignTurningHolderList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;        		"id_PictureDesignTurningHolder": 刀柄设计图片ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;        		"id_DesignTurningHolder": int DesignTurningHolder.id_DesignTurningHolder<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "url_PictureDesignTurningHolder": 刀柄设计图片Url<br/>
    &nbsp;&nbsp;            }]<br/>
                
    &nbsp;&nbsp;        "partDesignTurningHolderList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;        		"id_PartDesignTurningHolder": part文件ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;        		"id_DesignTurningHolder": int DesignTurningHolder.id_DesignTurningHolder<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "name_PartDesignTurningHolder": part文件name<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "url_PartDesignTurningHolder": part文件url<br/>
    &nbsp;&nbsp;            }],<br/>
            
    &nbsp;&nbsp;        "informDetailDesignTurningHolderList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_InformDetailDesignTurningHolder": 详细信息ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_DesignTurningHolder": int DesignTurningHolder.id_DesignTurningHolder<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "url_InformDetailDesignTurningHolder": 详细信息url<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "name_InformDetailDesignTurningHolder": 详细信息name<br/>
    &nbsp;&nbsp;            }],<br/>
                
      }],<br/>
    "categoryDesignTurningHolder": [{<br/>
    &nbsp;&nbsp;        "id_CategoryDesignTurningHolder": 刀柄设计加工类别ID<br/>
    &nbsp;&nbsp;        "name_CategoryDesignTurningHolder": 刀柄设计加工类别name<br/>
      }]<br/>
    "ISOList": list 用于ISO字段加载已有信息，做类似百度筛选列表用<br/>
	"array_PictureDesignTurningHolder": 刀柄设计图片url（以，分割）<br/>
	"array_PartDesignTurningHolder": part文件url（以，分割）<br/>
    "array_PartDesignTurningHolder_name": part文件name（以，分割）<br/>
    "array_InformDetailDesignTurningHolder": 详细信息url（以，分割）<br/>
    "array_InformDetailDesignTurningHolder_name": 详细信息name（以，分割）<br/>
    }<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	78
  	</td>
  	<td>
  	/designTurningHolderApp/saveDesignTurningHolder
  	</td>
  	<td>
  	添加刀柄设计页面
  	</td>
  	<td>
  	String user_id, 用户ID<br/>
	int id_DesignTurningHolder, 刀柄设计ID<br/>
	String array_PictureDesignTurningHolder: 刀柄设计图片url（以，分割）<br/>
	String array_PartDesignTurningHolder: part文件url（以，分割）<br/>
    String array_PartDesignTurningHolder_name: part文件name（以，分割）<br/>
    String array_InformDetailDesignTurningHolder: 详细信息url（以，分割）<br/>
    String array_InformDetailDesignTurningHolder_name: 详细信息name（以，分割）<br/>
	String DesignNumberTurningHolder, 刀柄设计编号<br/>
	String DesignNameTurningHolder, 刀柄名称<br/>
	String DesignTypeTurningHolder, 加工类别<br/>
	String DesignISOBladeTurning, ISO基准刀片<br/>
	String DesignBladecategoryTurningHolder, 刀片类别<br/>
	String DesignEdgeAngleTurningHolder, 主偏角<br/>
	String DesignFeatureTurningHolder, 加工特性简述<br/>
	String DesignCompanyTurningHolder, 生产厂家<br/>
	String DesignTypeCustomBlade 自定义刀片类别<br/>
  	</td>
  	<td>
  	{<br/>
    &nbsp;&nbsp;"result": "1",<br/>
    &nbsp;&nbsp;"msg": "操作成功"<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	79
  	</td>
  	<td>
  	/designTurningHolderApp/savePictureDesignTurningHolder
  	</td>
  	<td>
  	添加刀柄设计图片
  	</td>
  	<td>
  	String array_PictureDesignTurningHolder: 刀柄设计图片url（以，分割）<br/>
	String array_PartDesignTurningHolder: part文件url（以，分割）<br/>
    String array_PartDesignTurningHolder_name: part文件name（以，分割）<br/>
    String array_InformDetailDesignTurningHolder: 详细信息url（以，分割）<br/>
    String array_InformDetailDesignTurningHolder_name: 详细信息name（以，分割）<br/>
	String PictureDesignTurningHolder 刀柄设计图片文件<br/>
	String fileSuffix 文件后缀<br/>
	String filename 文件名字带后缀<br/>
  	</td>
  	<td>
  	{<br/>
    "result": "1",状态<br/>
    "categoryDesignTurningHolder": [{<br/>
    &nbsp;&nbsp;        "id_CategoryDesignTurningHolder": 刀柄设计加工类别ID<br/>
    &nbsp;&nbsp;        "name_CategoryDesignTurningHolder": 刀柄设计加工类别name<br/>
      }]<br/>
    "ISOList": list 用于ISO字段加载已有信息，做类似百度筛选列表用<br/>
	"array_PictureDesignTurningHolder": 刀柄设计图片url（以，分割）<br/>
	"array_PartDesignTurningHolder": part文件url（以，分割）<br/>
    "array_PartDesignTurningHolder_name": part文件name（以，分割）<br/>
    "array_InformDetailDesignTurningHolder": 详细信息url（以，分割）<br/>
    "array_InformDetailDesignTurningHolder_name": 详细信息name（以，分割）<br/>
    }<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	80
  	</td>
  	<td>
  	/designTurningHolderApp/savePartDesignTurningHolder
  	</td>
  	<td>
  	添加part文件
  	</td>
  	<td>
  	String array_PictureDesignTurningHolder: 刀柄设计图片url（以，分割）<br/>
	String array_PartDesignTurningHolder: part文件url（以，分割）<br/>
    String array_PartDesignTurningHolder_name: part文件name（以，分割）<br/>
    String array_InformDetailDesignTurningHolder: 详细信息url（以，分割）<br/>
    String array_InformDetailDesignTurningHolder_name: 详细信息name（以，分割）<br/>
	String PartDesignTurningHolder part文件<br/>
	String fileSuffix 文件后缀<br/>
	String filename 文件名字带后缀<br/>
  	</td>
  	<td>
  	{<br/>
    "result": "1",状态<br/>
    "categoryDesignTurningHolder": [{<br/>
    &nbsp;&nbsp;        "id_CategoryDesignTurningHolder": 刀柄设计加工类别ID<br/>
    &nbsp;&nbsp;        "name_CategoryDesignTurningHolder": 刀柄设计加工类别name<br/>
      }]<br/>
    "ISOList": list 用于ISO字段加载已有信息，做类似百度筛选列表用<br/>
	"array_PictureDesignTurningHolder": 刀柄设计图片url（以，分割）<br/>
	"array_PartDesignTurningHolder": part文件url（以，分割）<br/>
    "array_PartDesignTurningHolder_name": part文件name（以，分割）<br/>
    "array_InformDetailDesignTurningHolder": 详细信息url（以，分割）<br/>
    "array_InformDetailDesignTurningHolder_name": 详细信息name（以，分割）<br/>
    }<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	81
  	</td>
  	<td>
  	/designTurningHolderApp/saveInformDetailDesignTurningHolder
  	</td>
  	<td>
  	添加详细信息
  	</td>
  	<td>
  	String array_PictureDesignTurningHolder: 刀柄设计图片url（以，分割）<br/>
	String array_PartDesignTurningHolder: part文件url（以，分割）<br/>
    String array_PartDesignTurningHolder_name: part文件name（以，分割）<br/>
    String array_InformDetailDesignTurningHolder: 详细信息url（以，分割）<br/>
    String array_InformDetailDesignTurningHolder_name: 详细信息name（以，分割）<br/>
	String InformDetailDesignTurningHolder 详细信息文件<br/>
	String fileSuffix 文件后缀<br/>
	String filename 文件名字带后缀<br/>
  	</td>
  	<td>
  	{<br/>
    "result": "1",状态<br/>
    "categoryDesignTurningHolder": [{<br/>
    &nbsp;&nbsp;        "id_CategoryDesignTurningHolder": 刀柄设计加工类别ID<br/>
    &nbsp;&nbsp;        "name_CategoryDesignTurningHolder": 刀柄设计加工类别name<br/>
      }]<br/>
    "ISOList": list 用于ISO字段加载已有信息，做类似百度筛选列表用<br/>
	"array_PictureDesignTurningHolder": 刀柄设计图片url（以，分割）<br/>
	"array_PartDesignTurningHolder": part文件url（以，分割）<br/>
    "array_PartDesignTurningHolder_name": part文件name（以，分割）<br/>
    "array_InformDetailDesignTurningHolder": 详细信息url（以，分割）<br/>
    "array_InformDetailDesignTurningHolder_name": 详细信息name（以，分割）<br/>
    }<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	82
  	</td>
  	<td>
  	/designTurningHolderApp/deleteDesignTurningHolderList
  	</td>
  	<td>
  	删除刀柄设计信息
  	</td>
  	<td>
  	String id_DesignTurningHolder 刀柄设计ID
  	</td>
  	<td>
  	{<br/>
    &nbsp;&nbsp;"result": "1",<br/>
    &nbsp;&nbsp;"msg": "操作成功"<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	83
  	</td>
  	<td>
  	/designTurningHolderApp/toTurningBlade
  	</td>
  	<td>
  	到刀片设计列表（用于刀片信息按钮）
  	</td>
  	<td>
  	int pageNo, 第几页<br/>
  	int pageSize, 每页几条<br/>
  	String id, 刀柄设计ID（到刀片页面后将这个刀柄ID存下来，预留以后用）<br/>
	String DesignNumberTurningBlade, 刀片设计编号<br/>
	String DesignTypeBTADrill, 刀片类型<br/>
	String DesignISOBladeTurning, ISO基准刀片<br/>
	String DesignMachiningTypeBladeTurning, 加工类别<br/>
	String DesignCompanyTurningBlade,刀片设计厂商<br/>
	String DesignToolBladeFeatureTurning 刀片特点<br/>
  	</td>
  	<td>
  	{<br/>
	result: "1",<br/>
	para: {<br/>
	&nbsp;&nbsp;    DesignNumberTurningBlade, 刀片设计编号<br/>
	&nbsp;&nbsp;  	DesignTypeBTADrill, 刀片类型<br/>
	&nbsp;&nbsp;  	DesignISOBladeTurning, ISO基准刀片<br/>
	&nbsp;&nbsp;  	DesignMachiningTypeBladeTurning, 加工类别<br/>
	&nbsp;&nbsp;  	DesignCompanyTurningBlade, 刀片设计厂商<br/>
	&nbsp;&nbsp;  	DesignToolBladeFeatureTurning 刀片特点<br/>
	},<br/>
	page: {<br/>
	 &nbsp;&nbsp;  pageCount: 总页数<br/>
	},<br/>
	list: [{<br/>
	&nbsp;&nbsp;   id_DesignTurningBlade: 刀片设计ID,<br/>
	&nbsp;&nbsp;   DesignNumberTurningBlade: 刀片设计编号,<br/>
	&nbsp;&nbsp;   DesignNameTurningBlade: 刀片名称,<br/>
	&nbsp;&nbsp;   DesignTypeBTADrill: 刀片类型,<br/>
	&nbsp;&nbsp;   DesignISOBladeTurning: ISO基准刀片,<br/>
	&nbsp;&nbsp;   DesignMachiningTypeBladeTurning: 加工类别,<br/>
	&nbsp;&nbsp;   DesignCompanyTurningBlade: 刀片设计厂商,<br/>
	&nbsp;&nbsp;   DesignToolBladeFeatureTurning: 刀片特点,<br/>
	&nbsp;&nbsp;   DesignQianjiaoBladeTurning: 前角,<br/>
	&nbsp;&nbsp;   DesignHoujiaoBladeTurning: 后角,<br/>
	&nbsp;&nbsp;   DesignRenqingjiaoBladeTurning: 刃倾角,<br/>
	&nbsp;&nbsp;   DesignNoseRadiusTurning: 刀尖圆弧半径,<br/>
	&nbsp;&nbsp;   DesignBreakerBladeTurning: 断屑槽类型,<br/>
	&nbsp;&nbsp;   pictureDesignTurningBladeList: [{<br/>
	&nbsp;&nbsp; &nbsp;&nbsp;    "id_PictureDesignTurningBlade": 刀片设计图片ID,<br/>
	&nbsp;&nbsp; &nbsp;&nbsp;    "id_DesignTurningBlade": int DesignTurningBlade.id_DesignTurningBlade,<br/>
	&nbsp;&nbsp; &nbsp;&nbsp;    "url_PictureDesignTurningBlade": 刀片设计图片url<br/>
	 &nbsp;&nbsp;  }],<br/>
	 &nbsp;&nbsp;  partDesignTurningBladeList: [{<br/>
	&nbsp;&nbsp; &nbsp;&nbsp;    "id_PartDesignTurningBlade": part文件ID,<br/>
	&nbsp;&nbsp; &nbsp;&nbsp;    "id_DesignTurningBlade": int DesignTurningBlade.id_DesignTurningBlade,<br/>
	  &nbsp;&nbsp;&nbsp;&nbsp;   "url_PartDesignTurningBlade": part文件url,<br/>
	  &nbsp;&nbsp;&nbsp;&nbsp;   "name_PartDesignTurningBlade": part文件name<br/>
	  &nbsp;&nbsp; }],<br/>
	 &nbsp;&nbsp;  informDetailDesignTurningBladeList: [{<br/>
	 &nbsp;&nbsp;&nbsp;&nbsp;    "id_InformDetailDesignTurningBlade": 详细信息ID,<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;     "id_DesignTurningBlade": int DesignTurningBlade.id_DesignTurningBlade,<br/>
	 &nbsp;&nbsp;&nbsp;&nbsp;    "url_InformDetailDesignTurningBlade": 详细信息url<br/>
	 &nbsp;&nbsp;&nbsp;&nbsp;    "name_InformDetailDesignTurningBlade": 详细信息name<br/>
	&nbsp;&nbsp;   }],<br/>
	}]<br/>
	"TurningHolderId": 刀柄设计ID（存下来，预留以后用）<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	84
  	</td>
  	<td>
  	/CuttingFluidMaterialApp/queryCuttingFluidMaterialList
  	</td>
  	<td>
  	查询切削液页面
  	</td>
  	<td>
  	int pageNo, 第几页<br/>
  	int pageSize, 每页几条<br/>
	String NameCuttingFluid, 切削液名称<br/>
	String NumberCuttingFluid, 切削液编号<br/>
	String CategoryCuttingFluid, 切削液种类<br/>
	String CompanyCuttingFluid 供应商<br/>
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "CategoryCuttingFluidMaterialList": [{<br/>
    &nbsp;&nbsp;        "id_CategoryCuttingFluid": 切削液类别ID<br/>
    &nbsp;&nbsp;        "name_CategoryCuttingFluid": 切削液类别名称<br/>
     }],<br/>
    "para": {<br/>
     &nbsp;&nbsp;   NameCuttingFluid, 切削液名称<br/>
	&nbsp;&nbsp;	NumberCuttingFluid, 切削液编号<br/>
	&nbsp;&nbsp;	CategoryCuttingFluid, 切削液种类<br/>
	&nbsp;&nbsp;	CompanyCuttingFluid 供应商<br/>
    },<br/>
    "page": {<br/>
    &nbsp;&nbsp;    "pageCount": 总页数<br/>
    },<br/>
    "list": [{<br/>
    &nbsp;&nbsp;		"id_CuttingFluidMaterial": 切削液ID<br/>
    &nbsp;&nbsp;		"NameCuttingFluid": 切削液名称<br/>
    &nbsp;&nbsp;		"NumberCuttingFluid": 切削液编号<br/>
    &nbsp;&nbsp;		"CategoryCuttingFluid": 切削液种类<br/>
    &nbsp;&nbsp;		"CompanyCuttingFluid": 供应商<br/>
    &nbsp;&nbsp;		"FormulaCuttingFluid": 切削液配方<br/>
     &nbsp;&nbsp;       "CharacterCuttingFluid": 切削液性能特征<br/>
    &nbsp;&nbsp;        "TechnicalCuttingFluid": 切削液技术指标<br/>
    &nbsp;&nbsp;        "add_time": 添加时间<br/>
    &nbsp;&nbsp;        "user_id": 用户ID<br/>
    &nbsp;&nbsp;        "StrainRate": 切削液应用（字符串形式为： 1-2-3，2-3-4，）<br/>
            
    &nbsp;&nbsp;        "PictureCuttingFluidMaterialList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;        		"id_PictureCuttingFluid":  切削液图片ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_CuttingFluidMaterial": int CuttingFluidMaterial.id_CuttingFluidMaterial<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "url_PictureCuttingFluid": 切削液图片url<br/>
    &nbsp;&nbsp;         }],<br/>
             
    &nbsp;&nbsp;         "InformDetailCuttingFluidMaterialList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_InformDetailCuttingFluid": 详细信息ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_CuttingFluidMaterial": int CuttingFluidMaterial.id_CuttingFluidMaterial<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "url_InformDetailCuttingFluid": 详细信息url<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "name_InformDetailCuttingFluid": 详细信息name<br/>
    &nbsp;&nbsp;            }]<br/>
             
    &nbsp;&nbsp;        "ApplicationCuttingFluidMaterialList": [{<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;       		"id_ApplicationCuttingFluid": 应用实例ID<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "id_CuttingFluidMaterial": int CuttingFluidMaterial.id_CuttingFluidMaterial<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "url_ApplicationCuttingFluid": 应用实例url<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;              "name_ApplicationCuttingFluid": 应用实例name<br/>
       &nbsp;&nbsp;      }],<br/>
       }]<br/>
}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	85
  	</td>
  	<td>
  	/CuttingFluidMaterialApp/goAddCuttingFluidMaterial
  	</td>
  	<td>
  	去添加切削液页面
  	</td>
  	<td>
  	String id 切削液Id
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "CategoryCuttingFluidMaterialList": [{<br/>
    &nbsp;&nbsp;        "id_CategoryCuttingFluid": 切削液类别ID<br/>
    &nbsp;&nbsp;        "name_CategoryCuttingFluid": 切削液类别名称<br/>
        }],<br/>
    "cuttingFluidMaterial": {<br/>
    &nbsp;&nbsp;	"id_CuttingFluidMaterial": 切削液ID<br/>
    &nbsp;&nbsp;	"NameCuttingFluid": 切削液名称,<br/>
    &nbsp;&nbsp;	"NumberCuttingFluid": 切削液编号,<br/>
    &nbsp;&nbsp;	"CategoryCuttingFluid": 切削液种类,<br/>
    &nbsp;&nbsp;	"CompanyCuttingFluid": "供应商",<br/>
    &nbsp;&nbsp;	"FormulaCuttingFluid": "切削液配方",<br/>
    &nbsp;&nbsp;	"CharacterCuttingFluid": "切削液性能特征",<br/>
    &nbsp;&nbsp;    "TechnicalCuttingFluid": "切削液技术指标",<br/>
        
    &nbsp;&nbsp;    "PictureCuttingFluidMaterialList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;   			"id_PictureCuttingFluid": 切削液图片ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;            "id_CuttingFluidMaterial": int CuttingFluidMaterial.id_CuttingFluidMaterial<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;            "url_PictureCuttingFluid": 切削液图片url<br/>
    &nbsp;&nbsp;     }],<br/>
            
    &nbsp;&nbsp;    "InformDetailCuttingFluidMaterialList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;            "id_InformDetailCuttingFluid": 详细信息ID<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;            "id_CuttingFluidMaterial": int CuttingFluidMaterial.id_CuttingFluidMaterial<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;            "url_InformDetailCuttingFluid": 详细信息url<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;            "name_InformDetailCuttingFluid": 详细信息name<br/>
    &nbsp;&nbsp;     }],<br/>
            
     &nbsp;&nbsp;   "ApplicationCuttingFluidMaterialList": [{<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;           "id_ApplicationCuttingFluid": 应用实例ID<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;           "id_CuttingFluidMaterial": int CuttingFluidMaterial.id_CuttingFluidMaterial<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;           "url_ApplicationCuttingFluid": 应用实例url<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;           "name_ApplicationCuttingFluid": 应用实例name<br/>
     &nbsp;&nbsp;    }]<br/>
    },<br/>
    "StrainRate": 切削液应用（字符串形式为： 1-2-3，2-3-4，）<br/>
    "array_PictureCuttingFluidMaterial": 切削液图片url（以，分割）<br/>
    "array_InformDetailCuttingFluidMaterial": 详细信息url（以，分割）<br/>
    "array_InformDetailCuttingFluidMaterial_name": 详细信息name（以，分割）<br/>
    "array_ApplicationCuttingFluidMaterial": 应用实例url（以，分割）<br/>
    "array_ApplicationCuttingFluidMaterial_name": 应用实例name（以，分割）<br/>
}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	86
  	</td>
  	<td>
  	/CuttingFluidMaterialApp/saveCuttingFluidMaterial
  	</td>
  	<td>
  	保存切削液数据
  	</td>
  	<td>
  	int id_CuttingFluidMaterial 切削液ID
  	</td>
  	<td>
  	{<br/>
    &nbsp;&nbsp;"result": "1",<br/>
    &nbsp;&nbsp;"msg": "操作成功"<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	87
  	</td>
  	<td>
  	/CuttingFluidMaterialApp/savePictureCuttingFluidMaterial
  	</td>
  	<td>
  	加载切削液图片
  	</td>
  	<td>
  	int id_CuttingFluidMaterial, 切削液ID<br/>
	String array_PictureCuttingFluidMaterial: 切削液图片url（以，分割）<br/>
    String array_InformDetailCuttingFluidMaterial: 详细信息url（以，分割）<br/>
    String array_InformDetailCuttingFluidMaterial_name: 详细信息name（以，分割）<br/>
    String array_ApplicationCuttingFluidMaterial: 应用实例url（以，分割）<br/>
    String array_ApplicationCuttingFluidMaterial_name: 应用实例name（以，分割）<br/>
	String PictureCuttingFluidMaterial,图片文件<br/>
	String fileSuffix, 文件后缀<br/>
	String filename 文件名字带后缀<br/>
  	</td>
  	<td>
  	{
    "result": "1",
    "CategoryCuttingFluidMaterialList": [{<br/>
    &nbsp;&nbsp;        "id_CategoryCuttingFluid": 切削液类别ID<br/>
    &nbsp;&nbsp;        "name_CategoryCuttingFluid": 切削液类别名称<br/>
        }],<br/>
    "array_PictureCuttingFluidMaterial": 切削液图片url（以，分割）<br/>
    "array_InformDetailCuttingFluidMaterial": 详细信息url（以，分割）<br/>
    "array_InformDetailCuttingFluidMaterial_name": 详细信息name（以，分割）<br/>
    "array_ApplicationCuttingFluidMaterial": 应用实例url（以，分割）<br/>
    "array_ApplicationCuttingFluidMaterial_name": 应用实例name（以，分割）<br/>
	}
  	</td>
  </tr>
  <tr>
  	<td>
  	88
  	</td>
  	<td>
  	/CuttingFluidMaterialApp/saveInformDetailCuttingFluidMaterial
  	</td>
  	<td>
  	加载详细信息页面
  	</td>
  	<td>
  	int id_CuttingFluidMaterial, 切削液ID<br/>
	String array_PictureCuttingFluidMaterial: 切削液图片url（以，分割）<br/>
    String array_InformDetailCuttingFluidMaterial: 详细信息url（以，分割）<br/>
    String array_InformDetailCuttingFluidMaterial_name: 详细信息name（以，分割）<br/>
    String array_ApplicationCuttingFluidMaterial: 应用实例url（以，分割）<br/>
    String array_ApplicationCuttingFluidMaterial_name: 应用实例name（以，分割）<br/>
	String InformDetailCuttingFluidMaterial,详细信息文件<br/>
	String fileSuffix, 文件后缀<br/>
	String filename 文件名字带后缀<br/>
  	</td>
  	<td>
  	{
    "result": "1",
    "CategoryCuttingFluidMaterialList": [{<br/>
    &nbsp;&nbsp;        "id_CategoryCuttingFluid": 切削液类别ID<br/>
    &nbsp;&nbsp;        "name_CategoryCuttingFluid": 切削液类别名称<br/>
        }],<br/>
    "array_PictureCuttingFluidMaterial": 切削液图片url（以，分割）<br/>
    "array_InformDetailCuttingFluidMaterial": 详细信息url（以，分割）<br/>
    "array_InformDetailCuttingFluidMaterial_name": 详细信息name（以，分割）<br/>
    "array_ApplicationCuttingFluidMaterial": 应用实例url（以，分割）<br/>
    "array_ApplicationCuttingFluidMaterial_name": 应用实例name（以，分割）<br/>
	}
  	</td>
  </tr>
  <tr>
  	<td>
  	89
  	</td>
  	<td>
  	/CuttingFluidMaterialApp/saveApplicationCuttingFluidMaterial
  	</td>
  	<td>
  	加载应用实例
  	</td>
  	<td>
  	int id_CuttingFluidMaterial, 切削液ID<br/>
	String array_PictureCuttingFluidMaterial: 切削液图片url（以，分割）<br/>
    String array_InformDetailCuttingFluidMaterial: 详细信息url（以，分割）<br/>
    String array_InformDetailCuttingFluidMaterial_name: 详细信息name（以，分割）<br/>
    String array_ApplicationCuttingFluidMaterial: 应用实例url（以，分割）<br/>
    String array_ApplicationCuttingFluidMaterial_name: 应用实例name（以，分割）<br/>
	String ApplicationCuttingFluidMaterial,应用实例文件<br/>
	String fileSuffix, 文件后缀<br/>
	String filename 文件名字带后缀<br/>
  	</td>
  	<td>
  	{
    "result": "1",
    "CategoryCuttingFluidMaterialList": [{<br/>
    &nbsp;&nbsp;        "id_CategoryCuttingFluid": 切削液类别ID<br/>
    &nbsp;&nbsp;        "name_CategoryCuttingFluid": 切削液类别名称<br/>
        }],<br/>
    "array_PictureCuttingFluidMaterial": 切削液图片url（以，分割）<br/>
    "array_InformDetailCuttingFluidMaterial": 详细信息url（以，分割）<br/>
    "array_InformDetailCuttingFluidMaterial_name": 详细信息name（以，分割）<br/>
    "array_ApplicationCuttingFluidMaterial": 应用实例url（以，分割）<br/>
    "array_ApplicationCuttingFluidMaterial_name": 应用实例name（以，分割）<br/>
	}
  	</td>
  </tr>
  <tr>
  	<td>
  	90
  	</td>
  	<td>
  	/CuttingFluidMaterialApp/deleteCuttingFluidMaterial
  	</td>
  	<td>
  	删除切削液数据
  	</td>
  	<td>
  	String id_CuttingFluidMaterial 切削液ID
  	</td>
  	<td>
  	{<br/>
    &nbsp;&nbsp;"result": "1",<br/>
    &nbsp;&nbsp;"msg": "操作成功"<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	91
  	</td>
  	<td>
  	/CuttingFluidMaterialApp/toCuttingFluidApply
  	</td>
  	<td>
  	去切削液应用页面
  	</td>
  	<td>
  	int pageNo, 第几页<br/>
  	int pageSize, 每页几条<br/>
  	String WorkpieceMaterial, 工件材料<br/>
	String MachiningMethod, 加工方式<br/>
	String MachiningPrecision 加工精度<br/>
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "para": {<br/>
    &nbsp;&nbsp;	"WorkpieceMaterial": 工件材料<br/>
    &nbsp;&nbsp;	"MachiningMethod": 加工方式<br/>
    &nbsp;&nbsp;    "MachiningPrecision": 加工精度<br/>
    },<br/>
    "page": {<br/>
    &nbsp;&nbsp;    "pageCount": 总页数<br/>
    },<br/>
    "list": [{<br/>
    &nbsp;&nbsp;		"id_UsingCuttingFluid": 切削液应用ID<br/>
    &nbsp;&nbsp;		"WorkpieceMaterial": 工件材料<br/>
    &nbsp;&nbsp;		"MachiningMethod": 加工方式<br/>
    &nbsp;&nbsp;        "MachiningPrecision": 加工精度<br/>
    &nbsp;&nbsp;        "NameCuttingFluid": 切削液名称<br/>
    &nbsp;&nbsp;        "NumberCuttingFluid": 切削液编号<br/>
        }]<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	92
  	</td>
  	<td>
  	/designToolBTAdrillApp/queryDesignToolBTAdrillList
  	</td>
  	<td>
  	查询深孔钻设计页面
  	</td>
  	<td>
  	int pageNo, 第几页<br/>
  	int pageSize,每页几条<br/>
	String DesignNumberBTADrill, 钻头编号<br/>
	String DesignNameBTADrill, 钻头名称<br/>
	String DesignDiameterBTADrill,加工直径<br/>
	String DesignCompanyBTADrill 设计厂家<br/>
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "para": {<br/>
    &nbsp;&nbsp;    "DesignNumberBTADrill": 钻头编号<br/>
    &nbsp;&nbsp;    "DesignNameBTADrill": 钻头名称<br/>
    &nbsp;&nbsp;    "DesignDiameterBTADrill": 加工直径<br/>
    &nbsp;&nbsp;    "DesignCompanyBTADrill": 设计厂家<br/>
    },<br/>
    "page": {<br/>
    &nbsp;&nbsp;    "pageCount": 共多少页<br/>
    },<br/>
    "list": [{<br/>
    &nbsp;&nbsp;        "id_DesignToolBTAdrill": 深孔钻设计ID<br/>
    &nbsp;&nbsp;        "DesignNumberBTADrill": 深孔钻设计编号<br/>
    &nbsp;&nbsp;        "DesignNameBTADrill": 钻头名称<br/>
    &nbsp;&nbsp;        "DesignDiameterBTADrill": 加工直径<br/>
    &nbsp;&nbsp;        "DesignCompanyBTADrill": 设计厂家<br/>
    &nbsp;&nbsp;        "DesignBreakerBTADrill": 断屑槽类型<br/>
    &nbsp;&nbsp;        "DesignFeatureBTADrill": 加工特性简述<br/>
    &nbsp;&nbsp;        "pictureDesignToolBTAdrillList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_DesignPictureBTADrill": 图片ID<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "url_DesignToolBTAdrill": 图片url<br/>
    &nbsp;&nbsp;            }],<br/>
    &nbsp;&nbsp;        "informDetailDesignToolBTAdrillList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_DesignInformDetailBTADrill": 详细信息ID<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "url_DesignInformDetailBTADrill": 详细信息url<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "name_DesignInformDetailBTADrill":详细信息name<br/>
     &nbsp;&nbsp;           }],<br/>
     &nbsp;&nbsp;       "partDesignToolBTAdrillList": [{<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;       		"id_DesignPartBTADrill": part文件ID<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;              "url_DesignPartBTADrill": part文件url<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;              "name_DesignPartBTADrill": part文件name<br/>
      &nbsp;&nbsp;          }],<br/>
      &nbsp;&nbsp;      "P": {<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;      	"DesignBTADrillPWidth": 外齿工作宽度Lp<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;      	"DesignBTADrillPEdgeAngle": 外刃偏角φp<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;          "DesignBTADrillPRakeAngle": 外齿前角γp<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;          "DesignBTADrillPReliefAngle": 外齿后角αp<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;          "DesignBTADrillPNoseAngle": 外齿刀尖角εp<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;          "pPart": [{<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                  "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                  "url_DesignBTADrillPartAll": 刀片P part文件url<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                  "name_DesignBTADrillPartAll": 刀片P part文件name<br/>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                 "ascription": 所属（由于所有刀片的part文件都存在一个表，所以该字段用来区分part文件所属）<br/>
       &nbsp;&nbsp;&nbsp;&nbsp;             }],<br/>
      &nbsp;&nbsp;      },<br/>
      &nbsp;&nbsp;      "C": {<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;          "DesignBTADrillCWidth": 中心齿工作宽度Lc<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;          "DesignBTADrillCEdgeAngle": 内刃偏角φc<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;          "DesignBTADrillCRakeAngle": 中心齿前角γc<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;          "DesignBTADrillCReliefAngle": 中心齿后角αc<br/>
       &nbsp;&nbsp;&nbsp;&nbsp;         "DesignBTADrillCNoseAngle": 中心齿刀尖角εc<br/>
       &nbsp;&nbsp;&nbsp;&nbsp;         "cPart": [{<br/>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                 "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                 "url_DesignBTADrillPartAll": 刀片C part文件url<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                "name_DesignBTADrillPartAll": 刀片C part文件name<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                "ascription": 所属<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;            }]<br/>
        &nbsp;&nbsp;    },<br/>
        &nbsp;&nbsp;    "ZI": {<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;        "DesignBTADrillZIWidth": 中间齿工作宽度LI<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;        "DesignBTADrillZIEdgeAngle": 内刃偏角φI<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;       "DesignBTADrillZIRakeAngle": 中心齿前角γI<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;       "DesignBTADrillZIReliefAngle": 中间齿后角αI<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;       "DesignBTADrillZINoseAngle": 中间齿刀尖角εI<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;       "ziPart": [{<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;               "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;               "url_DesignBTADrillPartAll": 刀片ZI part文件url<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;               "name_DesignBTADrillPartAll": 刀片ZI part文件name<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;               "ascription": 所属<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;           }]<br/>
         &nbsp;&nbsp;   },<br/>
            
         &nbsp;&nbsp;   "One": {<br/>
          &nbsp;&nbsp;&nbsp;&nbsp;  	"DesignBTADrillZIArcAngleOne": 初始圆弧角度<br/>
          &nbsp;&nbsp;&nbsp;&nbsp;  	"DesignBTADrillZILeadLengthOne": 导向块长度<br/>
          &nbsp;&nbsp;&nbsp;&nbsp;      "DesignBTADrillZILeadThicknessOne": 导向块厚度<br/>
          &nbsp;&nbsp;&nbsp;&nbsp;      "onePart": [{<br/>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;              "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;             "url_DesignBTADrillPartAll": 导向块1 part文件url<br/>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;             "name_DesignBTADrillPartAll": 导向块1 part文件name<br/>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;             "ascription": 所属<br/>
           &nbsp;&nbsp;&nbsp;&nbsp;         }],<br/>
           &nbsp;&nbsp; },<br/>
            
           &nbsp;&nbsp; "Two": {<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;	"DesignBTADrillZIArcAngleTwo": 初始圆弧角度<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;    "DesignBTADrillZILeadLengthTwo": 导向块长度<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;   "DesignBTADrillZILeadThicknessTwo": 导向块厚度<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;    "twoPart": [{<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "url_DesignBTADrillPartAll": 导向块2 part文件url<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "name_DesignBTADrillPartAll": 导向块2 part文件name<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "ascription": 所属<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;       }]<br/>
           &nbsp;&nbsp; },<br/>
            &nbsp;&nbsp;"Body": {<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;   "bodyPart": [{<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          "name_DesignBTADrillPartAll": 深孔钻刀体 part文件name<br/>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          "url_DesignBTADrillPartAll": 深孔钻刀体 part文件url<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "ascription": 所属<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;       }]<br/>
           &nbsp;&nbsp; },<br/>
            
           &nbsp;&nbsp; "S": {<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;    "sPart": [{<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;            "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "name_DesignBTADrillPartAll": 深孔钻 part文件name<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "url_DesignBTADrillPartAll": 深孔钻part文件url<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "ascription": 所属<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;       }]<br/>
            &nbsp;&nbsp;}<br/>
        }]<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	93
  	</td>
  	<td>
  	/designToolBTAdrillApp/goAddDesignToolBTAdrill
  	</td>
  	<td>
  	去添加（修改）页面
  	</td>
  	<td>
  	String id 深孔钻设计ID
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "designToolBTAdrill": [{<br/>
    &nbsp;&nbsp;        "id_DesignToolBTAdrill": 深孔钻设计ID<br/>
    &nbsp;&nbsp;        "DesignNumberBTADrill": 深孔钻设计编号<br/>
    &nbsp;&nbsp;        "DesignNameBTADrill": 钻头名称<br/>
    &nbsp;&nbsp;        "DesignDiameterBTADrill": 加工直径<br/>
    &nbsp;&nbsp;        "DesignCompanyBTADrill": 设计厂家<br/>
    &nbsp;&nbsp;        "DesignBreakerBTADrill": 断屑槽类型<br/>
    &nbsp;&nbsp;        "DesignFeatureBTADrill": 加工特性简述<br/>
    &nbsp;&nbsp;        "pictureDesignToolBTAdrillList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_DesignPictureBTADrill": 图片ID<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "url_DesignToolBTAdrill": 图片url<br/>
    &nbsp;&nbsp;            }],<br/>
    &nbsp;&nbsp;        "informDetailDesignToolBTAdrillList": [{<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;                "id_DesignInformDetailBTADrill": 详细信息ID<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "url_DesignInformDetailBTADrill": 详细信息url<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "name_DesignInformDetailBTADrill":详细信息name<br/>
     &nbsp;&nbsp;           }],<br/>
     &nbsp;&nbsp;       "partDesignToolBTAdrillList": [{<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;       		"id_DesignPartBTADrill": part文件ID<br/>
     &nbsp;&nbsp;&nbsp;&nbsp;               "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;              "url_DesignPartBTADrill": part文件url<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;              "name_DesignPartBTADrill": part文件name<br/>
      &nbsp;&nbsp;          }],<br/>
      &nbsp;&nbsp;      "P": {<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;      	"DesignBTADrillPWidth": 外齿工作宽度Lp<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;      	"DesignBTADrillPEdgeAngle": 外刃偏角φp<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;          "DesignBTADrillPRakeAngle": 外齿前角γp<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;          "DesignBTADrillPReliefAngle": 外齿后角αp<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;          "DesignBTADrillPNoseAngle": 外齿刀尖角εp<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;          "pPart": [{<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                  "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                  "url_DesignBTADrillPartAll": 刀片P part文件url<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                  "name_DesignBTADrillPartAll": 刀片P part文件name<br/>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                 "ascription": 所属（由于所有刀片的part文件都存在一个表，所以该字段用来区分part文件所属）<br/>
       &nbsp;&nbsp;&nbsp;&nbsp;             }],<br/>
      &nbsp;&nbsp;      },<br/>
      &nbsp;&nbsp;      "C": {<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;          "DesignBTADrillCWidth": 中心齿工作宽度Lc<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;          "DesignBTADrillCEdgeAngle": 内刃偏角φc<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;          "DesignBTADrillCRakeAngle": 中心齿前角γc<br/>
      &nbsp;&nbsp;&nbsp;&nbsp;          "DesignBTADrillCReliefAngle": 中心齿后角αc<br/>
       &nbsp;&nbsp;&nbsp;&nbsp;         "DesignBTADrillCNoseAngle": 中心齿刀尖角εc<br/>
       &nbsp;&nbsp;&nbsp;&nbsp;         "cPart": [{<br/>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                 "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                 "url_DesignBTADrillPartAll": 刀片C part文件url<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                "name_DesignBTADrillPartAll": 刀片C part文件name<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                "ascription": 所属<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;            }]<br/>
        &nbsp;&nbsp;    },<br/>
        &nbsp;&nbsp;    "ZI": {<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;        "DesignBTADrillZIWidth": 中间齿工作宽度LI<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;        "DesignBTADrillZIEdgeAngle": 内刃偏角φI<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;       "DesignBTADrillZIRakeAngle": 中心齿前角γI<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;       "DesignBTADrillZIReliefAngle": 中间齿后角αI<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;       "DesignBTADrillZINoseAngle": 中间齿刀尖角εI<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;       "ziPart": [{<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;               "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;               "url_DesignBTADrillPartAll": 刀片ZI part文件url<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;               "name_DesignBTADrillPartAll": 刀片ZI part文件name<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;               "ascription": 所属<br/>
         &nbsp;&nbsp;&nbsp;&nbsp;           }]<br/>
         &nbsp;&nbsp;   },<br/>
            
         &nbsp;&nbsp;   "One": {<br/>
          &nbsp;&nbsp;&nbsp;&nbsp;  	"DesignBTADrillZIArcAngleOne": 初始圆弧角度<br/>
          &nbsp;&nbsp;&nbsp;&nbsp;  	"DesignBTADrillZILeadLengthOne": 导向块长度<br/>
          &nbsp;&nbsp;&nbsp;&nbsp;      "DesignBTADrillZILeadThicknessOne": 导向块厚度<br/>
          &nbsp;&nbsp;&nbsp;&nbsp;      "onePart": [{<br/>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;              "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;             "url_DesignBTADrillPartAll": 导向块1 part文件url<br/>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;             "name_DesignBTADrillPartAll": 导向块1 part文件name<br/>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;             "ascription": 所属<br/>
           &nbsp;&nbsp;&nbsp;&nbsp;         }],<br/>
           &nbsp;&nbsp; },<br/>
            
           &nbsp;&nbsp; "Two": {<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;	"DesignBTADrillZIArcAngleTwo": 初始圆弧角度<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;    "DesignBTADrillZILeadLengthTwo": 导向块长度<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;   "DesignBTADrillZILeadThicknessTwo": 导向块厚度<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;    "twoPart": [{<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "url_DesignBTADrillPartAll": 导向块2 part文件url<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "name_DesignBTADrillPartAll": 导向块2 part文件name<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "ascription": 所属<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;       }]<br/>
           &nbsp;&nbsp; },<br/>
            &nbsp;&nbsp;"Body": {<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;   "bodyPart": [{<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          "name_DesignBTADrillPartAll": 深孔钻刀体 part文件name<br/>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          "url_DesignBTADrillPartAll": 深孔钻刀体 part文件url<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "ascription": 所属<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;       }]<br/>
           &nbsp;&nbsp; },<br/>
            
           &nbsp;&nbsp; "S": {<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;    "sPart": [{<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;            "id_DesignToolBTAdrill": DesignToolBTAdrill.id_DesignToolBTAdrill<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "name_DesignBTADrillPartAll": 深孔钻 part文件name<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "url_DesignBTADrillPartAll": 深孔钻part文件url<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           "ascription": 所属<br/>
             &nbsp;&nbsp;&nbsp;&nbsp;       }]<br/>
            &nbsp;&nbsp;}<br/>
        }]<br/>
        array_PictureDesignToolBTAdrill 图片url(用，分割)<br/>
		array_InformDetailDesignToolBTAdrill 详细信息url(用，分割)<br/>
		array_InformDetailDesignToolBTAdrill_name 详细信息name(用，分割)<br/>
		array_PartDesignToolBTAdrill part文件url(用，分割)<br/>
		array_PartDesignToolBTAdrill_name part文件name(用，分割)<br/>
		array_pPart 刀片P part文件url(用，分割)<br/>
		array_pPart_name 刀片P part文件name<br/>
		array_cPart 刀片C part文件url(用，分割)<br/>
		array_cPart_name 刀片C part文件name(用，分割)<br/>
		array_ziPart 刀片ZI part文件url(用，分割)<br/>
		array_ziPart_name 刀片ZI part文件name(用，分割)<br/>
		array_onePart 导向块1 part文件url(用，分割)<br/>
		array_onePart_name 导向块1 part文件name(用，分割)<br/>
		array_twoPart 导向块2 part文件url(用，分割)<br/>
		array_twoPart_name 导向块2 part文件name(用，分割)<br/>
		array_bodyPart 深孔钻刀体 part文件url(用，分割)<br/>
		array_bodyPart_name 深孔钻刀体 part文件name(用，分割)<br/>
		array_sPart 深孔钻 part文件url(用，分割)<br/>
		array_sPart_name 深孔钻 part文件name(用，分割)<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	94
  	</td>
  	<td>
  	/designToolBTAdrillApp/saveDesignToolBTAdrill
  	</td>
  	<td>
  	保存（修改）深孔钻设计信息
  	</td>
  	<td>
  	String user_id, 用户ID<br/>
	int id_DesignToolBTAdrill,  深孔钻设计ID<br/>
	String DesignNumberBTADrill, 钻头编号<br/>
	String DesignNameBTADrill, 钻头名称<br/>
	String DesignDiameterBTADrill, 加工直径<br/>
	String DesignCompanyBTADrill, 设计厂家<br/>
	String DesignBreakerBTADrill, 断屑槽类型<br/>
	String DesignFeatureBTADrill, 加工特性简述<br/>
	String P, 周边刀片P(将周边刀片P的5个基本字段信息用字符串链接起来发给我，用“ ， ”间隔，字段全部为空也要发四个逗号，，，，)<br/>
	String C, 中心刀片C(将中心刀片C的5个基本字段信息用字符串链接起来发给我，用“ ， ”间隔，字段全部为空也要发四个逗号，，，，)<br/>
	String ZI, 中间刀片ZI(将中间刀片ZI的5个基本字段信息用字符串链接起来发给我，用“ ， ”间隔，字段全部为空也要发四个逗号，，，，)<br/>
	String One, 导向块1(将导向块1的3个基本字段信息用字符串链接起来发给我，用“ ， ”间隔，字段全部为空也要发四个逗号，，，，)<br/>
	String Two, 导向块2(将导向块2的3个基本字段信息用字符串链接起来发给我，用“ ， ”间隔，字段全部为空也要发四个逗号，，，，)<br/>
	String array_PictureDesignToolBTAdrill 图片url(用，分割)<br/>
	String array_InformDetailDesignToolBTAdrill 详细信息url(用，分割)<br/>
	String array_InformDetailDesignToolBTAdrill_name 详细信息name(用，分割)<br/>
	String array_PartDesignToolBTAdrill part文件url(用，分割)<br/>
	String array_PartDesignToolBTAdrill_name part文件name(用，分割)<br/>
	String array_pPart 刀片P part文件url(用，分割)<br/>
	String array_pPart_name 刀片P part文件name<br/>
	String array_cPart 刀片C part文件url(用，分割)<br/>
	String array_cPart_name 刀片C part文件name(用，分割)<br/>
	String array_ziPart 刀片ZI part文件url(用，分割)<br/>
	String array_ziPart_name 刀片ZI part文件name(用，分割)<br/>
	String array_onePart 导向块1 part文件url(用，分割)<br/>
	String array_onePart_name 导向块1 part文件name(用，分割)<br/>
	String array_twoPart 导向块2 part文件url(用，分割)<br/>
	String array_twoPart_name 导向块2 part文件name(用，分割)<br/>
	String array_bodyPart 深孔钻刀体 part文件url(用，分割)<br/>
	String array_bodyPart_name 深孔钻刀体 part文件name(用，分割)<br/>
	String array_sPart 深孔钻 part文件url(用，分割)<br/>
	String array_sPart_name 深孔钻 part文件name(用，分割)<br/>
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "msg": "操作成功"<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	95
  	</td>
  	<td>
  	/designToolBTAdrillApp/savePictureExperimentItem
  	</td>
  	<td>
  	保存图片
  	</td>
  	<td>
  	String PictureDesignToolBTAdrill ,要存储的图片文件<br/>
  	String fileSuffix, 文件后缀<br/>
  	String filename 文件名，带后缀<br/>
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "url": 图片存储的地址<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	96
  	</td>
  	<td>
  	/designToolBTAdrillApp/saveInformDetailDesignToolBTAdrill
  	</td>
  	<td>
  	保存详细信息
  	</td>
  	<td>
  	String InformDetailDesignToolBTAdrill ,详细信息文件
  	String fileSuffix, 文件后缀
  	String filename 文件名，带后缀
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "url": 详细信息文件存储的地址<br/>
    "name":详细信息文件存储的name<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	97
  	</td>
  	<td>
  	/designToolBTAdrillApp/savePartDesignToolBTAdrill
  	</td>
  	<td>
  	保存part文件
  	</td>
  	<td>
  	String PartDesignToolBTAdrill ,要存储的part文件
  	String fileSuffix, 文件后缀
  	String filename 文件名，带后缀
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "url": part文件存储的地址<br/>
    "name":part文件存储的name<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	98
  	</td>
  	<td>
  	/designToolBTAdrillApp/savePartAllDesignToolBTAdrill
  	</td>
  	<td>
  	保存所有刀片（导向块等）part文件
  	</td>
  	<td>
  	String file ,文件
  	String fileSuffix, 文件后缀
  	String filename 文件名字，带后缀
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "url": 刀片part文件存储的地址<br/>
    "name":刀片part文件存储的name<br/>
	}<br/>
  	</td>
  </tr>
  <tr>
  	<td>
  	99
  	</td>
  	<td>
  	/designToolBTAdrillApp/deleteDesignToolBTAdrill
  	</td>
  	<td>
  	删除深孔钻设计页面的信息
  	</td>
  	<td>
  	String id_DesignToolBTAdrill 深孔钻设计页面ID
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "msg": "操作成功"<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
	  <td>
	  100
	  </td>
	  <td>
	  /experimentManageApp/selectResult
	  </td>
	  <td>
	    查询试验管理基本信息页面
	  </td>
	  <td>
	    int pageNo, 第几页<br/>
	    int pageSize, 每页几条<br/>
		String ExperimentNo, 实验编号<br/>
		String ExperimentType, 实验类型<br/>
		String ExperimentMachine, 实验机床<br/>
		String ExperimentPart, 试验件<br/>
		String NumberMaterialExperimentPart, 试验材料牌号<br/>
		String CategoryMaterialExperimentPart, 试验材料种类<br/>
		String ExperimentTool, 试验刀具<br/>
		String ExperimentToolMaterial, 刀具材料<br/>
		String ExperimentCuttingFluid, 切削液<br/>
		String ExperimentMachiningType 加工类别：精加工  半精加工  粗加工<br/>
	  </td>
	  <td>
	  	{<br/>
	    "result": "1", 返回状态：1成功  0失败<br/>
	    "CategoryExperimentType": [{<br/>
	        "name_ExperimentType": 类别名字<br/>
	        "id_ExperimentType": 类别ID<br/>
	        }],<br/>
	    "para": {<br/>
	        ExperimentNo, 实验编号<br/>
			ExperimentType, 实验类型<br/>
			ExperimentMachine, 实验机床<br/>
			ExperimentPart, 试验件<br/>
			NumberMaterialExperimentPart, 试验材料牌号<br/>
			CategoryMaterialExperimentPart, 试验材料种类<br/>
			ExperimentTool, 试验刀具<br/>
			ExperimentToolMaterial, 刀具材料<br/>
			ExperimentCuttingFluid, 切削液<br/>
			ExperimentMachiningType 加工类别：精加工  半精加工  粗加工<br/>
	    },<br/>
	    "page": {<br/>
	        "pageCount": 总页数<br/>
	    },<br/>
	    "list": [{<br/>
	         "ExperimentReportList": [{<br/>
	         		 "id_ExperimentReport": 实验报告文件ID,<br/>
	         		 "id_ExperimentManage":  int  ExperimentManage.id_ExperimentManage,<br/>
	                 "url_ExperimentReport": 实验报告文件url,<br/>
	                 "name_ExperimentReport": 实验报告文件name,<br/>
	             }],<br/>
	         "id_ExperimentManage": 实验ID,<br/>
	         "ExperimentNo": 实验编号,<br/>
	         "ExperimentName": 实验名称,<br/>
	         "ExperimentType": 实验类型,<br/>
	         "ExperimentMachine": 实验机床,<br/>
	         "ExperimentPerson": 实验人员,<br/>
	         "ExperimentTeacher": 责任人,<br/>
	         "ExperimentPart": 试验件,<br/>
	         "NumberMaterialExperimentPart": 试验材料牌号,<br/>
	         "CategoryMaterialExperimentPart": 试验材料种类,<br/>
	         "ExperimentTool": 试验刀具,<br/>
	         "ExperimentToolMaterial": 刀具材料,<br/>
	         "ExperimentTime": 实验时间,<br/>
	         "ExperimentContent": 加工形式,<br/>
	         "ExperimentRemark": 实验备注,<br/>
	         "ExperimentCuttingFluid": 切削液,<br/>
	         "ExperimentMachiningType": 加工类别：精加工  半精加工  粗加工,<br/>
	         "ExperimentCondition": 实验说明<br/>
	        }]<br/>
		}<br/>
	  </td>
  </tr>
  
  <tr>
  	<td>
  	101
  	</td>
  	<td>
  	/experimentManageApp/goAddCuttingFluidMaterial
  	</td>
  	<td>
  	去添加实验基本信息页面
  	</td>
  	<td>
  	String id 实验基本信息ID
  	</td>
  	<td>
  	{<br/>
	    "result": "1", 返回状态：1成功  0失败<br/>
	    "CategoryExperimentType": [{<br/>
	        "name_ExperimentType": 类别名字<br/>
	        "id_ExperimentType": 类别ID<br/>
	        }],<br/>
  		"ExperimentManage": [{<br/>
         "ExperimentReportList": {<br/>
         		 "id_ExperimentReport": 实验报告文件ID,<br/>
         		 "id_ExperimentManage":  int  ExperimentManage.id_ExperimentManage,<br/>
                 "url_ExperimentReport": 实验报告文件url,<br/>
                 "name_ExperimentReport": 实验报告文件name,<br/>
             }],<br/>
         "id_ExperimentManage": 实验ID,<br/>
         "ExperimentNo": 实验编号,<br/>
         "ExperimentName": 实验名称,<br/>
         "ExperimentType": 实验类型,<br/>
         "ExperimentMachine": 实验机床,<br/>
         "ExperimentPerson": 实验人员,<br/>
         "ExperimentTeacher": 责任人,<br/>
         "ExperimentPart": 试验件,<br/>
         "NumberMaterialExperimentPart": 试验材料牌号,<br/>
         "CategoryMaterialExperimentPart": 试验材料种类,<br/>
         "ExperimentTool": 试验刀具,<br/>
         "ExperimentToolMaterial": 刀具材料,<br/>
         "ExperimentTime": 实验时间,<br/>
         "ExperimentContent": 加工形式,<br/>
         "ExperimentRemark": 实验备注,<br/>
         "ExperimentCuttingFluid": 切削液,<br/>
         "ExperimentMachiningType": 加工类别：精加工  半精加工  粗加工,<br/>
         "ExperimentCondition": 实验说明<br/>
        }<br/>
         "array_ExperimentReport": "实验报告文件url（所有的url以 ，分割）",<br/>
    	 "array_ExperimentReport_name": "实验报告文件name（所有的name以 ，分割）"<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		102
  	</td>
  	<td>
  		/experimentManageApp/jc
  	</td>
  	<td>
  		查询编号是否已经使用
  	</td>
  	<td>
  	String ExperimentNo_userForm 实验编号
  	</td>
  	<td>
  	{<br/>
    "result": 返回1则编号可以使用，返回0则编号已经存在，不可使用。<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
		103 	
  	</td>
  	<td>
  		/experimentManageApp/saveExperimentManage
  	</td>
  	<td>
  		添加实验
  	</td>
  	<td>
  		String array_ExperimentReport, 实验报告文件url（所有的url以 ，分割）<br/>
  		String array_ExperimentReport_name, 实验报告文件name（所有的name以 ，分割）<br/>
  		int id_ExperimentManage, 实验基本信息ID<br/>
  		String ExperimentNo , 实验编号<br/>
  		String ExperimentName, 实验名称<br/>
  		String ExperimentType , 实验类型<br/>
  		String ExperimentMachine , 实验机床<br/>
  		String ExperimentPerson,实验人员<br/>
		String ExperimentTeacher,责任人<br/>
		String ExperimentPart ,试验件 <br/>
		String NumberMaterialExperimentPart ,试验材料牌号<br/> 
		String CategoryMaterialExperimentPart , 试验材料种类<br/>
		String ExperimentTool , 试验刀具<br/>
		String ExperimentToolMaterial , 刀具材料<br/>
		String ExperimentCuttingFluid , 切削液<br/>
		String ExperimentMachiningType, 加工类别：精加工  半精加工  粗加工<br/>
		String ExperimentContent , 加工形式<br/>
		String ExperimentTime , 实验时间<br/>
		String ExperimentCondition , 实验说明<br/>
		String ExperimentRemark 实验备注 <br/>
  	</td>
  	<td>
  		{<br/>
    	"result": "1",  状态 1：成功  0： 失败<br/>
    	"msg": 返回信息 <br/>
		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		104
  	</td>
  	<td>
  		/experimentManageApp/saveExperimentReport
  	</td>
  	<td>
  		保存实验报告文件
  	</td>
  	<td>
  		String file ,文件<br/>
  		String fileSuffix, 文件后缀<br/>
  		String filename 文件名，带后缀<br/>
  	</td>
  	<td>
  		{<br/>
		"result": "1", 状态 1：成功  0： 失败<br/>
		"url": 实验报告文件存储的地址<br/>
		"name":实验报告文件存储的name<br/>
		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		105
  	</td>
  	<td>
  		/experimentManageApp/deleteExperimentManage
  	</td>
  	<td>
  		删除实验基本信息
  	</td>
  	<td>
  		String id_ExperimentManage 实验基本信息ID 
  	</td>
  	<td>
  		{<br/>
		    "result": 状态 1：成功  0： 失败<br/>
		    "msg": 返回信息<br/>
		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		106
  	</td>
  	<td>
  		/experimentManageApp/jzExperimentMachine
  	</td>
  	<td>
  		用于加载各个页面，都是此接口，根据   “deputy” 参数的值判断加载的是哪个页面 ，查询条件根据对应参数字段输入
  	</td>
  	<td>
  		int deputy, 传值1：查询机床节点、传值2：查询试验件页面、传值3：查询工件材料页面、传值4：查询刀片页面、传值5：查询深孔钻页面、传值6：查询切削液页面<br/>
  		int pageNo, 第几页<br/>
  		int pageSize, 每页几条<br/><br/>
  		
  		String NumberMachineNode, 机床编号<br/>
		String NumberMachine, 机床型号<br/>
		String TypeMachineNode, 机床类别<br/>
		String DepartmentMachineNode, 机床所在单位<br/>
		String WorkshopMachineNode 机床车间<br/><br/>
		
		String nameExperimentPart, 零件名称 <br/>
		String numberExperimentPart, 零件编号 <br/>
		String typeExperimentPart, 零件类别 <br/>
		String numberMaterialExperimentPart, 材料编号 <br/>
		String categoryMaterialExperimentPart 材料类别<br/><br/>
		
		String NameMaterial 材料名称<br/>
		String NumberMaterial 材料牌号<br/>
		String id_CategoryMaterial 材料类别id<br/>
		String ISOCuttingMaterial ISO加工分类<br/>
		String CategoryMaterial 热处理方式<br/>
		String CompanyMaterial 供应商<br/><br/>
		
		String NumberTurningBlade 刀片编号<br/>
		String TypeBTADrill 刀片类型(1 外圆切削 2 内孔切削 3 超硬刀具 4 重型加工刀片)<br/>
		String ISOBladeTurning ISO基准刀片<br/>
		String ToolCoatBladeTurning 刀片涂层<br/>
		String ToolMaterialBladeTurning 刀片材料<br/>
		String MachiningTypeBladeTurning 加工类别<br/>
		String ToolBladeFeatureTurning 刀片加工特点<br/>
		String CompanyTurningBlade 刀片厂商<br/>
		String MateriaBladeTurning 加工材料<br/><br/>
		
		String NumberBTADrill 钻头编号<br/>
		String TypeBTADrill1 钻头类型<br/>
		String NameBTADrill 钻头名称<br/>
		String DiameterBTADrill 加工直径<br/>
		String MateriaBTAlDrill 加工材料<br/>
		String ToolMaterialBTADrill 刀具材料<br/>
		String ToolCoatBTADrill 刀具涂层<br/>
		String BreakerBTADrill 断屑槽类型<br/>
		String CompanyBTADrill 生产厂家<br/><br/>
		
		String NameCuttingFluid, 切削液名称<br/>
		String NumberCuttingFluid, 切削液编号<br/>
		String CategoryCuttingFluid, 切削液种类<br/>
		String CompanyCuttingFluid 供应商<br/>
  	</td>
  	<td>
  		<B>机床节点页面：</B><br/>
  		{<br/>
		"categoryMachineNodeInform":[{<br/>
		   "id_CategoryMachineNodeInform": 机床结点类别ID<br/>
		   "name_CategoryMachineNodeInform": 机床结点类别名称<br/>
		}],<br/>
		"para": {<br/>
		   "NumberMachineNode": 机床编号<br/>
		   "NumberMachine": 机床型号<br/>
		   "WorkshopMachineNode": 机床车间<br/>
		   "TypeMachineNode": 机床类别<br/>
		   "DepartmentMachineNode": 机床所在单位<br/>
		},<br/>
		"page": {<br/>
		   "pageCount": int 总页数<br/>
		},<br/>
		"list":[{	<br/>
		   "id_MachineNodeInform": 机床结点ID<br/>
		   "NumberMachineNode": 机床编号<br/>
		   "NumberMachine": 机床型号<br/>
		   "TypeMachineNode": 机床类别<br/>
		   "DepartmentMachineNode": 机床所在单位<br/>
		   "WorkshopMachineNode": 机床车间<br/>
		   "PositionMachineNode": 机床位置<br/>
		   "UseFrequencyMachineNode": 机床使用强度<br/>
		   "TimeUseMachineNode": 机床投入使用时间<br/>
		   "TimeDestroyMachineNode": 机床报废时间<br/>
		   "add_time": 添加时间<br/>
		   "user_id": 用户Id<br/>
		}]<br/>
		}<br/>
		<br/>
		<br/>
		<B>试验件页面：</B><br/>
		{<br/>
		"para": {<br/>
		  	nameExperimentPart, 零件名称<br/>
		  	numberExperimentPart, 零件编号<br/>
		  	typeExperimentPart, 零件类别<br/>
		  	numberMaterialExperimentPart, 材料编号<br/>
		  	categoryMaterialExperimentPart 材料类别<br/>
		},	<br/>
		"categoryMaterialExperimentPartList": [{<br/>
		   "id_CategoryMaterialExperimentPart": 材料类别ID<br/>
		   "name_CategoryMaterialExperimentPart": 材料类别名称<br/>
		}],<br/>
		"CategoryExperimentPart": [{<br/>
		  	"id_typeExperimentPart": 零件类别ID<br/>
		   "name_typeExperimentPart": 零件类别名称<br/>
		}],<br/>
		"page": {<br/>
		   "pageCount": 总页数<br/>
		},<br/>
		"list": [{<br/>
		  	"id_experimentPart": 零件ID<br/>
		  	"nameExperimentPart": 零件名称<br/>
		  	"numberExperimentPart": 零件编号<br/>
		  	"typeExperimentPart": 零件类别<br/>
		  	"numberMaterialExperimentPart": 材料编号<br/>
		  	"categoryMaterialExperimentPart": 材料类别<br/>
		   "remarkExperimentPart": 备注<br/>
		   "add_time": 添加时间<br/>
		   "user_id": 用户ID<br/>
		}]<br/>
		}<br/>
		<br/>
		<br/>
		<B>工件材料页面：</B><br/>
		{<br/>
		  "page" : {<br/>
		    	pageCount : int 总页数<br/>
		  }<br/>
		  "list":{<br/>
		    	id_Material: int<br/>
		    	NameMaterial: String 材料名称<br/>
		    	NumberMaterial ： String 材料牌号<br/>
		    	id_CategoryMaterial： String 材料类别id<br/>
		    	ISOCuttingMaterial：String ISO加工分类 <br/>
		    	CategoryMaterial ：String 热处理方式<br/>
		    	CompanyMaterial ： String 供应商<br/>
		    	ConstituentsMaterial：String 材料主要成分(元素-百分比， 例如{1-1,2-2，}) <br/>
		    	MachineableMaterial ：String 材料加工性<br/>
		    	DensityMaterial ：String 材料密度 <br/>
		    	ModulusMaterial： String 弹性模量<br/>
		    	HardnessMaterial： String 材料硬度<br/>
		    	ConductivityMaterial ：String 材料热导率<br/>
		    	SpecificheatMaterial： String 材料比热<br/>
		    	StrengthMaterial ：String 抗拉强度<br/>
		    	ThermalExpansionMaterial ：String 热膨胀系数<br/>
		    	JCMaterial： String JC模型(ABnCm)(A,B,n,C,m 例如1,2,,4,5,)<br/>
		    	StrainRate:String 应变率(数据点-温度-应变-应变率,例如{1-1-1-1，2-2-2-2，})<br/>
		    	add_time： bigint 添加时间<br/>
		    	user_id ：int 用户id<br/>
		  }<br/>
		  "categoryMaterialList":{<br/>
		    	id_CategoryMaterial: int 材料类别id<br/>
		    	name_CategoryMaterial : String 材料类别名称<br/>
		  }<br/>
		  "para":{<br/>
		    	NameMaterial: String 材料名称<br/>
		    	NumberMaterial ： String 材料牌号<br/>
		    	id_CategoryMaterial： String 材料类别id<br/>
		    	ISOCuttingMaterial：String ISO加工分类 <br/>
		    	CategoryMaterial ：String 热处理方式<br/>
		    	CompanyMaterial ： String 供应商<br/>
		  }<br/>
		}<br/>
		<br/>
		<br/>
		<B>查询刀片页面：</B><br/>
		{<br/>
		  "list":{<br/>
		    "id_TurningBlade":int<br/>
		    "NumberTurningBlade":String 刀片编号<br/>
		    "TypeBTADrill":String 刀片类型(1 外圆切削 2 内孔切削 3 超硬刀具 4 重型加工刀片)<br/>
		    "NameTurningBlade":String 刀片名称<br/>
		    "ISOBladeTurning":String ISO基准刀片<br/>
		    "ToolCoatBladeTurning":String 刀片涂层<br/>
		    "ToolMaterialBladeTurning":String 刀具材料<br/>
		    "MachiningTypeBladeTurning":String 加工类别(1 精加工 2 粗加工 3 半精加工)<br/>
		    "ToolBladeFeatureTurning":String 刀片加工特点<br/>
		    "CompanyTurningBlade":String 刀片厂商<br/>
		    "QianjiaoBladeTurning":double 前角<br/>
		    "HoujiaoBladeTurning":double 后角<br/>
		    "HoujisojiaoBladeTurning":double 刃倾角<br/>
		    "NoseRadiusTurning":double 刀尖圆弧半径<br/>
		    "BreakerBladeTurning":String 断屑槽类型<br/>
		    "MateriaBladeTurning":String 加工材料<br/>
		    "isPMKNS":String （传值类似为"P,M,N"）P 加工P , M 加工M , K 加工K , N 加工N , S 加工S<br/>
		    "ISOPBladeTurning":String 加工P<br/>
		    "ISOPTextBladeTurning":String 加工P参数<br/>
		    "ISOMBladeTurning":String 加工M<br/>
		    "ISOMTextBladeTurning":String 加工M参数<br/>
		    "ISOKBladeTurning":String 加工K<br/>
		    "ISOKTextBladeTurning":String 加工K参数<br/>
		    "ISONBladeTurning":String 加工N<br/>
		    "ISONTextBladeTurning": String 加工N参数<br/>
		    "ISOSBladeTurning":String 加工S<br/>
		    "ISOSTextBladeTurning":String 加工S参数<br/>
		    "add_time":bigint 添加时间<br/>
		    "user_id":int 用户id<br/>
		  }<br/>
		  "page":{<br/>
		    pageCount : int 总页数<br/>
		  }<br/>
		  "para":{<br/>
		    NumberTurningBlade:String 刀片编号<br/>
		    TypeBTADrill:String 刀片类型(1 外圆切削 2 内孔切削 3 超硬刀具 4 重型加工刀片)<br/>
		    ISOBladeTurning:String ISO基准刀片<br/>
		    ToolCoatBladeTurning:String 刀片涂层<br/>
		    ToolMaterialBladeTurning:String 刀具材料<br/>
		    MachiningTypeBladeTurning:String 加工类别(1 精加工 2 粗加工 3 半精加工)<br/>
		    ToolBladeFeatureTurning：String 刀片加工特点<br/>
		    CompanyTurningBlade：String 刀片厂商<br/>
		    MateriaBladeTurning：String 加工材料<br/>
		  }<br/>
		}<br/>
		
		
		<B>深孔钻页面：</B><br/>
		{<br/>
		  "list":{<br/>
		    "id_BTADrill" : int <br/>
		    "NumberBTADrill" : string 钻头编号<br/>
		    "TypeBTADrill" : string 钻头类型(1 焊接钻头 2 可转位钻头)<br/>
		    "NameBTADrill" : string 钻头名称<br/>
		    "DiameterBTADrill" : string 加工直径<br/>
		    "MateriaBTAlDrill" : string 加工材料<br/>
		    "ToolMaterialBTADrill" : string 刀具材料<br/>
		    "ToolCoatBTADrill" : string 刀具涂层<br/>
		    "BreakerBTADrill" : string 断屑槽类型<br/>
		    "CompanyBTADrill" : string 生产厂家<br/>
		    "isPMKNS" : string （传值类似为"P,M,N"）P 加工P , M 加工M , K 加工K , N 加工N , S 加工S<br/>
		    "ISOPBTADrill" : string 加工P<br/>
		    "ISOPTextBTADrill" : string 加工P参数<br/>
		    "ISOMBTADrill" : string 加工M<br/>
		    "ISOMTextBTADrill" : string 加工M参数<br/>
		    "ISOKBTADrill" : string 加工K<br/>
		    "ISOKTextBTADrill" : string 加工K参数<br/>
		    "ISONBTADrill" : string 加工N<br/>
		    "ISONTextBTADrill" : string 加工N参数<br/>
		    "ISOSBTADrill" : string 加工S<br/>
		    "ISOSTextBTADrill" : string 加工S参数<br/>
		  }<br/>
		  "page" : {<br/>
		    pageCount : int 总页数<br/>
		  }<br/>
		  "para" : {     <br/>
		  	NumberBTADrill : String 钻头编号<br/>
		    TypeBTADrill : String 钻头类型<br/>
		    NameBTADrill : String 钻头名称<br/>
		    DiameterBTADrill : String 加工直径<br/>
		    MateriaBTAlDrill : String 加工材料<br/>
		    ToolMaterialBTADrill : String 刀具材料<br/>
		    ToolCoatBTADrill : String 刀具涂层<br/>
		    BreakerBTADrill : String 断屑槽类型<br/>
		    CompanyBTADrill :String 生产厂家<br/>
		  }<br/>
		}<br/>
		<br/>
		<br/>
		<B>切削液页面：</B><br/>
		{<br/>
		"CategoryCuttingFluidMaterialList": [{<br/>
		   "id_CategoryCuttingFluid": 切削液类别ID<br/>
		   "name_CategoryCuttingFluid": 切削液类别名称<br/>
		}],<br/>
		"para": {<br/>
		   NameCuttingFluid, 切削液名称<br/>
		  	NumberCuttingFluid, 切削液编号<br/>
		  	CategoryCuttingFluid, 切削液种类<br/>
		  	CompanyCuttingFluid 供应商<br/>
		},<br/>
		"page": {<br/>
		   "pageCount": 总页数<br/>
		},<br/>
		"list": [{<br/>
		  	"id_CuttingFluidMaterial": 切削液ID<br/>
		  	"NameCuttingFluid": 切削液名称<br/>
		  	"NumberCuttingFluid": 切削液编号<br/>
		  	"CategoryCuttingFluid": 切削液种类<br/>
		  	"CompanyCuttingFluid": 供应商<br/>
		  	"FormulaCuttingFluid": 切削液配方<br/>
		    "CharacterCuttingFluid": 切削液性能特征<br/>
		    "TechnicalCuttingFluid": 切削液技术指标<br/>
		    "add_time": 添加时间<br/>
		    "user_id": 用户ID<br/>
		}]<br/>
		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	107
  	</td>
  	<td>
  	/CuttingSimulationApp/queryCuttingSimulationList
  	</td>
  	<td>
  	查询仿真刀具基本信息页面
  	</td>
  	<td>
  	String IDCutSim, 仿真编号<br/>
  	String NameCutSim, 仿真名称<br/>
  	String TypeCutSim, 仿真类型<br/>
	String MaterialWorkpieceCutSim, 工件材料<br/>
	String ToolType, 刀具类型<br/>
	String MaterialToolCutSim, 刀具材料<br/>
	String MaterialToolCutSimNum, 刀具/刀片编号<br/>
	String SoftwareCutSim 仿真软件<br/>
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "CategoryTypeCutSimList": [{<br/>
            "id_CategoryTypeCutSim": 仿真软件ID,<br/>
            "name_CategoryTypeCutSim": 仿真软件name<br/>
        }],<br/>
    "para": {<br/>
        IDCutSim, 仿真编号<br/>
	  	NameCutSim, 仿真名称<br/>
	  	TypeCutSim, 仿真类型<br/>
		MaterialWorkpieceCutSim, 工件材料<br/>
		ToolType, 刀具类型<br/>
		MaterialToolCutSim, 刀具材料<br/>
		MaterialToolCutSimNum, 刀具/刀片编号<br/>
		SoftwareCutSim 仿真软件<br/>
    },<br/>
    "CategorySoftwareCutSimList": [{<br/>
            "id_CategorySoftwareCutSim": 仿真类型ID,<br/>
            "name_CategorySoftwareCutSim": "仿真类型name"<br/>
        }],<br/>
    "page": {<br/>
        "pageCount": 总页数<br/>
    },<br/>
    "list": [{<br/>
    		"id_CuttingSimulation": 仿真刀具ID,<br/>
    		"IDCutSim": 仿真编号,<br/>
    		"NameCutSim": 仿真名称,<br/>
    		"TypeCutSim": 仿真类型,<br/>
    		"MaterialWorkpieceCutSim": 工件材料,<br/>
    		"ToolType": 刀具类型,<br/>
    		"MaterialToolCutSim": 刀具材料,<br/>
    		"MaterialToolCutSimNum": 刀具/刀片编号,<br/>
    		"QianjiaoCutSim": 前角,<br/>
    		"HoujiaoCutSim":后角,<br/>
    		"RenqingCutSim": 刃倾角,<br/>
    		"NoseRadiusCutSim": 刀尖圆弧半径,<br/>
    		"BreakerBladeCutSim": 断屑槽类型,<br/>
    		"CuttingSpeedCutSim": 切削速度,<br/>
    		"RoatingSpeedCutSim": 转速,<br/>
            "FeedCutSim": 进给量,<br/>
            "FeedSpeedCutSim": 进给速度,<br/>
            "CuttingDepthCutSim": 切削深度,<br/>
            "CuttingWidthCutSim": 切削宽度,<br/>
            "SoftwareCutSim": 仿真软件,<br/>
            "ForceXCutSim": 切削力Fx,<br/>
            "ForceYCutSim": 切削力Fy,<br/>
            "ForceZCutSim": 切削力Fz,<br/>
            "TorqueCutSim": 扭矩 N,<br/>
            "TemperatureCutSim": 切削温度,<br/>
            "ChipShapeCutSim": 切屑形态,<br/>
            "SurfaceStressCutSim": 表面残余应力,<br/>
            "ExReToolLife": 刀具寿命,<br/>
            "ExReWearTimeAndValue": 时间-磨损量VB(mm),,<br/>
            "CutSimDefined1": 自定义1：参数名称,<br/>
            "CutSimDefined1Value": 自定义1：结果,<br/>
            "CutSimDefined2": 自定义2：参数名称,<br/>
            "CutSimDefined2Value": 自定义2：结果,<br/>
            "CutSimDefined3": 自定义3：参数名称,<br/>
            "CutSimDefined3Value": 自定义3：结果,<br/>
            "ModelPictureCutSim": [{<br/>
                    "id_CuttingSimulationFile": 仿真刀具模型图片ID,<br/>
                    "id_CuttingSimulation": int  CuttingSimulation.id_CuttingSimulation,<br/>
                    "url_CuttingSimulationFile": 仿真刀具模型图片url<br/>
                }],<br/>
            "FileCutSim": [{<br/>
                "id_CuttingSimulationFile": 仿真程序文件ID,<br/>
                "id_CuttingSimulation": int  CuttingSimulation.id_CuttingSimulation,<br/>
                "url_CuttingSimulationFile": 仿真程序文件url,<br/>
                "name_CuttingSimulationFile": 仿真程序文件name<br/>
            }],<br/>
        }]<br/>
}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	108
  	</td>
  	<td>
  	/CuttingSimulationApp/goAddCuttingSimulation
  	</td>
  	<td>
  	去添加仿真刀具页面
  	</td>
  	<td>
  	String id 仿真刀具ID
  	</td>
  	<td>
  	{<br/>
    "result": "1",<br/>
    "CategoryTypeCutSimList": [{<br/>
            "id_CategoryTypeCutSim": 仿真软件ID,<br/>
            "name_CategoryTypeCutSim": 仿真软件name<br/>
        }],<br/>
    "CategorySoftwareCutSimList": [{<br/>
            "id_CategorySoftwareCutSim": 仿真类型ID,<br/>
            "name_CategorySoftwareCutSim": "仿真类型name"<br/>
        }],<br/>
    "CuttingSimulation": [{<br/>
    		"id_CuttingSimulation": 仿真刀具ID,<br/>
    		"IDCutSim": 仿真编号,<br/>
    		"NameCutSim": 仿真名称,<br/>
    		"TypeCutSim": 仿真类型,<br/>
    		"MaterialWorkpieceCutSim": 工件材料,<br/>
    		"ToolType": 刀具类型,<br/>
    		"MaterialToolCutSim": 刀具材料,<br/>
    		"MaterialToolCutSimNum": 刀具/刀片编号,<br/>
    		"QianjiaoCutSim": 前角,<br/>
    		"HoujiaoCutSim":后角,<br/>
    		"RenqingCutSim": 刃倾角,<br/>
    		"NoseRadiusCutSim": 刀尖圆弧半径,<br/>
    		"BreakerBladeCutSim": 断屑槽类型,<br/>
    		"CuttingSpeedCutSim": 切削速度,<br/>
    		"RoatingSpeedCutSim": 转速,<br/>
            "FeedCutSim": 进给量,<br/>
            "FeedSpeedCutSim": 进给速度,<br/>
            "CuttingDepthCutSim": 切削深度,<br/>
            "CuttingWidthCutSim": 切削宽度,<br/>
            "SoftwareCutSim": 仿真软件,<br/>
            "ForceXCutSim": 切削力Fx,<br/>
            "ForceYCutSim": 切削力Fy,<br/>
            "ForceZCutSim": 切削力Fz,<br/>
            "TorqueCutSim": 扭矩 N,<br/>
            "TemperatureCutSim": 切削温度,<br/>
            "ChipShapeCutSim": 切屑形态,<br/>
            "SurfaceStressCutSim": 表面残余应力,<br/>
            "ExReToolLife": 刀具寿命,<br/>
            "ExReWearTimeAndValue": 时间-磨损量VB(mm),,<br/>
            "CutSimDefined1": 自定义1：参数名称,<br/>
            "CutSimDefined1Value": 自定义1：结果,<br/>
            "CutSimDefined2": 自定义2：参数名称,<br/>
            "CutSimDefined2Value": 自定义2：结果,<br/>
            "CutSimDefined3": 自定义3：参数名称,<br/>
            "CutSimDefined3Value": 自定义3：结果,<br/>
            "ModelPictureCutSim": [{<br/>
                    "id_CuttingSimulationFile": 仿真刀具模型图片ID,<br/>
                    "id_CuttingSimulation": int  CuttingSimulation.id_CuttingSimulation,<br/>
                    "url_CuttingSimulationFile": 仿真刀具模型图片url<br/>
                }],<br/>
            "FileCutSim": [{<br/>
                "id_CuttingSimulationFile": 仿真程序文件ID,<br/>
                "id_CuttingSimulation": int  CuttingSimulation.id_CuttingSimulation,<br/>
                "url_CuttingSimulationFile": 仿真程序文件url,<br/>
                "name_CuttingSimulationFile": 仿真程序文件name<br/>
            }],<br/>
        }]<br/>
        "array_ModelPictureCutSim": 所有仿真刀具模型图片url（以，分割）,<br/>
        "array_FileCutSim": 所有仿真程序文件url（以，分割）,<br/>
        "array_FileCutSim_name": 所有仿真程序文件name（以，分割）,<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	109
  	</td>
  	<td>
  	/CuttingSimulationApp/saveCuttingSimulation
  	</td>
  	<td>
  	保存仿真刀具基本信息
  	</td>
  	<td>
  	int id_CuttingSimulation, 仿真刀具基本信息ID<br/>
	String array_ModelPictureCutSim: 所有仿真刀具模型图片url（以，分割）,<br/>
    String array_FileCutSim: 所有仿真程序文件url（以，分割）,<br/>
    String array_FileCutSim_name: 所有仿真程序文件name（以，分割）,<br/>
	String IDCutSim, 仿真编号<br/>
	String NameCutSim, 仿真名称<br/>
	String TypeCutSim, 仿真类型<br/>
	String MaterialWorkpieceCutSim, 工件材料<br/>
	String ToolType, 刀具类型<br/>
	String MaterialToolCutSim, 刀具材料<br/>
	String MaterialToolCutSimNum, 刀具/刀片编号<br/>
	String QianjiaoCutSim, 前角<br/>
	String HoujiaoCutSim, 后角<br/>
	String RenqingCutSim, 刃倾角<br/>
	String NoseRadiusCutSim, 刀尖圆弧半径<br/>
	String BreakerBladeCutSim, 断屑槽类型<br/>
	String CuttingSpeedCutSim, 切削速度<br/>
	String RoatingSpeedCutSim, 转速<br/>
	String FeedCutSim, 进给量<br/>
	String FeedSpeedCutSim, 进给速度<br/>
	String CuttingDepthCutSim, 切削深度<br/>
	String CuttingWidthCutSim, 切削宽度<br/>
	String SoftwareCutSim, 仿真软件<br/>
	String ForceXCutSim, 切削力Fx<br/>
	String ForceYCutSim, 切削力Fy<br/>
	String ForceZCutSim, 切削力Fz<br/>
	String TorqueCutSim, 扭矩 N<br/>
	String TemperatureCutSim 切削温度<br/>
  	</td>
  	<td>
  	{<br/>
    "result": 1成功 0失败,<br/>
    "msg": 返回信息<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	110
  	</td>
  	<td>
  	/CuttingSimulationApp/saveModelPictureCutSim
  	</td>
  	<td>
  	保存仿真刀具模型图片文件
  	</td>
  	<td>
  	String file ,文件 <br/>
  	String fileSuffix, 文件后缀<br/>
  	String filename 文件名带后缀<br/>
  	</td>
  	<td>
  	{<br/>
    "result": 1成功 0失败,<br/>
    "url": 返回文件的url<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	111
  	</td>
  	<td>
  	/CuttingSimulationApp/saveFileCutSim
  	</td>
  	<td>
  	保存仿真程序文件
  	</td>
  	<td>
  	String file ,文件 <br/>
  	String fileSuffix, 文件后缀<br/>
  	String filename 文件名带后缀<br/>
  	</td>
  	<td>
  	{<br/>
    "result": 1成功 0失败,<br/>
    "name": 返回文件的name,<br/>
    "url": 返回文件的url<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	112
  	</td>
  	<td>
  	/CuttingSimulationApp/jzAll
  	</td>
  	<td>
  	用于加载各个页面，都是此接口，根据   “deputy” 参数的值判断加载的是哪个页面 ，查询条件根据对应参数字段输入
  	</td>
  	<td>
  	int deputy, 传值1：查询工件材料页面、传值2：查询刀片页面、传值3：查询深孔钻页面<br/>
  	int pageNo, 第几页<br/>
  	int pageSize, 每页几条<br/>
	String NameMaterial 材料名称<br/>
	String NumberMaterial 材料牌号<br/>
	String id_CategoryMaterial 材料类别id<br/>
	String ISOCuttingMaterial ISO加工分类<br/>
	String CategoryMaterial 热处理方式<br/>
	String CompanyMaterial 供应商<br/>
	String NumberTurningBlade 刀片编号<br/>
	String TypeBTADrill 刀片类型(1 外圆切削 2 内孔切削 3 超硬刀具 4 重型加工刀片)<br/>
	String ISOBladeTurning ISO基准刀片<br/>
	String ToolCoatBladeTurning 刀片涂层<br/>
	String ToolMaterialBladeTurning 刀片材料<br/>
	String MachiningTypeBladeTurning 加工类别<br/>
	String ToolBladeFeatureTurning 刀片加工特点<br/>
	String CompanyTurningBlade 刀片厂商<br/>
	String MateriaBladeTurning 加工材料<br/>
	String NumberBTADrill 钻头编号<br/>
	String TypeBTADrill1 钻头类型<br/>
	String NameBTADrill 钻头名称<br/>
	String DiameterBTADrill 加工直径<br/>
	String MateriaBTAlDrill 加工材料<br/>
	String ToolMaterialBTADrill 刀具材料<br/>
	String ToolCoatBTADrill 刀具涂层<br/>
	String BreakerBTADrill 断屑槽类型<br/>
	String CompanyBTADrill 生产厂家<br/>
  	</td>
  	<td>
  	<B>工件材料页面：</B><br/>
		{<br/>
		  "page" : {<br/>
		    	pageCount : int 总页数<br/>
		  }<br/>
		  "list":{<br/>
		    	id_Material: int<br/>
		    	NameMaterial: String 材料名称<br/>
		    	NumberMaterial ： String 材料牌号<br/>
		    	id_CategoryMaterial： String 材料类别id<br/>
		    	ISOCuttingMaterial：String ISO加工分类 <br/>
		    	CategoryMaterial ：String 热处理方式<br/>
		    	CompanyMaterial ： String 供应商<br/>
		    	ConstituentsMaterial：String 材料主要成分(元素-百分比， 例如{1-1,2-2，}) <br/>
		    	MachineableMaterial ：String 材料加工性<br/>
		    	DensityMaterial ：String 材料密度 <br/>
		    	ModulusMaterial： String 弹性模量<br/>
		    	HardnessMaterial： String 材料硬度<br/>
		    	ConductivityMaterial ：String 材料热导率<br/>
		    	SpecificheatMaterial： String 材料比热<br/>
		    	StrengthMaterial ：String 抗拉强度<br/>
		    	ThermalExpansionMaterial ：String 热膨胀系数<br/>
		    	JCMaterial： String JC模型(ABnCm)(A,B,n,C,m 例如1,2,,4,5,)<br/>
		    	StrainRate:String 应变率(数据点-温度-应变-应变率,例如{1-1-1-1，2-2-2-2，})<br/>
		    	add_time： bigint 添加时间<br/>
		    	user_id ：int 用户id<br/>
		  }<br/>
		  "categoryMaterialList":{<br/>
		    	id_CategoryMaterial: int 材料类别id<br/>
		    	name_CategoryMaterial : String 材料类别名称<br/>
		  }<br/>
		  "para":{<br/>
		    	NameMaterial: String 材料名称<br/>
		    	NumberMaterial ： String 材料牌号<br/>
		    	id_CategoryMaterial： String 材料类别id<br/>
		    	ISOCuttingMaterial：String ISO加工分类 <br/>
		    	CategoryMaterial ：String 热处理方式<br/>
		    	CompanyMaterial ： String 供应商<br/>
		  }<br/>
		}<br/>
		<br/>
		<br/>
		<B>查询刀片页面：</B><br/>
		{<br/>
		  "list":{<br/>
		    "id_TurningBlade":int<br/>
		    "NumberTurningBlade":String 刀片编号<br/>
		    "TypeBTADrill":String 刀片类型(1 外圆切削 2 内孔切削 3 超硬刀具 4 重型加工刀片)<br/>
		    "NameTurningBlade":String 刀片名称<br/>
		    "ISOBladeTurning":String ISO基准刀片<br/>
		    "ToolCoatBladeTurning":String 刀片涂层<br/>
		    "ToolMaterialBladeTurning":String 刀具材料<br/>
		    "MachiningTypeBladeTurning":String 加工类别(1 精加工 2 粗加工 3 半精加工)<br/>
		    "ToolBladeFeatureTurning":String 刀片加工特点<br/>
		    "CompanyTurningBlade":String 刀片厂商<br/>
		    "QianjiaoBladeTurning":double 前角<br/>
		    "HoujiaoBladeTurning":double 后角<br/>
		    "HoujisojiaoBladeTurning":double 刃倾角<br/>
		    "NoseRadiusTurning":double 刀尖圆弧半径<br/>
		    "BreakerBladeTurning":String 断屑槽类型<br/>
		    "MateriaBladeTurning":String 加工材料<br/>
		    "isPMKNS":String （传值类似为"P,M,N"）P 加工P , M 加工M , K 加工K , N 加工N , S 加工S<br/>
		    "ISOPBladeTurning":String 加工P<br/>
		    "ISOPTextBladeTurning":String 加工P参数<br/>
		    "ISOMBladeTurning":String 加工M<br/>
		    "ISOMTextBladeTurning":String 加工M参数<br/>
		    "ISOKBladeTurning":String 加工K<br/>
		    "ISOKTextBladeTurning":String 加工K参数<br/>
		    "ISONBladeTurning":String 加工N<br/>
		    "ISONTextBladeTurning": String 加工N参数<br/>
		    "ISOSBladeTurning":String 加工S<br/>
		    "ISOSTextBladeTurning":String 加工S参数<br/>
		    "add_time":bigint 添加时间<br/>
		    "user_id":int 用户id<br/>
		  }<br/>
		  "page":{<br/>
		    pageCount : int 总页数<br/>
		  }<br/>
		  "para":{<br/>
		    NumberTurningBlade:String 刀片编号<br/>
		    TypeBTADrill:String 刀片类型(1 外圆切削 2 内孔切削 3 超硬刀具 4 重型加工刀片)<br/>
		    ISOBladeTurning:String ISO基准刀片<br/>
		    ToolCoatBladeTurning:String 刀片涂层<br/>
		    ToolMaterialBladeTurning:String 刀具材料<br/>
		    MachiningTypeBladeTurning:String 加工类别(1 精加工 2 粗加工 3 半精加工)<br/>
		    ToolBladeFeatureTurning：String 刀片加工特点<br/>
		    CompanyTurningBlade：String 刀片厂商<br/>
		    MateriaBladeTurning：String 加工材料<br/>
		  }<br/>
		}<br/>
		
		
		<B>深孔钻页面：</B><br/>
		{<br/>
		  "list":{<br/>
		    "id_BTADrill" : int <br/>
		    "NumberBTADrill" : string 钻头编号<br/>
		    "TypeBTADrill" : string 钻头类型(1 焊接钻头 2 可转位钻头)<br/>
		    "NameBTADrill" : string 钻头名称<br/>
		    "DiameterBTADrill" : string 加工直径<br/>
		    "MateriaBTAlDrill" : string 加工材料<br/>
		    "ToolMaterialBTADrill" : string 刀具材料<br/>
		    "ToolCoatBTADrill" : string 刀具涂层<br/>
		    "BreakerBTADrill" : string 断屑槽类型<br/>
		    "CompanyBTADrill" : string 生产厂家<br/>
		    "isPMKNS" : string （传值类似为"P,M,N"）P 加工P , M 加工M , K 加工K , N 加工N , S 加工S<br/>
		    "ISOPBTADrill" : string 加工P<br/>
		    "ISOPTextBTADrill" : string 加工P参数<br/>
		    "ISOMBTADrill" : string 加工M<br/>
		    "ISOMTextBTADrill" : string 加工M参数<br/>
		    "ISOKBTADrill" : string 加工K<br/>
		    "ISOKTextBTADrill" : string 加工K参数<br/>
		    "ISONBTADrill" : string 加工N<br/>
		    "ISONTextBTADrill" : string 加工N参数<br/>
		    "ISOSBTADrill" : string 加工S<br/>
		    "ISOSTextBTADrill" : string 加工S参数<br/>
		  }<br/>
		  "page" : {<br/>
		    pageCount : int 总页数<br/>
		  }<br/>
		  "para" : {     <br/>
		  	NumberBTADrill : String 钻头编号<br/>
		    TypeBTADrill : String 钻头类型<br/>
		    NameBTADrill : String 钻头名称<br/>
		    DiameterBTADrill : String 加工直径<br/>
		    MateriaBTAlDrill : String 加工材料<br/>
		    ToolMaterialBTADrill : String 刀具材料<br/>
		    ToolCoatBTADrill : String 刀具涂层<br/>
		    BreakerBTADrill : String 断屑槽类型<br/>
		    CompanyBTADrill :String 生产厂家<br/>
		  }<br/>
		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	113
  	</td>
  	<td>
  	/CuttingSimulationResultApp/queryCuttingSimulationList
  	</td>
  	<td>
  	查看仿真刀具结果页面
  	</td>
  	<td>
  	int pageNo, <br/>
  	int pageSize, <br/>
	String IDCutSim, <br/>
	String NameCutSim,<br/>
	String TypeCutSim, <br/>
	String MaterialWorkpieceCutSim, <br/>
	String ToolType,<br/>
	String MaterialToolCutSim, <br/>
	String MaterialToolCutSimNum, <br/>
	String SoftwareCutSim<br/>
  	</td>
  	<td>
  	{<br/>
    "result": 成功1 失败0,<br/>
    "CategoryTypeCutSimList": [{<br/>
            "id_CategoryTypeCutSim": 仿真软件ID,<br/>
            "name_CategoryTypeCutSim": 仿真软件name<br/>
        }],<br/>
    "para": {<br/>
		IDCutSim, 仿真编号<br/>
		NameCutSim, 仿真名称<br/>
		TypeCutSim, 仿真类型<br/>
		MaterialWorkpieceCutSim, 工件材料<br/>
		ToolType, 刀具类型<br/>
		MaterialToolCutSim, 刀具材料<br/>
		MaterialToolCutSimNum, 刀具/刀片编号<br/>
		SoftwareCutSim 仿真软件<br/>
	 },<br/>
    "CategorySoftwareCutSimList": [{<br/>
           "id_CategorySoftwareCutSim": 仿真类型ID,<br/>
		   "name_CategorySoftwareCutSim": "仿真类型name"<br/>
        }],<br/>
    "page": {<br/>
        "pageCount": 总页数<br/>
    },<br/>
    "list": [{	<br/>
        	"id_CuttingSimulation": 仿真刀具ID,<br/>
			"IDCutSim": 仿真编号,<br/>
			"NameCutSim": 仿真名称,<br/>
			"TypeCutSim": 仿真类型,<br/>
			"MaterialWorkpieceCutSim": 工件材料,<br/>
			"ToolType": 刀具类型,<br/>
			"MaterialToolCutSim": 刀具材料,<br/>
			"MaterialToolCutSimNum": 刀具/刀片编号,<br/>
			"QianjiaoCutSim": 前角,<br/>
			"HoujiaoCutSim":后角,<br/>
			"RenqingCutSim": 刃倾角,<br/>
			"NoseRadiusCutSim": 刀尖圆弧半径,<br/>
			"BreakerBladeCutSim": 断屑槽类型,<br/>
			"CuttingSpeedCutSim": 切削速度,<br/>
			"RoatingSpeedCutSim": 转速,<br/>
			"FeedCutSim": 进给量,<br/>
			"FeedSpeedCutSim": 进给速度,<br/>
			"CuttingDepthCutSim": 切削深度,<br/>
			"CuttingWidthCutSim": 切削宽度,<br/>
			"SoftwareCutSim": 仿真软件,<br/>
			"ForceXCutSim": 切削力Fx,<br/>
			"ForceYCutSim": 切削力Fy,<br/>
			"ForceZCutSim": 切削力Fz,<br/>
			"TorqueCutSim": 扭矩 N,<br/>
			"TemperatureCutSim": 切削温度,<br/>
			"ChipShapeCutSim": 切屑形态,<br/>
			"SurfaceStressCutSim": 表面残余应力,<br/>
			"ExReToolLife": 刀具寿命,<br/>
			"ExReWearTimeAndValue": 时间-磨损量VB(mm)（格式为    XXX-XXX，XXX-XXX，）,<br/>
			"CutSimDefined1": 自定义1：参数名称,<br/>
			"CutSimDefined1Value": 自定义1：结果,<br/>
			"CutSimDefined2": 自定义2：参数名称,<br/>
			"CutSimDefined2Value": 自定义2：结果,<br/>
			"CutSimDefined3": 自定义3：参数名称,<br/>
			"CutSimDefined3Value": 自定义3：结果,<br/>
			"ExReWearTimeAndValueList": [{<br/>
                    "mosundu": 磨损度<br/>
                    "shijian": 时间<br/>
                }],<br/>
            
            "PictureFileCutSim": [<br/>
                "id_CuttingSimulationResultFile": 仿真结果图片ID<br/>
                "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
                "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，仿真结果图片是“PictureFileCutSim”）<br/>
                "url_CuttingSimulationResultFile": 仿真结果图片url<br/>
            ],<br/>
            
            "ResultFileCutSim": [<br/>
                "id_CuttingSimulationResultFile": 仿真结果文件ID<br/>
                "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
                "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，仿真结果文件是“ResultFileCutSim”）<br/>
                "name_CuttingSimulationResultFile": 仿真结果文件name<br/>
                "url_CuttingSimulationResultFile": 仿真结果图片文件url<br/>
            ],<br/>
            "ForceFileCutSim": [<br/>
                "id_CuttingSimulationResultFile": 切削力文件ID<br/>
                "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
                "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，切削力文件是“ForceFileCutSim”）<br/>
                "name_CuttingSimulationResultFile": 切削力文件name<br/>
                "url_CuttingSimulationResultFile": 切削力文件url<br/>
            ],<br/>
            
            "TemperatureFileCutSim": [<br/>
                "id_CuttingSimulationResultFile": 切削温度文件ID<br/>
                "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
                "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，切削温度文件是“TemperatureFileCutSim”）<br/>
                "name_CuttingSimulationResultFile": 切削温度文件name<br/>
                "url_CuttingSimulationResultFile": 切削温度文件url<br/>
            ],<br/>
            
            "ChipShapePicCutSim": [<br/>
                "id_CuttingSimulationResultFile": 切屑形态图片ID<br/>
                "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
                "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，切屑形态图片是“ChipShapePicCutSim”）<br/>
                "url_CuttingSimulationResultFile": 切屑形态图片url<br/>
            ],<br/>
            
            "SurfaceStressFileCutSim": [<br/>
                "id_CuttingSimulationResultFile": 表面参与应力文件ID<br/>
                "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
                "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，表面参与应力文件是“SurfaceStressFileCutSim”）<br/>
                "name_CuttingSimulationResultFile": 表面参与应力文件name<br/>
                "url_CuttingSimulationResultFile": 表面参与应力文件url<br/>
            ],<br/>
            
            "ExReWearFile": [<br/>
                "id_CuttingSimulationResultFile": 刀具磨损文件ID<br/>
                "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
                "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，刀具磨损文件“ExReWearFile”）<br/>
                "name_CuttingSimulationResultFile": 刀具磨损文件name<br/>
                "url_CuttingSimulationResultFile": 刀具磨损文件url<br/>
            ],<br/>
            "ExReWearPicture": [<br/>
                "id_CuttingSimulationResultFile": 刀具磨损图片ID<br/>
                "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
                "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，刀具磨损图片是“ExReWearPicture”）<br/>
                "url_CuttingSimulationResultFile": 刀具磨损图片url<br/>
            ],<br/>
            
            "Defined1File": [{<br/>
                "id_CuttingSimulationResultFile": 自定义1结果文件ID<br/>
                "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
                "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，自定义1结果文件是“Defined1File”）<br/>
                "name_CuttingSimulationResultFile": 自定义1结果文件name<br/>
                "url_CuttingSimulationResultFile": 自定义1结果文件url<br/>
                }],<br/>
           
            "Defined2File": [<br/>
                "id_CuttingSimulationResultFile": 自定义2结果文件ID<br/>
                "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
                "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，自定义2结果文件是“Defined2File”）<br/>
                "name_CuttingSimulationResultFile": 自定义2结果文件name<br/>
                "url_CuttingSimulationResultFile": 自定义2结果文件url<br/>
            ],<br/>
            
            "Defined3File": [<br/>
                "id_CuttingSimulationResultFile": 自定义3结果文件ID<br/>
                "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
                "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，自定义3结果文件是“Defined3File”）<br/>
                "name_CuttingSimulationResultFile": 自定义3结果文件name<br/>
                "url_CuttingSimulationResultFile": 自定义3结果文件url<br/>
            ],<br/>
        }]<br/>
        
    }<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	114
  	</td>
  	<td>
  	/CuttingSimulationResultApp/goAddCuttingSimulationResult
  	</td>
  	<td>
  	去添加仿真刀具结果页面
  	</td>
  	<td>
  	String id 仿真刀具ID
  	</td>
  	<td>
  	{
	  	"result": 成功1 失败0,<br/>
	  	"CategoryTypeCutSimList": [{<br/>
			"id_CategoryTypeCutSim": 仿真软件ID,<br/>
			"name_CategoryTypeCutSim": 仿真软件name<br/>
		}],<br/>
	  	"CategorySoftwareCutSimList": [{<br/>
			"id_CategorySoftwareCutSim": 仿真类型ID,<br/>
			"name_CategorySoftwareCutSim": "仿真类型name"<br/>
		}],<br/>
	  	CuttingSimulation：{<br/>
		  	"id_CuttingSimulation": 仿真刀具ID,<br/>
			"IDCutSim": 仿真编号,<br/>
			"NameCutSim": 仿真名称,<br/>
			"TypeCutSim": 仿真类型,<br/>
			"MaterialWorkpieceCutSim": 工件材料,<br/>
			"ToolType": 刀具类型,<br/>
			"MaterialToolCutSim": 刀具材料,<br/>
			"MaterialToolCutSimNum": 刀具/刀片编号,<br/>
			"QianjiaoCutSim": 前角,<br/>
			"HoujiaoCutSim":后角,<br/>
			"RenqingCutSim": 刃倾角,<br/>
			"NoseRadiusCutSim": 刀尖圆弧半径,<br/>
			"BreakerBladeCutSim": 断屑槽类型,<br/>
			"CuttingSpeedCutSim": 切削速度,<br/>
			"RoatingSpeedCutSim": 转速,<br/>
			"FeedCutSim": 进给量,<br/>
			"FeedSpeedCutSim": 进给速度,<br/>
			"CuttingDepthCutSim": 切削深度,<br/>
			"CuttingWidthCutSim": 切削宽度,<br/>
			"SoftwareCutSim": 仿真软件,<br/>
			"ForceXCutSim": 切削力Fx,<br/>
			"ForceYCutSim": 切削力Fy,<br/>
			"ForceZCutSim": 切削力Fz,<br/>
			"TorqueCutSim": 扭矩 N,<br/>
			"TemperatureCutSim": 切削温度,<br/>
			"ChipShapeCutSim": 切屑形态,<br/>
			"SurfaceStressCutSim": 表面残余应力,<br/>
			"ExReToolLife": 刀具寿命,<br/>
			"ExReWearTimeAndValue": 时间-磨损量VB(mm)（格式为    XXX-XXX，XXX-XXX，）,<br/>
			"CutSimDefined1": 自定义1：参数名称,<br/>
			"CutSimDefined1Value": 自定义1：结果,<br/>
			"CutSimDefined2": 自定义2：参数名称,<br/>
			"CutSimDefined2Value": 自定义2：结果,<br/>
			"CutSimDefined3": 自定义3：参数名称,<br/>
			"CutSimDefined3Value": 自定义3：结果,<br/>
			"ExReWearTimeAndValueList": [{<br/>
		            "mosundu": 磨损度<br/>
		            "shijian": 时间<br/>
		        }],<br/>
		    
		    "PictureFileCutSim": [<br/>
		        "id_CuttingSimulationResultFile": 仿真结果图片ID<br/>
		        "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
		        "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，仿真结果图片是“PictureFileCutSim”）<br/>
		        "url_CuttingSimulationResultFile": 仿真结果图片url<br/>
		    ],<br/>
		    
		    "ResultFileCutSim": [<br/>
		        "id_CuttingSimulationResultFile": 仿真结果文件ID<br/>
		        "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
		        "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，仿真结果文件是“ResultFileCutSim”）<br/>
		        "name_CuttingSimulationResultFile": 仿真结果文件name<br/>
		        "url_CuttingSimulationResultFile": 仿真结果图片文件url<br/>
		    ],<br/>
		    "ForceFileCutSim": [<br/>
		        "id_CuttingSimulationResultFile": 切削力文件ID<br/>
		        "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
		        "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，切削力文件是“ForceFileCutSim”）<br/>
		        "name_CuttingSimulationResultFile": 切削力文件name<br/>
		        "url_CuttingSimulationResultFile": 切削力文件url<br/>
		    ],<br/>
		    
		    "TemperatureFileCutSim": [<br/>
		        "id_CuttingSimulationResultFile": 切削温度文件ID<br/>
		        "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
		        "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，切削温度文件是“TemperatureFileCutSim”）<br/>
		        "name_CuttingSimulationResultFile": 切削温度文件name<br/>
		        "url_CuttingSimulationResultFile": 切削温度文件url<br/>
		    ],<br/>
		    
		    "ChipShapePicCutSim": [<br/>
		        "id_CuttingSimulationResultFile": 切屑形态图片ID<br/>
		        "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
		        "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，切屑形态图片是“ChipShapePicCutSim”）<br/>
		        "url_CuttingSimulationResultFile": 切屑形态图片url<br/>
		    ],<br/>
		    
		    "SurfaceStressFileCutSim": [<br/>
		        "id_CuttingSimulationResultFile": 表面参与应力文件ID<br/>
		        "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
		        "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，表面参与应力文件是“SurfaceStressFileCutSim”）<br/>
		        "name_CuttingSimulationResultFile": 表面参与应力文件name<br/>
		        "url_CuttingSimulationResultFile": 表面参与应力文件url<br/>
		    ],<br/>
		    
		    "ExReWearFile": [<br/>
		        "id_CuttingSimulationResultFile": 刀具磨损文件ID<br/>
		        "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
		        "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，刀具磨损文件“ExReWearFile”）<br/>
		        "name_CuttingSimulationResultFile": 刀具磨损文件name<br/>
		        "url_CuttingSimulationResultFile": 刀具磨损文件url<br/>
		    ],<br/>
		    "ExReWearPicture": [<br/>
		        "id_CuttingSimulationResultFile": 刀具磨损图片ID<br/>
		        "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
		        "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，刀具磨损图片是“ExReWearPicture”）<br/>
		        "url_CuttingSimulationResultFile": 刀具磨损图片url<br/>
		    ],<br/>
		    
		    "Defined1File": [{<br/>
		        "id_CuttingSimulationResultFile": 自定义1结果文件ID<br/>
		        "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
		        "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，自定义1结果文件是“Defined1File”）<br/>
		        "name_CuttingSimulationResultFile": 自定义1结果文件name<br/>
		        "url_CuttingSimulationResultFile": 自定义1结果文件url<br/>
		        }],<br/>
		   
		    "Defined2File": [<br/>
		        "id_CuttingSimulationResultFile": 自定义2结果文件ID<br/>
		        "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
		        "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，自定义2结果文件是“Defined2File”）<br/>
		        "name_CuttingSimulationResultFile": 自定义2结果文件name<br/>
		        "url_CuttingSimulationResultFile": 自定义2结果文件url<br/>
		    ],<br/>
		    
		    "Defined3File": [<br/>
		        "id_CuttingSimulationResultFile": 自定义3结果文件ID<br/>
		        "id_CuttingSimulation": int CuttingSimulation.id_CuttingSimulation<br/>
		        "ascription": 归属（所有文件都存于一张表，所以该字段是用于判断文件是什么文件，自定义3结果文件是“Defined3File”）<br/>
		        "name_CuttingSimulationResultFile": 自定义3结果文件name<br/>
		        "url_CuttingSimulationResultFile": 自定义3结果文件url<br/>
		    ],<br/>
	  	}<br/>
	  	"array_PictureFileCutSim": 所有仿真结果图片url（以，分割）,<br/>
	  	"array_ResultFileCutSim": 所有仿真结果文件url（以，分割）<br/>
	  	"array_ResultFileCutSim_name": 所有仿真结果文件name"（以，分割）,<br/>
	  	"array_ForceFileCutSim": 所有切削力文件url<br/>
	  	"array_ForceFileCutSim_name": 所有切削力文件name,<br/>
	  	"array_TemperatureFileCutSim": 所有切削温度文件url,<br/>
	  	"array_TemperatureFileCutSim_name": 所有切削温度文件name,<br/>
	  	"array_ChipShapePicCutSim": 所有切屑形态图片url<br/>
		"array_SurfaceStressFileCutSim": 所有表面参与应力文件url,<br/>
    	"array_SurfaceStressFileCutSim_name": 所有表面参与应力文件name,<br/>
    	"array_ExReWearFile": 所有刀具磨损文件url,<br/>
    	"array_ExReWearFile_name": 所有刀具磨损文件name,<br/>
    	"array_ExReWearPicture": 所有刀具磨损图片url<br/>
    	"array_Defined1File": 自定义1结果文件url,<br/>
	  	"array_Defined1File_name": 自定义1结果文件name,<br/>
        "array_Defined2File": 自定义2结果文件url,<br/>
	    "array_Defined2File_name": 自定义2结果文件name,<br/>
	    "array_Defined3File": 自定义3结果文件url,<br/>
	    "array_Defined3File_name": 自定义3结果文件name,<br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	115
  	</td>
  	<td>
  	/CuttingSimulationResultApp/saveResultFile
  	</td>
  	<td>
  	保存结果的文件
  	</td>
  	<td>
  	String file ,保存的文件<br/>
  	String fileSuffix, 文件的后缀<br/>
  	String filename 文件的名字，带后缀<br/>
  	</td>
  	<td>
  	{<br/>
    "result": 1成功  0失败<br/>
    "name": 文件name<br/>
    "url": 文件url<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	116
  	</td>
  	<td>
  	/CuttingSimulationResultApp/saveCuttingSimulation
  	</td>
  	<td>
  	修改仿真刀具结果信息（因为有基本信息才有对应的结果信息，所以结果页暂时不能添加新的信息，需到基本信息页添加后，在到结果页添加结果）
  	</td>
  	<td>
  	int id_CuttingSimulation 仿真刀具ID<br/> 
	String array_PictureFileCutSim: 所有仿真结果图片url（以，分割）,<br/>
  	String array_ResultFileCutSim: 所有仿真结果文件url（以，分割）<br/>
  	String array_ResultFileCutSim_name: 所有仿真结果文件name"（以，分割）,<br/>
  	String array_ForceFileCutSim: 所有切削力文件url<br/>
  	String array_ForceFileCutSim_name: 所有切削力文件name,<br/>
  	String array_TemperatureFileCutSim: 所有切削温度文件url,<br/>
  	String array_TemperatureFileCutSim_name: 所有切削温度文件name,<br/>
  	String array_ChipShapePicCutSim: 所有切屑形态图片url<br/>
	String array_SurfaceStressFileCutSim: 所有表面参与应力文件url,<br/>
   	String array_SurfaceStressFileCutSim_name: 所有表面参与应力文件name,<br/>
   	String array_ExReWearFile: 所有刀具磨损文件url,<br/>
   	String array_ExReWearFile_name: 所有刀具磨损文件name,<br/>
   	String array_ExReWearPicture: 所有刀具磨损图片url<br/>
   	String array_Defined1File: 自定义1结果文件url,<br/>
  	String array_Defined1File_name: 自定义1结果文件name,<br/>
    String array_Defined2File: 自定义2结果文件url,<br/>
    String array_Defined2File_name: 自定义2结果文件name,<br/>
    String array_Defined3File: 自定义3结果文件url,<br/>
    String array_Defined3File_name: 自定义3结果文件name,<br/>
	String ForceXCutSim: 切削力Fx,<br/>
	String ForceYCutSim: 切削力Fy,<br/>
	String ForceZCutSim: 切削力Fz,<br/>
	String TorqueCutSim: 扭矩 N,<br/>
	String TemperatureCutSim: 切削温度,<br/>
	String ChipShapeCutSim: 切屑形态,<br/>
	String SurfaceStressCutSim: 表面残余应力,<br/>
	String ExReToolLife: 刀具寿命,<br/>
	String ExReWearTimeAndValue: 时间-磨损量VB(mm)（格式为    XXX-XXX，XXX-XXX，）,<br/>
	String CutSimDefined1: 自定义1：参数名称,<br/>
	String CutSimDefined1Value: 自定义1：结果,<br/>
	String CutSimDefined2: 自定义2：参数名称,<br/>
	String CutSimDefined2Value: 自定义2：结果,<br/>
	String CutSimDefined3: 自定义3：参数名称,<br/>
	String CutSimDefined3Value: 自定义3：结果,<br/>
  	</td>
  	<td>
  	{<br/>
	    "result": 成功1  失败0 <br/>
	    "msg": 返回状态<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	117
  	</td>
  	<td>
  	/experimentParameterResultApp/goExperimentParameterResult
  	</td>
  	<td>
  	去添加试验参数页面
  	</td>
  	<td>
  	String ExperimentNo 试验编号
  	</td>
  	<td>
  	{<br/>
	    "result": 1成功 0失败,<br/>
	    "msg": 返回信息,<br/>
	    "CategoryExperimentType": [{<br/>
	    		"id_ExperimentType": 试验类型ID<br/>
	            "name_ExperimentType": 试验类型名字,<br/>
	     }],<br/>
	    "ExperimentManage": {<br/>
	    	"id_ExperimentManage": 试验信息ID,<br/>
	    	"ExperimentNo": 实验编号,<br/>
	    	"ExperimentName": 实验名称,<br/>
	    	"ExperimentType": 实验类型,<br/>
	    	"ExperimentMachine": 实验机床,<br/>
	    	"ExperimentPerson": 实验人员,<br/>
	    	"ExperimentTeacher": 责任人,<br/>
	    	"ExperimentPart": 试验件,<br/>
	        "NumberMaterialExperimentPart": 试验材料牌号,<br/>
	        "CategoryMaterialExperimentPart": 试验材料种类,<br/>
	        "ExperimentTool": 试验刀具,<br/>
	        "ExperimentToolMaterial": 刀具材料,<br/>
	        "ExperimentCuttingFluid": 切削液,<br/>
	        "ExperimentMachiningType": 加工类别：精加工  半精加工  粗加工,<br/>
	        "ExperimentContent": 加工形式,<br/>
	        "ExperimentTime":实验时间,<br/>
	        "ExperimentCondition":实验说明,<br/>
	        "ExperimentRemark":实验备注<br/>
	    },<br/>
	    "ExperimentParameterResult": [{ 这是参数值，和下面的parameters对应。<br/>
	    		id_ExperimentParameterResult: 试验参数ID<br/>
	    		ExperimentCuttingSpeed: 切削速度 <br/>
	            ExperimentCuttingDepth: 切削深度<br/>
	            ExperimentCuttingWidth: 切削宽度 <br/>
	            ExperimentFeedRate: 进给量 <br/>
	            ExperimentToolQianjiao:刀具前角<br/>
	            ExperimentToolHoujiao:刀具后角 <br/>
	            ExperimentToolZhupianjiao：刀具主偏角<br/>
	            ExperimentToolRenqingjiao：刀具刃倾角 <br/>
	            ExperimentToolNoseRadius：刀尖圆弧半径<br/>
	            ExperimentToolBreakerBlade：断屑槽类型  <br/>
	            ExperimentMachiningType：加工类别<br/>
	            ExperimentTool：试验刀具<br/>
	            ExperimentToolMaterial：刀具材料<br/>
	            ExperimentCuttingFluid：切削液<br/>
	            ExperimentPara1：预留1<br/>
	            ExperimentPara2：预留2<br/>
	        }],<br/>
	    "parameters": [	这是一个集合，返回的是该编号的有哪些参数列有值（参数种类很多，但是每个试验对应的参数不一定都有值，所以只返回有值的参数列）<br/>
	        id_ExperimentParameterResult: 试验参数ID<br/>
	    		ExperimentCuttingSpeed: 切削速度 <br/>
	            ExperimentCuttingDepth: 切削深度<br/>
	            ExperimentCuttingWidth: 切削宽度 <br/>
	            ExperimentFeedRate: 进给量 <br/>
	            ExperimentToolQianjiao:刀具前角<br/>
	            ExperimentToolHoujiao:刀具后角 <br/>
	            ExperimentToolZhupianjiao：刀具主偏角<br/>
	            ExperimentToolRenqingjiao：刀具刃倾角 <br/>
	            ExperimentToolNoseRadius：刀尖圆弧半径<br/>
	            ExperimentToolBreakerBlade：断屑槽类型  <br/>
	            ExperimentMachiningType：加工类别<br/>
	            ExperimentTool：试验刀具<br/>
	            ExperimentToolMaterial：刀具材料<br/>
	            ExperimentCuttingFluid：切削液<br/>
	            ExperimentPara1：预留1<br/>
	            ExperimentPara2：预留2<br/>
	    ]<br/>
	    }<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	118
  	</td>
  	<td>
  	/experimentParameterResultApp/importExcel
  	</td>
  	<td>
  	导入excel并返回excel表中的值
  	</td>
  	<td>
  	String excelFile,   excel文件
  	String fileSuffix,  文件的后缀(.xlsx)
  	String filename,	文件的名字
  	</td>
  	<td>
  	{<br/>
  	"result":成功1，失败0<br/>
  	"msg":返回信息(成功、或失败原因)<br/>
  	"ExperimentParameterResult": [{ 这是参数值，和下面的parameters对应。<br/>
	    		id_ExperimentParameterResult: 试验参数ID<br/>
	    		ExperimentCuttingSpeed: 切削速度 <br/>
	            ExperimentCuttingDepth: 切削深度<br/>
	            ExperimentCuttingWidth: 切削宽度 <br/>
	            ExperimentFeedRate: 进给量 <br/>
	            ExperimentToolQianjiao:刀具前角<br/>
	            ExperimentToolHoujiao:刀具后角 <br/>
	            ExperimentToolZhupianjiao：刀具主偏角<br/>
	            ExperimentToolRenqingjiao：刀具刃倾角 <br/>
	            ExperimentToolNoseRadius：刀尖圆弧半径<br/>
	            ExperimentToolBreakerBlade：断屑槽类型  <br/>
	            ExperimentMachiningType：加工类别<br/>
	            ExperimentTool：试验刀具<br/>
	            ExperimentToolMaterial：刀具材料<br/>
	            ExperimentCuttingFluid：切削液<br/>
	            ExperimentPara1：预留1<br/>
	            ExperimentPara2：预留2<br/>
	        }],<br/>
	    "parameters": [	这是一个集合，返回的是该编号的有哪些参数列有值（参数种类很多，但是每个试验对应的参数不一定都有值，所以只返回有值的参数列）<br/>
	        id_ExperimentParameterResult: 试验参数ID<br/>
	    		ExperimentCuttingSpeed: 切削速度 <br/>
	            ExperimentCuttingDepth: 切削深度<br/>
	            ExperimentCuttingWidth: 切削宽度 <br/>
	            ExperimentFeedRate: 进给量 <br/>
	            ExperimentToolQianjiao:刀具前角<br/>
	            ExperimentToolHoujiao:刀具后角 <br/>
	            ExperimentToolZhupianjiao：刀具主偏角<br/>
	            ExperimentToolRenqingjiao：刀具刃倾角 <br/>
	            ExperimentToolNoseRadius：刀尖圆弧半径<br/>
	            ExperimentToolBreakerBlade：断屑槽类型  <br/>
	            ExperimentMachiningType：加工类别<br/>
	            ExperimentTool：试验刀具<br/>
	            ExperimentToolMaterial：刀具材料<br/>
	            ExperimentCuttingFluid：切削液<br/>
	            ExperimentPara1：预留1<br/>
	            ExperimentPara2：预留2<br/>
	    ]<br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	119
  	</td>
  	<td>
  	/experimentParameterResultApp/saveExperimentParameterResult
  	</td>
  	<td>
  	保存试验参数
  	</td>
  	<td>
  	String json,   将所有的参数数据通过json串的形式传给我。例如：[  {ExperimentCuttingSpeed:"12",ExperimentCuttingDepth:"23"},   {ExperimentCuttingSpeed:"45",ExperimentCuttingDepth:"6576"}   ]<br/>
  	String id	实验基本信息ID	<br/>
  	</td>
  	<td>
  	{<br/>
  		"result":"1",<br/>
  		"msg":"保存成功"<br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	120
  	</td>
  	<td>
  	/experimentParameterResultApp/exportExperimentParameterResult
  	</td>
  	<td>
  	导出ex表。（返回的是文件的地址，需要去下载）
  	</td>
  	<td>
  	String json,   将所有的参数数据通过json串的形式传给我。例如：[  {ExperimentCuttingSpeed:"12",ExperimentCuttingDepth:"23"},   {ExperimentCuttingSpeed:"45",ExperimentCuttingDepth:"6576"}   ]<br/>
  	String id	实验基本信息ID<br/>
  	</td>
  	<td>
  	{<br/>
  		"result": 成功1  失败0 <br/>
  		"msg": 返回状态<br/>
  		"url": 所导出文件的地址，需从定向一次下载。<br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	121
  	</td>
  	<td>
  	/experimentParameterResultApp/CheckExperimentResultList
  	</td>
  	<td>
  	查询试验结果（包括试验刀具寿命）
  	</td>
  	<td>
  	String id_ExperimentParameterResult  试验参数ID  
  	</td>
  	<td>
  	{<br/>
	  "ExperimentResult": {<br/>
	  
	  	"id_ExperimentManage": 试验基本信息ID<br/>
	  	"id_ExperimentParameterResult": 试验参数ID<br/>
	  	"ExReForceX": "切削力Fx",<br/>
	  	"ExReForceY": "切削力Fy",<br/>
	    "ExReForceZ": "切削力Fz",<br/>
	    "ExReTorque": "扭矩 N",<br/>
	    "ExReTemperature": "切削温度",<br/>
	    "ExReSurfaceMorphology": "加工表面形态",<br/>
	    "ExReChipShape": "切屑形态",<br/>
	    "ExReSurfaceRoughness": "表面粗糙度",<br/>
	    "ExReSurfaceHardness": "表面硬度",<br/>
	    "ExReSectionHardness": "截面硬度"   格式：  1-2, <br/>
	    "ExReSurfaceStress": "表面残余应力",<br/>
	    "ExReSectionStress": "截面残余应力",  格式：3-4, <br/>
	    "ExReDefined1": "自定义1参数名称",<br/>
	  	"ExReDefined1Value": "自定义1结果",<br/>
	    "ExReDefined2": "自定义2参数名称",<br/>
	    "ExReDefined2Value": "自定义2结果",<br/>
	    "ExReDefined3": "自定义3参数名称",<br/>
	    "ExReDefined3Value": "自定义3结果",<br/>
	    "ExReDefined4": "自定义4参数名称",<br/>
	    "ExReDefined4Value": "自定义4结果",<br/>
	    "ExReDefined5": "自定义5参数名称",<br/>
	    "ExReDefined5Value": "自定义5结果",<br/>
	    "ExReToolLife": "刀具寿命",<br/>
	    "ExReWearStandard": "磨钝标准",<br/>
	  
	  	
	  	"ExReForceFile": [{<br/>
	        "id_ExperimentResultFile": 切削力文件ID<br/>
	        "id_ExperimentParameterResult": 试验参数ID<br/>
	        "url_ExperimentResultFile": 切削力文件url<br/>
	        "name_ExperimentResultFile": 切削力文件name<br/>
	        "ascription":  归属      切削力文件 为：ExReForceFile,<br/>
	      }],<br/>
	      
	    "ExReTemperatureFile": [{<br/>
	        "id_ExperimentResultFile": 切削温度文件ID<br/>
	        "id_ExperimentParameterResult": 试验参数ID<br/>
	        "url_ExperimentResultFile": 切削温度文件url<br/>
	        "name_ExperimentResultFile": 切削温度文件name<br/>
	        "ascription": 归属：切削温度文件为： "ExReTemperatureFile",<br/>
	      }],<br/>
	      
	    "SurfaceFile": [{<br/>
	      "id_ExperimentResultFile": 表面文件ID<br/>
	      "id_ExperimentParameterResult": 试验参数ID<br/>
	      "url_ExperimentResultFile": 表面文件url<br/>
	      "name_ExperimentResultFile": 表面文件name<br/>
	      "ascription": 归属：表面文件为："SurfaceFile",<br/>
	      }], <br/>
	     
	    "ShapeFile": [{<br/>
	        "id_ExperimentResultFile": 切屑形态文件ID<br/>
	        "id_ExperimentParameterResult": 试验参数ID<br/>
	        "url_ExperimentResultFile": 切屑形态文件url<br/>
	        "name_ExperimentResultFile": 切屑形态文件name<br/>
	        "ascription": 归属：切屑形态文件为："ShapeFile",<br/>
	      }],<br/>
	     
	    "SurfaceRoughnessFile": [{<br/>
	        "id_ExperimentResultFile": 表面粗糙度文件ID<br/>
	        "id_ExperimentParameterResult": 试验参数ID<br/>
	        "url_ExperimentResultFile": 表面粗糙度文件url<br/>
	        "name_ExperimentResultFile": 表面粗糙度文件name<br/>
	        "ascription": 归属：表面粗糙度文件为："SurfaceRoughnessFile",<br/>
	      }],<br/>
	      
	    "SurfaceHardnessFile": [{<br/>
	        "id_ExperimentResultFile": 表面硬度文件ID<br/>
	        "id_ExperimentParameterResult": 试验参数ID<br/>
	        "url_ExperimentResultFile": 表面硬度文件url<br/>
	        "name_ExperimentResultFile": 表面硬度文件name<br/>
	        "ascription":归属：表面硬度文件为： "SurfaceHardnessFile",<br/>
	      }],<br/>
	      
	    "ExReSectionHardnessFile": [{<br/>
	        "id_ExperimentResultFile": 截面硬度文件ID<br/>
	        "id_ExperimentParameterResult": 试验参数ID<br/>
	        "url_ExperimentResultFile": 截面硬度文件url<br/>
	        "name_ExperimentResultFile": 截面硬度文件name<br/>
	        "ascription": 归属：截面硬度文件为："ExReSectionHardnessFile",<br/>
	      }],<br/>
	      
	    "ExReSurfaceStressFile": [{<br/>
	        "id_ExperimentResultFile": 表面残余应力ID<br/>
	        "id_ExperimentParameterResult": 试验参数ID<br/>
	        "url_ExperimentResultFile": 表面残余应力url<br/>
	        "name_ExperimentResultFile": 表面残余应力name<br/>
	        "ascription": 归属：表面残余应力为："ExReSurfaceStressFile",<br/>
	      }],<br/>
	      
	    "ExReSectionStressFile": [{<br/>
	        "id_ExperimentResultFile": 截面硬度文件ID<br/>
	        "id_ExperimentParameterResult": 试验参数ID<br/>
	        "url_ExperimentResultFile": 截面硬度文件url<br/>
	        "name_ExperimentResultFile": 截面硬度文件name<br/>
	        "ascription": 归属：截面硬度文件为："ExReSectionStressFile",<br/>
	      }],<br/>
	      
	    "ExReDefined1File": [{<br/>
	        "id_ExperimentResultFile": 自定义1结果文件ID<br/>
	        "id_ExperimentParameterResult": 试验参数ID<br/>
	        "url_ExperimentResultFile": 自定义1结果文件url<br/>
	        "name_ExperimentResultFile": 自定义1结果文件name<br/>
	        "ascription": 归属：自定义1结果文件为："ExReDefined1File",<br/>
	      }],    <br/>
	    
	    "ExReDefined2File": [{<br/>
	        "id_ExperimentResultFile": 自定义2结果文件ID<br/>
	        "id_ExperimentParameterResult": 试验参数ID<br/>
	        "url_ExperimentResultFile": 自定义2结果文件url<br/>
	        "name_ExperimentResultFile": 自定义2结果文件name<br/>
	        "ascription":归属：自定义2结果文件为： "ExReDefined2File",<br/>
	      }],<br/>
	    
	    "ExReDefined3File": [{<br/>
	        "id_ExperimentResultFile": 自定义3结果文件ID<br/>
	        "id_ExperimentParameterResult": 试验参数ID<br/>
	        "url_ExperimentResultFile": 自定义3结果文件url<br/>
	        "name_ExperimentResultFile": 自定义3结果文件name<br/>
	        "ascription":归属：自定义3结果文件为： "ExReDefined3File",<br/>
	      }]<br/>
	     
	    "ExReDefined4File": [{<br/>
	       "id_ExperimentResultFile": 自定义4结果文件ID<br/>
	       "id_ExperimentParameterResult": 试验参数ID<br/>
	       "url_ExperimentResultFile": 自定义4结果文件url<br/>
	       "name_ExperimentResultFile": 自定义4结果文件name<br/>
	       "ascription":归属：自定义4结果文件为： "ExReDefined4File",<br/>
	     }],<br/>
	           
	    "ExReDefined5File": [{<br/>
	        "id_ExperimentResultFile": 自定义5结果文件ID<br/>
	        "id_ExperimentParameterResult": 试验参数ID<br/>
	        "url_ExperimentResultFile": 自定义5结果文件url<br/>
	        "name_ExperimentResultFile": 自定义5结果文件name<br/>
	        "ascription":归属：自定义5结果文件为： "ExReDefined5File",<br/>
	      }],<br/>
	    
	    "ExReWearFile": [{<br/>
	        "id_ExperimentResultFile": 刀具磨损文件ID<br/>
	        "id_ExperimentParameterResult": 试验参数ID<br/>
	        "url_ExperimentResultFile": 刀具磨损文件url<br/>
	        "name_ExperimentResultFile": 刀具磨损文件name<br/>
	        "ascription":归属：刀具磨损文件为： "ExReWearFile",<br/>
	      }],<br/>
	    
	    "ExReSectionStressList": [{<br/>
	        "yuansu": 距离表面距离<br/>
	        "baifenbi": 硬度值<br/>
	      }],<br/>
	    
	    "ExReSectionHardnessList": [{<br/>
	        "yuansu": 距离表面距离<br/>
	        "baifenbi": 硬度值<br/>
	      }],<br/>
	  },<br/>
	  
	  "ExperimentParameterToolWear": [{<br/>
	  
	  	  "id_ExperimentParameterToolWear": 刀具寿命ID<br/>
	      "id_ExperimentParameterResult": 试验参数ID<br/>
	  	  "ExReWearValue": 磨损量(mm)<br/>
	      "ExReWearTime": 时间<br/>
	      
	      "ExReQianDaoPicture": [{<br/>
	      	  "id_ExperimentParameterToolWear": 刀具寿命ID<br/>
	          "id_ExperimentParameterToolWearPicture": 前刀面图片文件ID<br/>
	          "url_ExperimentParameterToolWearPicture": 前刀面图片文件url<br/>
	          "ascription": 归属：前刀面图片文件为："ExReQianDaoPicture",<br/>
	        }],<br/>
	      
	      "ExReHouDaoPicture": [{<br/>
	          "id_ExperimentParameterToolWearPicture": 后刀面图片文件ID<br/>
	          "ascription": 归属：后刀面图片文件为："ExReHouDaoPicture",<br/>
	          "url_ExperimentParameterToolWearPicture": 后刀面图片文件url<br/>
	          "id_ExperimentParameterToolWear": 刀具寿命ID<br/>
	        }],<br/>
	      
	      "ExReDaojianPicture": [{<br/>
	      	  "id_ExperimentParameterToolWear": 刀具寿命ID<br/>
	          "id_ExperimentParameterToolWearPicture": 刀尖图片文件ID<br/>
	          "url_ExperimentParameterToolWearPicture": 刀尖图片文件url<br/>
	          "ascription": 归属：刀尖图片文件为："ExReDaojianPicture",<br/>
	        }]<br/>
	        
	      "ExReotherPicture": [{<br/>
	      	  "id_ExperimentParameterToolWear": 刀具寿命ID<br/>
	          "id_ExperimentParameterToolWearPicture": 其他图片文件ID<br/>
	          "url_ExperimentParameterToolWearPicture": 其他图片文件url<br/>
	          "ascription":归属：其他图片文件为： "ExReotherPicture",<br/>
	        }],<br/>
	      
	    }],<br/>
	    
	    
	  "Number": 1,<br/>
	  "array_ExReForceFile": 所有切削力文件url（以，分割）<br/>
	  "array_ExReForceFile_name": 所有切削力文件name（以，分割）<br/>
	  "array_ExReTemperatureFile": 所有切削温度文件url（以，分割）<br/>
	  "array_ExReTemperatureFile_name": 所有切削温度文件name（以，分割）<br/>
	  "array_SurfaceFile": 所有表面文件url（以，分割）<br/>
	  "array_SurfaceFile_name": 所有表面文件name（以，分割）<br/>
	  "array_ShapeFile": 所有切屑形态文件url（以，分割）<br/>
	  "array_ShapeFile_name": 所有切屑形态文件name（以，分割）<br/>
	  "array_SurfaceRoughnessFile": 所有表面粗糙度文件url（以，分割）<br/>
	  "array_SurfaceRoughnessFile_name": 所有表面粗糙度文件name（以，分割）<br/>
	  "array_SurfaceHardnessFile": 所有表面硬度文件url（以，分割）<br/>
	  "array_SurfaceHardnessFile_name": 所有表面硬度文件name（以，分割）<br/>
	  "array_ExReSectionHardnessFile": 所有截面硬度文件url（以，分割）<br/>
	  "array_ExReSectionHardnessFile_name": 所有截面硬度文件name（以，分割）<br/>
	  "array_ExReSurfaceStressFile": 所有表面残余应力url（以，分割）<br/>
	  "array_ExReSurfaceStressFile_name": 所有表面残余应力name（以，分割）<br/>
	  "array_ExReSectionStressFile": 所有截面硬度文件url（以，分割）<br/>
	  "array_ExReSectionStressFile_name": 所有截面硬度文件name（以，分割）<br/>
	  "array_ExReDefined1File": 自定义1结果文件url（以，分割）<br/>
	  "array_ExReDefined1File_name": 自定义1结果文件name（以，分割）<br/>
	  "array_ExReDefined2File": 自定义2结果文件url（以，分割）<br/>
	  "array_ExReDefined2File_name": 自定义2结果文件name（以，分割）<br/>
	  "array_ExReDefined3File": 自定义3结果文件url（以，分割）<br/>
	  "array_ExReDefined3File_name": 自定义3结果文件name（以，分割）<br/>
	  "array_ExReDefined4File": 自定义4结果文件url（以，分割）<br/>
	  "array_ExReDefined4File_name": 自定义4结果文件name（以，分割）<br/>
	  "array_ExReDefined5File": 自定义5结果文件url（以，分割）<br/>
	  "array_ExReDefined5File_name": 自定义5结果文件name（以，分割）<br/>
	  "array_ExReWearFile": 所有刀具磨损文件url（以，分割）<br/>
	  "array_ExReWearFile_name": 所有刀具磨损文件name（以，分割）<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	122
  	</td>
  	<td>
  	/experimentParameterResultApp/saveResultFile
  	</td>
  	<td>
  	保存结果文件
  	</td>
  	<td>
  	String file ,结果文件<br/>
  	String fileSuffix, 文件后缀<br/>
  	String filename 文件名字带后缀<br/>
  	</td>
  	<td>
  	{<br/>
	    "result": 成功1 失败0<br/>
	    "name": 文件名字<br/>
	    "url": 文件url<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	123
  	</td>
  	<td>
  	/experimentParameterResultApp/saveResultInfo
  	</td>
  	<td>
  	保存结果信息
  	</td>
  	<td>
  	String id_ExperimentParameterResult："试验参数ID"<br/>
  	String ExReForceX: "切削力Fx",<br/>
	String ExReForceY: "切削力Fy",<br/>
	String ExReForceZ: "切削力Fz",<br/>
	String ExReTorque: "扭矩 N",<br/>
	String ExReTemperature: "切削温度",<br/>
	String ExReSurfaceMorphology: "加工表面形态",<br/>
	String ExReChipShape: "切屑形态",<br/>
	String ExReSurfaceRoughness: "表面粗糙度",<br/>
	String ExReSurfaceHardness: "表面硬度",<br/>
	String ExReSectionHardness: "截面硬度"   格式：  1-2, <br/>
	String ExReSurfaceStress: "表面残余应力",<br/>
	String ExReSectionStress: "截面残余应力",  格式：3-4, <br/>
	String ExReDefined1: "自定义1参数名称",<br/>
	String ExReDefined1Value: "自定义1结果",<br/>
	String ExReDefined2: "自定义2参数名称",<br/>
	String ExReDefined2Value: "自定义2结果",<br/>
	String ExReDefined3: "自定义3参数名称",<br/>
	String ExReDefined3Value: "自定义3结果",<br/>
	String ExReDefined4: "自定义4参数名称",<br/>
	String ExReDefined4Value: "自定义4结果",<br/>
	String ExReDefined5: "自定义5参数名称",<br/>
	String ExReDefined5Value: "自定义5结果",<br/>
	String ExReToolLife: "刀具寿命",<br/>
	String ExReWearStandard: "磨钝标准",<br/>
	String array_ExReForceFile: 所有切削力文件url（以，分割）<br/>
	String array_ExReForceFile_name: 所有切削力文件name（以，分割）<br/>
	String array_ExReTemperatureFile: 所有切削温度文件url（以，分割）<br/>
	String array_ExReTemperatureFile_name: 所有切削温度文件name（以，分割）<br/>
	String array_SurfaceFile: 所有表面文件url（以，分割）<br/>
	String array_SurfaceFile_name: 所有表面文件name（以，分割）<br/>
	String array_ShapeFile: 所有切屑形态文件url（以，分割）<br/>
	String array_ShapeFile_name: 所有切屑形态文件name（以，分割）<br/>
	String array_SurfaceRoughnessFile: 所有表面粗糙度文件url（以，分割）<br/>
	String array_SurfaceRoughnessFile_name: 所有表面粗糙度文件name（以，分割）<br/>
	String array_SurfaceHardnessFile: 所有表面硬度文件url（以，分割）<br/>
	String array_SurfaceHardnessFile_name: 所有表面硬度文件name（以，分割）<br/>
	String array_ExReSectionHardnessFile: 所有截面硬度文件url（以，分割）<br/>
	String array_ExReSectionHardnessFile_name: 所有截面硬度文件name（以，分割）<br/>
	String array_ExReSurfaceStressFile: 所有表面残余应力url（以，分割）<br/>
	String array_ExReSurfaceStressFile_name: 所有表面残余应力name（以，分割）<br/>
	String array_ExReSectionStressFile: 所有截面硬度文件url（以，分割）<br/>
	String array_ExReSectionStressFile_name: 所有截面硬度文件name（以，分割）<br/>
	String array_ExReDefined1File: 自定义1结果文件url（以，分割）<br/>
	String array_ExReDefined1File_name: 自定义1结果文件name（以，分割）<br/>
	String array_ExReDefined2File: 自定义2结果文件url（以，分割）<br/>
	String array_ExReDefined2File_name: 自定义2结果文件name（以，分割）<br/>
	String array_ExReDefined3File: 自定义3结果文件url（以，分割）<br/>
	String array_ExReDefined3File_name: 自定义3结果文件name（以，分割）<br/>
	String array_ExReDefined4File: 自定义4结果文件url（以，分割）<br/>
	String array_ExReDefined4File_name: 自定义4结果文件name（以，分割）<br/>
	String array_ExReDefined5File: 自定义5结果文件url（以，分割）<br/>
	String array_ExReDefined5File_name: 自定义5结果文件name（以，分割）<br/>
	String array_ExReWearFile: 所有刀具磨损文件url（以，分割）<br/>
	String array_ExReWearFile_name: 所有刀具磨损文件name（以，分割）<br/>
	String life 刀具寿命（传递json串） 例如：{"ExReWearTime":时间,"ExReWearValue":磨损度,"array_ExReQianDaoPicture":所有前脚图片地址（逗号间隔）,"array_ExReHouDaoPicture":所有后脚图片地址（逗号间隔）,"array_ExReDaojianPicture":所有刀尖图片地址（逗号间隔）,"array_ExReotherPicture":所有其他图片地址（逗号间隔）}<br/>
  	</td>
  	<td>
  	{<br/>
		"result":"1",<br/>
		"msg":"保存成功"<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	124
  	</td>
  	<td>
  	/experimentParameterResultApp/selectResult
  	</td>
  	<td>
  	实验基本信息页面及结果查询（此处查询和上面的试验基本数据查询不同，此处含有参数数据，且由于结果页面数据太多，需要包含查询结果数据的入口）
  	</td>
  	<td>
  	int pageNo, 第几页<br/>
	int pageSize, 每页几条<br/>
	String ExperimentNo, 实验编号<br/>
	String ExperimentType, 实验类型<br/>
	String ExperimentMachine, 实验机床<br/>
	String ExperimentPart, 试验件<br/>
	String NumberMaterialExperimentPart, 试验材料牌号<br/>
	String CategoryMaterialExperimentPart, 试验材料种类<br/>
	String ExperimentTool, 试验刀具<br/>
	String ExperimentToolMaterial, 刀具材料<br/>
	String ExperimentCuttingFluid, 切削液<br/>
	String ExperimentMachiningType 加工类别：精加工 半精加工 粗加工<br/>
  	</td>
  	<td>
  	{<br/>
		"result": "1", 返回状态：1成功 0失败<br/>
		"CategoryExperimentType": [{<br/>
			"name_ExperimentType": 类别名字<br/>
			"id_ExperimentType": 类别ID<br/>
		}],<br/>
		"para": {<br/>
		ExperimentNo, 实验编号<br/>
		ExperimentType, 实验类型<br/>
		ExperimentMachine, 实验机床<br/>
		ExperimentPart, 试验件<br/>
		NumberMaterialExperimentPart, 试验材料牌号<br/>
		CategoryMaterialExperimentPart, 试验材料种类<br/>
		ExperimentTool, 试验刀具<br/>
		ExperimentToolMaterial, 刀具材料<br/>
		ExperimentCuttingFluid, 切削液<br/>
		ExperimentMachiningType 加工类别：精加工 半精加工 粗加工<br/>
		},<br/>
		"page": {<br/>
			"pageCount": 总页数<br/>
		},<br/>
		"list": [{<br/>
		"ExperimentReportList": [{<br/>
			"id_ExperimentReport": 实验报告文件ID,<br/>
			"id_ExperimentManage": int ExperimentManage.id_ExperimentManage,<br/>
			"url_ExperimentReport": 实验报告文件url,<br/>
			"name_ExperimentReport": 实验报告文件name,<br/>
		}],<br/>
		"id_ExperimentManage": 实验ID,<br/>
		"ExperimentNo": 实验编号,<br/>
		"ExperimentName": 实验名称,<br/>
		"ExperimentType": 实验类型,<br/>
		"ExperimentMachine": 实验机床,<br/>
		"ExperimentPerson": 实验人员,<br/>
		"ExperimentTeacher": 责任人,<br/>
		"ExperimentPart": 试验件,<br/>
		"NumberMaterialExperimentPart": 试验材料牌号,<br/>
		"CategoryMaterialExperimentPart": 试验材料种类,<br/>
		"ExperimentTool": 试验刀具,<br/>
		"ExperimentToolMaterial": 刀具材料,<br/>
		"ExperimentTime": 实验时间,<br/>
		"ExperimentContent": 加工形式,<br/>
		"ExperimentRemark": 实验备注,<br/>
		"ExperimentCuttingFluid": 切削液,<br/>
		"ExperimentMachiningType": 加工类别：精加工 半精加工 粗加工,<br/>
		"ExperimentCondition": 实验说明<br/>
		"ExperimentParameterResult": [{ 这是参数值，和下面的parameters对应。<br/>
			id_ExperimentParameterResult: 试验参数ID<br/>
			ExperimentCuttingSpeed: 切削速度 <br/>
			ExperimentCuttingDepth: 切削深度<br/>
			ExperimentCuttingWidth: 切削宽度 <br/>
			ExperimentFeedRate: 进给量 <br/>
			ExperimentToolQianjiao:刀具前角<br/>
			ExperimentToolHoujiao:刀具后角 <br/>
			ExperimentToolZhupianjiao：刀具主偏角<br/>
			ExperimentToolRenqingjiao：刀具刃倾角 <br/>
			ExperimentToolNoseRadius：刀尖圆弧半径<br/>
			ExperimentToolBreakerBlade：断屑槽类型 <br/>
			ExperimentMachiningType：加工类别<br/>
			ExperimentTool：试验刀具<br/>
			ExperimentToolMaterial：刀具材料<br/>
			ExperimentCuttingFluid：切削液<br/>
			ExperimentPara1：预留1<br/>
			ExperimentPara2：预留2<br/>
		}],<br/>
		"parameters": [	这是一个集合，返回的是该编号的有哪些参数列有值（参数种类很多，但是每个试验对应的参数不一定都有值，所以只返回有值的参数列）<br/>
			id_ExperimentParameterResult: 试验参数ID<br/>
			ExperimentCuttingSpeed: 切削速度 <br/>
			ExperimentCuttingDepth: 切削深度<br/>
			ExperimentCuttingWidth: 切削宽度 <br/>
			ExperimentFeedRate: 进给量 <br/>
			ExperimentToolQianjiao:刀具前角<br/>
			ExperimentToolHoujiao:刀具后角 <br/>
			ExperimentToolZhupianjiao：刀具主偏角<br/>
			ExperimentToolRenqingjiao：刀具刃倾角 <br/>
			ExperimentToolNoseRadius：刀尖圆弧半径<br/>
			ExperimentToolBreakerBlade：断屑槽类型 <br/>
			ExperimentMachiningType：加工类别<br/>
			ExperimentTool：试验刀具<br/>
			ExperimentToolMaterial：刀具材料<br/>
			ExperimentCuttingFluid：切削液<br/>
			ExperimentPara1：预留1<br/>
			ExperimentPara2：预留2<br/>
		]<br/>
	 }]<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	125
  	</td>
  	<td>
  	/experimentParameterResultApp/goExportResult
  	</td>
  	<td>
  	导出结果信息
  	</td>
  	<td>
  	String id_ExperimentParameterResult 试验参数ID
  	</td>
  	<td>
  	{<br/>
	    "result": 成功1  失败 0<br/>
	    "msg": 返回信息<br/>
	    "url": 导出文件的地址<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	126
  	</td>
  	<td>
  	/ProcessPartApp/ProcessPartList
  	</td>
  	<td>
  	加工零件列表
  	</td>
  	<td>
  	int pageNo, 第几页<br/>
  	int pageSize, 每页几条<br/>
	String NameProcessPart, 零件名称<br/>
	String NumberProcessPart, 零件编号<br/>
	String TypeProcessPart, 零件类别<br/>
	String AssemblyProcessPart, 零件所属部件<br/>
	String NoAssemblyProcessPart 零件所属部件编号<br/>
  	</td>
  	<td>
  	"result":成功1 失败0<br/>
  	{<br/>
  	"CategoryTypeProcessPart":[{<br/>
  		"id_CategoryTypeProcessPart":加工零件类别ID<br/>
  		"name_CategoryTypeProcessPart": 加工零件类别名字,<br/>
  		}],<br/>
  	"CategoryIndustryProcessPart":[{<br/>
  		"id_CategoryIndustryProcessPart": 加工零件应用行业ID<br/>
  		"name_CategoryIndustryProcessPart": 加工零件应用行业名字<br/>
  		}],<br/>
  	"page":{<br/>
  		"pageCount":总页数<br/>
  		},<br/>
  	"list":[{<br/>
  		"id_ProcessPart": 加工零件ID<br/>
  		"NameProcessPart":"零件名称",<br/>
  		"NumberProcessPart":"零件编号"<br/>
  		"TypeProcessPart":"零件类别",<br/>
  		"AssemblyProcessPart":"零件所属部件",<br/>
  		"NoAssemblyProcessPart":"零件所属部件编号",<br/>
  		"CompanyProcessPart":"零件所属厂家",<br/>
  		"IndustryProcessPart":"应用行业",<br/>
  		"NumberMaterialProcessPart":"材料牌号",<br/>
  		"CategoryMaterialProcessPart":"材料类别",<br/>
  		"RemarkProcessPart":"备注",<br/>
  		"PictureProcessPart":[{<br/>
  			"id_ProcessPart":int ProcessPart.id_ProcessPart 对应加工零件ID<br/>
  			"id_ProcessPartFile":图片ID<br/>
  			"url_ProcessPartFile":图片URL,<br/>
  			"ascription":"PictureProcessPart", 所属<br/>
  			}],<br/>
  		"InformProcessPart":[{<br/>
  			"id_ProcessPart":int ProcessPart.id_ProcessPart 对应加工零件ID<br/>
  			"id_ProcessPartFile":详细信息ID<br/>
  			"url_ProcessPartFile":详细信息URL<br/>
  			"name_ProcessPartFile":详细信息name<br/>
  			"ascription":"InformProcessPart", 所属<br/>
  			}],<br/>
  		"PartProcessPart":[{<br/>
	  		"id_ProcessPart":int ProcessPart.id_ProcessPart 对应加工零件ID<br/>
	  		"id_ProcessPartFile":图案文件ID<br/>
	  		"url_ProcessPartFile":图案文件url,<br/>
	  		"name_ProcessPartFile":图案文件name,<br/>
	  		"ascription":"PartProcessPart",所属<br/>
	  		}],<br/>
  		}]<br/>
  	"para":{<br/>
  		NameProcessPart, 零件名称<br/>
		NumberProcessPart, 零件编号<br/>
		TypeProcessPart, 零件类别<br/>
		AssemblyProcessPart, 零件所属部件<br/>
		NoAssemblyProcessPart 零件所属部件编号<br/>
  	},<br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	127
  	</td>
  	<td>
  	/ProcessPartApp/goAddProcessPartt
  	</td>
  	<td>
  	去添加加工零件页面
  	</td>
  	<td>
  	String id 加工零件ID
  	</td>
  	<td>
  	"result":成功1 失败0<br/>
  	{<br/>
  	"CategoryTypeProcessPart":[{<br/>
  		"id_CategoryTypeProcessPart":加工零件类别ID<br/>
  		"name_CategoryTypeProcessPart": 加工零件类别名字,<br/>
  		}],<br/>
  	"CategoryIndustryProcessPart":[{<br/>
  		"id_CategoryIndustryProcessPart": 加工零件应用行业ID<br/>
  		"name_CategoryIndustryProcessPart": 加工零件应用行业名字<br/>
  		}],<br/>
  	"page":{<br/>
  		"pageCount":总页数<br/>
  		},<br/>
  	"ProcessPart":[{<br/>
  		"id_ProcessPart": 加工零件ID<br/>
  		"NameProcessPart":"零件名称",<br/>
  		"NumberProcessPart":"零件编号"<br/>
  		"TypeProcessPart":"零件类别",<br/>
  		"AssemblyProcessPart":"零件所属部件",<br/>
  		"NoAssemblyProcessPart":"零件所属部件编号",<br/>
  		"CompanyProcessPart":"零件所属厂家",<br/>
  		"IndustryProcessPart":"应用行业",<br/>
  		"NumberMaterialProcessPart":"材料牌号",<br/>
  		"CategoryMaterialProcessPart":"材料类别",<br/>
  		"RemarkProcessPart":"备注",<br/>
  		"PictureProcessPart":[{<br/>
  			"id_ProcessPart":int ProcessPart.id_ProcessPart 对应加工零件ID<br/>
  			"id_ProcessPartFile":图片ID<br/>
  			"url_ProcessPartFile":图片URL,<br/>
  			"ascription":"PictureProcessPart", 所属<br/>
  			}],<br/>
  		"InformProcessPart":[{<br/>
  			"id_ProcessPart":int ProcessPart.id_ProcessPart 对应加工零件ID<br/>
  			"id_ProcessPartFile":详细信息ID<br/>
  			"url_ProcessPartFile":详细信息URL<br/>
  			"name_ProcessPartFile":详细信息name<br/>
  			"ascription":"InformProcessPart", 所属<br/>
  			}],<br/>
  		"PartProcessPart":[{<br/>
	  		"id_ProcessPart":int ProcessPart.id_ProcessPart 对应加工零件ID<br/>
	  		"id_ProcessPartFile":图案文件ID<br/>
	  		"url_ProcessPartFile":图案文件url,<br/>
	  		"name_ProcessPartFile":图案文件name,<br/>
	  		"ascription":"PartProcessPart",所属<br/>
	  		}],<br/>
  		}]<br/>
  	"array_PictureProcessPart":所有图片地址<br/>
	"array_InformProcessPart":所有详细信息url<br/>,
	"array_InformProcessPart_name":所有详细信息name<br/>
  	"array_PartProcessPart":图案文件url<br/>
  	"array_PartProcessPart_name":图案文件name<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	128
  	</td>
  	<td>
  	/ProcessPartApp/saveProcessPart
  	</td>
  	<td>
  	修改/添加加工零件信息
  	</td>
  	<td>
  	int id_ProcessPart, 加工零件ID<br/>
	String array_PictureProcessPart, 所有图片url(以，分割)<br/>
	String array_InformProcessPart, 所有详细信息url(以，分割)<br/>
	String array_InformProcessPart_name, 所有详细信息name(以，分割)<br/>
	String array_PartProcessPart, 所有图案url(以，分割)<br/>
	String array_PartProcessPart_name, 所有图案name(以，分割)<br/>
	String NameProcessPart, 零件名称<br/>
	String NumberProcessPart, 零件编号<br/>
	String TypeProcessPart, 零件类别<br/>
	String AssemblyProcessPart, 零件所属部件<br/>
	String NoAssemblyProcessPart 零件所属部件编号<br/>
	String CompanyProcessPart, 零件所属厂家<br/>
	String IndustryProcessPart, 应用行业<br/>
	String NumberMaterialProcessPart, 材料牌号<br/>
	String CategoryMaterialProcessPart, 材料类别<br/>
	String RemarkProcessPart 备注<br/>
  	</td>
  	<td>
  	{<br/>
		"result":返回状态 1成功 0失败,<br/>
		"msg":返回信息<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	129
  	</td>
  	<td>
  	/ProcessPartApp/savePictureProcessPart
  	</td>
  	<td>
  	保存图片文件
  	</td>
  	<td>
  	String PictureProcessPart ,图片文件<br/>
  	String fileSuffix, 文件后缀<br/>
  	String filename 文件名带后缀<br/>
  	</td>
  	<td>
  	{<br/>
	    "result": 成功1 失败0<br/>
	    "url": 文件url<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	130
  	</td>
  	<td>
  	/ProcessPartApp/saveInformProcessPart
  	</td>
  	<td>
  	详细信息文件
  	</td>
  	<td>
  	String InformProcessPart ,详细信息文件<br/>
  	String fileSuffix, 文件后缀<br/>
  	String filename 文件名带后缀<br/>
  	</td>
  	<td>
  	{<br/>
	    "result": 成功1 失败0<br/>
	    "name": 文件名字<br/>
	    "url": 文件url<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	131
  	</td>
  	<td>
  	/ProcessPartApp/savePartProcessPart
  	</td>
  	<td>
  	保存图案文件
  	</td>
  	<td>
  	String PartProcessPart ,图案文件<br/>
  	String fileSuffix, 文件后缀<br/>
  	String filename 文件名带后缀<br/>
  	</td>
  	<td>
  	{<br/>
	    "result": 成功1 失败0<br/>
	    "name": 文件名字<br/>
	    "url": 文件url<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	132
  	</td>
  	<td>
  	/ProcessPartApp/loadingMaterial
  	</td>
  	<td>
  	去往加载工件材料页面
  	</td>
  	<td>
  	int pageNo, 第几页<br/>
  	int pageSize, 每页几条<br/>
	String NameMaterial 材料名称<br/>
	String NumberMaterial 材料牌号<br/>
	String id_CategoryMaterial 材料类别id<br/>
	String ISOCuttingMaterial ISO加工分类<br/>
	String CategoryMaterial 热处理方式<br/>
	String CompanyMaterial 供应商<br/>
  	</td>
  	<td>
  	<B>工件材料页面：</B><br/>
		{<br/>
		  "page" : {<br/>
		    	pageCount : int 总页数<br/>
		  }<br/>
		  "list":{<br/>
		    	id_Material: int<br/>
		    	NameMaterial: String 材料名称<br/>
		    	NumberMaterial ： String 材料牌号<br/>
		    	id_CategoryMaterial： String 材料类别id<br/>
		    	ISOCuttingMaterial：String ISO加工分类 <br/>
		    	CategoryMaterial ：String 热处理方式<br/>
		    	CompanyMaterial ： String 供应商<br/>
		    	ConstituentsMaterial：String 材料主要成分(元素-百分比， 例如{1-1,2-2，}) <br/>
		    	MachineableMaterial ：String 材料加工性<br/>
		    	DensityMaterial ：String 材料密度 <br/>
		    	ModulusMaterial： String 弹性模量<br/>
		    	HardnessMaterial： String 材料硬度<br/>
		    	ConductivityMaterial ：String 材料热导率<br/>
		    	SpecificheatMaterial： String 材料比热<br/>
		    	StrengthMaterial ：String 抗拉强度<br/>
		    	ThermalExpansionMaterial ：String 热膨胀系数<br/>
		    	JCMaterial： String JC模型(ABnCm)(A,B,n,C,m 例如1,2,,4,5,)<br/>
		    	StrainRate:String 应变率(数据点-温度-应变-应变率,例如{1-1-1-1，2-2-2-2，})<br/>
		    	add_time： bigint 添加时间<br/>
		    	user_id ：int 用户id<br/>
		  }<br/>
		  "categoryMaterialList":{<br/>
		    	id_CategoryMaterial: int 材料类别id<br/>
		    	name_CategoryMaterial : String 材料类别名称<br/>
		  }<br/>
		  "para":{<br/>
		    	NameMaterial: String 材料名称<br/>
		    	NumberMaterial ： String 材料牌号<br/>
		    	id_CategoryMaterial： String 材料类别id<br/>
		    	ISOCuttingMaterial：String ISO加工分类 <br/>
		    	CategoryMaterial ：String 热处理方式<br/>
		    	CompanyMaterial ： String 供应商<br/>
		  }<br/>
		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	133
  	</td>
  	<td>
  	/ProcessPartApp/deleteProcessPartList
  	</td>
  	<td>
  	删除加工零件信息
  	</td>
  	<td>
  	String id_ProcessPart 加工零件ID
  	</td>
  	<td>
  	{<br/>
		"result":返回状态 1成功 0失败,<br/>
		"msg":返回信息<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		134
  	</td>
  	<td>
  	/FixturePartApp/FixturePartList
  	</td>
  	<td>
  	夹具管理列表页面
  	</td>
  	<td>
  	int pageNo, 第几页<br/>
  	int pageSize, 每页几条<br/>
	String NameFixturePart, 夹具名称<br/>
	String NumberFixturePart, 夹具编号<br/>
	String TypeFixturePart, 夹具类别<br/>
	String MachineFixturePart, 应用机床<br/>
	String ProcessPartFixturePart 应用加工零件<br/>
  	</td>
  	<td>
  	{<br/>
  		"result": 成功1 失败0<br/>
  		"CategoryTypeFixturePart":[{<br/>
  			"id_CategoryTypeFixturePart": "夹具管理类型ID"<br/>
  			"name_CategoryTypeFixturePart":"夹具管理类型name"<br/>
  		}],<br/>
  		"page":{<br/>
  			"pageCount":总页数<br/>
  		},<br/>
  		"list":[{<br/>
  			"id_FixturePart": 夹具管理ID<br/>
  			"NumberFixturePart":"夹具编号",<br/>
  			"NameFixturePart":"夹具名称",<br/>
  			"TypeFixturePart": 夹具管理类型<br/>
  			"MachineFixturePart":"应用机床",<br/>
  			"ProcessPartFixturePart":"应用加工零件",<br/>
  			"AppCo":"应用公司",<br/>
  			"LocationFixturePart":"夹具存放地点",<br/>
  			"RemarkFixturePart":"备注",<br/>
  			"PictureFixturePart":[{<br/>
  				"id_FixturePart": int FixturePart.id_FixturePart<br/>
  				"id_FixturePartFile": 夹具图片ID<br/>
  				"url_FixturePartFile": 夹具图片url<br/>
  				"ascription":"PictureFixturePart",  所属<br/>
  			}],<br/>
  			"InformFixturePart":[{<br/>
  				"id_FixturePart": int FixturePart.id_FixturePart<br/>
  				"id_FixturePartFile": 夹具详细信息ID<br/>
  				"url_FixturePartFile":夹具详细信息url<br/>
  				"name_FixturePartFile": 夹具详细信息name<br/>
  				"ascription":"InformFixturePart",  所属<br/>
  			}]<br/>
  			"PartFixturePart":[{<br/>
  				"id_FixturePart": int FixturePart.id_FixturePart<br/>
  				"id_FixturePartFile": 夹具图案文件ID<br/>
  				"url_FixturePartFile": 夹具图案文件url<br/>
  				"name_FixturePartFile": 夹具图案文件name<br/>
  				"ascription":"PartFixturePart ",  所属<br/>
  			}],<br/>
  		}]<br/>
  		"para":{<br/>
  			"NameFixturePart": 夹具名称<br/>
  			"NumberFixturePart": 夹具编号<br/>
  			"TypeFixturePart": 夹具类别<br/>
  			"MachineFixturePart": 应用机床<br/>
  			"ProcessPartFixturePart": 应用加工零件<br/>
  		},<br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		135
  	</td>
  	<td>
  	/FixturePartApp/goAddFixturePart
  	</td>
  	<td>
  	去添加夹具页面
  	</td>
  	<td>
  	String id 夹具管理ID<br/>
  	</td>
  	<td>
  	{<br/>
  		"result": 成功1 失败0<br/>
  		"CategoryTypeFixturePart":[{<br/>
  			"id_CategoryTypeFixturePart": "夹具管理类型ID"<br/>
  			"name_CategoryTypeFixturePart":"夹具管理类型name"<br/>
  		}],<br/>
  		"FixturePart":[{<br/>
  			"id_FixturePart": 夹具管理ID<br/>
  			"NumberFixturePart":"夹具编号",<br/>
  			"NameFixturePart":"夹具名称",<br/>
  			"TypeFixturePart": 夹具管理类型<br/>
  			"MachineFixturePart":"应用机床",<br/>
  			"ProcessPartFixturePart":"应用加工零件",<br/>
  			"AppCo":"应用公司",<br/>
  			"LocationFixturePart":"夹具存放地点",<br/>
  			"RemarkFixturePart":"备注",<br/>
  			"PictureFixturePart":[{<br/>
  				"id_FixturePart": int FixturePart.id_FixturePart<br/>
  				"id_FixturePartFile": 夹具图片ID<br/>
  				"url_FixturePartFile": 夹具图片url<br/>
  				"ascription":"PictureFixturePart",  所属<br/>
  			}],<br/>
  			"InformFixturePart":[{<br/>
  				"id_FixturePart": int FixturePart.id_FixturePart<br/>
  				"id_FixturePartFile": 夹具详细信息ID<br/>
  				"url_FixturePartFile":夹具详细信息url<br/>
  				"name_FixturePartFile": 夹具详细信息name<br/>
  				"ascription":"InformFixturePart",  所属<br/>
  			}]<br/>
  			"PartFixturePart":[{<br/>
  				"id_FixturePart": int FixturePart.id_FixturePart<br/>
  				"id_FixturePartFile": 夹具图案文件ID<br/>
  				"url_FixturePartFile": 夹具图案文件url<br/>
  				"name_FixturePartFile": 夹具图案文件name<br/>
  				"ascription":"PartFixturePart ",  所属<br/>
  			}],<br/>
  		}]<br/>
  		"array_PictureFixturePart": 所有夹层管理图片url（以，分割）<br/>
  		"array_InformFixturePart": 所有夹层管理详细信息url（以，分割）<br/>
		"array_InformFixturePart_name": 所有夹层管理详细信息name（以，分割）<br/>
		"array_PartFixturePart": 所有夹层管理图案文件url（以，分割）<br/>
  		"array_PartFixturePart_name": 所有夹层管理图案文件name（以，分割）<br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		136
  	</td>
  	<td>
  	/FixturePartApp/saveFixturePart
  	</td>
  	<td>
  	保存夹层管理
  	</td>
  	<td>
  	int id_FixturePart 夹层管理ID<br/>
	String array_PictureFixturePart: 所有夹层管理图片url（以，分割）<br/>
  	String array_InformFixturePart: 所有夹层管理详细信息url（以，分割）<br/>
	String array_InformFixturePart_name: 所有夹层管理详细信息name（以，分割）<br/>
	String array_PartFixturePart: 所有夹层管理图案文件url（以，分割）<br/>
  	String array_PartFixturePart_name: 所有夹层管理图案文件name（以，分割）<br/>
	String NameFixturePart 夹具名称, <br/>
	String NumberFixturePart 夹具编号, <br/>
	String TypeFixturePart 夹具类别, <br/>
	String MachineFixturePart 应用机床, <br/>
	String ProcessPartFixturePart 应用加工零件, <br/>
	String AppCo 应用公司, <br/>
	String LocationFixturePart 夹具存放地点, <br/>
	String RemarkFixturePart 备注<br/>
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
  		137
  	</td>
  	<td>
  	/FixturePartApp/savePictureFixturePart
  	</td>
  	<td>
  	保存图片文件
  	</td>
  	<td>
  	String PictureFixturePart,图片文件<br/>
  	String fileSuffix, 文件后缀<br/>
  	String filename 文件名带后缀<br/>
  	</td>
  	<td>
  	{
  		"result": 成功1 失败0<br/>
  		"url": 图片url<br/>
  	}
  	</td>
  </tr>
  
  <tr>
  	<td>
  		138
  	</td>
  	<td>
  	/FixturePartApp/savePartFixturePart
  	</td>
  	<td>
  	保存图案文件
  	</td>
  	<td>
  	String PartFixturePart , 图案文件<br/>
  	String fileSuffix, 文件后缀<br/>
  	String filename 文件名带后缀<br/>
  	</td>
  	<td>
  	{
  		"result": 成功1 失败0<br/>
  		"url": 图案文件url<br/>
  		"name": 图案文件name<br/>
  	}
  	</td>
  </tr>
  
  <tr>
  	<td>
  		139
  	</td>
  	<td>
  	/FixturePartApp/saveInformFixturePart
  	</td>
  	<td>
  	保存详细信息文件
  	</td>
  	<td>
  	String InformFixturePart 详细信息文件<br/>
  	String fileSuffix, 文件后缀<br/>
  	String filename 文件名带后缀<br/>
  	</td>
  	<td>
  	{
  		"result": 成功1 失败0<br/>
  		"url": 详细信息文件url<br/>
  		"name": 详细信息文件name<br/>
  	}
  	</td>
  </tr>
  
  <tr>
  	<td>
  		140
  	</td>
  	<td>
  	/FixturePartApp/deleteFixturePartList
  	</td>
  	<td>
  	删除夹层管理信息
  	</td>
  	<td>
  	String id_FixturePart 夹层管理ID
  	</td>
  	<td>
  	{<br/>
  		"result": 成功1 失败0<br/>
  		"msg":返回信息 <br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		141
  	</td>
  	<td>
  	/FixturePartApp/loading
  	</td>
  	<td>
  	加载机床节点及加工零件
  	</td>
  	<td>
  	int deputy, 传值1：查询机床节点、传值2：加工零件页面<br/>
	int pageNo, 第几页<br/>
	int pageSize, 每页几条<br/>
	String NumberMachineNode, 机床编号<br/>
	String NumberMachine, 机床型号<br/>
	String TypeMachineNode, 机床类别<br/>
	String DepartmentMachineNode, 机床所在单位<br/>
	String WorkshopMachineNode 机床车间<br/>
	String NameProcessPart, 零件名称<br/>
	String NumberProcessPart, 零件编号<br/>
	String TypeProcessPart, 零件类别<br/>
	String AssemblyProcessPart, 零件所属部件<br/>
	String NoAssemblyProcessPart 零件所属部件编号<br/>
  	</td>
  	<td>
  	<B>机床节点页面：</B><br/>
  		{<br/>
		"categoryMachineNodeInform":[{<br/>
		   "id_CategoryMachineNodeInform": 机床结点类别ID<br/>
		   "name_CategoryMachineNodeInform": 机床结点类别名称<br/>
		}],<br/>
		"para": {<br/>
		   "NumberMachineNode": 机床编号<br/>
		   "NumberMachine": 机床型号<br/>
		   "WorkshopMachineNode": 机床车间<br/>
		   "TypeMachineNode": 机床类别<br/>
		   "DepartmentMachineNode": 机床所在单位<br/>
		},<br/>
		"page": {<br/>
		   "pageCount": int 总页数<br/>
		},<br/>
		"list":[{	<br/>
		   "id_MachineNodeInform": 机床结点ID<br/>
		   "NumberMachineNode": 机床编号<br/>
		   "NumberMachine": 机床型号<br/>
		   "TypeMachineNode": 机床类别<br/>
		   "DepartmentMachineNode": 机床所在单位<br/>
		   "WorkshopMachineNode": 机床车间<br/>
		   "PositionMachineNode": 机床位置<br/>
		   "UseFrequencyMachineNode": 机床使用强度<br/>
		   "TimeUseMachineNode": 机床投入使用时间<br/>
		   "TimeDestroyMachineNode": 机床报废时间<br/>
		   "add_time": 添加时间<br/>
		   "user_id": 用户Id<br/>
		}]<br/>
		}<br/>
		<br/>
		<br/>
	<B>加工零件页面：</B><br/>
	{<br/>
		"CategoryTypeProcessPart":[{<br/>
			"name_CategoryTypeProcessPart":"加工零件类别name",<br/>
			"id_CategoryTypeProcessPart": 加工零件类别ID<br/>
		}],<br/>
		"para":{<br/>
			NameProcessPart, 零件名称<br/>
			NumberProcessPart, 零件编号<br/>
			TypeProcessPart, 零件类别<br/>
			AssemblyProcessPart, 零件所属部件<br/>
			NoAssemblyProcessPart 零件所属部件编号<br/>
		},<br/>
		"CategoryIndustryProcessPart":[{<br/>
			"name_CategoryIndustryProcessPart":"加工零件应用行业name",<br/>
			"id_CategoryIndustryProcessPart": 加工零件应用行业ID<br/>
		}],<br/>
		"page":{<br/>
			"pageCount":总页数<br/>
		},<br/>
		"list":[{<br/>
			"id_ProcessPart": 加工零件ID<br/>
			"NameProcessPart":"零件名称",<br/>
			"NumberProcessPart":"零件编号"<br/>
			"TypeProcessPart":"零件类别",<br/>
			"AssemblyProcessPart":"零件所属部件",<br/>
			"NoAssemblyProcessPart":"零件所属部件编号",<br/>
			"CompanyProcessPart":"零件所属厂家",<br/>
			"IndustryProcessPart":"应用行业",<br/>
			"NumberMaterialProcessPart":"材料牌号",<br/>
			"CategoryMaterialProcessPart":"材料类别",<br/>
			"RemarkProcessPart":"备注",<br/>
		}]<br/>
	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		142
  	</td>
  	<td>
  		/ProcessFlowApp/ProcessFlowList
  	</td>
  	<td>
  		查看工艺列表
  	</td>
  	<td>
  		int pageNo,第几页    <br/>
  		int pageSize, 每页几条  <br/>
		String NoProcessFlow, 工艺流程编号   <br/>
		String CompanyProcessFlow, 单位名称   <br/>
		String NameProcessFlow, 工艺流程名称  <br/>
		String PartNameProcessFlow, 零件名称  <br/>
		String PartNumberProcessFlow 零件编号  <br/>
  	</td>
  	<td>
  		{<br/>
  		"result":成功1 失败0,<br/>
  		"para":{<br/>
  			NoProcessFlow, 工艺流程编号   <br/>
			CompanyProcessFlow, 单位名称   <br/>
			NameProcessFlow, 工艺流程名称  <br/>
			PartNameProcessFlow, 零件名称  <br/>
			PartNumberProcessFlow 零件编号  <br/>
  		},<br/>
  		"page":{<br/>
  			"pageCount":1<br/>
  		},<br/>
  		"list":[{<br/>
  			"id_ProcessFlow":工艺流程Id,<br/>
  			"NoProcessFlow":"工艺流程编号",<br/>
  			"NameProcessFlow":"工艺流程名称",<br/>
  			"CompanyProcessFlow":"单位名称",<br/>
  			"PartNameProcessFlow":"零件名称",<br/>
  			"PartNumberProcessFlow":"零件编号",<br/>
  			"PartNoMaterialProcessFlow":"零件材料牌号",<br/>
  			"PartCategoryMaterialProcessFlow":"零件材料类别",<br/>
  			"PartAssemblyProcessFlow":"零件所属部件",<br/>
  			"PartNoAssemblyProcessFlow":"零件所属部件编号",<br/>
  			"PartTypeProcessFlow":"零件类别",<br/>
  			"PicturePartProcessFlow":[{<br/>
  				"id_PicturePartProcessFlow":工艺图片ID<br/>
  				"id_ProcessFlow":工艺ID    ProcessFlow.id_ProcessFlow<br/>
  				"url_PicturePartProcessFlow":工艺图片url,<br/>
  			}]<br/>
  			<br/>
  			"WorkingProcedureList":[{<br/>
  				"id_WorkingProcedure":工序ID<br/>
  				"id_ProcessFlow":int ProcessFlow.id_ProcessFlow<br/>
  				"NoProcedureProcessFlow":"工序编号",<br/>
  				"NameProcedureProcessFlow":"工序名称",<br/>
  				"ContentProcedureProcessFlow":"工序内容",<br/>
  				"EquipmentType":"设备型号",<br/>
  				"TimeProcessFlow":"工时",<br/>
  				"MachineProcessFlow":"加工夹具",<br/>
  				"MachineProcessCode":"加工程序"<br/>
  				"CuttingFluidProcessFlow":"切削液",<br/>
  				"RemarkProcessFlow":"工序备注",<br/>
  				"PictureProcessFlow":[{<br/>
  					"id_PictureProcessFlow":工序图片ID<br/>
  					"id_WorkingProcedure":工序ID   WorkingProcedure.id_WorkingProcedure<br/>
  					"url_PictureProcessFlow":工序图片url,<br/>
  				}],<br/>
  			}],<br/>
  		}]<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		143
  	</td>
  	<td>
  		/ProcessFlowApp/goAddProcessFlow
  	</td>
  	<td>
  		去添加工艺页面
  	</td>
  	<td>
  		String id 工艺流程ID
  	</td>
  	<td>
  		{<br/>
  		"result":成功1 失败0,<br/>
  		"ProcessFlow":{<br/>
  			"id_ProcessFlow":工艺流程Id,<br/>
  			"NoProcessFlow":"工艺流程编号",<br/>
  			"NameProcessFlow":"工艺流程名称",<br/>
  			"CompanyProcessFlow":"单位名称",<br/>
  			"PartNameProcessFlow":"零件名称",<br/>
  			"PartNumberProcessFlow":"零件编号",<br/>
  			"PartNoMaterialProcessFlow":"零件材料牌号",<br/>
  			"PartCategoryMaterialProcessFlow":"零件材料类别",<br/>
  			"PartAssemblyProcessFlow":"零件所属部件",<br/>
  			"PartNoAssemblyProcessFlow":"零件所属部件编号",<br/>
  			"PartTypeProcessFlow":"零件类别",<br/>
  			"PicturePartProcessFlow":[{<br/>
  				"id_PicturePartProcessFlow":工艺图片ID<br/>
  				"id_ProcessFlow":工艺ID    ProcessFlow.id_ProcessFlow<br/>
  				"url_PicturePartProcessFlow":工艺图片url,<br/>
  			}]<br/>
  			<br/>
  			"WorkingProcedureList":[{<br/>
  				"id_WorkingProcedure":工序ID<br/>
  				"id_ProcessFlow":int ProcessFlow.id_ProcessFlow<br/>
  				"NoProcedureProcessFlow":"工序编号",<br/>
  				"NameProcedureProcessFlow":"工序名称",<br/>
  				"ContentProcedureProcessFlow":"工序内容",<br/>
  				"EquipmentType":"设备型号",<br/>
  				"TimeProcessFlow":"工时",<br/>
  				"MachineProcessFlow":"加工夹具",<br/>
  				"MachineProcessCode":"加工程序"<br/>
  				"CuttingFluidProcessFlow":"切削液",<br/>
  				"RemarkProcessFlow":"工序备注",<br/>
  				"PictureProcessFlow":[{<br/>
  					"id_PictureProcessFlow":工序图片ID<br/>
  					"id_WorkingProcedure":工序ID   WorkingProcedure.id_WorkingProcedure<br/>
  					"url_PictureProcessFlow":工序图片url,<br/>
  				}],<br/>
  			}],<br/>
  			"WorkingProcedureNum":工序的个数<br/>
  			},<br/>
  		"array_PicturePartProcessFlow": 所有工艺图片url(以，分割)<br/>
  		}
  	</td>
  </tr>
  
  <tr>
  	<td>
  		144
  	</td>
  	<td>
  		/ProcessFlowApp/saveProcessFlow
  	</td>
  	<td>
  		添加工艺流程信息
  	</td>
  	<td>
  		传给我一个Json类型的值，格式类似一个Map为：<br/>
  			form{<br/>
  				&nbsp;&nbsp;int id_ProcessFlow 工艺流程ID <br/>
  				&nbsp;&nbsp;String NoProcessFlow 工艺流程编号<br/>
  				&nbsp;&nbsp;String CompanyProcessFlow 单位名称<br/>
  				&nbsp;&nbsp;String NameProcessFlow 工艺流程名称<br/>
  				&nbsp;&nbsp;String PartNameProcessFlow 零件名称<br/>
  				&nbsp;&nbsp;String PartNumberProcessFlow 零件编号<br/>
  				&nbsp;&nbsp;String PartNoMaterialProcessFlow 零件材料牌号<br/>
  				&nbsp;&nbsp;String PartCategoryMaterialProcessFlow 零件材料类别<br/>
  				&nbsp;&nbsp;String PartAssemblyProcessFlow 零件所属部件<br/>
  				&nbsp;&nbsp;String PartNoAssemblyProcessFlow 零件所属部件编号<br/>
  				&nbsp;&nbsp;String PartTypeProcessFlow 零件类别<br/>
  				&nbsp;&nbsp;String array_PicturePartProcessFlow 工艺流程图片url(以，分割)<br/>
  				&nbsp;&nbsp;WorkingProcedure：[{<br/>
  				&nbsp;&nbsp;&nbsp;&nbsp;	String NoProcedureProcessFlow 工序编号<br/>
  				&nbsp;&nbsp;&nbsp;&nbsp;	String NameProcedureProcessFlow 工序名称<br/>
  				&nbsp;&nbsp;&nbsp;&nbsp;	String ContentProcedureProcessFlow 工序内容<br/>
  				&nbsp;&nbsp;&nbsp;&nbsp;	String EquipmentType 设备型号<br/>
  				&nbsp;&nbsp;&nbsp;&nbsp;	String TimeProcessFlow 工时<br/>
  				&nbsp;&nbsp;&nbsp;&nbsp;	String MachineProcessFlow 加工夹具<br/>
  				&nbsp;&nbsp;&nbsp;&nbsp;	String MachineProcessCode 加工程序<br/>
  				&nbsp;&nbsp;&nbsp;&nbsp;	String CuttingFluidProcessFlow 切削液<br/>
  				&nbsp;&nbsp;&nbsp;&nbsp;	String RemarkProcessFlow 工序备注<br/>
  				&nbsp;&nbsp;&nbsp;&nbsp;	String array_PictureProcessFlow 工序图片url(以，分割)<br/>
  				}]<br/>
  			}<br/>
  	</td>
  	<td>
  		{<br/>
		"result": 1成功 0失败,<br/>
		"msg": 返回信息<br/>
		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		145
  	</td>
  	<td>
  		/ProcessFlowApp/savePicturePartProcessFlow
  	</td>
  	<td>
  		保存工艺流程图片
  	</td>
  	<td>
  		String PicturePartProcessFlow ,工艺流程图片文件<br/>
  		String fileSuffix, 文件后缀<br/>
  		String filename	文件名字带后缀<br/>
  	</td>
  	<td>
  		{<br/>
  		"result":成功1 失败0,<br/>
  		"url":图片url<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		146
  	</td>
  	<td>
  		/ProcessFlowApp/savePictureProcessFlow
  	</td>
  	<td>
  		保存工序图片
  	</td>
  	<td>
  		String PictureProcessFlow ,保存工序图片文件<br/>
  		String fileSuffix, 文件后缀<br/>
  		String filename	文件名字带后缀<br/>
  	</td>
  	<td>
  		{<br/>
  		"result":成功1 失败0,<br/>
  		"url":图片url<br/>
  		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		147
  	</td>
  	<td>
  		/ProcessFlowApp/deleteProcessFlowList
  	</td>
  	<td>
  		删除工艺流程信息
  	</td>
  	<td>
  		String id_ProcessFlow 工艺流程ID
  	</td>
  	<td>
  		{<br/>
		"result": 1成功 0失败,<br/>
		"msg": 返回信息<br/>
		}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		148
  	</td>
  	<td>
  		/ProcessFlowApp/jzAll
  	</td>
  	<td>
  		用于加载各个页面，都是此接口，根据 “deputy” 参数的值判断加载的是哪个页面 ，查询条件根据对应参数字段输入
  	</td>
  	<td>
  		int deputy, 传值1：查询切削液、传值2：查询夹具管理页面、传值3：查询零件管理页面<br/>
  		int pageNo, 第几页<br/>
  		int pageSize, 每页几条<br/>
  		String NameCuttingFluid, 切削液名称<br/>
  		String NumberCuttingFluid, 切削液编号<br/>
		String CategoryCuttingFluid, 切削液种类<br/>
		String CompanyCuttingFluid, 供应商<br/>
		String NameFixturePart, 夹具名称<br/>
		String NumberFixturePart, 夹具编号<br/>
		String TypeFixturePart, 夹具类别<br/>
		String MachineFixturePart, 应用机床<br/>
		String ProcessPartFixturePart, 应用加工零件<br/>
		String NameProcessPart, 零件名称<br/>
		String NumberProcessPart, 零件编号<br/>
		String TypeProcessPart, 零件类别<br/>
		String AssemblyProcessPart, 零件所属部件<br/>
		String NoAssemblyProcessPart 零件所属部件编号<br/>
  	</td>
  	<td>
  		<B>切削液页面：</B><br/>
  		{<br/>
		"result": 成功1 失败0 ,<br/>
		"CategoryCuttingFluidMaterialList": [{<br/>
		   "id_CategoryCuttingFluid": 切削液类别ID<br/>
		   "name_CategoryCuttingFluid": 切削液类别名称<br/>
		}],<br/>
		"para": {<br/>
		   NameCuttingFluid, 切削液名称<br/>
		  	NumberCuttingFluid, 切削液编号<br/>
		  	CategoryCuttingFluid, 切削液种类<br/>
		  	CompanyCuttingFluid 供应商<br/>
		},<br/>
		"page": {<br/>
		   "pageCount": 总页数<br/>
		},<br/>
		"list": [{<br/>
		  	"id_CuttingFluidMaterial": 切削液ID<br/>
		  	"NameCuttingFluid": 切削液名称<br/>
		  	"NumberCuttingFluid": 切削液编号<br/>
		  	"CategoryCuttingFluid": 切削液种类<br/>
		  	"CompanyCuttingFluid": 供应商<br/>
		  	"FormulaCuttingFluid": 切削液配方<br/>
		   "CharacterCuttingFluid": 切削液性能特征<br/>
		   "TechnicalCuttingFluid": 切削液技术指标<br/>
		   "add_time": 添加时间<br/>
		   "user_id": 用户ID<br/>
  		}]<br/>
  		}<br/>
  		<br/>
  		<B>查询夹具管理页面：</B><br/>
  		{<br/>
			"result": 成功1 失败0<br/>
			"CategoryTypeFixturePart":[{<br/>
			"id_CategoryTypeFixturePart": "夹具管理类型ID"<br/>
			"name_CategoryTypeFixturePart":"夹具管理类型name"<br/>
		}],<br/>
		"para":{<br/>
			"NameFixturePart": 夹具名称<br/>
			"NumberFixturePart": 夹具编号<br/>
			"TypeFixturePart": 夹具类别<br/>
			"MachineFixturePart": 应用机床<br/>
			"ProcessPartFixturePart": 应用加工零件<br/>
		},<br/>
		"page":{<br/>
			"pageCount":总页数<br/>
		},<br/>
		"list":[{<br/>
			"id_FixturePart": 夹具管理ID<br/>
			"NumberFixturePart":"夹具编号",<br/>
			"NameFixturePart":"夹具名称",<br/>
			"TypeFixturePart": 夹具管理类型<br/>
			"MachineFixturePart":"应用机床",<br/>
			"ProcessPartFixturePart":"应用加工零件",<br/>
			"AppCo":"应用公司",<br/>
			"LocationFixturePart":"夹具存放地点",<br/>
			"RemarkFixturePart":"备注",<br/>
  		}]<br/>
  		}<br/>
  		<br/>
  		<B>查询零件管理页面：</B><br/>
  		{<br/>
  		"result":成功1 失败0<br/>
		"CategoryTypeProcessPart":[{<br/>
			"id_CategoryTypeProcessPart":加工零件类别ID<br/>
			"name_CategoryTypeProcessPart": 加工零件类别名字,<br/>
		}],<br/>
		"CategoryIndustryProcessPart":[{<br/>
			"id_CategoryIndustryProcessPart": 加工零件应用行业ID<br/>
			"name_CategoryIndustryProcessPart": 加工零件应用行业名字<br/>
		}],<br/>
		"page":{<br/>
			"pageCount":总页数<br/>
		},<br/>
		"para":{<br/>
			NameProcessPart, 零件名称<br/>
			NumberProcessPart, 零件编号<br/>
			TypeProcessPart, 零件类别<br/>
			AssemblyProcessPart, 零件所属部件<br/>
			NoAssemblyProcessPart 零件所属部件编号<br/>
		},<br/>
		"list":[{<br/>
			"id_ProcessPart": 加工零件ID<br/>
			"NameProcessPart":"零件名称",<br/>
			"NumberProcessPart":"零件编号"<br/>
			"TypeProcessPart":"零件类别",<br/>
			"AssemblyProcessPart":"零件所属部件",<br/>
			"NoAssemblyProcessPart":"零件所属部件编号",<br/>
			"CompanyProcessPart":"零件所属厂家",<br/>
			"IndustryProcessPart":"应用行业",<br/>
			"NumberMaterialProcessPart":"材料牌号",<br/>
			"CategoryMaterialProcessPart":"材料类别",<br/>
			"RemarkProcessPart":"备注",<br/>
  		}]<br/>
  		}<br/>
  		
  	</td>
  </tr>
  
  <tr>
  	<td>
  	149
  	</td>
  	<td>
  	/ProcessStepApp/ProcessStepList
  	</td>
  	<td>
  	查询工步列表
  	</td>
  	<td>
  	int pageNo, 第几页<br/>
  	int pageSize, 每页几条<br/>
  	String NoProcedureProcessFlow, 工序编号（由于该页面需要显示工序及工艺的信息，所以需要这个值去查询，每次分页等请求时，需要把这个值都带着。）<br/>
	String NoProcessStep,  工步编号<br/>
	String MachiningTypeProcessStep,  加工类别<br/>
	String MachiningLevelProcessStep,  加工级别<br/>
	String NameProcessStep,  工步名称<br/>
	String ContentProcessStep  工步内容<br/>
  	</td>
  	<td>
  	{
  		"result":成功1 失败0<br/>
  		"erro":返回信息<br/>
  		"ProcessStep":[{<br/>
  			"id_ProcessStep":工步ID<br/>
  			"id_WorkingProcedure":工序ID<br/>
  			"NoProcessStep":"工步编号",<br/>
  			"NameProcessStep":"工步名称",<br/>
  			"MachiningLevelProcessStep":加工级别<br/>
  			"MachiningTypeProcessStep":加工类别<br/>
  			"ContentProcessStep":"工步内容",<br/>
  			"MeasureProcessStep":"量具"<br/>
  			"ToolHolderProcessStep":"刀柄",<br/>
  			"ToolbladeProcessStep":"刀片",<br/>
  			"ToolMaterialProcessStep":"刀片材料",<br/>
  			"CutterProcessStep":"刀具",<br/>
	  		"CuttingWidthProcessStep":切削宽度<br/>
	  		"CutterSpeedProcessStep":切削速度<br/>
	  		"SpindlespeedProcessStep":主轴转速<br/>
	  		"CuttingDepthProcessStep":切削深度<br/>
	  		"FeedSpeedProcessStep":进给速度<br/>
	  		"FeedProcessStep":每齿进给量<br/>
	  		"TimeMachiningProcessStep":"机动",<br/>
	  		"TimeAssistProcessStep":"辅助",<br/>
	  		"RemarkProcessStep":"备注",<br/>
	  		"DeviceProcessStep":"设备",<br/>
	  		"FixtureProcessStep":"夹具",<br/>
	  		"CuttingFluidProcessStep":"切削液",<br/>
	  		"PictureProcessStep":[{<br/>
	  			"id_PictureProcessStep":工步图片ID<br/>
	  			"id_ProcessStep":工步ID<br/>
	  			"url_PictureProcessStep":工步图片url<br/>
  			}],<br/>
  		}],<br/>
  		"para":{<br/>
  			NoProcedureProcessFlow, 工序编号（由于该页面需要显示工序及工艺的信息，所以需要这个值去查询，每次分页等请求时，需要把这个值都带着。）<br/>
			NoProcessStep,  工步编号<br/>
			MachiningTypeProcessStep,  加工类别<br/>
			MachiningLevelProcessStep,  加工级别<br/>
			NameProcessStep,  工步名称<br/>
			ContentProcessStep  工步内容<br/>
  		},<br/>
  		
  		"WorkingProcedure":{<br/>
  			"id_WorkingProcedure":工序ID<br/>
  			"id_ProcessFlow":工艺流程ID<br/>
  			"NoProcedureProcessFlow":"工序编号",<br/>
  			"NameProcedureProcessFlow":"工序名称",<br/>
  			"ContentProcedureProcessFlow":"工序内容",<br/>
  			"RemarkProcessFlow":"工序备注",<br/>
  			"TimeProcessFlow":"工时",<br/>
  			"MachineProcessFlow":"加工夹具",<br/>
  			"CuttingFluidProcessFlow":"切削液",<br/>
  			"EquipmentType":"设备型号",<br/>
  			"MachineProcessCode":"加工程序"<br/>
  		},<br/>
  		"ProcessFlow":{<br/>
  			"id_ProcessFlow":工艺流程ID<br/>
  			"NoProcessFlow":"工艺流程编号",<br/>
  			"NameProcessFlow":"工艺流程名称",<br/>
  			"PartNumberProcessFlow":"零件编号",<br/>
  			"PartNameProcessFlow":"零件名称",<br/>
  			"PartTypeProcessFlow":"零件类别",<br/>
  			"PartNoAssemblyProcessFlow":"零件所属部件编号",<br/>
  			"PartCategoryMaterialProcessFlow":"零件材料类别",<br/>
  			"PartNoMaterialProcessFlow":"零件材料牌号",<br/>
  			"PartAssemblyProcessFlow":"零件所属部件"<br/>
  			"CompanyProcessFlow":"单位名称",<br/>
  		},<br/>
  		"page":{"<br/>
  			pageCount":总页数<br/>
  		}<br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  	150
  	</td>
  	<td>
  	/ProcessStepApp/goAddProcessStep
  	</td>
  	<td>
  	去添加工步页面
  	</td>
  	<td>
  	String id, 工步ID<br/>
  	String NoProcedureProcessFlow 工序编号<br/>
  	</td>
  	<td>
  	{
  		"result":成功1 失败0<br/>
  		"ProcessStep":[{<br/>
  			"id_ProcessStep":工步ID<br/>
  			"id_WorkingProcedure":工序ID<br/>
  			"NoProcessStep":"工步编号",<br/>
  			"NameProcessStep":"工步名称",<br/>
  			"MachiningLevelProcessStep":加工级别<br/>
  			"MachiningTypeProcessStep":加工类别<br/>
  			"ContentProcessStep":"工步内容",<br/>
  			"MeasureProcessStep":"量具"<br/>
  			"ToolHolderProcessStep":"刀柄",<br/>
  			"ToolbladeProcessStep":"刀片",<br/>
  			"ToolMaterialProcessStep":"刀片材料",<br/>
  			"CutterProcessStep":"刀具",<br/>
	  		"CuttingWidthProcessStep":切削宽度<br/>
	  		"CutterSpeedProcessStep":切削速度<br/>
	  		"SpindlespeedProcessStep":主轴转速<br/>
	  		"CuttingDepthProcessStep":切削深度<br/>
	  		"FeedSpeedProcessStep":进给速度<br/>
	  		"FeedProcessStep":每齿进给量<br/>
	  		"TimeMachiningProcessStep":"机动",<br/>
	  		"TimeAssistProcessStep":"辅助",<br/>
	  		"RemarkProcessStep":"备注",<br/>
	  		"DeviceProcessStep":"设备",<br/>
	  		"FixtureProcessStep":"夹具",<br/>
	  		"CuttingFluidProcessStep":"切削液",<br/>
	  		"PictureProcessStep":[{<br/>
	  			"id_PictureProcessStep":工步图片ID<br/>
	  			"id_ProcessStep":工步ID<br/>
	  			"url_PictureProcessStep":工步图片url<br/>
  			}],<br/>
  		}],<br/>
  		"WorkingProcedure":{<br/>
  			"id_WorkingProcedure":工序ID<br/>
  			"id_ProcessFlow":工艺流程ID<br/>
  			"NoProcedureProcessFlow":"工序编号",<br/>
  			"NameProcedureProcessFlow":"工序名称",<br/>
  			"ContentProcedureProcessFlow":"工序内容",<br/>
  			"RemarkProcessFlow":"工序备注",<br/>
  			"TimeProcessFlow":"工时",<br/>
  			"MachineProcessFlow":"加工夹具",<br/>
  			"CuttingFluidProcessFlow":"切削液",<br/>
  			"EquipmentType":"设备型号",<br/>
  			"MachineProcessCode":"加工程序"<br/>
  		},<br/>
  		"ProcessFlow":{<br/>
  			"id_ProcessFlow":工艺流程ID<br/>
  			"NoProcessFlow":"工艺流程编号",<br/>
  			"NameProcessFlow":"工艺流程名称",<br/>
  			"PartNumberProcessFlow":"零件编号",<br/>
  			"PartNameProcessFlow":"零件名称",<br/>
  			"PartTypeProcessFlow":"零件类别",<br/>
  			"PartNoAssemblyProcessFlow":"零件所属部件编号",<br/>
  			"PartCategoryMaterialProcessFlow":"零件材料类别",<br/>
  			"PartNoMaterialProcessFlow":"零件材料牌号",<br/>
  			"PartAssemblyProcessFlow":"零件所属部件"<br/>
  			"CompanyProcessFlow":"单位名称",<br/>
  		},<br/>
  		array_PictureProcessStep 所有工步图片url(以，分割)<br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
  		151
  	</td>
  	<td>
  	/ProcessStepApp/saveProcessStep
  	</td>
  	<td>
  	添加工步信息
  	</td>
  	<td>
  	String array_PictureProcessStep, 所有工步图片url(以，分割)<br/>
	int id_ProcessStep, 工步ID<br/>
	int id_WorkingProcedure,  工序ID<br/>
	String NoProcessStep,  工步编号<br/>
	String MachiningTypeProcessStep, 加工类别<br/>
	String MachiningLevelProcessStep, 加工级别<br/>
	String NameProcessStep, 工步名称<br/>
	String ContentProcessStep, 工步内容<br/>
	String MeasureProcessStep, 量具<br/>
	String ToolHolderProcessStep, 刀柄<br/>
	String ToolbladeProcessStep,  刀片<br/>
	String ToolMaterialProcessStep, 刀片材料<br/>
	String CutterProcessStep, 刀具<br/>
	String CutterSpeedProcessStep, 切削速度<br/>
	String SpindlespeedProcessStep, 主轴转速<br/>
	String FeedProcessStep,  每齿进给量<br/>
	String FeedSpeedProcessStep, 进给速度<br/>
	String CuttingDepthProcessStep, 切削深度<br/>
	String CuttingWidthProcessStep, 切削宽度<br/>
	String TimeMachiningProcessStep, 机动<br/>
	String TimeAssistProcessStep, 辅助<br/>
	String RemarkProcessStep, 备注<br/>
	String DeviceProcessStep, 设备<br/>
	String FixtureProcessStep, 夹具<br/>
	String CuttingFluidProcessStep  切削液<br/>
  	</td>
  	<td>
  	{<br/>
  		"result":成功1 失败0<br/>
  		"msg": 返回信息<br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
	152
  	</td>
  	<td>
  	/ProcessStepApp/savePictureProcessStep
  	</td>
  	<td>
  	保存工步图片
  	</td>
  	<td>
  	String PictureProcessStep ,  工序图片文件<br/>
  	String fileSuffix, 文件后缀<br/>
  	String filename  文件名带后缀<br/>
  	</td>
  	<td>
  	{<br/>
  		"result":成功1 失败0<br/>
  		"url":图片url<br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
	153
  	</td>
  	<td>
  	/ProcessStepApp/deleteProcessStepList
  	</td>
  	<td>
  	删除工步信息
  	</td>
  	<td>
  	String id_ProcessStep 工步ID
  	</td>
  	<td>
  	{<br/>
  		"result":成功1 失败0<br/>
  		"msg":返回信息 <br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
	154
  	</td>
  	<td>
  	/ManufacturePlanApp/ManufacturePlanList
  	</td>
  	<td>
  	生产计划页面
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
	155
  	</td>
  	<td>
  	/ManufacturePlanApp/goAddManufacturePlan
  	</td>
  	<td>
  	去添加生产计划页面
  	</td>
  	<td>
  	String id 生产ID
  	</td>
  	<td>
  	{<br/>
  		"ManufacturePlan":{<br/>
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
  		}<br/>
  	}<br/>
  	</td>
  </tr>
  
  <tr>
  	<td>
	156
  	</td>
  	<td>
  	/ManufacturePlanApp/saveManufacturePlan
  	</td>
  	<td>
  	添加生产计划页面
  	</td>
  	<td>
  	String "id_ManufacturePlan":生产ID<br/>
  	String "NoManufPlan":"生产编号",<br/>
  	String "QuantityManufPlan":"生产数量",<br/>
  	String "DateStartManufPlan":"生产日期",<br/>
  	String "DateFinishManufPlan":"完成日期",<br/>
  	String "RemarkManufPlan":"备注",<br/>
  	String "PartNoManufPlan":"零件编号",<br/>
  	String "NameManufPlan":"零件名称",<br/>
  	String "NumberMaterialManufPlan":"材料牌号",<br/>
  	String "CategoryMaterialManufPlan":"材料类别",<br/>
  	String "DeviceManufPlan":"设备编号",<br/>
  	String "IDDeviceManufPlan":"节点设备编号",<br/>
  	String "BranchManufPlan":"部门分厂",<br/>
  	String "StaffManufPlan":"生产人员",<br/>
  	String "NoProcessManufPlan":"工序编号",<br/>
  	String "NameProcessManufPlan":"工序名称",<br/>
  	String "NoProcessStepManufPlan":"工步编号",<br/>
  	String "NameProcessStepManufPlan":"工步名称",<br/>
  	String "MachiningTypeManufPlan":"加工类别"<br/>
  	String "MachiningLevelManufPlan":"加工级别",<br/>
  	String "CuttingFluidManufPlan":"切削液",<br/>
  	String "CutterSpeedManufPlan":"切削速度",<br/>
  	String "SpindleSpeedManufPlan":"主轴转速",<br/>
  	String "FeedManufPlan":"每齿进给量",<br/>
  	String "CuttingDepthManufPlan":"切削深度",<br/>
  	String "CuttingWidthManufPlan":"切削宽度",<br/>
  	String "FeedSpeedManufPlan":"进给速度",<br/>
  	String "ToolHolderManufPlan":"刀柄",<br/>
  	String "ToolbladeManufPlan":"刀片",<br/>
  	String "ToolMaterialManufPlan":"刀片/刀具材料",<br/>
  	String "CutterManufPlan":"刀具",<br/>
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
	157
  	</td>
  	<td>
  	/ManufacturePlanApp/deleteManufacturePlanList
  	</td>
  	<td>
  	删除生产计划
  	</td>
  	<td>
  	String id_ManufacturePlan 生产计划ID
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
	158
  	</td>
  	<td>
  	/ManufacturePlanApp/loading
  	</td>
  	<td>
  	用于加载各个页面，都是此接口，根据 “deputy” 参数的值判断加载的是哪个页面 ，查询条件根据对应参数字段输入
  	</td>
  	<td>
  	int deputy, 传值1：加工零件、传值2：工序页面、传值3：工步页面、传值4：部门分厂、传值5：人员<br/>
  	int pageNo,  第几页<br/>
  	int pageSize, 每页几条<br/>
  	String NameProcessPart,  零件名称<br/>
  	String NumberProcessPart,  零件编号<br/>
	String TypeProcessPart, 零件类别<br/>
	String AssemblyProcessPart,  零件所属部件<br/>
	String NoAssemblyProcessPart, 零件所属部件编号<br/>
	String NoProcedureProcessFlow, 工序编号<br/>
	String NameProcedureProcessFlow, 工序名称<br/>
	String ContentProcedureProcessFlow,  工序内容<br/>
	String EquipmentType, 设备型号<br/>
	String NoProcessStep, 工步编号<br/>
	String MachiningTypeProcessStep, 加工类别<br/>
	String MachiningLevelProcessStep, 加工级别<br/>
	String NameProcessStep, 工步名称<br/>
	String ContentProcessStep 工步内容<br/>
	String "SuperiorDepartmentManuf":"上级部门"<br/>
	String "NameDepartmentManuf":"部门名称",<br/>
	String "NoDepartmentManuf":"部门编号",<br/>
	String "AddressDepartmentManuf":"地址",<br/>
	String NameStaffManuf, 员工姓名<br/>
	String DepartStaffManuf, 员工部门<br/>
	String NoStaffManuf, 员工编号<br/>
	String JobStaffManuf 职务<br/>
  	</td>
  	<td>
  	<b>加工零件页面</b><br/>
  	{<br/>
  		"result":"1",<br/>
  		"CategoryTypeProcessPart":[{<br/>
  			"name_CategoryTypeProcessPart":"加工零件类别name",<br/>
  			"id_CategoryTypeProcessPart":加工零件类别ID<br/>
  		}],<br/>
  		"CategoryIndustryProcessPart":[{<br/>
  			"name_CategoryIndustryProcessPart":"加工零件应用行业name",<br/>
  			"id_CategoryIndustryProcessPart":加工零件应用行业Id<br/>
  		}],<br/>
  		"para":{<br/>
  			NameProcessPart,  零件名称<br/>
		  	NumberProcessPart,  零件编号<br/>
			TypeProcessPart, 零件类别<br/>
			AssemblyProcessPart,  零件所属部件<br/>
			NoAssemblyProcessPart, 零件所属部件编号<br/>
  		},<br/>
  		"page":{<br/>
  			"pageCount":总页数<br/>
  		},<br/>
  		"list":[{<br/>
  			"IndustryProcessPart": 应用行业<br/>
  			"id_ProcessPart":零件ID<br/>
  			"NameProcessPart":"零件名称",<br/>
  			"NumberProcessPart":"零件编号"<br/>
  			"TypeProcessPart":零件类别<br/>
  			"NoAssemblyProcessPart":"零件部件编号",<br/>
  			"AssemblyProcessPart":"零件部件",<br/>
  			"CompanyProcessPart":零件所属厂家<br/>
  			"NumberMaterialProcessPart":"材料牌号",<br/>
  			"CategoryMaterialProcessPart":"材料类别",<br/>
  			"RemarkProcessPart":备注<br/>
  		}]<br/>
  	}<br/>
  	<b>工序页面</b><br/>
  	{<br/>
  		"result":"1",<br/>
  		"para":{<br/>
  			NoProcedureProcessFlow, 工序编号<br/>
			NameProcedureProcessFlow, 工序名称<br/>
			ContentProcedureProcessFlow,  工序内容<br/>
			EquipmentType, 设备型号<br/>
  		},<br/>
  		"page":{<br/>
  			"pageCount":1<br/>
  		},<br/>
  		"list":[{<br/>
  			"id_WorkingProcedure":工序ID<br/>
  			"NoProcedureProcessFlow":"工序编号",<br/>
  			"NameProcedureProcessFlow":"工序名称",<br/>
  			"ContentProcedureProcessFlow":"工序内容",<br/>
  			"RemarkProcessFlow":"工序备注",<br/>
  			"TimeProcessFlow":"工时",<br/>
  			"MachineProcessFlow":"加工夹具",<br/>
  			"CuttingFluidProcessFlow":"切削液",<br/>
  			"EquipmentType":"设备型号",<br/>
  			"MachineProcessCode":"加工程序"<br/>
  		}]<br/>
  	}<br/>
  	<b>工步页面</b><br/>
  	{<br/>
  		"result":"1",<br/>
  		"para":{<br/>
  			NoProcessStep, 工步编号<br/>
			MachiningTypeProcessStep, 加工类别<br/>
			MachiningLevelProcessStep, 加工级别<br/>
			NameProcessStep, 工步名称<br/>
			ContentProcessStep 工步内容<br/>
  		},<br/>
  		"page":{<br/>
  			"pageCount":总页数<br/>
  		},<br/>
  		"list":[{<br/>
  			"id_ProcessStep":工步ID<br/>
  			"NoProcessStep":"工步编号",<br/>
  			"ContentProcessStep":"工步内容",<br/>
  			"RemarkProcessStep":"备注",<br/>
  			"CuttingWidthProcessStep":"切削宽度",<br/>
  			"TimeMachiningProcessStep":"机动",<br/>
  			"DeviceProcessStep":"设备",<br/>
  			"FeedProcessStep":"每齿进给量",<br/>
  			"CuttingDepthProcessStep":"切削深度",<br/>
  			"ToolbladeProcessStep":"刀片",<br/>
  			"NameProcessStep":"工步名称",<br/>
  			"CutterProcessStep":"刀具",<br/>
  			"FeedSpeedProcessStep":"进给速度",<br/>
  			"FixtureProcessStep":"夹具",<br/>
  			"MachiningTypeProcessStep":"加工类别",<br/>
  			"MachiningLevelProcessStep":"加工级别",<br/>
  			"CutterSpeedProcessStep":"切削速度",<br/>
  			"CuttingFluidProcessStep":"切削液",<br/>
  			"TimeAssistProcessStep":"辅助",<br/>
  			"ToolMaterialProcessStep":"刀片材料",<br/>
  			"ToolHolderProcessStep":"刀柄",<br/>
  			"SpindlespeedProcessStep":"主轴转速",<br/>
  			"MeasureProcessStep":"量具"<br/>
  		}]<br/>
  	}<br/>
  	<b>部门分厂</b><br/>
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
  	<b>人员</b><br/>
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
</table>
</body>
</html>

<jsp:include  page="table1.jsp"/>



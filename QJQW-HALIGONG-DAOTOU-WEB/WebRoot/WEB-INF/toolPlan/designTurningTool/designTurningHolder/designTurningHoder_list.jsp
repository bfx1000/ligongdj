<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.2.js"></script>
<script type="text/javascript" src="/resources/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
<script type="text/javascript" src="/resources/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
<script src="<%=path%>/resources/js/common/detail.js"  type="text/javascript"></script>

<link href="<%=path%>/resources/css/index/style_a.css" rel="stylesheet" type="text/css" />



</head>
<body>
	<div class="content_box_table">
		<form action="designTurningBlade/queryDesignTurningBladeList" method="post" name="Form" id="Form">
			<div class="search_wrap">
				<div class="search_input_wrap">
					<span>训练数据输入&nbsp;<input name="DesignNumberTurningBlade" tpye="text" value="${pd.DesignNumberTurningBlade }" placeholder="加载excel" /></span> 
					<span>预测数据输入&nbsp;<input name="DesignNumberTurningBlade" tpye="text" value="${pd.DesignNumberTurningBlade }" placeholder="加载excel" /></span> 
					<span>输入层神经元数<input name="DesignISOBladeTurning" tpye="text" value="${pd.DesignISOBladeTurning }" /></span> 
					<span>输出层神经元数<input name="DesignISOBladeTurning" tpye="text" value="${pd.DesignISOBladeTurning }" /></span> 
					<span>隐含层神经数&nbsp;<input name="DesignToolBladeFeatureTurning" tpye="text" value="${pd.DesignToolBladeFeatureTurning }" /></span> 
					<span>输入层-隐含层传递函数<input name="DesignCompanyTurningBlade" tpye="text" value="${pd.DesignCompanyTurningBlade }" /></span>
					<span>输出层-隐含层传递函数<input name="DesignCompanyTurningBlade" tpye="text" value="${pd.DesignCompanyTurningBlade }" /></span>
					<div class="clear"></div>
				</div>
				
				<div class="opera_img">
					<img src="/resources/images/ico_n.png" data-name="0" onclick="changeOpera(this);" alt="展开" />
				</div>

				<a class="sousuo_btn_min" onclick="onSearchKey();">运行神经网络</a>
				<div class="clear"></div>
			</div>
			<input type="hidden" id="id" name="id" value="${TurningHolderId }" />
		</form>
	
           <table border="1" class="box_table li_table" id="yblTable">
               <tbody>
                   <tr>
                   	  
                   </tr>
               </tbody>
           </table>
           
          <input type="button" value="生成曲线" class="btn_add" onclick="onChangeQX();"> 
          <span class="graph_type">曲线维数: 
              <select name="graph_type" id="graph_type" onchange="graphType();">
                      <option value="0">二维曲线图</option>
                      <option value="1">三维曲线图</option>
              </select>
          </span> 
          
          <span class="x_val">x: 
              <select name="" id="x_val">
                      <option value="1">f(x1)</option>
                      <option value="2">应变</option>
                      <option value="3">应变率</option>
              </select>
          </span> 
         
          <span class="y_val">y: 
              <select name="" id="y_val">
                      <option value="1">f(x2)</option>
                      <option value="2">应变</option>
                      <option value="3">应变率</option>
              </select></span> 

          <div id="container" class="iframe_new" data-highcharts-chart="0">
        
          <img src="/resources/images/img_1.png" class="list_youhuayuce" alt="youhua" title="youhua">
          <br>
          <img src="/resources/images/img_2.png" class="list_youhuayuce" alt="youhua" title="youhua">
          <iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></div></div>
          
          <div class="clear"></div>
        
		
						
</body>
</html>


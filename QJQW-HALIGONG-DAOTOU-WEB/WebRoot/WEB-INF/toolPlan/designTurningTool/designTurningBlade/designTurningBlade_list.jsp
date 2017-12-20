<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>



	<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.2.js"></script>
	<script type="text/javascript" src="/resources/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript" src="/resources/js/bootstrap-datepicker.min.js"></script>
	<!-- 日期框 -->
	<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js" type="text/javascript"></script>
	<script src="<%=path%>/resources/js/common/detail.js" type="text/javascript"></script>
	<link href="<%=path%>/resources/css/index/style_a.css" rel="stylesheet" type="text/css" />
	

<script type="text/javascript">
	
	//检索
	function onSearchKey(){
		var id = $("#id").val();
		if(id == null || id == ""){
			var url = "<%=path%>/designTurningBlade/queryDesignTurningBladeList";
		}else{
			var url = "<%=path%>/designTurningHolder/toTurningBlade";
		}
		document.Form.action = url;
		$("#Form").submit();
	}
	
	$(function() {
		//下拉框
		$(".chzn-select").chosen(); 
		$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
	});

	//新增
	function add(){
		window.location.href='<%=path%>/designTurningBlade/goAddDesignTurningBlade?id=';
	}
	
	//修改
	function edit(id){
		window.location.href='<%=path%>/designTurningBlade/goAddDesignTurningBlade?id=' + id;
	}

	//删除
	function del(id_DesignTurningBlade){
		if(confirm("确定要删除吗?")){
			var url = "<%=path%>/designTurningBlade/deleteDesignTurningBlade?id_DesignTurningBlade=" + id_DesignTurningBlade;
			document.Form.action = url;
			$("#Form").ajaxSubmit(function(result){
				if(result) {
					jump(${page.pageNo});
				}else{
					alert('操作失败，请联系管理员！');
				}
			});
		}
	}
	
	//预览pdf文件
	function onShowPdf(url){
		window.open("<%=basePath%>goods" + url);
	}
</script>

</head>




<body>
	<div class="content_box_table">
		<form action="designTurningBlade/queryDesignTurningBladeList" method="post" name="Form" id="Form">
			<div class="search_wrap">
				<div class="search_input_wrap">
					<span>目标函数&nbsp;&nbsp;<input name="DesignNumberTurningBlade" tpye="text" value="${pd.DesignNumberTurningBlade }" placeholder="加载txt文件" /></span> 
					<span>约束条件<input name="DesignNumberTurningBlade" tpye="text" value="${pd.DesignNumberTurningBlade }" placeholder="加载txt文件" /></span> 
					<span>目标种群大小<input name="DesignISOBladeTurning" tpye="text" value="${pd.DesignISOBladeTurning }" /></span> 
					<span>迭代总数<input name="DesignISOBladeTurning" tpye="text" value="${pd.DesignISOBladeTurning }" />
						

					</span> 
					<span>目标函数数量<input name="DesignToolBladeFeatureTurning" tpye="text" value="${pd.DesignToolBladeFeatureTurning }" /></span> 
					<span>决策变量数量<input name="DesignCompanyTurningBlade" tpye="text" value="${pd.DesignCompanyTurningBlade }" /></span>
					<div class="clear"></div>
				</div>
				
				<div class="opera_img">
					<img src="/resources/images/ico_n.png" data-name="0" onclick="changeOpera(this);" alt="展开" />
				</div>

				<a class="sousuo_btn_min" onclick="onSearchKey();">运行遗传算法</a>
				<div class="clear"></div>
			</div>
			<input type="hidden" id="id" name="id" value="${TurningHolderId }" />
		</form>
	
           <table border="1" class="box_table li_table" id="yblTable">
               <tbody>
                   <tr>
                       <th class="th"></th>
                       <th class="th"></th>
                       <td class="th">NSGA-II</td>
                       <td class="th"></td>
                       <td class="th"></td>
                   </tr>
               </tbody>
           </table>
          </li>
          <input type="button" value="生成曲线" class="btn_add" onclick="onChangeQX();"> 
          <span class="graph_type">曲线维数: 
              <select name="graph_type" id="graph_type" onchange="graphType();">
                      <option value="0">三维曲线图</option>
                      <option value="1">二维曲线图</option>
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

          <span class="z_val" style="display: inline;">z: 
              <select name="" id="z_val">
                      <option value="1">f(x3)</option>
                      <option value="2">应变</option>
                      <option value="3">应变率</option>
              </select>
          </span>
          </li>
          <div id="container" class="iframe_boxqx" data-highcharts-chart="0">
         
          <img src="/resources/images/img_youhua2.png" class="list_youhuayuce" alt="youhua" title="youhua">
          
          <iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe></div></div>
          <div class="clear"></div>
        <iframe id="tmp_downloadhelper_iframe" style="display: none;"></iframe>

		
		<!-- 展开详情   -->
		<div id="ulli_${var.id_DesignTurningBlade}" class="ulli" style="display: none;">
			<div class="box_xiangxi">
				<div class="box_u1">
					<ul class="ul1">
						<li><span>刀片设计编号</span><i>${var.DesignNumberTurningBlade }</i></li>
						<li><span>刀片名称</span><i>${var.DesignNameTurningBlade }</i></li>
						<li>
							<span>刀片类型</span> 
							<i> <c:choose>
									<c:when test="${var.DesignTypeBTADrill == 1}">外圆切削</c:when>
									<c:when test="${var.DesignTypeBTADrill == 2}">内孔切削</c:when>
									<c:when test="${var.DesignTypeBTADrill == 3}">超硬刀具</c:when>
									<c:when test="${var.DesignTypeBTADrill == 4}">重型加工刀片</c:when>
								</c:choose>
							</i>
						</li>
						<li>
							<span>ISO基准刀片</span>
							<div>${var.DesignISOBladeTurning }</div>
						</li>
					</ul>
					<ul class="ul1">
						<li><span>加工类别</span> <i> <c:choose>
									<c:when test="${var.DesignMachiningTypeBladeTurning == 1}">精加工</c:when>
									<c:when test="${var.DesignMachiningTypeBladeTurning == 2}">粗加工</c:when>
									<c:when test="${var.DesignMachiningTypeBladeTurning == 3}">半精加工</c:when>
								</c:choose>
						</i></li>
						<li><span>刀片设计厂商</span><i>${var.DesignCompanyTurningBlade } </i></li>
						<li><span>刀片加工特点</span><i>${var.DesignToolBladeFeatureTurning } </i></li>
						<li><span>断屑槽类型</span><i>${var.DesignBreakerBladeTurning } </i></li>
						<li><span>刀柄</span><i>${var.DesignHolderInfo } </i></li>
						<li></li>
					</ul>
					<div class="clear"></div>
					<div class="block">刀片角度信息：</div>
					<ul class="ul1">
						<li><span>后角</span><i>${var.DesignHoujiaoBladeTurning } </i></li>
						<li><span>刀尖圆弧半径</span><i>${var.DesignNoseRadiusTurning } </i></li>
					</ul>
					<ul class="ul1">
						<li><span>前角</span><i>${var.DesignQianjiaoBladeTurning } </i></li>
						<li><span>刃倾角</span><i>${var.DesignRenqingjiaoBladeTurning } </i></li>
					</ul>
					<div class="clear"></div>
				</div>
			</div>

			<div class="box_p">
				<h4>刀具图片</h4>
				<p>
					<c:forEach items="${var.pictureDesignTurningBladeList}" var="var1" varStatus="vs">
						<img name='pictureTurningHolders_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_PictureDesignTurningBlade }' />
						<a class="btn" onclick="onShowPdf('${var1.url_PictureDesignTurningBlade }');">预览</a>
						<br />
					</c:forEach>
				</p>
			</div>
			<div class="box_p">
				<h4>详细信息</h4>
				<p>
					<c:forEach items="${var.informDetailDesignTurningBladeList}" var="var1" varStatus="vs">
						<span name='informDetailTurningHolders_img'>${var1.name_InformDetailDesignTurningBlade }</span>
						<a class="btn" onclick="onShowPdf('${var1.url_InformDetailDesignTurningBlade }');">预览</a>
						<br />
					</c:forEach>
				</p>
			</div>
			<div class="box_p">
				<h4>part文件</h4>
				<p>
					<c:forEach items="${var.partDesignTurningBladeList}" var="var1" varStatus="vs">
						<span name='informDetailTurningHolders_img'>${var1.name_PartDesignTurningBlade }</span>
						<a class="btn" onclick="onShowPdf('${var1.url_PartDesignTurningBlade }');">预览</a>
						<br />
					</c:forEach>
				</p>
			</div>
		</div>
</body>
</html>


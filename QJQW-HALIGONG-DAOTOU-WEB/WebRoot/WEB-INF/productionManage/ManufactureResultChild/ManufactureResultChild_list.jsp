<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	Long date = System.currentTimeMillis();
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.2.js"></script>
	<script type="text/javascript" src="/resources/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
	<script type="text/javascript" src="/resources/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
	<script src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"  type="text/javascript"></script>
	<script src="<%=path%>/resources/js/common/detail.js"  type="text/javascript"></script>
	<script src="<%=path%>/resources/js/laydate/laydate.js"></script>
	<link href="<%=path%>/resources/css/index/style_a.css?v=<%=date%>" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		//检索
		function onSearchKey(){
			var url = "<%=path%>/ManufactureResultChild/ManufactureResultChildList";
			document.Form.action = url;
			$("#Form").submit();
		}
		
		function onClose(){
			Dialog.getInstance('0').cancelButton.onclick.apply(Dialog.getInstance('0').cancelButton,[]);
		}
		$(function() {
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
			});
		});
	</script>
			
	<script type="text/javascript">
		//新增
		function add(){
			window.location.href='<%=path%>/ManufactureResultChild/goAddManufactureResultChild?id=';
		}
		//修改
		function edit(id){
			window.location.href='<%=path%>/ManufactureResultChild/goAddManufactureResultChild?id=' + id;
		}
		//展开折叠详细
		function onShowDetial(id_BTADrill){
			$("#ulli_" + id_BTADrill).toggle();
		}
		//删除
		function del(id_ManufactureResultChild){
			if(confirm("确定要删除吗?")){
				var url = "<%=path%>/ManufactureResultChild/deleteManufactureResultChildList?id_ManufactureResultChild=" + id_ManufactureResultChild;
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
		
		function Customization(){
			window.location.href='<%=path%>/ManufactureResultChild/Customization';
		}
	</script>
</head>
<body>
<div class="content_box_table">
	<form action="ManufactureResultChild/ManufactureResultChildList" method="post" name="Form" id="Form">
	  <div class="search_wrap">
  
	  	<div class="search_input_wrap">
		  	<span>生产编号<input name="NoManufRS" tpye="text" value="${pd.NoManufRS }" /></span>
		  	<span>零件编号<input name="PartNoManufRS" tpye="text" value="${pd.PartNoManufRS }" /></span>
		  	<span>零件名称<input name="NameManufRS" tpye="text" value="${pd.NameManufRS }" /></span>
		  	<span>材料牌号<input name="NumberMaterialManufRS" tpye="text" value="${pd.NumberMaterialManufRS }" /></span>
		  	<span>材料类别<input name="CategoryMaterialManufRS" tpye="text" value="${pd.CategoryMaterialManufRS }" /></span>
		  	<span>工序编号<input name="NoProcessManufRS" tpye="text" value="${pd.NoProcessManufRS }" /></span>
		  	<span>工步编号<input name="NoProcessStepManufRS" tpye="text" value="${pd.NoProcessStepManufRS }" /></span>
		  	<div class="clear"></div>
		 </div>
		  
		 <div class="opera_img">
		  	<img src="/resources/images/ico_n.png" data-name="0"  onclick="changeOpera(this);"  alt="展开" />
		 </div>		  
		 <a class="sousuo_btn_min" onclick="onSearchKey();">搜索</a>			  
		 <div class="clear"></div>
	  </div>
	   
	</form>


	<!-- 复选框   -->
	<div class="search_wrap">
	
		<div class="check_wrap">			
			<span class="label_wrap"><input type="checkbox" checked="checked" />生产编号</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />零件编号</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />零件名称</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />材料牌号</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />材料类别</span>
			<span class="label_wrap"><input type="checkbox" />工序编号</span>
			<span class="label_wrap"><input type="checkbox" />工步编号</span>
		</div>
		
		<div class="opera_img">
		  	<img src="/resources/images/ico_n.png" data-name="0"  onclick="changeOpera(this);"  alt="展开" />
		</div>
		<div class="choose_show_btn"   onclick="selectData();" >应用</div>	
		<div class="clear"></div>
	</div>
	
	<!-- 新增按钮   -->
	<div class="addbtn_wrap">
		 <a class="btn" onclick="add();">新增</a>
		 <a class="btn" onclick="Customization();">定制新增</a>
	</div>
	
	
	<div class="content_wrap">
		<div class="each_list_wrap"  style="background: white;">
			<span class="list_title skz_hide  skz_list0">&nbsp;生产编号</span>
			<span class="list_title skz_hide skz_list1" >&nbsp;零件编号</span>
			<span class="list_title skz_hide skz_list2" >&nbsp;零件名称</span>
			<span class="list_title skz_hide skz_list3" >&nbsp;材料牌号</span>
			<span class="list_title skz_hide skz_list4" >&nbsp;材料类别</span>
			<span class="list_title skz_hide skz_list5"  style="display: none;" >&nbsp;工序编号</span>
			<span class="list_title skz_hide skz_list6"  style="display: none;" >&nbsp;工步编号</span>
			<span class="list_title opera_wrap  skz_hide  skz_list7">&nbsp;&nbsp;&nbsp;操作</span>
		</div>
		<c:choose>
    		<c:when test="${not empty ManufactureResultChild}">
	  			<c:forEach items="${ManufactureResultChild}" var="var" varStatus="vs">	
					<div class="each_list_wrap"  >
						<div class="onclick" onclick="onShowDetial(${var.id_ManufactureResultChild });"></div>
						<span class="skz_hide skz_list0" >&nbsp;${var.NoManufRS }</span>
						<span class="skz_hide skz_list1" >&nbsp;${var.PartNoManufRS }</span>
						<span class="skz_hide skz_list2" >&nbsp;${var.NameManufRS }</span>
						<span class="skz_hide skz_list3" >&nbsp;${var.NumberMaterialManufRS}</span>
						<span class="skz_hide skz_list4" >&nbsp;${var.CategoryMaterialManufRS}</span>
						<span class="skz_hide skz_list5"  style="display: none;" >&nbsp;${var.NoProcessManufRS}</span>
						<span class="skz_hide skz_list6"  style="display: none;" >&nbsp;${var.NoProcessStepManufRS}</span>
						<span class="opera_wrap  skz_hide  skz_list7">
							<span class="btn btn_xg" onclick="edit('${var.id_ManufactureResultChild}');">修改</span>
						    <span class="btn btn_sc" onclick="del('${var.id_ManufactureResultChild}');">删除</span>
						</span>
						<div class="clear"></div>	
						
						<!-- 展开详情   -->
						<div id="ulli_${var.id_ManufactureResultChild}"  data-name="0"  class="ulli" style="display: none;">
							<div class="box_xiangxi_copy">
								<div class="box_u1">
								<br/>
								<span style="color:#217fe1;"><h3>生产计划：</h3></span>
								<br/>
									<ul class="ul1_copy">
								  		<li><span>生产编号:</span><i>${var.NoManufRS } &nbsp;</i></li>
								  		<li><span>完成日期:</span><div>${var.DateFinishManufRS} &nbsp;</div></li>
									</ul>
									<ul class="ul1_copy">
								  		<li><span>生产序号ID:</span><i>${var.QuantityManufRS } &nbsp;</i></li>
								  		<li><span>备注:</span><div>${var.RemarkManufRS} &nbsp;</div></li>
									</ul>
									<ul class="ul1_copy">
								  		<li><span>生产日期:</span><i>${var.DateStartManufRS } &nbsp;</i></li>
								  		<li><span> </span><i>&nbsp; </i></li>
									</ul>
								<br/>&nbsp; 
								<span style="color:#217fe1;"><h3>零件信息及设备：</h3></span>
								<br/>
									<ul class="ul1_copy">
								  		<li><span>零件名称:</span><i>${var.NameManufRS } &nbsp;</i></li>
								  		<li><span>设备编号:</span><i>${var.DeviceManufRS }&nbsp; </i></li>
									</ul>
									<ul class="ul1_copy">
								  		<li><span>材料牌号:</span><i>${var.NumberMaterialManufRS } &nbsp;</i></li>
								  		<li><span>节点设备编号:</span><i>${var.IDDeviceManufRS }&nbsp;</i></li>
									</ul>
									<ul class="ul1_copy">
								  		<li><span>零件编号:</span><div>${var.PartNoManufRS}&nbsp; </div></li>
								  		<li><span>材料类别:</span><i>${var.CategoryMaterialManufRS }&nbsp; </i></li>
									</ul>
									<div class="clear"></div>
							  	</div>
							</div>
							<div class="clear"></div>
						<div class="box_xiangxi zhedie">	
							<div class="box_zhedie">
									<span class="a_zhedie1" id = "zd${var.id_ManufactureResultChild }_1" onclick = "zd(${var.id_ManufactureResultChild },1);" style="display:block;">工艺信息</span>
									<span class="a_zhedie2" id = "zd1${var.id_ManufactureResultChild }_1" onclick = "zd1(${var.id_ManufactureResultChild },1);" style="display:none;">工艺信息</span>
								</div>
								 <div class="box_u1" id="box_clcs${var.id_ManufactureResultChild }_1" style="display:none"> 
								 	<div class="box_xiangxi_copy">
										<div class="box_u1">
										  	<ul class="ul1_copy">	
										  		<li><span>工步编号:</span><div>${var.NoProcessStepManufRS} &nbsp;</div></li>
										  		<li><span>加工级别:</span><i>${var.MachiningLevelManufRS } &nbsp;</i></li>
										  		<li><span>主轴转速:</span><i>${var.SpindleSpeedManufRS } &nbsp;</i></li>
										  		<li><span>切削宽度:</span><i>${var.CuttingWidthManufRS } &nbsp;</i></li>
										  		<li><span>刀片:</span><i>${var.ToolbladeManufRS }&nbsp; </i></li>
										  		<li><span>刀片/刀具材料:</span><i>${var.ToolMaterialManufRS } &nbsp;</i></li>
										  	</ul>	
										  	<ul class="ul1_copy">	
										  		<li><span>工序编号:</span><i>${var.NoProcessManufRS } &nbsp;</i></li>
										  		<li><span>工步名称:</span><div>${var.NameProcessStepManufRS} &nbsp;</div></li>
										  		<li><span>切削液:</span><i>${var.CuttingFluidManufRS } &nbsp;</i></li>
										  		<li><span>每齿进给量:</span><i>${var.FeedManufRS } &nbsp;</i></li>
										  		<li><span>进给速度:</span><i>${var.FeedSpeedManufRS } &nbsp;</i></li>
										  		<li><span>刀具:</span><i>${var.CutterManufRS } &nbsp;</i></li>
										  	</ul>	
										  	<ul class="ul1_copy">	
										  		<li><span>工序名称:</span><i>${var.NameProcessManufRS }&nbsp; </i></li>
										  		<li><span>加工类别:</span><div>${var.MachiningTypeManufRS}&nbsp; </div></li>
										  		<li><span>切削速度:</span><i>${var.CutterSpeedManufRS } &nbsp;</i></li>
										  		<li><span>切削深度:</span><i>${var.CuttingDepthManufRS }&nbsp; </i></li>
										  		<li><span>刀柄:</span><i>${var.ToolHolderManufRS } &nbsp;</i></li>
										  	</ul>
										  </div>
									 </div>
								  </div>
								 
							</div>
							 <div class="clear"></div>
							<br/>
							
							<div class="box_xiangxi zhedie">	
							<div class="box_zhedie">
									<span class="a_zhedie1" id = "zd${var.id_ManufactureResultChild }_2" onclick = "zd(${var.id_ManufactureResultChild },2);" style="display:block;">结果信息</span>
									<span class="a_zhedie2" id = "zd1${var.id_ManufactureResultChild }_2" onclick = "zd1(${var.id_ManufactureResultChild },2);" style="display:none;">结果信息</span>
								</div>
								 <div class="box_u1" id="box_clcs${var.id_ManufactureResultChild }_2" style="display:none"> 
								 	<div class="box_xiangxi_copy">
										<div class="box_u1">
										  	<ul class="ul1_copy">	
										  		<li><span>刀具寿命:</span><div>${var.ToollifeManufRS} &nbsp;</div></li>
										  		<li><span>加工尺寸:</span><i>${var.MachiningSize } &nbsp;</i></li>
										  	</ul>	
										  	<ul class="ul1_copy">	
										  		<li><span>刀具磨损量:</span><i>${var.ToolWearManufRS } &nbsp;</i></li>
										  		<li><span>尺寸精度:</span><i>${var.SizePrecision } &nbsp;</i></li>
										  	</ul>	
										  	<ul class="ul1_copy">	
										  		<li><span>材料去除率:</span><i>${var.RemovalRateManufRS }&nbsp;</i></li>
										  		<li><span>加工时间:</span><i>${var.MachiningTime } &nbsp;</i></li>
										  	</ul>
										  </div>
										  
									 </div>
									 <div class="box_xiangxi">
										<div class="box_u1">
											<div class="box_u1">
										  	<ul class="ul1">	
												<li><span>表面粗糙度:</span><div>${var.SurfaceRoughnessManufRS} &nbsp;</div></li>
											</ul>
											<ul class="ul1">
												<li>
												<div class="box_p">
												  	<h4>表面粗糙度文件</h4>
												  	<p>
												    	<c:forEach items="${var.SurfaceRoughnessFileManufRS}" var="var1" varStatus="vs">
												      		${var1.name_FileManufactureResultChild }
												      		<a class="btn" onclick="onShowPdf('${var1.url_FileManufactureResultChild }');">预览</a>
												      		<br/>
												    	</c:forEach>
												  	</p>
												</div>
											</li>
											</ul>
										</div>
										
										<div class="box_u1">
										  	<ul class="ul1">	
												<li><span>表面硬度:</span><div>${var.SurfaceHardnessManufRS} &nbsp;</div></li>
											</ul>
											<ul class="ul1">
												<li>
												<div class="box_p">
												  	<h4>表面硬度文件</h4>
												  	<p>
												    	<c:forEach items="${var.SurfaceHardnessFileManufRS}" var="var1" varStatus="vs">
												      		${var1.name_FileManufactureResultChild }
												      		<a class="btn" onclick="onShowPdf('${var1.url_FileManufactureResultChild }');">预览</a>
												      		<br/>
												    	</c:forEach>
												  	</p>
												</div>
											</li>
											</ul>
										</div>
										
										<div class="box_u1">
										  	<ul class="ul1">	
												<li><span>表面残余应力:</span><div>${var.SurfaceStressManufRS}&nbsp; </div></li>
											</ul>
											<ul class="ul1">
												<li>
												<div class="box_p">
												  	<h4>表面参与应力文件</h4>
												  	<p>
												    	<c:forEach items="${var.SurfaceStressFileManufRS}" var="var1" varStatus="vs">
												      		${var1.name_FileManufactureResultChild }
												      		<a class="btn" onclick="onShowPdf('${var1.url_FileManufactureResultChild }');">预览</a>
												      		<br/>
												    	</c:forEach>
												  	</p>
												</div>
											</li>
											</ul>
										</div>
										
										<div class="box_u1">
										  	<ul class="ul1">	
												<li><span>加工表面形态:</span><div>${var.SurfaceMorphologyManufRS} &nbsp;</div></li>
											</ul>
											<ul class="ul1">
												<li>
												<div class="box_p">
												  	<h4>表面文件</h4>
												  	<p>
												    	<c:forEach items="${var.SurfaceMorphologyFileManufRS}" var="var1" varStatus="vs">
												      		${var1.name_FileManufactureResultChild }
												      		<a class="btn" onclick="onShowPdf('${var1.url_FileManufactureResultChild }');">预览</a>
												      		<br/>
												    	</c:forEach>
												  	</p>
												</div>
											</li>
											</ul>
										</div>
										
										<div class="box_u1">
										  	<ul class="ul1">	
												<li><span>切屑形态:</span><div>${var.ChipShapeManufRS} &nbsp;</div></li>
											</ul>
											<ul class="ul1">
												<li>
												<div class="box_p">
												  	<h4>切屑形态文件</h4>
												  	<p>
												    	<c:forEach items="${var.ChipShapeFileManufRS}" var="var1" varStatus="vs">
												      		${var1.name_FileManufactureResultChild }
												      		<a class="btn" onclick="onShowPdf('${var1.url_FileManufactureResultChild }');">预览</a>
												      		<br/>
												    	</c:forEach>
												  	</p>
												</div>
											</li>
											</ul>
										</div>
									  	<div class="box_p">
											<h4>加工结果图片</h4>
										  	<p>
										    	<c:forEach items="${var.PictureManufRS}" var="var1" varStatus="vs">
										      		<img name='pictureBTADrills_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_FileManufactureResult }' />
										      		<a class="btn" onclick="onShowPdf('${var1.url_FileManufactureResultChild }');">预览</a>
										      		<br/>
										    	</c:forEach>
										  	</p>
										</div>
										<div class="box_p">
											<h4>刀具磨损图片</h4>
										  	<p>
										    	<c:forEach items="${var.PictureToolWearManufRS}" var="var1" varStatus="vs">
										      		<img name='pictureBTADrills_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_FileManufactureResult }' />
										      		<a class="btn" onclick="onShowPdf('${var1.url_FileManufactureResultChild }');">预览</a>
										      		<br/>
										    	</c:forEach>
										  	</p>
										</div>		
										</div>
									 </div>
								  </div>
								 
							</div>
							 <div class="clear"></div>
							<br/>
							
							<div class="box_xiangxi zhedie">	
							<div class="box_zhedie">
									<span class="a_zhedie1" id = "zd${var.id_ManufactureResultChild }_3" onclick = "zd(${var.id_ManufactureResultChild },3);" style="display:block;">自定义结果</span>
									<span class="a_zhedie2" id = "zd1${var.id_ManufactureResultChild }_3" onclick = "zd1(${var.id_ManufactureResultChild },3);" style="display:none;">自定义结果</span>
								</div>
								 <div class="box_u1" id="box_clcs${var.id_ManufactureResultChild }_3" style="display:none"> 
								 	<div class="box_xiangxi">
										<div class="box_u1">
								 	<ul class="ul1">	
									  		<li><span>参数名称1:</span><div>${var.ManufRSDefined1} &nbsp;</div></li>
									  	</ul>	
									  	<ul class="ul1">	
									  		<li><span>结果1:</span><i>${var.ManufRSDefined1Value } &nbsp;</i></li>
									  	</ul>
									  	<div class="box_p">
										  	<h4>结果文件</h4>
										  	<p>
										    	<c:forEach items="${var.ManufRSDefined1File}" var="var1" varStatus="vs">
										      		<span>${var1.name_FileManufactureResult }</span>
										      		<a class="btn" onclick="onShowPdf('${var1.url_FileManufactureResult }');">预览</a>
										      		<br/>
										    	</c:forEach>
										  	</p>
										</div>
									  		
									  </div>
									  <div class="box_u1">
									  	<ul class="ul1">	
									  		<li><span>参数名称2:</span><div>${var.ManufRSDefined2} &nbsp;</div></li>
									  	</ul>	
									  	<ul class="ul1">	
									  		<li><span>结果2:</span><i>${var.ManufRSDefined2Value } &nbsp;</i></li>
									  	</ul>
									  	<div class="box_p">
										  	<h4>结果文件</h4>
										  	<p>
										    	<c:forEach items="${var.ManufRSDefined2File}" var="var1" varStatus="vs">
										      		<span>${var1.name_FileManufactureResultChild }</span>
										      		<a class="btn" onclick="onShowPdf('${var1.url_FileManufactureResultChild }');">预览</a>
										      		<br/>
										    	</c:forEach>
										  	</p>
										</div>
									  		
									  </div>
									  <div class="box_u1">
									  	<ul class="ul1">	
									  		<li><span>参数名称3:</span><div>${var.ManufRSDefined3} &nbsp;</div></li>
									  	</ul>	
									  	<ul class="ul1">	
									  		<li><span>结果3:</span><i>${var.ManufRSDefined3Value }&nbsp; </i></li>
									  	</ul>
									  	<div class="box_p">
										  	<h4>结果文件</h4>
										  	<p>
										    	<c:forEach items="${var.ManufRSDefined3File}" var="var1" varStatus="vs">
										      		<span>${var1.name_FileManufactureResultChild }</span>
										      		<a class="btn" onclick="onShowPdf('${var1.url_FileManufactureResultChild }');">预览</a>
										      		<br/>
										    	</c:forEach>
										  	</p>
										</div>
										</div>
									</div>
								  </div>
								 
							</div>
							 <div class="clear"></div>
							<br/>
						</div>							
					</div>
				</c:forEach>
			</c:when>
			
	    	<c:otherwise>没有相关数据</c:otherwise>
	  	</c:choose>	
	</div>
	
	<div class="clear"></div>
  	<div class="page-header position-relative" style="vertical-align:top;padding-top:10px;padding-left:20px;">
<!-- 		  <a class="btn" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" >批量删除</a> -->
	   
		<div class="pagination">
	  		<ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="ManufactureResultChild/ManufactureResultChildList"/>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	function zd(i,j){
		$("#box_clcs"+i+"_"+j).css("display","block");
		$("#zd"+i+"_"+j).css("display","none");
		$("#zd1"+i+"_"+j).css("display","block");
	}
	function zd1(i,j){
		$("#box_clcs"+i+"_"+j).css("display","none");
		$("#zd"+i+"_"+j).css("display","block");
		$("#zd1"+i+"_"+j).css("display","none");
	}
</script>
</html>
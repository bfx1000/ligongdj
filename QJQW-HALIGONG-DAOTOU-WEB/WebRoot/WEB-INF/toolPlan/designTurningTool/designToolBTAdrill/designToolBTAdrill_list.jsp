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
<script src="<%=path%>/resources/js/common/detail.js?v=<%=date%>"  type="text/javascript"></script>
<link href="<%=path%>/resources/css/index/style_a.css?v=<%=date%>" rel="stylesheet" type="text/css" />
<!-- <link href="<%=path%>/resources/css/bootstrap.min.css" rel="stylesheet" /> -->
<!-- <link href="<%=path%>/resources/css/bootstrap-responsive.min.css" rel="stylesheet" /> -->
<!--   列表内容  添加折叠  js    -->
<script type="text/javascript">
	function zd(id){
		$("#box_clcs"+id).css("display","block");
		$("#zd"+id).css("display","none");
		$("#zd1"+id).css("display","block");
	}
	function zd1(id){
		$("#box_clcs"+id).css("display","none");
		$("#zd"+id).css("display","block");
		$("#zd1"+id).css("display","none");
	}
</script>
<script type="text/javascript">
    
	//检索
	function onSearchKey(){
		
		var url = "<%=path%>/designToolBTAdrill/queryDesignToolBTAdrillList";
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
		window.location.href='<%=path%>/designToolBTAdrill/goAddDesignToolBTAdrill?id=0';
	}
	
	//修改
	function edit(id){
		window.location.href='<%=path%>/designToolBTAdrill/goAddDesignToolBTAdrill?id=' + id;
	}
	
	//展开折叠详细
	function onShowDetial(id_TurningHolder){
		$("#ulli_" + id_TurningHolder).toggle();
	}
	
	//删除
	function del(id_DesignToolBTAdrill){
		if(confirm("确定要删除吗?")){
			var url = "<%=path%>/designToolBTAdrill/deleteDesignToolBTAdrill?id_DesignToolBTAdrill=" + id_DesignToolBTAdrill;
			document.Form.action = url;
			$("#Form").ajaxSubmit(function(result){
				if(result) {
					jump(${page.pageNo});
				}else{
					alert('操作失败，请联系管理员！');
				}
			};
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
  <form action="designToolBTAdrill/queryDesignToolBTAdrillList" method="post" name="Form" id="Form">
    <div class="search_wrap">
	  <div class="search_input_wrap">
		<span>钻头编号<input name="DesignNumberBTADrill" tpye="text" value="${pd.DesignNumberBTADrill }" /></span>
		<span>钻头名称<input name="DesignNameBTADrill" tpye="text" value="${pd.DesignNameBTADrill }" /></span>
		<span>加工直径<input name="DesignDiameterBTADrill" tpye="text" value="${pd.DesignDiameterBTADrill }" /></span>
		<span>设计厂商<input name="DesignCompanyBTADrill" tpye="text" value="${pd.DesignCompanyBTADrill }" /></span>
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
	  <span class="label_wrap"><input type="checkbox" checked="checked" />钻头编号</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />钻头名称</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />加工直径</span>
	  <span class="label_wrap"><input type="checkbox" checked="checked" />设计厂商</span>
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
  </div>
  <div class="content_wrap">
  	<div class="each_list_wrap" style="background: white;">
			<span class="list_title skz_hide skz_list0">&nbsp;钻头编号</span> 
 			<span class="list_title skz_hide skz_list1">&nbsp;钻头名称</span> 
 			<span class="list_title skz_hide skz_list2">&nbsp;加工直径</span> 
 			<span class="list_title skz_hide skz_list3"  >&nbsp;刀片设计厂商</span> 
			<span class="list_title opera_wrap  skz_hide  skz_list4">&nbsp;&nbsp;&nbsp;操作</span>	
	</div>
    <c:choose>
      <c:when test="${not empty designToolBTAdrill}">
	    <c:forEach items="${designToolBTAdrill}" var="var" varStatus="vs">
	      <div class="each_list_wrap">
	      	<div class="onclick" onclick="onShowDetial(${var.id_DesignToolBTAdrill });"></div>
			<span class="  skz_hide skz_list0">&nbsp;${var.DesignNumberBTADrill }</span> 
 			<span class="skz_hide skz_list1">&nbsp;${var.DesignNameBTADrill }</span> 
 			<span class="skz_hide skz_list2">&nbsp;${var.DesignDiameterBTADrill }</span> 
 			<span class="skz_hide skz_list3"  >&nbsp;${var.DesignCompanyBTADrill }</span> 
			<span class="opera_wrap  skz_hide  skz_list4">
			  <span class="btn btn_xg" onclick="edit('${var.id_DesignToolBTAdrill}');">修改</span>
			  <span class="btn btn_sc" onclick="del('${var.id_DesignToolBTAdrill}');">删除</span>
			</span>					
			<div class="clear"></div>
			<!-- 展开详情   -->
			<div id="ulli_${var.id_DesignToolBTAdrill}" class="ulli" style="display: none;">
			  <div class="box_xiangxi">
				<div class="box_u1">
				  <ul class="ul1">
					<li><span>钻头编号</span><i>${var.DesignNumberBTADrill }</i></li>
					<li><span>钻头名称</span><i>${var.DesignNameBTADrill }</i></li>
					<li><span>加工直径</span><div>${var.DesignDiameterBTADrill } </div></li>
				  </ul>
				  <ul class="ul1">
					<li><span>设计厂家</span><i>${var.DesignCompanyBTADrill } </i></li>
					<li><span>断屑槽类型</span><i>${var.DesignBreakerBTADrill } </i></li>
					<li><span>加工特性简述</span><i>${var.DesignFeatureBTADrill } </i></li>
				  </ul>
				  <div class="clear"></div>
				</div>
			  </div>
			  <div class="box_p">
			    <h4>刀具图片</h4>
			    <p>
			      <c:forEach items="${var.pictureDesignToolBTAdrillList}" var="var1" varStatus="vs">
			        <img name='pictureDesignToolBTAdrills_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_DesignToolBTAdrill }' />
			        <a class="btn" onclick="onShowPdf('${var1.url_DesignToolBTAdrill }');">预览</a>
			        <br/>
			      </c:forEach>
			    </p>
			  </div>
				<div class="box_p">
				  <h4>详细信息</h4>
				  <p>
				    <c:forEach items="${var.informDetailDesignToolBTAdrillList}" var="var1" varStatus="vs">
				      <span name='informDetailDesignToolBTAdrills_img' >${var1.name_DesignInformDetailBTADrill }</span>
				      <a class="btn" onclick="onShowPdf('${var1.url_DesignInformDetailBTADrill }');">预览</a>
				      <br/>
				    </c:forEach>
				  </p>
				</div>
				<div class="box_p">
				  <h4>part文件</h4>
				  <p>
				    <c:forEach items="${var.partDesignToolBTAdrillList}" var="var1" varStatus="vs">
				      <span name='partDesignToolBTAdrills_img' >${var1.name_DesignPartBTADrill }</span>
				      <a class="btn" onclick="onShowPdf('${var1.url_DesignPartBTADrill }');">预览</a>
				      <br/>
				    </c:forEach>
				  </p>
				</div>
				
			  <div class="box_xiangxi zhedie">
						<div class="box_zhedie">
							<span class="a_zhedie1" id = "zd${var.id_DesignToolBTAdrill }" onclick = "zd(${var.id_DesignToolBTAdrill });" style="display:block;">刀片信息</span>
							<span class="a_zhedie2" id = "zd1${var.id_DesignToolBTAdrill }" onclick = "zd1(${var.id_DesignToolBTAdrill });" style="display:none;">刀片信息</span>
						</div>
						<div class="box_u1" id="box_clcs${var.id_DesignToolBTAdrill }" style="display:none">
							<ul  class="ul1  img_ul">
								<li><img src="/resources/images/P_BTADrill.png" /></li>
							</ul>						
							<ul class="ul1 img_infor_ul">
							  	<li><span>外齿工作宽度Lp：</span> &nbsp;${var.P.DesignBTADrillPWidth} </li>
							  	<li><span>外刃偏角φp： </span> &nbsp;${var.P.DesignBTADrillPEdgeAngle} </li>
							  	<li><span>外齿前角γp:</span> &nbsp;${var.P.DesignBTADrillPRakeAngle} </li>
							  	<li><span>外齿后角αp:</span> &nbsp;${var.P.DesignBTADrillPReliefAngle} </li>
							  	<li><span>外齿刀尖角εp： </span> &nbsp;${var.P.DesignBTADrillPNoseAngle} </li>
							</ul>
							<ul class="ul1 img_addr_ul">
								<li>								
									<div class="box_p">
										<h4>part文件：</h4>
									    <p>
										      <c:forEach items="${var.P.pPart}" var="var1" varStatus="vs">
										      <span name='partDesignToolBTAdrills_img' >${var1.name_DesignBTADrillPartAll }</span>
										      <a class="btn" onclick="onShowPdf('${var1.url_DesignBTADrillPartAll }');">预览</a>
										      <br/>
										      </c:forEach>
									    </p>
									</div>							
								</li>						
							</ul>
							
							<div class="clear"></div>
							<hr/>
							<ul  class="ul1 img_ul">
								<li><img src="/resources/images/C_BTADrill.png" /></li>
							</ul>
							<ul class="ul1 img_infor_ul">
							  <li><span>中心齿工作宽度Lc：</span> &nbsp;${var.C.DesignBTADrillCWidth} </li>
							  <li><span>内刃偏角φc：  </span> &nbsp;${var.C.DesignBTADrillCEdgeAngle} </li>
							  <li><span>中心齿前角γc:</span> &nbsp;${var.C.DesignBTADrillCRakeAngle} </li>
							  <li><span>中心齿后角αc:</span> &nbsp;${var.C.DesignBTADrillCReliefAngle} </li>
							  <li><span>中心齿刀尖角εc：</span> &nbsp;${var.C.DesignBTADrillCNoseAngle} </li>
							</ul>
							<ul class="ul1 img_addr_ul">
								<li>
									<div class="box_p">
										<h4>part文件：</h4>
									    <p>
										      <c:forEach items="${var.C.cPart}" var="var1" varStatus="vs">
										      <span name='partDesignToolBTAdrills_img' >${var1.name_DesignBTADrillPartAll }</span>
										      <a class="btn" onclick="onShowPdf('${var1.url_DesignBTADrillPartAll }');">预览</a>
										      <br/>
										      </c:forEach>
									    </p>
									</div>
								</li>
							</ul>
							<div class="clear"></div>
							<hr/>
							<ul  class="ul1  img_ul">
								<li><img src="/resources/images/ZI_BTADrill.png" /></li>
							</ul>	
							<ul class="ul1 img_infor_ul">
							  <li><span>中间齿工作宽度LI：</span> &nbsp;${var.ZI.DesignBTADrillZIWidth} </li>
							  <li><span>内刃偏角φI：  </span> &nbsp;${var.ZI.DesignBTADrillZIEdgeAngle } </li>
							  <li><span>中心齿前角γI:</span> &nbsp;${var.ZI.DesignBTADrillZIRakeAngle} </li>
							  <li><span>中间齿后角αI:</span> &nbsp;${var.ZI.DesignBTADrillZIReliefAngle } </li>
							  <li><span>中间齿刀尖角εI： </span> &nbsp;${var.ZI.DesignBTADrillZINoseAngle} </li>
							</ul>
							<ul class="ul1 img_addr_ul">
								<li>
									<div class="box_p">
										<h4>part文件：</h4>
									    <p>
										      <c:forEach items="${var.ZI.ziPart}" var="var1" varStatus="vs">
										      <span name='partDesignToolBTAdrills_img' >${var1.name_DesignBTADrillPartAll }</span>
										      <a class="btn" onclick="onShowPdf('${var1.url_DesignBTADrillPartAll }');">预览</a>
										      <br/>
										      </c:forEach>
									    </p>
									</div>
								</li>
							</ul>
							<div class="clear"></div>
							<hr/>
							<ul  class="ul1  img_ul">
								<li><img src="/resources/images/One_BTADrill.png" /></li>
							</ul>	
							<ul class="ul1 img_infor_ul">
							  <li><span>初始圆弧角度：</span> &nbsp;${var.One.DesignBTADrillZIArcAngleOne} </li>
							  <li><span>导向块长度：  </span> &nbsp;${var.One.DesignBTADrillZILeadLengthOne } </li>
							  <li><span>导向块厚度:</span> &nbsp;${var.One.DesignBTADrillZILeadThicknessOne } </li>
							</ul>
							<ul class="ul1 img_addr_ul">
								<li>
									<div class="box_p">
										<h4>part文件：</h4>
									    <p>
										      <c:forEach items="${var.One.onePart}" var="var1" varStatus="vs">
										      <span name='partDesignToolBTAdrills_img' >${var1.name_DesignBTADrillPartAll }</span>
										      <a class="btn" onclick="onShowPdf('${var1.url_DesignBTADrillPartAll }');">预览</a>
										      <br/>
										      </c:forEach>
									    </p>
									</div>
								</li>
							</ul>
							<div class="clear"></div>
							<hr/>
							<ul  class="ul1  img_ul">
								<li><img src="/resources/images/Two_BTADrill.png" /></li>
							</ul>	
							<ul class="ul1 img_infor_ul">
							  <li><span>初始圆弧角度：</span> &nbsp;${var.Two.DesignBTADrillZIArcAngleTwo} </li>
							  <li><span>导向块长度：  </span> &nbsp;${var.Two.DesignBTADrillZILeadLengthTwo } </li>
							  <li><span>导向块厚度:</span> &nbsp;${var.Two.DesignBTADrillZILeadThicknessTwo } </li>
							</ul>
							<ul class="ul1 img_addr_ul">
								<li>
									<div class="box_p">
										<h4>part文件：</h4>
									    <p>
										      <c:forEach items="${var.Two.twoPart}" var="var1" varStatus="vs">
										      <span name='partDesignToolBTAdrills_img' >${var1.name_DesignBTADrillPartAll }</span>
										      <a class="btn" onclick="onShowPdf('${var1.url_DesignBTADrillPartAll }');">预览</a>
										      <br/>
										      </c:forEach>
									    </p>
									</div>
								</li>
							</ul>
							<div class="clear"></div>
							<hr/>
							<ul  class="ul1  img_ul">
								<li><img src="/resources/images/Body_BTADrill.png" /></li>
							</ul>
							<ul class="ul1 img_addr_ul">
								<li>	
									<div class="box_p">
										<h4>part文件：</h4>
									    <p>
										      <c:forEach items="${var.Body.bodyPart}" var="var1" varStatus="vs">
										      <span name='partDesignToolBTAdrills_img' >${var1.name_DesignBTADrillPartAll }</span>
										      <a class="btn" onclick="onShowPdf('${var1.url_DesignBTADrillPartAll }');">预览</a>
										      <br/>
										      </c:forEach>
									    </p>
									</div>
								</li>
							</ul>
							<div class="clear"></div>
							<hr/>
							<ul  class="ul1  img_ul">
								<li><img src="/resources/images/S_BTADrill.png" style="width:10;height:10;"/></li>
							</ul>
							<ul class="ul1 img_addr_ul">
								<li>	
									<div class="box_p">
										<h4>part文件：</h4>
									    <p>
										      <c:forEach items="${var.S.sPart}" var="var1" varStatus="vs">
										      <span name='partDesignToolBTAdrills_img' >${var1.name_DesignBTADrillPartAll }</span>
										      <a class="btn" onclick="onShowPdf('${var1.url_DesignBTADrillPartAll }');">预览</a>
										      <br/>
										      </c:forEach>
									    </p>
									</div>
								</li>
							</ul>
							<div class="clear"></div>
						</div>
				<div class="clear"></div>
				</div>
				
			</div>
		  </div>
		</c:forEach>
	  </c:when>
	  <c:otherwise>没有相关数据</c:otherwise>
	</c:choose>
  </div>
  <div class="page-header position-relative" style="vertical-align:top;padding-top:10px;padding-left:20px;">
	<div class="pagination">
	  <ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="designToolBTAdrill/queryDesignToolBTAdrillList"/>
	</div>
  </div>
</div>

</body>




</html>


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
	<link href="<%=path%>/resources/css/index/style_a.css?v=<%=date%>" rel="stylesheet" type="text/css" />
	<!-- <link href="<%=path%>/resources/css/bootstrap.min.css" rel="stylesheet" /> -->
	<!-- <link href="<%=path%>/resources/css/bootstrap-responsive.min.css" rel="stylesheet" /> -->

	<script type="text/javascript">
	
	    
		//检索
		function onSearchKey(){
			var url = "<%=path%>/toolBTAdrill/queryToolBTAdrillList";
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
			window.location.href='<%=path%>/toolBTAdrill/goAddToolBTAdrill?id=';
		}
		
		
		//修改
		function edit(id){
			window.location.href='<%=path%>/toolBTAdrill/goAddToolBTAdrill?id=' + id;
		}
		
		//展开折叠详细
		function onShowDetial(id_BTADrill){
			$("#ulli_" + id_BTADrill).toggle();
		}
		
		//删除
		function del(id_BTADrill){
			if(confirm("确定要删除吗?")){
				$.ajax({
				    url:"/toolBTAdrill/deleteToolBTAdrill",
				    type:"post",
				    data:{id_BTADrill:id_BTADrill},
				    success:function(data){
				    	if(data==1){
				    		$("#div_"+id_BTADrill).remove();
				    		alert("删除成功");
				    	}
				    	else{
				    		alert("删除失败，请联系管理员");
				    	}
				    },
				});
				
				
			}
		}
		
		//预览pdf文件
		function onShowPdf(url){
			window.open("<%=basePath%>goods" + url);
		}
		
		function exportExcel(){
			var whetherExport = document.getElementsByName("whetherExport");
			var ExportId = "";
			for(var i=0;i<whetherExport.length;i++){
				if(whetherExport[i].checked){
					ExportId += whetherExport[i].value + ",";
				}
			}
			alert(ExportId);
			$("#ExportId").val(ExportId);
			$("#ExportId_Form").submit();
		}
		
		function exportExcelOne(id){
			window.location.href='<%=path%>/toolBTAdrill/exportExcelOne?id='+id;
		}
		
		function exportTxTOne(id){
			window.location.href='<%=path%>/toolBTAdrill/exportTXTOne?id='+id;
		}
		
		/* 加载更多 */
		function loadMore(){
			  	
			var number = $("#number").val();
			var order = $("#order").val();
			var asc = $("#asc").val();
			var NumberBTADrill = $("#NumberBTADrill_pd").val();
			var TypeBTADrill = $("#TypeBTADrill_pd").val();
			var NameBTADrill = $("#NameBTADrill_pd").val();
			var DiameterBTADrill = $("#DiameterBTADrill_pd").val();
			var MateriaBTAlDrill = $("#MateriaBTAlDrill_pd").val();
			var ToolMaterialBTADrill = $("#ToolMaterialBTADrill_pd").val();
			var ToolCoatBTADrill = $("#ToolCoatBTADrill_pd").val();
			var BreakerBTADrill = $("#BreakerBTADrill_pd").val();
			var CompanyBTADrill = $("#CompanyBTADrill_pd").val();
			$.ajax({
				url:"/toolBTAdrill/leadMore",
			    type:"post",
			    data:{number:number,
			    	order:order,
			    	asc:asc,
			    	NumberBTADrill:NumberBTADrill,
			    	TypeBTADrill:TypeBTADrill,
			    	NameBTADrill:NameBTADrill,
			    	DiameterBTADrill:DiameterBTADrill,
			    	MateriaBTAlDrill:MateriaBTAlDrill,
			    	ToolMaterialBTADrill:ToolMaterialBTADrill,
			    	ToolCoatBTADrill:ToolCoatBTADrill,
			    	BreakerBTADrill:BreakerBTADrill,
			    	CompanyBTADrill:CompanyBTADrill
			    },
			    dataType:"json",
			    success:function(data){
			    	var result = data.result;
			    	if(result==1){
			    		$("#number").val(data.number);
			    		for(var i = 0;i<data.list.length;i++){
			    			
			    			html=   '<div class="each_list_wrap"  >'+
							'<span  class="checkbox_input skz_list10"><input type="checkbox" name = "whetherExport" value="'+data.list[i].id_BTADrill+'"></span>'+
							'<div class="onclick" onclick="onShowDetial('+data.list[i].id_BTADrill+');"></div>'+
							'<span class="skz_hide  skz_list0 ">&nbsp;'+data.list[i].NumberBTADrill+'</span>'+
							'<span class="skz_hide skz_list1" >&nbsp;'+(data.list[i].TypeBTADrill== 1 ? "焊接钻头" : "可转位钻头")+'</span>'+
							'<span class="skz_hide  skz_list2" >&nbsp;'+data.list[i].NameBTADrill+'</span>'+
							'<span class="skz_hide  skz_list3" >&nbsp;'+data.list[i].DiameterBTADrill+'</span>'+
							'<span class="skz_hide  skz_list4" >&nbsp;'+data.list[i].MateriaBTAlDrill+'</span>'+
							'<span class="skz_hide  skz_list5" style="display: none;">&nbsp;'+data.list[i].ToolMaterialBTADrill+'</span>'+
							'<span class="skz_hide  skz_list6" style="display: none;">&nbsp;'+data.list[i].ToolCoatBTADrill+'</span>'+
							'<span class="skz_hide  skz_list7" style="display: none;">&nbsp;'+data.list[i].BreakerBTADrill+'</span>'+
							'<span class="skz_hide  skz_list8" style="display: none;">&nbsp;'+data.list[i].CompanyBTADrill+'</span>'+
							'<span class="opera_wrap  skz_hide  skz_list9">'+
								'<span class="btn btn_xg" onclick="edit('+data.list[i].id_BTADrill+');">修改</span>'+
							   ' <span class="btn btn_sc" onclick="del('+data.list[i].id_BTADrill+');">删除</span>'+
							'</span>'+
							'<div class="clear"></div>	'+
							
							'<div id="ulli_'+data.list[i].id_BTADrill+'"  data-name="0"  class="ulli" style="display: none;">'+
								'<div class="box_xiangxi">'+
									'<div class="box_u1">'+
										'<ul class="ul1">'+
									  		'<li><span>钻头编号</span><i>'+data.list[i].NumberBTADrill+'</i></li>'+
									  		'<li><span>钻头类型</span><i>'+(data.list[i].TypeBTADrill== 1 ? "焊接钻头" : "可转位钻头")+'</i></li>'+
									  		'<li><span>加工直径</span><div>'+data.list[i].DiameterBTADrill+'</div></li>'+
									  		'<li><span>断屑槽类型</span><i>'+data.list[i].BreakerBTADrill+'</i></li>'+
									  		'<li><span>生产厂家</span><i>'+data.list[i].CompanyBTADrill+'</i></li>'+
										'</ul>'+
										'<ul class="ul1">'+
									  		'<li><span>加工材料</span><i>'+data.list[i].MateriaBTAlDrill+'</i></li>'+
									  		'<li><span>刀具材料</span><i>'+data.list[i].ToolMaterialBTADrill+'</i></li>'+
									  		'<li><span>刀具涂层</span><i>'+data.list[i].ToolCoatBTADrill+'</i></li>'+
									  		'<li><span>ISO材料加工信息</span><i></i></li>'+
										'</ul>'+
										'<div class="clear"></div>'+
								  	'</div>'+
								'</div>'+
								
				
								'<div class="box_p">'+
									'<h4>刀具图片</h4>'+
								  	'<p>';
								  	for(var j=0;j<data.list[i].pictureBTADrillList.length;j++){
								  		html+='<img name="pictureBTADrills_img" width="100px" height="100px" src="<%=path%>/goods'+data.list[i].pictureBTADrillList[j].url_PictureBTADrill+'" /> '+ 
									      		'<a class="btn" onclick="onShowPdf(\''+data.list[i].pictureBTADrillList[j].url_PictureBTADrill+'\');">预览</a>'+
									      		'<br/>';
								  	}
								    	
								  	html+='</p>'+
								'</div>'+
								'<div class="box_p">'+
								  	'<h4>详细图片</h4>'+
								  	'<p>';
								  	for(var k=0;k<data.list[i].pictureDetailBTADrillList.length;k++){
								  		html+='<img name="pictureBTADrills_img" width="100px" height="100px" src="<%=path%>/goods'+data.list[i].pictureDetailBTADrillList[k].url_PictureDetailBTADrill+'" /> '+
									      		'<a class="btn" onclick="onShowPdf(\''+data.list[i].pictureDetailBTADrillList[k].url_PictureDetailBTADrill+'\');">预览</a>'+
									      		'<br/>';
								  	}
								  	html+='</p>'+
								'</div>'+
								'<div class="box_p">'+
								  	'<h4>详细信息</h4>'+
								  	'<p>';
								  	for(var l=0;l<data.list[i].informDetailBTADrillList.length;l++){
								  		html+='<span name="informDetailBTADrills_img" >'+data.list[i].informDetailBTADrillList[l].name_InformDetailBTADrill+'</span>'+
									      		'<a class="btn" onclick="onShowPdf(\''+data.list[i].informDetailBTADrillList[l].url_PictureDetailBTADrill+'\');">预览</a>'+
									      		'<br/>';
								  	}
								  	html+='</p>'+
								'</div>'+
								'<div class="box_p">'+
								  	'<h4>应用实例</h4>'+
								  	'<p>';
								  	for(var a=0;a<data.list[i].applicationBTADrillList.length;a++){
								  		html+='<span name="applicationBTADrills_img" >'+data.list[i].applicationBTADrillList[a].name_ApplicationBTADrill+'</span>'+
									      		'<a class="btn" onclick="onShowPdf(\''+data.list[i].applicationBTADrillList[a].url_ApplicationBTADrill+'\');">预览</a>'+
									      		'<br/>';
								  	}
								    	
								  	html+='</p>'+
								'</div>'+
								'<div class="clear"></div>';
								if(data.list[i].isPMKNS.indexOf('P')>0){
									html+='<div class="box_p">'+
								  	'<h4>加工P参数</h4>'+
								  	'<p>'+data.list[i].ISOPTextBTADrill+'</p>'+
								  '</div>';
								}
								if(data.list[i].isPMKNS.indexOf('M')>0){
									html+='<div class="box_p">'+
								  	'<h4>加工M参数</h4>'+
								  	'<p>'+data.list[i].ISOMTextBTADrill+'</p>'+
								  '</div>';
								}
								if(data.list[i].isPMKNS.indexOf('K')>0){
									html+='<div class="box_p">'+
								  	'<h4>加工K参数</h4>'+
								  	'<p>'+data.list[i].ISOKTextBTADrill+'</p>'+
								  '</div>';
								}
								if(data.list[i].isPMKNS.indexOf('N')>0){
									html+='<div class="box_p">'+
								  	'<h4>加工N参数</h4>'+
								  	'<p>'+data.list[i].ISONTextBTADrill+'</p>'+
								  '</div>';
								}
								if(data.list[i].isPMKNS.indexOf('S')>0){
									html+='<div class="box_p">'+
								  	'<h4>加工S参数</h4>'+
								  	'<p>'+data.list[i].ISOSTextBTADrill+'</p>'+
								  '</div>';
								}
								html+='<span class="btn btn_xg" onclick="exportExcelOne('+data.list[i].id_BTADrill+');">导出exc</span>&nbsp;'+
								'<span class="btn btn_xg" onclick="exportTxTOne('+data.list[i].id_BTADrill+');">导出txt</span>'+
							'</div>	'+
						'</div>';
						$("#content_wrap").append(html);
						selectData();
			    		}
			    	}
			    	else{
			    		$(".loading_more").html("无更多数据");
			    	}
			    },
			});
		}
		
		/* 全选or全不选 */
		 function selAll(obj){
	            var o=document.getElementsByName("whetherExport");
	            for(var i=0;i<o.length;i++)
	            {
	                if(obj.checked==true)
	                    o[i].checked=true;
	                else
	                    o[i].checked=false;
	            }
	     }
		 function selFirst(){
	            var o=document.getElementsByName("whetherExport");
	            var count=0,num=0;
	            for(var i=0;i<o.length-1;i++)
	            {
	                if(o[i+1].checked==true)
	                {
	                    count++;
	                }
	                if(o[i+1].checked==false)
	                {
	                    num++;
	                }
	            }
	            if(count==o.length-1)
	            {
	                o[0].checked=true;
	            }
	            if(num>0)
	            {
	                if(o[0].checked==true)
	                {
	                    o[0].checked=false;
	                }
	            }
	     }
		 /* 列头排序 */
		 function orderBy(i){
			 $("#order").val(i);
			 if($("#asc").val()!="" && $("#asc").val()!=null){
				 $("#asc").val("");
			 }else{
				 $("#asc").val("1");
			 }
			 onSearchKey();
		 }
		 function RunBat(){
			 alert("执行Bat中");
			 $.ajax({
				 url: '/toolBTAdrill/RunBat' ,  
		         type: 'POST', 
		         success:function(data){
		        	 if(data==1){
		        		 alert("执行成功，文件生成成功");
		        	 }else{
		        		 alert("执行失败");
		        	 }
		         }
			 });
		 }
	</script>
</head>
<body>
<form action="/toolBTAdrill/exportExcel" method="post" id="ExportId_Form">
	<input id = "ExportId" name= "ExportId" type = "hidden" value =""/>
</form>
<div class="content_box_table">
	<form action="/toolBTAdrill/queryToolBTAdrillList" method="post" name="Form" id="Form">
	  <div class="search_wrap">
	  
	  	<div class="search_input_wrap">
	  	
	  		<input id="order" name="order" type="hidden" value="${pd.order }" />
	  		<input id="asc" name="asc" type="hidden" value="${pd.asc }" />
	  		
		  	<span>钻头编号<input id="NumberBTADrill_pd" name="NumberBTADrill" tpye="text" value="${pd.NumberBTADrill }" /></span>
		  	<span>钻头类型
		  	  <select id="TypeBTADrill_pd" name="TypeBTADrill" onChange="" class="select" >
		  	  	<option value="" ${pd.TypeBTADrill == '' ? 'selected' : '' }>请选择</option>
			    <option value="1" ${pd.TypeBTADrill == 1 ? 'selected' : '' }>焊接钻头</option>
			    <option value="2" ${pd.TypeBTADrill == 2 ? 'selected' : '' }>可转位钻头</option>
			  </select>
		  	</span>
		  	<span>钻头名称<input id="NameBTADrill_pd" name="NameBTADrill" tpye="text" value="${pd.NameBTADrill }" /></span>
		  	<span>加工直径<input id="DiameterBTADrill_pd" name="DiameterBTADrill" tpye="text" value="${pd.DiameterBTADrill }" /></span>
		  	<span>加工材料<input id="MateriaBTAlDrill_pd" name="MateriaBTAlDrill" tpye="text" value="${pd.MateriaBTAlDrill }" /></span>
		  	<span>刀具材料<input id="ToolMaterialBTADrill_pd" name="ToolMaterialBTADrill" tpye="text" value="${pd.ToolMaterialBTADrill }" /></span>
		  	<span>刀具涂层<input id="ToolCoatBTADrill_pd" name="ToolCoatBTADrill" tpye="text" value="${pd.ToolCoatBTADrill }" /></span>
		  	<span>断屑槽类型<input id="BreakerBTADrill_pd" name="BreakerBTADrill" tpye="text" value="${pd.BreakerBTADrill }" /></span>
		  	<span>生产厂家<input id="CompanyBTADrill_pd" name="CompanyBTADrill" tpye="text" value="${pd.CompanyBTADrill }" /></span>
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
			<span class="label_wrap"><input type="checkbox" checked="checked" />钻头类型</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />钻头名称</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />加工直径</span>
			<span class="label_wrap"><input type="checkbox" checked="checked" />加工材料</span>
			<span class="label_wrap"><input type="checkbox" />刀具材料</span>
			<span class="label_wrap"><input type="checkbox" />刀具涂层</span>
			<span class="label_wrap"><input type="checkbox" />断屑槽类型</span>
			<span class="label_wrap"><input type="checkbox" />生产厂家</span>
			<span class="label_wrap" style="display:none"><input type="checkbox" checked="checked" />复选框</span>
		</div>
		
		<div class="opera_img">
		  	<img src="/resources/images/ico_n.png" data-name="0"  onclick="changeOpera(this);"  alt="展开" />
		</div>
		<div class="choose_show_btn"   onclick="selectData();" >应用</div>	
		<div class="clear"></div>
	</div>
	<div class="choose_show_btn" style="float:right;margin-right:2px;"  onclick="exportExcel();" >批量导出</div>	
	<!-- 新增按钮   -->
	<div class="addbtn_wrap">
		 <a class="btn" onclick="add();">新增</a>
	</div>
		
	
	<div class="content_wrap" id="content_wrap">
		<!-- class : skz_hide用在勾选显示         -->
					<div class="each_list_wrap"  style="background: white;">
						<span  class="checkbox_input skz_hide skz_list10"><input type="checkbox" onclick="selAll(this)" id = "whetherExportAll"></span>
						<span class="list_title skz_hide  skz_list0" onclick="orderBy('NumberBTADrill');">&nbsp;钻头编号</span>
						<span class="list_title skz_hide skz_list1"  onclick="orderBy('TypeBTADrill');">&nbsp;钻头类型</span>
						<span class="list_title skz_hide  skz_list2"  onclick="orderBy('NameBTADrill');">&nbsp;钻头名称</span>
						<span class="list_title skz_hide  skz_list3"  onclick="orderBy('DiameterBTADrill');">&nbsp;加工直径</span>
						<span class="list_title skz_hide  skz_list4"  onclick="orderBy('MateriaBTAlDrill');">&nbsp;加工材料</span>
						<span class="list_title skz_hide  skz_list5"  onclick="orderBy('ToolMaterialBTADrill');" style="display: none;">&nbsp;刀具材料</span>
						<span class="list_title skz_hide  skz_list6"  onclick="orderBy('ToolCoatBTADrill');" style="display: none;">&nbsp;刀具涂层</span>
						<span class="list_title skz_hide  skz_list7"  onclick="orderBy('BreakerBTADrill');" style="display: none;">&nbsp;断屑槽类型</span>
						<span class="list_title skz_hide  skz_list8"  onclick="orderBy('CompanyBTADrill');" style="display: none;">&nbsp;生产厂家</span>
						<span class="list_title opera_wrap skz_hide  skz_list9">&nbsp;&nbsp;&nbsp;操作</span>
					</div>
		<c:choose>
    		<c:when test="${not empty toolBTAdrillList}">
	  			<c:forEach items="${toolBTAdrillList}" var="var" varStatus="vs">	
					<div class="each_list_wrap" id="div_${var.id_BTADrill }">
						<span  class="checkbox_input skz_list10"><input type="checkbox" name = "whetherExport" value="${var.id_BTADrill }"></span>
						<div class="onclick" onclick="onShowDetial(${var.id_BTADrill });"></div>
						<span class="skz_hide  skz_list0">&nbsp;${var.NumberBTADrill }</span>
						<span class="skz_hide skz_list1" >&nbsp;${var.TypeBTADrill == 1 ? '焊接钻头' : '可转位钻头'}</span>
						<span class="skz_hide  skz_list2" >&nbsp;${var.NameBTADrill }</span>
						<span class="skz_hide  skz_list3" >&nbsp;${var.DiameterBTADrill}</span>
						<span class="skz_hide  skz_list4" >&nbsp;${var.MateriaBTAlDrill}</span>
						<span class="skz_hide  skz_list5" style="display: none;">&nbsp;${var.ToolMaterialBTADrill}</span>
						<span class="skz_hide  skz_list6" style="display: none;">&nbsp;${var.ToolCoatBTADrill}</span>
						<span class="skz_hide  skz_list7" style="display: none;">&nbsp;${var.BreakerBTADrill }</span>
						<span class="skz_hide  skz_list8" style="display: none;">&nbsp;${var.CompanyBTADrill }</span>
						<span class="opera_wrap  skz_hide  skz_list9">
							<span class="btn btn_xg" onclick="edit('${var.id_BTADrill}');">修改</span>
						    <span class="btn btn_sc" onclick="del('${var.id_BTADrill}');">删除</span>
						</span>
						<div class="clear"></div>	
						
						<!-- 展开详情   -->
						<div id="ulli_${var.id_BTADrill}"  data-name="0"  class="ulli" style="display: none;">
							<div class="box_xiangxi">
							<!--<img src="images/dtcp_img1.png" class="img1" alt="哈理工刀头" title="哈理工刀头"/> -->
								<div class="box_u1">
									<ul class="ul1">
								  		<li><span>钻头编号</span><i>${var.NumberBTADrill } </i></li>
								  		<li><span>钻头类型</span><i>${var.TypeBTADrill == 1 ? '焊接钻头' : '可转位钻头'} </i></li>
								  		<li><span>加工直径</span><div>${var.DiameterBTADrill} </div></li>
								  		<li><span>断屑槽类型</span><i>${var.BreakerBTADrill } </i></li>
								  		<li><span>生产厂家</span><i>${var.CompanyBTADrill } </i></li>
									</ul>
									<ul class="ul1">
								  		<li><span>加工材料</span><i>${var.MateriaBTAlDrill}</i></li>
								  		<li><span>刀具材料</span><i>${var.ToolMaterialBTADrill}</i></li>
								  		<li><span>刀具涂层</span><i>${var.ToolCoatBTADrill}</i></li>
								  		<li><span>ISO材料加工信息</span><i></i></li>
									</ul>
									<div class="clear"></div>
							  	</div>
							</div>
							
			
							<div class="box_p">
								<h4>刀具图片</h4>
							  	<p>
							    	<c:forEach items="${var.pictureBTADrillList}" var="var1" varStatus="vs">
							      		<img name='pictureBTADrills_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_PictureBTADrill }' />
							      		<a class="btn" onclick="onShowPdf('${var1.url_PictureBTADrill }');">预览</a>
							      		<br/>
							    	</c:forEach>
							  	</p>
							</div>
							<div class="box_p">
							  	<h4>详细图片</h4>
							  	<p>
							    	<c:forEach items="${var.pictureDetailBTADrillList}" var="var1" varStatus="vs">
							      		<img name='pictureBTADrills_img' width='100px' height='100px' src='<%=path%>/goods${var1.url_PictureDetailBTADrill }' />
							      		<a class="btn" onclick="onShowPdf('${var1.url_PictureDetailBTADrill }');">预览</a>
							      		<br/>
							    	</c:forEach>
							  	</p>
							</div>
							<div class="box_p">
							  	<h4>详细信息</h4>
							  	<p>
							    	<c:forEach items="${var.informDetailBTADrillList}" var="var1" varStatus="vs">
							      		<span name='informDetailBTADrills_img' >${var1.name_InformDetailBTADrill }</span>
							      		<a class="btn" onclick="onShowPdf('${var1.url_InformDetailBTADrill }');">预览</a>
							      		<br/>
							    	</c:forEach>
							  	</p>
							</div>
							<div class="box_p">
							  	<h4>应用实例</h4>
							  	<p>
							    	<c:forEach items="${var.applicationBTADrillList}" var="var1" varStatus="vs">
							      		<span name='applicationBTADrills_img' >${var1.name_ApplicationBTADrill }</span>
							      		<a class="btn" onclick="onShowPdf('${var1.url_ApplicationBTADrill }');">预览</a>
							      	<br/>
							    	</c:forEach>
							  	</p>
							</div>
							<div class="clear"></div>
							<c:if test="${fn:contains(var.isPMKNS, 'P')}">
							  <div class="box_p">
							  	<h4>加工P参数</h4>
							  	<p>${var.ISOPTextBTADrill }</p>
							  </div>
							</c:if>
							<c:if test="${fn:contains(var.isPMKNS, 'M')}">
							  <div class="box_p">
							  	<h4>加工M参数</h4>
							  	<p>${var.ISOMTextBTADrill }</p>
							  </div>
							</c:if>
							<c:if test="${fn:contains(var.isPMKNS, 'K')}">
							  <div class="box_p">
							  	<h4>加工K参数</h4>
							  	<p>${var.ISOKTextBTADrill }</p>
							  </div>
							</c:if>
							<c:if test="${fn:contains(var.isPMKNS, 'N')}">
							  <div class="box_p">
							  	<h4>加工N参数</h4>
							  	<p>${var.ISONTextBTADrill }</p>
							  </div>
							</c:if>
							<c:if test="${fn:contains(var.isPMKNS, 'S')}">
							  <div class="box_p">
							  	<h4>加工S参数</h4>
							  	<p>${var.ISOSTextBTADrill }</p>
							  </div>
							</c:if>
							<span class="btn btn_xg" onclick="exportExcelOne('${var.id_BTADrill}');">导出exc</span>&nbsp;
							<span class="btn btn_xg" onclick="exportTxTOne('${var.id_BTADrill}');">导出txt</span>
							<span class="btn btn_xg" onclick="RunBat();">执行Bat</span>
						</div>	
												
					</div>
					
				</c:forEach>
			</c:when>
	    	<c:otherwise>没有相关数据</c:otherwise>
	  	</c:choose>	
	</div>
	
	<div class="clear"></div>
	<div class="loading_more" onclick="loadMore();">加载更多</div>
	<input id = "number" value = "2" type="hidden"/>
	<div class="clear"></div>
	
	<div style="display:none;">
		<ff:page mhFrom="Form" showReSize="true"  field="page" onlyOneShow="true" showListNo="false" action="toolBTAdrill/queryToolBTAdrillList"/>
	</div>
	</div>
</body>
</html>
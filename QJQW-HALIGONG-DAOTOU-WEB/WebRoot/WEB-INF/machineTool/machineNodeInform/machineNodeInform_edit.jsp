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


	$(document).ready(function(){
		
		changeValue();
		
		
		//详细信息
		var array_InformDetailMachineNodeInform = $("#array_InformDetailMachineNodeInform").val();
		var array_InformDetailMachineNodeInform_name = $("#array_InformDetailMachineNodeInform_name").val();
		if(array_InformDetailMachineNodeInform != null && array_InformDetailMachineNodeInform != ''){
			var informDetailMachineNodeInforms = array_InformDetailMachineNodeInform.split(',');
			var informDetailMachineNodeInforms_name = array_InformDetailMachineNodeInform_name.split(',');
			var informDetailMachineNodeInforms_str = '';
			for(var i = 0; i < informDetailMachineNodeInforms.length; i++){
				if(informDetailMachineNodeInforms[i] != null && informDetailMachineNodeInforms[i] != ''){
					informDetailMachineNodeInforms_str = informDetailMachineNodeInforms_str + "<div><span name='informDetailMachineNodeInforms_img' url='"+informDetailMachineNodeInforms[i]+"' >"+informDetailMachineNodeInforms_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelInformDetailMachineNodeInformImg(\""+informDetailMachineNodeInforms[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_InformDetailMachineNodeInformList").html(informDetailMachineNodeInforms_str);
		}
	});


	//类别自定义切换
	function onShowTypeMachineInformCustom(){
		var TypeMachine = $("#TypeMachineNode_userForm").val();
		if(TypeMachine == 9){//自定义
			$("#TypeCustomMachineNode_userForm").show();
		}else{
			$("#TypeCustomMachineNode_userForm").val('');
			$("#TypeCustomMachineNode_userForm").hide();
		}
		
	}
	
	//保存
	function save(){
		
		$("#array_InformDetailMachineNodeInform_userForm").val($("#array_InformDetailMachineNodeInform").val());
		$("#array_InformDetailMachineNodeInform_name_userForm").val($("#array_InformDetailMachineNodeInform_name").val());
		
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
		window.location.href='<%=path%>/machineNodeInform/queryMachineNodeInformList';
	}
	
	
	
	
	
	//保存详细信息
	function onSaveInformDetailMachineInformList(){
	    $("#NumberMachineNode_informMachineNodeInformForm").val($("#NumberMachineNode_userForm").val());
	    $("#NumberMachine_informMachineNodeInformForm").val($("#NumberMachine_userForm").val());
	    $("#TypeMachineNode_informMachineNodeInformForm").val($("#id_CategoryToolCoating_userForm").val());
	    $("#DepartmentMachineNode_informMachineNodeInformForm").val($("#DepartmentMachineNode_userForm").val());
	    $("#WorkshopMachineNode_informMachineNodeInformForm").val($("#WorkshopMachineNode_userForm").val());
	    $("#PositionMachineNode_informMachineNodeInformForm").val($("#PositionMachineNode_userForm").val());
	    $("#UseFrequencyMachineNode_informMachineNodeInformForm").val($("#UseFrequencyMachineNode_userForm").val());
	    $("#TimeUseMachineNode_informMachineNodeInformForm").val($("#TimeUseMachineNode_userForm").val());
	    $("#TimeDestroyMachineNode_informMachineNodeInformForm").val($("#TimeDestroyMachineNode_userForm").val());
	    
		$("#informDetailMachineNodeInformForm").submit();
	}
	
	//删除详细信息
	function onDelInformDetailMachineNodeInformImg(url_informDetailMachineNodeInform){
		var array_InformDetailMachineNodeInform = $("#array_InformDetailMachineNodeInform").val();
		array_InformDetailMachineNodeInform = array_InformDetailMachineNodeInform.replace(url_informDetailMachineNodeInform,'');
		$("#array_InformDetailMachineNodeInform").val(array_InformDetailMachineNodeInform);
		var img_array = $("span[name='informDetailMachineNodeInforms_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url_informDetailMachineNodeInform){
				$(img_array[i]).parent().remove();
			}
		}
	}
	
	function changeValue(){
		var loading = $("#id_CategoryToolCoating_userForm").val();
		if(loading == null || loading == ""){
			document.getElementById('id_CategoryToolCoating_userForm').value=document.getElementById('selectWrap').options[document.getElementById('selectWrap').selectedIndex].text;
		}
	}
	
	function loadingTool(){
			$("#id_MachineNodeInform_loadingTool").val($("#id_MachineNodeInform_userForm").val());
			$("#NumberMachineNode_loadingTool").val($("#NumberMachineNode_userForm").val());
		    $("#NumberMachine_loadingTool").val($("#NumberMachine_userForm").val());
		    $("#TypeMachineNode_loadingTool").val($("#id_CategoryToolCoating_userForm").val());
		    $("#DepartmentMachineNode_loadingTool").val($("#DepartmentMachineNode_userForm").val());
		    $("#WorkshopMachineNode_loadingTool").val($("#WorkshopMachineNode_userForm").val());
		    $("#PositionMachineNode_loadingTool").val($("#PositionMachineNode_userForm").val());
		    $("#UseFrequencyMachineNode_loadingTool").val($("#UseFrequencyMachineNode_userForm").val());
		    $("#TimeUseMachineNode_loadingTool").val($("#TimeUseMachineNode_userForm").val());
		    $("#TimeDestroyMachineNode_loadingTool").val($("#TimeDestroyMachineNode_userForm").val());
		    
		    $("#array_InformDetailMachineNodeInform_loadingTool").val($("#array_InformDetailMachineNodeInform").val());
			$("#array_InformDetailMachineNodeInform_name_loadingTool").val($("#array_InformDetailMachineNodeInform_name").val());
			
			$("#loadingTool").submit();
	}
</script>
</head>
<body>



<a class="btn" onclick="save();">保存</a>
<a class="btn" onclick="onClose();">返回</a>
<input type="hidden" id="turn_url_id" value="${turn_url}"/>
<div class="content_box_text">
  <ul class="box_text">
    <form action="/machineNodeInform/saveMachineNodeInform" name="userForm" id="userForm" method="post">
  	  <input type="hidden" id="array_InformDetailMachineNodeInform_userForm" name="array_InformDetailMachineNodeInform"/>
  	  <input type="hidden" id="array_InformDetailMachineNodeInform_name_userForm" name="array_InformDetailMachineNodeInform_name"/>
  	    
	  <input type="hidden" name="id_MachineNodeInform" id="id_MachineNodeInform_userForm" value="${(MachineNodeInform.id_MachineNodeInform == null || MachineNodeInform.id_MachineNodeInform == '') ? 0 : MachineNodeInform.id_MachineNodeInform}"/>
	  <li>
	    <span id="lititle">机床编号</span>
	    <input name="NumberMachineNode" id="NumberMachineNode_userForm" type="text" value="${MachineNodeInform.NumberMachineNode}" class="input" maxlength="10"/>
	  </li>		
	  <li>
	    <span id="lititle">机床型号</span>
	    <input name="NumberMachine" id="NumberMachine_userForm" type="text" value="${MachineInform.NumberMachine==null ? MachineNodeInform.NumberMachine :MachineInform.NumberMachine }" class="input" maxlength="100"/>
	  </li>
	  <li class="append_wrap">
	    <span id="lititle">机床所在单位</span>
	    <div class="first">
	    	<input name="DepartmentMachineNode" onKeyup="getContent(this);"  data-id="0"  id="DepartmentMachineNode_userForm" type="text" value="${MachineNodeInform.DepartmentMachineNode}" class="input" maxlength="100"/>
	  	</div>
	  	<div class="append" id="append0"></div>
	  </li>
	  <li>
	    <span id="lititle">机床类别</span>
	    <span class="select_wrap">
				<span class="edit_select">
					<select  name="selectWrap"  id="selectWrap" onChange="changeValue();" class="select" contenteditable="true">
						<c:forEach items="${categoryMachineNodeInform}" var="var" varStatus="vs">
							<option value="${var.id_CategoryMachineNodeInform }" ${MachineNodeInform.TypeMachineNode == var.id_CategoryMachineNodeInform ? 'selected' : '' }>${var.name_CategoryMachineNodeInform }</option>	
						</c:forEach>
					</select>
				</span>
				<span class="input_select">
				<input type="text" name="TypeMachineNode" id="id_CategoryToolCoating_userForm" value="${TypeMachine_name }">
				</span>
		</span>
	  </li>
	  
	  <li class="append_wrap">
	    <span id="lititle">机床车间</span>
	    <div class="first">
	    	<input name="WorkshopMachineNode"  onKeyup="getContent(this);"  data-id="1" id="WorkshopMachineNode_userForm" type="text" value="${MachineNodeInform.WorkshopMachineNode}" class="input" maxlength="100"/>
	  	</div>
	  	<div class="append" id="append1"></div>
	  </li>
	  <li>
	  	<input type = "button" value = "加载机床型号和类别" class="btn" onclick="loadingTool();"/>
	  </li>
	  <li class="block">
	    <span id="lititle">机床位置</span>
	    <input name="PositionMachineNode" id="PositionMachineNode_userForm" type="text" value="${MachineNodeInform.PositionMachineNode}" class="input" maxlength="100"/>
	  </li>
	  <li class="block">
	    <span id="lititle">机床使用强度</span>
	    <input name="UseFrequencyMachineNode" id="UseFrequencyMachineNode_userForm" type="text" value="${MachineNodeInform.UseFrequencyMachineNode}" class="input" maxlength="100"/>
	  </li>
	  
	  <li class="block">
	    <span id="lititle">投入使用时间</span>
	    <input name="TimeUseMachineNode" id="TimeUseMachineNode_userForm" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" type="text" value="${MachineNodeInform.TimeUseMachineNode}" class="input" maxlength="100"/>
	  </li>
	   <li class="block">
	    <span id="lititle">机床报废时间</span>
	    <input name="TimeDestroyMachineNode" id="TimeDestroyMachineNode_userForm" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" type="text" value="${MachineNodeInform.TimeDestroyMachineNode}" class="input" maxlength="100"/>
	  </li>
	</form>
	

	<!-- 详细信息 begin  -->
	<form action="/machineNodeInform/saveInformDetailMachineNodeInform" name="informDetailMachineNodeInformForm" id="informDetailMachineNodeInformForm" method="post" enctype="multipart/form-data">
 	  <input name="id_MachineNodeInform" type="hidden" value="${MachineNodeInform.id_MachineNodeInform}"/>

      <input type="hidden" id="NumberMachineNode_informMachineNodeInformForm" value="" class="input" name="NumberMachineNode"/>
      <input type="hidden" id="NumberMachine_informMachineNodeInformForm" value="" class="input" name="NumberMachine"/>
      <input type="hidden" id="TypeMachineNode_informMachineNodeInformForm" value="" class="input" name="TypeMachineNode"/>
      <input type="hidden" id="DepartmentMachineNode_informMachineNodeInformForm" value="" class="input" name="DepartmentMachineNode"/>
      <input type="hidden" id="WorkshopMachineNode_informMachineNodeInformForm" value="$" class="input" name="WorkshopMachineNode"/>
      <input type="hidden" id="PositionMachineNode_informMachineNodeInformForm" value="" class="input" name="PositionMachineNode"/>
      <input type="hidden" id="UseFrequencyMachineNode_informMachineNodeInformForm" value="" class="input" name="UseFrequencyMachineNode"/>
      <input type="hidden" id="TimeUseMachineNode_informMachineNodeInformForm" value="" class="input" name="TimeUseMachineNode"/>
      <input type="hidden" id="TimeDestroyMachineNode_informMachineNodeInformForm" value="" class="input" name="TimeDestroyMachineNode"/>
	  <input type="hidden" value='${DwArray }'  name = 'DwArray'/>
	  <input type="hidden" value='${CjArray }'  name = 'CjArray'/>	
	  
 	  <li class="block bor_t"> 
 	    <span id="lititle">详细信息</span>
    	<input type="hidden" value="${array_InformDetailMachineNodeInform == null ? '' : array_InformDetailMachineNodeInform }" id="array_InformDetailMachineNodeInform" name="array_InformDetailMachineNodeInform"/>
    	<input type="hidden" value="${array_InformDetailMachineNodeInform_name == null ? '' : array_InformDetailMachineNodeInform_name }" id="array_InformDetailMachineNodeInform_name" name="array_InformDetailMachineNodeInform_name"/>
	    
	    <input type="file" accept=".pdf" name="InformDetailMachineNodeInform" id="InformDetailMachineNodeInform" />
	    <input type="button" value="加载文件" class="btn" onclick="onSaveInformDetailMachineInformList();"/>
	    <span id="span_InformDetailMachineNodeInformList">
	      <c:forEach items="${MachineNodeInform.informDetailMachineNodeInformList}" var="var" varStatus="vs">
	      	<div>
	      	  <span name='informDetailMachineNodeInforms_img' >${var.name_InformDetailMachineNodeInform }</span>
	      	  <a class="btn btn_shanchu" onclick='onDelInformDetailMachineNodeInformImg("${var.url_InformDetailMachineNodeInform }");'>删除</a>
	      	  <br/>
	      	</div>
	      </c:forEach>
	    </span>
 	  </li> 
 	</form>
  	<!-- 详细信息 end  -->
	<div class="clear"></div>
    
  </ul>
</div>
<div>
	<form action = "/machineNodeInform/loadingTool" id = "loadingTool" method="post">
		  <input type="hidden" id="id_MachineNodeInform_loadingTool" value = ""  class = "input" name="id_MachineNodeInform" />
		  <input type="hidden" id="NumberMachineNode_loadingTool" value="" class="input" name="NumberMachineNode"/>
	      <input type="hidden" id="NumberMachine_loadingTool" value="" class="input" name="NumberMachine"/>
	      <input type="hidden" id="TypeMachineNode_loadingTool" value="" class="input" name="TypeMachineNode"/>
	      <input type="hidden" id="DepartmentMachineNode_loadingTool" value="" class="input" name="DepartmentMachineNode"/>
	      <input type="hidden" id="WorkshopMachineNode_loadingTool" value="$" class="input" name="WorkshopMachineNode"/>
	      <input type="hidden" id="PositionMachineNode_loadingTool" value="" class="input" name="PositionMachineNode"/>
	      <input type="hidden" id="UseFrequencyMachineNode_loadingTool" value="" class="input" name="UseFrequencyMachineNode"/>
	      <input type="hidden" id="TimeUseMachineNode_loadingTool" value="" class="input" name="TimeUseMachineNode"/>
	      <input type="hidden" id="TimeDestroyMachineNode_loadingTool" value="" class="input" name="TimeDestroyMachineNode"/>
	      
	      <input type="hidden" id="array_InformDetailMachineNodeInform_loadingTool" name="array_InformDetailMachineNodeInform"/>
  	 	  <input type="hidden" id="array_InformDetailMachineNodeInform_name_loadingTool" name="array_InformDetailMachineNodeInform_name"/>
  	 	  <input type="hidden" value='${DwArray }' id='DwArray' name = 'DwArray'/>
		  <input type="hidden" value='${CjArray }' id='CjArray' name = 'CjArray'/>
	</form>
</div>

<script type="text/javascript">
    var data = null;

    $(document).ready(function(){

		var isoArray_str = $("#DwArray").val();
		var isoArray_str1 = $("#CjArray").val();
		data = eval(JSON.parse(isoArray_str)); 
		data1 = eval(JSON.parse(isoArray_str1));
		
        /* $(document).keydown(function(e){   	
        	
            e = e || window.event;
            var keycode = e.which ? e.which : e.keyCode;
            if(keycode == 38){//up
                if(jQuery.trim($("#append0").html())==""){
                    return;
                }else{
                	movePrev(0);
                }
                
                if(jQuery.trim($("#append1").html())==""){
                    return;
                }else{
                	movePrev(1);
                }
                
          
            }else if(keycode == 40){//down
                if(jQuery.trim($("#append0").html())==""){
                    return;
                }else{
                	
                	$("#DepartmentMachineNode_userForm").blur();
                    if($(".item0").hasClass("addbg")){
                        moveNext(0);
                    }else{
                        $(".item0").removeClass('addbg').eq(0).addClass('addbg');
                    }
                	
                }
            
            
                if(jQuery.trim($("#append1").html())==""){
                    return;
                }else{
                	
                	$("#WorkshopMachineNode_userForm").blur();
                    if($(".item1").hasClass("addbg")){
                        moveNext(1);
                    }else{
                        $(".item1").removeClass('addbg').eq(0).addClass('addbg');
                    }
                	
                }
            
            }else if(keycode == 13){//enter
                dojob(0);
                dojob(1);
            }
        });

        function movePrev(id){
        	
        	if(id == 0){
        		$("#DepartmentMachineNode_userForm").blur();
        	}else{
        		$("#WorkshopMachineNode_userForm").blur();
        	}    
            var index = $(".addbg").prevAll().length;
            if(index == 0){
                $(".item" + id).removeClass('addbg').eq($(".item" + id).length-1).addClass('addbg');
            }else{
                $(".item" + id).removeClass('addbg').eq(index-1).addClass('addbg');
            }
        };

        function moveNext(id){
 
            var index = $(".addbg").prevAll().length;
            if(index == $(".item" + id).length-1){
                $(".item" + id).removeClass('addbg').eq(0).addClass('addbg');
            }else{
                $(".item" + id).removeClass('addbg').eq(index+1).addClass('addbg');
            }

        };

        function dojob(id){
        	if(id == 0){
        		$("#DepartmentMachineNode_userForm").blur();
                var value = $(".addbg").text();
                $("#DepartmentMachineNode_userForm").val(value);
                $("#append" + id).hide().html("");
        	}else{
        		
        		$("#WorkshopMachineNode_userForm").blur();
                var value = $(".addbg").text();
                $("#WorkshopMachineNode_userForm").val(value);
                $("#append" + id).hide().html("");
        		
        	}
            
        } */
    });
    $("body").click(function(){
    	$(".append").hide().html("");
    });
    function getContent(obj){
        var DepartmentMachineNode_userForm = jQuery.trim($(obj).val());
        
        var dataId = $(obj).attr("data-id");//判断当前是哪个input触发的事件     
 
        if(DepartmentMachineNode_userForm == ""){
            $("#append" + dataId).hide().html("");
            return false;
        }
        
        
        if(dataId == 0){
        	//机床所在单位   
            var html = "";
            for (var i = 0; i < data.length; i++) {
                if (data[i].indexOf(DepartmentMachineNode_userForm) >= 0) {
                    html = html + "<div class='item item0' data-id='0'  onmouseenter='getFocus(this)' onClick='getCon(this);'>" + data[i] + "</div>"
                }
            }
            
            if(html != ""){
                $("#append0").show().html(html);
            }else{
                $("#append0").hide().html("");
            }
        }else{
        	
        	//机床车间
            var html1 = '';     
            for (var i = 0; i < data1.length; i++) {      	
                if (data1[i].indexOf(DepartmentMachineNode_userForm) >= 0) {          	
                    html1 = html1 + "<div class='item item1' data-id='1' onmouseenter='getFocus(this)' onClick='getCon(this);'>" + data1[i] + "</div>"
                }
            }
                 
            if(html1 != ""){
                $("#append1").show().html(html1);
            }else{
                $("#append1").hide().html("");
            }
        	
        }    
      
    }
    function getFocus(obj){
    	var dataId = $(obj).attr("data-id");
        $(".item" + dataId).removeClass("addbg");
        $(obj).addClass("addbg");
    }
    function getCon(obj){
        var value = $(obj).text();
        var dataId = $(obj).attr("data-id");
        if(dataId == 0){
        	$("#DepartmentMachineNode_userForm").val(value);
        }else{
        	$("#WorkshopMachineNode_userForm").val(value);
        }     
        $("#append" + dataId).hide().html("");
        event.stopPropagation();
    }
    
</script>
</body>

</html>
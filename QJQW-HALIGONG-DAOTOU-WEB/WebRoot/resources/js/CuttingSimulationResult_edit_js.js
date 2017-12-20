$(document).ready(function(){
	
		var array_ResultFileCutSim = $("#array_ResultFileCutSim").val();
		var array_ResultFileCutSim_name = $("#array_ResultFileCutSim_name").val();
		if(array_ResultFileCutSim != null && array_ResultFileCutSim != ''){
			var ResultFileCutSims= array_ResultFileCutSim.split(',');
			var ResultFileCutSims_name = array_ResultFileCutSim_name.split(',');
			var ResultFileCutSims_str = '';
			for(var i = 0; i < ResultFileCutSims.length; i++){
				if(ResultFileCutSims[i] != null && ResultFileCutSims[i] != ''){
					ResultFileCutSims_str = ResultFileCutSims_str + "<div><span name='ResultFileCutSims_img' url='"+ResultFileCutSims[i]+"' >"+ResultFileCutSims_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelResultFileCutSimImg(\""+ResultFileCutSims[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ResultFileCutSim").html(ResultFileCutSims_str);
		}
		
		var array_ForceFileCutSim = $("#array_ForceFileCutSim").val();
		var array_ForceFileCutSim_name = $("#array_ForceFileCutSim_name").val();
		if(array_ForceFileCutSim != null && array_ForceFileCutSim != ''){
			var ForceFileCutSims= array_ForceFileCutSim.split(',');
			var ForceFileCutSims_name = array_ForceFileCutSim_name.split(',');
			var ForceFileCutSims_str = '';
			for(var i = 0; i < ForceFileCutSims.length; i++){
				if(ForceFileCutSims[i] != null && ForceFileCutSims[i] != ''){
					ForceFileCutSims_str = ForceFileCutSims_str + "<div><span name='ForceFileCutSims_img' url='"+ForceFileCutSims[i]+"' >"+ForceFileCutSims_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelForceFileCutSimImg(\""+ForceFileCutSims[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ForceFileCutSim").html(ForceFileCutSims_str);
		}
		var array_TemperatureFileCutSim = $("#array_TemperatureFileCutSim").val();
		var array_TemperatureFileCutSim_name = $("#array_TemperatureFileCutSim_name").val();
		if(array_TemperatureFileCutSim != null && array_TemperatureFileCutSim != ''){
			var TemperatureFileCutSims= array_TemperatureFileCutSim.split(',');
			var TemperatureFileCutSims_name = array_TemperatureFileCutSim_name.split(',');
			var TemperatureFileCutSims_str = '';
			for(var i = 0; i < TemperatureFileCutSims.length; i++){
				if(TemperatureFileCutSims[i] != null && TemperatureFileCutSims[i] != ''){
					TemperatureFileCutSims_str = TemperatureFileCutSims_str + "<div><span name='TemperatureFileCutSims_img' url='"+TemperatureFileCutSims[i]+"' >"+TemperatureFileCutSims_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelTemperatureFileCutSimImg(\""+TemperatureFileCutSims[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_TemperatureFileCutSim").html(TemperatureFileCutSims_str);
		}
		var array_SurfaceStressFileCutSim = $("#array_SurfaceStressFileCutSim").val();
		var array_SurfaceStressFileCutSim_name = $("#array_SurfaceStressFileCutSim_name").val();
		if(array_SurfaceStressFileCutSim != null && array_SurfaceStressFileCutSim != ''){
			var SurfaceStressFileCutSims= array_SurfaceStressFileCutSim.split(',');
			var SurfaceStressFileCutSims_name = array_SurfaceStressFileCutSim_name.split(',');
			var SurfaceStressFileCutSims_str = '';
			for(var i = 0; i < SurfaceStressFileCutSims.length; i++){
				if(SurfaceStressFileCutSims[i] != null && SurfaceStressFileCutSims[i] != ''){
					SurfaceStressFileCutSims_str = SurfaceStressFileCutSims_str + "<div><span name='SurfaceStressFileCutSims_img' url='"+SurfaceStressFileCutSims[i]+"' >"+SurfaceStressFileCutSims_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelSurfaceStressFileCutSimImg(\""+SurfaceStressFileCutSims[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_SurfaceStressFileCutSim").html(SurfaceStressFileCutSims_str);
		}
		var array_ExReWearFile = $("#array_ExReWearFile").val();
		var array_ExReWearFile_name = $("#array_ExReWearFile_name").val();
		if(array_ExReWearFile != null && array_ExReWearFile != ''){
			var ExReWearFiles= array_ExReWearFile.split(',');
			var ExReWearFiles_name = array_ExReWearFile_name.split(',');
			var ExReWearFiles_str = '';
			for(var i = 0; i < ExReWearFiles.length; i++){
				if(ExReWearFiles[i] != null && ExReWearFiles[i] != ''){
					ExReWearFiles_str = ExReWearFiles_str + "<div><span name='ExReWearFiles_img' url='"+ExReWearFiles[i]+"' >"+ExReWearFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelExReWearFileImg(\""+ExReWearFiles[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ExReWearFile").html(ExReWearFiles_str);
		}
		var array_Defined1File = $("#array_Defined1File").val();
		var array_Defined1File_name = $("#array_Defined1File_name").val();
		if(array_Defined1File != null && array_Defined1File != ''){
			var Defined1Files= array_Defined1File.split(',');
			var Defined1Files_name = array_Defined1File_name.split(',');
			var Defined1Files_str = '';
			for(var i = 0; i < Defined1Files.length; i++){
				if(Defined1Files[i] != null && Defined1Files[i] != ''){
					Defined1Files_str = Defined1Files_str + "<div><span name='Defined1Files_img' url='"+Defined1Files[i]+"' >"+Defined1Files_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelDefined1FileImg(\""+Defined1Files[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_Defined1File").html(Defined1Files_str);
		}
		
		var array_Defined2File = $("#array_Defined2File").val();
		var array_Defined2File_name = $("#array_Defined2File_name").val();
		if(array_Defined2File != null && array_Defined2File != ''){
			var Defined2Files= array_Defined2File.split(',');
			var Defined2Files_name = array_Defined2File_name.split(',');
			var Defined2Files_str = '';
			for(var i = 0; i < Defined2Files.length; i++){
				if(Defined2Files[i] != null && Defined2Files[i] != ''){
					Defined2Files_str = Defined2Files_str + "<div><span name='Defined2Files_img' url='"+Defined2Files[i]+"' >"+Defined2Files_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelDefined2FileImg(\""+Defined2Files[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_Defined2File").html(Defined2Files_str);
		}
		var array_Defined3File = $("#array_Defined3File").val();
		var array_Defined3File_name = $("#array_Defined3File_name").val();
		if(array_Defined3File != null && array_Defined3File != ''){
			var Defined3Files= array_Defined3File.split(',');
			var Defined3Files_name = array_Defined3File_name.split(',');
			var Defined3Files_str = '';
			for(var i = 0; i < Defined3Files.length; i++){
				if(Defined3Files[i] != null && Defined3Files[i] != ''){
					Defined3Files_str = Defined3Files_str + "<div><span name='Defined3Files_img' url='"+Defined3Files[i]+"' >"+Defined3Files_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelDefined3FileImg(\""+Defined3Files[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_Defined3File").html(Defined3Files_str);
		}
		
	});

	function onDelPictureFileCutSimImg(url){
		var img_array = $("img[name='PictureFileCutSims_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url){
				$(img_array[i]).parent().remove();
				var array_PictureFileCutSim = $("#array_PictureFileCutSim").val();
				array_PictureFileCutSim = array_PictureFileCutSim.replace(url,'');
				$("#array_PictureFileCutSim").val(array_PictureFileCutSim);
			}
		}
	}

	function onDelResultFileCutSimImg(url){
		var img_array = $("span[name='ResultFileCutSims_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_ResultFileCutSim = $("#array_ResultFileCutSim").val();
				array_ResultFileCutSim = array_ResultFileCutSim.replace(url,'');
				$("#array_ResultFileCutSim").val(array_ResultFileCutSim);
			}
		}
	}

	function onDelForceFileCutSimImg(url){
		var img_array = $("span[name='ForceFileCutSims_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_ForceFileCutSim = $("#array_ForceFileCutSim").val();
				array_ForceFileCutSim = array_ForceFileCutSim.replace(url,'');
				$("#array_ForceFileCutSim").val(array_ForceFileCutSim);
			}
		}
	}

	function onDelTemperatureFileCutSimImg(url){
		var img_array = $("span[name='TemperatureFileCutSims_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_TemperatureFileCutSim = $("#array_TemperatureFileCutSim").val();
				array_TemperatureFileCutSim = array_TemperatureFileCutSim.replace(url,'');
				$("#array_TemperatureFileCutSim").val(array_TemperatureFileCutSim);
			}
		}
	}

	function onDelChipShapePicCutSimImg(url){
		var img_array = $("img[name='ChipShapePicCutSims_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods"+url){
				$(img_array[i]).parent().remove();
				var array_ChipShapePicCutSim = $("#array_ChipShapePicCutSim").val();
				array_ChipShapePicCutSim = array_ChipShapePicCutSim.replace(url,'');
				$("#array_ChipShapePicCutSim").val(array_ChipShapePicCutSim);
			}
		}
	}

	function onDelSurfaceStressFileCutSimImg(url){
		var img_array = $("span[name='SurfaceStressFileCutSims_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_SurfaceStressFileCutSim = $("#array_SurfaceStressFileCutSim").val();
				array_SurfaceStressFileCutSim = array_SurfaceStressFileCutSim.replace(url,'');
				$("#array_SurfaceStressFileCutSim").val(array_SurfaceStressFileCutSim);
			}
		}
	}

	function onDelExReWearFileImg(url){
		var img_array = $("span[name='ExReWearFiles_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_ExReWearFile = $("#array_ExReWearFile").val();
				array_ExReWearFile = array_ExReWearFile.replace(url,'');
				$("#array_ExReWearFile").val(array_ExReWearFile);
			}
		}
	}

	function onDelExReWearPictureImg(url){
		var img_array = $("img[name='ExReWearPictures_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("src") == "/goods" + url){
				$(img_array[i]).parent().remove();
				var array_ExReWearPicture = $("#array_ExReWearPicture").val();
				array_ExReWearPicture = array_ExReWearPicture.replace(url,'');
				$("#array_ExReWearPicture").val(array_ExReWearPicture);
			}
		}
	}

	function onDelDefined1FileImg(url){
		var img_array = $("span[name='Defined1Files_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_Defined1File = $("#array_Defined1File").val();
				array_Defined1File = array_Defined1File.replace(url,'');
				$("#array_Defined1File").val(array_Defined1File);
			}
		}
	}

	function onDelDefined2FileImg(url){
		var img_array = $("span[name='Defined2Files_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_Defined2File = $("#array_Defined2File").val();
				array_Defined2File = array_Defined2File.replace(url,'');
				$("#array_Defined2File").val(array_Defined2File);
			}
		}
	}

	function onDelDefined3FileImg(url){
		var img_array = $("span[name='Defined3Files_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_Defined3File = $("#array_Defined3File").val();
				array_Defined3File = array_Defined3File.replace(url,'');
				$("#array_Defined3File").val(array_Defined3File);
			}
		}
	}
	


	//上传图片
	function onSaveResultFile(ascription){
		var file = null;
		if("ResultFileCutSim"==ascription){
			file = $("#ResultFileCutSim").get(0).files[0]; //选择上传的文件
		}
		else if("ForceFileCutSim"==ascription){
			file = $("#ForceFileCutSim").get(0).files[0]; //选择上传的文件
		}
		else if("TemperatureFileCutSim"==ascription){
			file = $("#TemperatureFileCutSim").get(0).files[0]; //选择上传的文件
		}
		else if("SurfaceStressFileCutSim"==ascription){
			file = $("#SurfaceStressFileCutSim").get(0).files[0]; //选择上传的文件
		}
		else if("ExReWearFile"==ascription){
			file = $("#ExReWearFile").get(0).files[0]; //选择上传的文件
		}
		else if("Defined1File"==ascription){
			file = $("#Defined1File").get(0).files[0]; //选择上传的文件
		}
		else if("Defined2File"==ascription){
			file = $("#Defined2File").get(0).files[0]; //选择上传的文件
		}
		else if("Defined3File"==ascription){
			file = $("#Defined3File").get(0).files[0]; //选择上传的文件
		}
		if(file==null||file==""){
			alert("请选择文件");
			return false;
		}
		var formData = new FormData();
		formData.append("resultFile",file);
		formData.append("ascription",ascription);
		
		$.ajax({  
	          url: '/CuttingSimulationResult/saveResultFile' ,  
	          type: 'POST',  
	          data: formData,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  if(data.ascription=="ResultFileCutSim"){
		            	  $("#span_ResultFileCutSim").append("<div><span name='ResultFileCutSims_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelResultFileCutSimImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#ResultFileCutSim").remove();
		            	  $("#span_input_ResultFileCutSim").html('<input type="file" name="ResultFileCutSim" id="ResultFileCutSim" />');
		            	  var array_ResultFileCutSim = $("#array_ResultFileCutSim").val();
		            	  var array_ResultFileCutSim_name = $("#array_ResultFileCutSim_name").val();
		            	  array_ResultFileCutSim_name = array_ResultFileCutSim_name + data.fileName + ",";
		            	  array_ResultFileCutSim = array_ResultFileCutSim + data.url + "," ;
		            	  $("#array_ResultFileCutSim").val(array_ResultFileCutSim);
		            	  $("#array_ResultFileCutSim_name").val(array_ResultFileCutSim_name);
	            	  }
	            	  if(data.ascription=="ForceFileCutSim"){
		            	  $("#span_ForceFileCutSim").append("<div><span name='ForceFileCutSims_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelForceFileCutSimImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#ForceFileCutSim").remove();
		            	  $("#span_input_ForceFileCutSim").html('<input type="file" name="ForceFileCutSim" id="ForceFileCutSim" />');
		            	  var array_ForceFileCutSim = $("#array_ForceFileCutSim").val();
		            	  var array_ForceFileCutSim_name = $("#array_ForceFileCutSim_name").val();
		            	  array_ForceFileCutSim_name = array_ForceFileCutSim_name + data.fileName + ",";
		            	  array_ForceFileCutSim = array_ForceFileCutSim + data.url + "," ;
		            	  $("#array_ForceFileCutSim").val(array_ForceFileCutSim);
		            	  $("#array_ForceFileCutSim_name").val(array_ForceFileCutSim_name);
	            	  }
	            	  if(data.ascription=="TemperatureFileCutSim"){
		            	  $("#span_TemperatureFileCutSim").append("<div><span name='TemperatureFileCutSims_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelTemperatureFileCutSimImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#TemperatureFileCutSim").remove();
		            	  $("#span_input_TemperatureFileCutSim").html('<input type="file" name="TemperatureFileCutSim" id="TemperatureFileCutSim" />');
		            	  var array_TemperatureFileCutSim = $("#array_TemperatureFileCutSim").val();
		            	  var array_TemperatureFileCutSim_name = $("#array_TemperatureFileCutSim_name").val();
		            	  array_TemperatureFileCutSim_name = array_TemperatureFileCutSim_name + data.fileName + ",";
		            	  array_TemperatureFileCutSim = array_TemperatureFileCutSim + data.url + "," ;
		            	  $("#array_TemperatureFileCutSim").val(array_TemperatureFileCutSim);
		            	  $("#array_TemperatureFileCutSim_name").val(array_TemperatureFileCutSim_name);
	            	  }
	            	  if(data.ascription=="SurfaceStressFileCutSim"){
		            	  $("#span_SurfaceStressFileCutSim").append("<div><span name='SurfaceStressFileCutSims_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelSurfaceStressFileCutSimImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#SurfaceStressFileCutSim").remove();
		            	  $("#span_input_SurfaceStressFileCutSim").html('<input type="file" name="SurfaceStressFileCutSim" id="SurfaceStressFileCutSim" />');
		            	  var array_SurfaceStressFileCutSim = $("#array_SurfaceStressFileCutSim").val();
		            	  var array_SurfaceStressFileCutSim_name = $("#array_SurfaceStressFileCutSim_name").val();
		            	  array_SurfaceStressFileCutSim_name = array_SurfaceStressFileCutSim_name + data.fileName + ",";
		            	  array_SurfaceStressFileCutSim = array_SurfaceStressFileCutSim + data.url + "," ;
		            	  $("#array_SurfaceStressFileCutSim").val(array_SurfaceStressFileCutSim);
		            	  $("#array_SurfaceStressFileCutSim_name").val(array_SurfaceStressFileCutSim_name);
	            	  }
	            	  if(data.ascription=="ExReWearFile"){
		            	  $("#span_ExReWearFile").append("<div><span name='ExReWearFiles_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelExReWearFileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#ExReWearFile").remove();
		            	  $("#span_input_ExReWearFile").html('<input type="file" name="ExReWearFile" id="ExReWearFile" />');
		            	  var array_ExReWearFile = $("#array_ExReWearFile").val();
		            	  var array_ExReWearFile_name = $("#array_ExReWearFile_name").val();
		            	  array_ExReWearFile_name = array_ExReWearFile_name + data.fileName + ",";
		            	  array_ExReWearFile = array_ExReWearFile + data.url + "," ;
		            	  $("#array_ExReWearFile").val(array_ExReWearFile);
		            	  $("#array_ExReWearFile_name").val(array_ExReWearFile_name);
	            	  }
	            	  if(data.ascription=="Defined1File"){
		            	  $("#span_Defined1File").append("<div><span name='Defined1Files_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelDefined1FileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#Defined1File").remove();
		            	  $("#span_input_Defined1File").html('<input type="file" name="Defined1File" id="Defined1File" />');
		            	  var array_Defined1File = $("#array_Defined1File").val();
		            	  var array_Defined1File_name = $("#array_Defined1File_name").val();
		            	  array_Defined1File_name = array_Defined1File_name + data.fileName + ",";
		            	  array_Defined1File = array_Defined1File + data.url + "," ;
		            	  $("#array_Defined1File").val(array_Defined1File);
		            	  $("#array_Defined1File_name").val(array_Defined1File_name);
	            	  }
	            	  if(data.ascription=="Defined2File"){
		            	  $("#span_Defined2File").append("<div><span name='Defined2Files_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelDefined2FileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#Defined2File").remove();
		            	  $("#span_input_Defined2File").html('<input type="file" name="Defined2File" id="Defined2File" />');
		            	  var array_Defined2File = $("#array_Defined2File").val();
		            	  var array_Defined2File_name = $("#array_Defined2File_name").val();
		            	  array_Defined2File_name = array_Defined2File_name + data.fileName + ",";
		            	  array_Defined2File = array_Defined2File + data.url + "," ;
		            	  $("#array_Defined2File").val(array_Defined2File);
		            	  $("#array_Defined2File_name").val(array_Defined2File_name);
	            	  }
	            	  if(data.ascription=="Defined3File"){
		            	  $("#span_Defined3File").append("<div><span name='Defined3Files_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelDefined3FileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#Defined3File").remove();
		            	  $("#span_input_Defined3File").html('<input type="file" name="Defined3File" id="Defined3File" />');
		            	  var array_Defined3File = $("#array_Defined3File").val();
		            	  var array_Defined3File_name = $("#array_Defined3File_name").val();
		            	  array_Defined3File_name = array_Defined3File_name + data.fileName + ",";
		            	  array_Defined3File = array_Defined3File + data.url + "," ;
		            	  $("#array_Defined3File").val(array_Defined3File);
		            	  $("#array_Defined3File_name").val(array_Defined3File_name);
	            	  }
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}

	
	
	
	
	
	
	

	function editCl(id){
		var clTdLength = $("#clTable td").length;//table列数
		var dataName = $(id).attr("data-name");
		if(dataName == 0){//点击的之前是编辑状态，需变为“保存”
			$("#btn_add_ExReWearTimeAndValue").show();
			$(id).attr("data-name","1");
				$(id).val("保存");
		}else{
			$("#btn_add_ExReWearTimeAndValue").hide();
			$(id).attr("data-name","0");
				$(id).val("点击输入");
		}
		if(clTdLength != 0) {
			
			
			if(dataName == 0){//点击的之前是编辑状态，需变为“保存”
				
				htmlInput = '<input type="text" />';
				var inputs1 = $("#clTable td.edit_1");
				var inputs2 = $("#clTable td.edit_2");
				for(var i = 0;i<inputs1.length;i++){
					$(inputs1[i]).html('<input type="text" value="'+$(inputs1[i]).text()+'" />');
					$(inputs2[i]).html('<input type="text" value="'+$(inputs2[i]).text()+'" />');
					
				}
				
			}else{
				var ExReWearTimeAndValue_str = '';
				
				//执行保存事件
				var inputs1 = $("#clTable td.edit_1");
				var inputs2 = $("#clTable td.edit_2");
				for(var i = 0;i<inputs1.length;i++){
					ExReWearTimeAndValue_str = ExReWearTimeAndValue_str + ($(inputs1[i]).children('input').val()==""?" ":$(inputs1[i]).children('input').val()) + "-" + ($(inputs2[i]).children('input').val()==""?" ":$(inputs2[i]).children('input').val()) + ",";
					$("#ExReWearTimeAndValue_userForm").val(ExReWearTimeAndValue_str);
					$(inputs1[i]).html($(inputs1[i]).children('input').val());
					$(inputs2[i]).html($(inputs2[i]).children('input').val());
				}
				$("#clTable td.edit input").remove();//td变为不可编辑
				
			}
		}
	}




	//添加材料
	function addCl(id){
		var dataName = $(id).attr("data-name");
		
		var clTdLength = document.getElementById("clTable").rows.item(0).cells.length;//材料table列数
		
		
		var addTrId = $("#clTable tr.cl_tr_0 td").eq(clTdLength-2).attr("id");//获取table表格最后一列的td的ID
		
		
		if(addTrId != undefined || addTrId != null){
			addTrIdNum = parseInt(addTrId.substring(addTrId.lastIndexOf("td")+2));
			var clTrLength = $("#clTable tr").length;//材料table行数
			var htmlTr = new Array();
			htmlTr[0] = '<td class="td edit_1" id="cl_tr0_td' + (addTrIdNum+1)  +'"><input type="text" value=" " /></td>';
			htmlTr[1] = '<td class="td edit_2" id="cl_tr1_td' + (addTrIdNum+1)  +'"><input type="text" value=" " /></td>';
			htmlTr[2] = '<td class="td" id="cl_tr2_td' + (addTrIdNum+1)  +'"><a class="btn btn_bg_orange b_block" onclick="delCl(' + (addTrIdNum+1) + ')">删除</a></td>';
			for(var i=0;i<clTrLength;i++){
				$(".cl_tr_" + i).append(htmlTr[i]);
			}
	
		}else{
		
			var clTrLength = $("#clTable tr").length;//材料table行数

			var htmlTr = new Array();
	
			htmlTr[0] = '<td class="td edit_1" id="cl_tr0_td' + (clTdLength-1)  +'"><input type="text" value=" " /></td>';
			htmlTr[1] = '<td class="td edit_2" id="cl_tr1_td' + (clTdLength-1)  +'"><input type="text" value=" " /></td>';
			htmlTr[2] = '<td class="td" id="cl_tr2_td' + (clTdLength-1)  +'"><a class="btn btn_bg_orange b_block" onclick="delCl(' + (clTdLength-1) + ')">删除</a></td>';
			for(var i=0;i<clTrLength;i++){
				$(".cl_tr_" + i).append(htmlTr[i]);
			}
		}
	}
	//删除材料整列
	function delCl(id){
		var dataName = $("#ExReWearTimeAndValue_btn").attr("data-name");
		var str = '';
		if(dataName == 0){//保存
			str = str + $("#cl_tr" + 0 + "_td" + id ).html() + "-";
			str = str + $("#cl_tr" + 1 + "_td" + id ).html() + ",";
		}else{//点击输入
			str = str + $("#cl_tr" + 0 + "_td" + id + " input").val() + "-";
			str = str + $("#cl_tr" + 1 + "_td" + id + " input").val() + ",";
		}
		if(confirm("确定要删除吗?")){
			var clTrLength = $("#clTable tr").length;//材料table行数
			for(var i=0;i<clTrLength;i++){
				$("#cl_tr" + i + "_td" + id).remove();
				var ExReWearTimeAndValue = $("#ExReWearTimeAndValue_userForm").val();
				ExReWearTimeAndValue = ExReWearTimeAndValue.replace(str, '');
				$("#ExReWearTimeAndValue_userForm").val(ExReWearTimeAndValue);
				
			}
		}
	}




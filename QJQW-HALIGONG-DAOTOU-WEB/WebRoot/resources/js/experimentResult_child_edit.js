$(document).ready(function(){
	
		//加载图片到页面
		var array_ExReForceFile = $("#array_ExReForceFile").val();
		var array_ExReForceFile_name = $("#array_ExReForceFile_name").val();
		if(array_ExReForceFile != null && array_ExReForceFile != ''){
			var ExReForceFiles= array_ExReForceFile.split(',');
			var ExReForceFiles_name = array_ExReForceFile_name.split(',');
			var ExReForceFiles_str = '';
			for(var i = 0; i < ExReForceFiles.length; i++){
				if(ExReForceFiles[i] != null && ExReForceFiles[i] != ''){
					ExReForceFiles_str = ExReForceFiles_str + "<div><span name='ExReForceFiles_img' url='"+ExReForceFiles[i]+"' >"+ExReForceFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelExReForceFileImg(\""+ExReForceFiles[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ExReForceFile").html(ExReForceFiles_str);
		}
		
		var array_ExReTemperatureFile = $("#array_ExReTemperatureFile").val();
		var array_ExReTemperatureFile_name = $("#array_ExReTemperatureFile_name").val();
		if(array_ExReTemperatureFile != null && array_ExReTemperatureFile != ''){
			var ExReTemperatureFiles= array_ExReTemperatureFile.split(',');
			var ExReTemperatureFiles_name = array_ExReTemperatureFile_name.split(',');
			var ExReTemperatureFiles_str = '';
			for(var i = 0; i < ExReTemperatureFiles.length; i++){
				if(ExReTemperatureFiles[i] != null && ExReTemperatureFiles[i] != ''){
					ExReTemperatureFiles_str = ExReTemperatureFiles_str + "<div><span name='ExReTemperatureFiles_img' url='"+ExReTemperatureFiles[i]+"' >"+ExReTemperatureFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelExReTemperatureFileImg(\""+ExReTemperatureFiles[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ExReTemperatureFile").html(ExReTemperatureFiles_str);
		}
	
		
		var array_SurfaceFile = $("#array_SurfaceFile").val();
		var array_SurfaceFile_name = $("#array_SurfaceFile_name").val();
		if(array_SurfaceFile != null && array_SurfaceFile != ''){
			var SurfaceFiles= array_SurfaceFile.split(',');
			var SurfaceFiles_name = array_SurfaceFile_name.split(',');
			var SurfaceFiles_str = '';
			for(var i = 0; i < SurfaceFiles.length; i++){
				if(SurfaceFiles[i] != null && SurfaceFiles[i] != ''){
					SurfaceFiles_str = SurfaceFiles_str + "<div><span name='SurfaceFiles_img' url='"+SurfaceFiles[i]+"' >"+SurfaceFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelSurfaceFileImg(\""+SurfaceFiles[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_SurfaceFile").html(SurfaceFiles_str);
		}
		
		
		var array_ShapeFile = $("#array_ShapeFile").val();
		var array_ShapeFile_name = $("#array_ShapeFile_name").val();
		if(array_ShapeFile != null && array_ShapeFile != ''){
			var ShapeFiles= array_ShapeFile.split(',');
			var ShapeFiles_name = array_ShapeFile_name.split(',');
			var ShapeFiles_str = '';
			for(var i = 0; i < ShapeFiles.length; i++){
				if(ShapeFiles[i] != null && ShapeFiles[i] != ''){
					ShapeFiles_str = ShapeFiles_str + "<div><span name='ShapeFiles_img' url='"+ShapeFiles[i]+"' >"+ShapeFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelShapeFileImg(\""+ShapeFiles[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ShapeFile").html(ShapeFiles_str);
		}
		
		var array_SurfaceRoughnessFile = $("#array_SurfaceRoughnessFile").val();
		var array_SurfaceRoughnessFile_name = $("#array_SurfaceRoughnessFile_name").val();
		if(array_SurfaceRoughnessFile != null && array_SurfaceRoughnessFile != ''){
			var SurfaceRoughnessFiles= array_SurfaceRoughnessFile.split(',');
			var SurfaceRoughnessFiles_name = array_SurfaceRoughnessFile_name.split(',');
			var SurfaceRoughnessFiles_str = '';
			for(var i = 0; i < SurfaceRoughnessFiles.length; i++){
				if(SurfaceRoughnessFiles[i] != null && SurfaceRoughnessFiles[i] != ''){
					SurfaceRoughnessFiles_str = SurfaceRoughnessFiles_str + "<div><span name='SurfaceRoughnessFiles_img' url='"+SurfaceRoughnessFiles[i]+"' >"+SurfaceRoughnessFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelSurfaceRoughnessFileImg(\""+SurfaceRoughnessFiles[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_SurfaceRoughnessFile").html(SurfaceRoughnessFiles_str);
		}
	
		var array_SurfaceHardnessFile = $("#array_SurfaceHardnessFile").val();
		var array_SurfaceHardnessFile_name = $("#array_SurfaceHardnessFile_name").val();
		if(array_SurfaceHardnessFile != null && array_SurfaceHardnessFile != ''){
			var SurfaceHardnessFiles= array_SurfaceHardnessFile.split(',');
			var SurfaceHardnessFiles_name = array_SurfaceHardnessFile_name.split(',');
			var SurfaceHardnessFiles_str = '';
			for(var i = 0; i < SurfaceHardnessFiles.length; i++){
				if(SurfaceHardnessFiles[i] != null && SurfaceHardnessFiles[i] != ''){
					SurfaceHardnessFiles_str = SurfaceHardnessFiles_str + "<div><span name='SurfaceHardnessFiles_img' url='"+SurfaceHardnessFiles[i]+"' >"+SurfaceHardnessFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelSurfaceHardnessFileImg(\""+SurfaceHardnessFiles[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_SurfaceHardnessFile").html(SurfaceHardnessFiles_str);
		}
		
		var array_ExReSectionHardnessFile = $("#array_ExReSectionHardnessFile").val();
		var array_ExReSectionHardnessFile_name = $("#array_ExReSectionHardnessFile_name").val();
		if(array_ExReSectionHardnessFile != null && array_ExReSectionHardnessFile != ''){
			var ExReSectionHardnessFiles= array_ExReSectionHardnessFile.split(',');
			var ExReSectionHardnessFiles_name = array_ExReSectionHardnessFile_name.split(',');
			var ExReSectionHardnessFiles_str = '';
			for(var i = 0; i < ExReSectionHardnessFiles.length; i++){
				if(ExReSectionHardnessFiles[i] != null && ExReSectionHardnessFiles[i] != ''){
					ExReSectionHardnessFiles_str = ExReSectionHardnessFiles_str + "<div><span name='ExReSectionHardnessFiles_img' url='"+ExReSectionHardnessFiles[i]+"' >"+ExReSectionHardnessFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelExReSectionHardnessFileImg(\""+ExReSectionHardnessFiles[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ExReSectionHardnessFile").html(ExReSectionHardnessFiles_str);
		}
		
		var array_ExReSurfaceStressFile = $("#array_ExReSurfaceStressFile").val();
		var array_ExReSurfaceStressFile_name = $("#array_ExReSurfaceStressFile_name").val();
		if(array_ExReSurfaceStressFile != null && array_ExReSurfaceStressFile != ''){
			var ExReSurfaceStressFiles= array_ExReSurfaceStressFile.split(',');
			var ExReSurfaceStressFiles_name = array_ExReSurfaceStressFile_name.split(',');
			var ExReSurfaceStressFiles_str = '';
			for(var i = 0; i < ExReSurfaceStressFiles.length; i++){
				if(ExReSurfaceStressFiles[i] != null && ExReSurfaceStressFiles[i] != ''){
					ExReSurfaceStressFiles_str = ExReSurfaceStressFiles_str + "<div><span name='ExReSurfaceStressFiles_img' url='"+ExReSurfaceStressFiles[i]+"' >"+ExReSurfaceStressFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelExReSurfaceStressFileImg(\""+ExReSurfaceStressFiles[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ExReSurfaceStressFile").html(ExReSurfaceStressFiles_str);
		}
		
		var array_ExReSectionStressFile = $("#array_ExReSectionStressFile").val();
		var array_ExReSectionStressFile_name = $("#array_ExReSectionStressFile_name").val();
		if(array_ExReSectionStressFile != null && array_ExReSectionStressFile != ''){
			var ExReSectionStressFiles= array_ExReSectionStressFile.split(',');
			var ExReSectionStressFiles_name = array_ExReSectionStressFile_name.split(',');
			var ExReSectionStressFiles_str = '';
			for(var i = 0; i < ExReSectionStressFiles.length; i++){
				if(ExReSectionStressFiles[i] != null && ExReSectionStressFiles[i] != ''){
					ExReSectionStressFiles_str = ExReSectionStressFiles_str + "<div><span name='ExReSectionStressFiles_img' url='"+ExReSectionStressFiles[i]+"' >"+ExReSectionStressFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelExReSectionStressFileImg(\""+ExReSectionStressFiles[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ExReSectionStressFile").html(ExReSectionStressFiles_str);
		}
		
		var array_ExReDefined1File = $("#array_ExReDefined1File").val();
		var array_ExReDefined1File_name = $("#array_ExReDefined1File_name").val();
		if(array_ExReDefined1File != null && array_ExReDefined1File != ''){
			var ExReDefined1Files= array_ExReDefined1File.split(',');
			var ExReDefined1Files_name = array_ExReDefined1File_name.split(',');
			var ExReDefined1Files_str = '';
			for(var i = 0; i < ExReDefined1Files.length; i++){
				if(ExReDefined1Files[i] != null && ExReDefined1Files[i] != ''){
					ExReDefined1Files_str = ExReDefined1Files_str + "<div><span name='ExReDefined1Files_img' url='"+ExReDefined1Files[i]+"' >"+ExReDefined1Files_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelExReDefined1FileImg(\""+ExReDefined1Files[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ExReDefined1File").html(ExReDefined1Files_str);
		}
		
		var array_ExReDefined2File = $("#array_ExReDefined2File").val();
		var array_ExReDefined2File_name = $("#array_ExReDefined2File_name").val();
		if(array_ExReDefined2File != null && array_ExReDefined2File != ''){
			var ExReDefined2Files= array_ExReDefined2File.split(',');
			var ExReDefined2Files_name = array_ExReDefined2File_name.split(',');
			var ExReDefined2Files_str = '';
			for(var i = 0; i < ExReDefined2Files.length; i++){
				if(ExReDefined2Files[i] != null && ExReDefined2Files[i] != ''){
					ExReDefined2Files_str = ExReDefined2Files_str + "<div><span name='ExReDefined2Files_img' url='"+ExReDefined2Files[i]+"' >"+ExReDefined2Files_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelExReDefined2FileImg(\""+ExReDefined2Files[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ExReDefined2File").html(ExReDefined2Files_str);
		}
		
		var array_ExReDefined3File = $("#array_ExReDefined3File").val();
		var array_ExReDefined3File_name = $("#array_ExReDefined3File_name").val();
		if(array_ExReDefined3File != null && array_ExReDefined3File != ''){
			var ExReDefined3Files= array_ExReDefined3File.split(',');
			var ExReDefined3Files_name = array_ExReDefined3File_name.split(',');
			var ExReDefined3Files_str = '';
			for(var i = 0; i < ExReDefined3Files.length; i++){
				if(ExReDefined3Files[i] != null && ExReDefined3Files[i] != ''){
					ExReDefined3Files_str = ExReDefined3Files_str + "<div><span name='ExReDefined3Files_img' url='"+ExReDefined3Files[i]+"' >"+ExReDefined3Files_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelExReDefined3FileImg(\""+ExReDefined3Files[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ExReDefined3File").html(ExReDefined3Files_str);
		}
		
		var array_ExReDefined4File = $("#array_ExReDefined4File").val();
		var array_ExReDefined4File_name = $("#array_ExReDefined4File_name").val();
		if(array_ExReDefined4File != null && array_ExReDefined4File != ''){
			var ExReDefined4Files= array_ExReDefined4File.split(',');
			var ExReDefined4Files_name = array_ExReDefined4File_name.split(',');
			var ExReDefined4Files_str = '';
			for(var i = 0; i < ExReDefined4Files.length; i++){
				if(ExReDefined4Files[i] != null && ExReDefined4Files[i] != ''){
					ExReDefined4Files_str = ExReDefined4Files_str + "<div><span name='ExReDefined4Files_img' url='"+ExReDefined4Files[i]+"' >"+ExReDefined4Files_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelExReDefined4FileImg(\""+ExReDefined4Files[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ExReDefined4File").html(ExReDefined4Files_str);
		}
		
		var array_ExReDefined5File = $("#array_ExReDefined5File").val();
		var array_ExReDefined5File_name = $("#array_ExReDefined5File_name").val();
		if(array_ExReDefined5File != null && array_ExReDefined5File != ''){
			var ExReDefined5Files= array_ExReDefined5File.split(',');
			var ExReDefined5Files_name = array_ExReDefined5File_name.split(',');
			var ExReDefined5Files_str = '';
			for(var i = 0; i < ExReDefined5Files.length; i++){
				if(ExReDefined5Files[i] != null && ExReDefined5Files[i] != ''){
					ExReDefined5Files_str = ExReDefined5Files_str + "<div><span name='ExReDefined5Files_img' url='"+ExReDefined5Files[i]+"' >"+ExReDefined5Files_name[i]+"</span><a class='btn btn_shanchu' onclick='onDelExReDefined5FileImg(\""+ExReDefined5Files[i]+"\");'>删除</a><br/></div>";
				}
			}
			$("#span_ExReDefined5File").html(ExReDefined5Files_str);
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
		
		
		/* ExReQianDaoPictures_img  ExReHouDaoPictures_img   ExReDaojianPictures_img   ExReotherPictures_img */
		var trNum = $("#trNum").val();
		for(var i = 0 ; i<trNum ;i++){
			var img_array = $("input[name=ExReQianDaoPicture_img"+i+"]");
			for(var j = 0;j<img_array.length;j++){
				var val = $("#array_ExReQianDaoPicture"+i).val();
				val = val + $(img_array[j]).val()+",";
				$("#array_ExReQianDaoPicture"+i).val(val);
			}
			var img_array1 = $("input[name=ExReHouDaoPicture_img"+i+"]");
			for(var j= 0;j<img_array1.length;j++){
				var val = $("#array_ExReHouDaoPicture"+i).val();
				val += $(img_array1[j]).val()+",";
				$("#array_ExReHouDaoPicture"+i).val(val);
			}
			var img_array2 = $("input[name=ExReDaojianPicture_img"+i+"]");
			for(var j= 0;j<img_array2.length;j++){
				var val = $("#array_ExReDaojianPicture"+i).val();
				val += $(img_array2[j]).val()+",";
				$("#array_ExReDaojianPicture"+i).val(val);
			}
			var img_array3 = $("input[name=ExReotherPicture_img"+i+"]");
			for(var j= 0;j<img_array3.length;j++){
				var val = $("#array_ExReotherPicture"+i).val();
				val += $(img_array3[j]).val()+",";
				$("#array_ExReotherPicture"+i).val(val);
			}
		}
		
		
	});
	
	//删除
	function onDelExReForceFileImg(url){
		var img_array = $("span[name='ExReForceFiles_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_ExReForceFile = $("#array_ExReForceFile").val();
				array_ExReForceFile = array_ExReForceFile.replace(url,'');
				$("#array_ExReForceFile").val(array_ExReForceFile);
			}
		}
	}
	function onDelExReTemperatureFileImg(url){
		var img_array = $("span[name='ExReTemperatureFiles_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_ExReTemperatureFile = $("#array_ExReTemperatureFile").val();
				array_ExReTemperatureFile = array_ExReTemperatureFile.replace(url,'');
				$("#array_ExReTemperatureFile").val(array_ExReTemperatureFile);
			}
		}
	}
	function onDelSurfaceFileImg(url){
		var img_array = $("span[name='SurfaceFiles_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_SurfaceFile = $("#array_SurfaceFile").val();
				array_SurfaceFile = array_SurfaceFile.replace(url,'');
				$("#array_SurfaceFile").val(array_SurfaceFile);
			}
		}
	}
	function onDelShapeFileImg(url){
		var img_array = $("span[name='ShapeFiles_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_ShapeFile = $("#array_ShapeFile").val();
				array_ShapeFile = array_ShapeFile.replace(url,'');
				$("#array_ShapeFile").val(array_ShapeFile);
			}
		}
	}
	function onDelSurfaceRoughnessFileImg(url){
		var img_array = $("span[name='SurfaceRoughnessFiles_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_SurfaceRoughnessFile = $("#array_SurfaceRoughnessFile").val();
				array_SurfaceRoughnessFile = array_SurfaceRoughnessFile.replace(url,'');
				$("#array_SurfaceRoughnessFile").val(array_SurfaceRoughnessFile);
			}
		}
	}
	function onDelSurfaceHardnessFileImg(url){
		var img_array = $("span[name='SurfaceHardnessFiles_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_SurfaceHardnessFile = $("#array_SurfaceHardnessFile").val();
				array_SurfaceHardnessFile = array_SurfaceHardnessFile.replace(url,'');
				$("#array_SurfaceHardnessFile").val(array_SurfaceHardnessFile);
			}
		}
	}
	function onDelExReSectionHardnessFileImg(url){
		var img_array = $("span[name='ExReSectionHardnessFiles_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_ExReSectionHardnessFile = $("#array_ExReSectionHardnessFile").val();
				array_ExReSectionHardnessFile = array_ExReSectionHardnessFile.replace(url,'');
				$("#array_ExReSectionHardnessFile").val(array_ExReSectionHardnessFile);
			}
		}
	}
	function onDelExReSurfaceStressFileImg(url){
		var img_array = $("span[name='ExReSurfaceStressFiles_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_ExReSurfaceStressFile = $("#array_ExReSurfaceStressFile").val();
				array_ExReSurfaceStressFile = array_ExReSurfaceStressFile.replace(url,'');
				$("#array_ExReSurfaceStressFile").val(array_ExReSurfaceStressFile);
			}
		}
	}
	function onDelExReSectionStressFileImg(url){
		var img_array = $("span[name='ExReSectionStressFiles_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_ExReSectionStressFile = $("#array_ExReSectionStressFile").val();
				array_ExReSectionStressFile = array_ExReSectionStressFile.replace(url,'');
				$("#array_ExReSectionStressFile").val(array_ExReSectionStressFile);
			}
		}
	}
	function onDelExReDefined1FileImg(url){
		var img_array = $("span[name='ExReDefined1Files_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_ExReDefined1File = $("#array_ExReDefined1File").val();
				array_ExReDefined1File = array_ExReDefined1File.replace(url,'');
				$("#array_ExReDefined1File").val(array_ExReDefined1File);
			}
		}
	}
	function onDelExReDefined2FileImg(url){
		var img_array = $("span[name='ExReDefined2Files_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_ExReDefined2File = $("#array_ExReDefined2File").val();
				array_ExReDefined2File = array_ExReDefined2File.replace(url,'');
				$("#array_ExReDefined2File").val(array_ExReDefined2File);
			}
		}
	}
	function onDelExReDefined3FileImg(url){
		var img_array = $("span[name='ExReDefined3Files_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_ExReDefined3File = $("#array_ExReDefined3File").val();
				array_ExReDefined3File = array_ExReDefined3File.replace(url,'');
				$("#array_ExReDefined3File").val(array_ExReDefined3File);
			}
		}
	}
	function onDelExReDefined4FileImg(url){
		var img_array = $("span[name='ExReDefined4Files_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_ExReDefined4File = $("#array_ExReDefined4File").val();
				array_ExReDefined4File = array_ExReDefined4File.replace(url,'');
				$("#array_ExReDefined4File").val(array_ExReDefined4File);
			}
		}
	}
	function onDelExReDefined5FileImg(url){
		var img_array = $("span[name='ExReDefined5Files_img']");
		for(var i=0;i<img_array.length;i++){
			if($(img_array[i]).attr("url") == url){
				$(img_array[i]).parent().remove();
				var array_ExReDefined5File = $("#array_ExReDefined5File").val();
				array_ExReDefined5File = array_ExReDefined5File.replace(url,'');
				$("#array_ExReDefined5File").val(array_ExReDefined5File);
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
	function onDelExReQianDaoPictureImg(url,i){
		var img_array = $("img[name=ExReQianDaoPictures_img"+i+"]");
		for(var j=0;j<img_array.length;j++){
			if($(img_array[j]).attr("src") == "/goods" +url){
				$(img_array[j]).parent().remove();
				var array_ExReQianDaoPicture = $("#array_ExReQianDaoPicture"+i).val();
				array_ExReQianDaoPicture = array_ExReQianDaoPicture.replace(url,'');
				$("#array_ExReQianDaoPicture"+i).val(array_ExReQianDaoPicture);
			}
		}		
	}
	function onDelExReHouDaoPictureImg(url,i){
		var img_array = $("img[name=ExReHouDaoPictures_img"+i+"]");
		for(var j=0;j<img_array.length;j++){
			if($(img_array[j]).attr("src") =="/goods" + url){
				$(img_array[j]).parent().remove();
				var array_ExReHouDaoPicture = $("#array_ExReHouDaoPicture"+i).val();
				array_ExReHouDaoPicture = array_ExReHouDaoPicture.replace(url,'');
				$("#array_ExReHouDaoPicture"+i).val(array_ExReHouDaoPicture);
			}
		}		
	}
	function onDelExReDaojianPictureImg(url,i){
		var img_array = $("img[name=ExReDaojianPictures_img"+i+"]");
		for(var j=0;j<img_array.length;j++){
			if($(img_array[j]).attr("src") =="/goods" + url){
				$(img_array[j]).parent().remove();
				var array_ExReDaojianPicture = $("#array_ExReDaojianPicture"+i).val();
				array_ExReDaojianPicture = array_ExReDaojianPicture.replace(url,'');
				$("#array_ExReDaojianPicture"+i).val(array_ExReDaojianPicture);
			}
		}		
	}
	function onDelExReotherPictureImg(url,i){
		var img_array = $("img[name=ExReotherPictures_img"+i+"]");
		for(var j=0;j<img_array.length;j++){
			if($(img_array[j]).attr("src") =="/goods" + url){
				$(img_array[j]).parent().remove();
				var array_ExReotherPicture = $("#array_ExReotherPicture"+i).val();
				array_ExReotherPicture = array_ExReotherPicture.replace(url,'');
				$("#array_ExReotherPicture"+i).val(array_ExReotherPicture);
			}
		}		
	}
	
	
	
	//上传图片
	function onSaveResultFile(ascription){
		var file = null;
		if("ExReForceFile"==ascription){
			file = $("#ExReForceFile").get(0).files[0]; //选择上传的文件
		}
		else if("ExReTemperatureFile"==ascription){
			file = $("#ExReTemperatureFile").get(0).files[0]; //选择上传的文件
		}
		else if("SurfaceFile"==ascription){
			file = $("#SurfaceFile").get(0).files[0]; //选择上传的文件
		}
		else if("ShapeFile"==ascription){
			file = $("#ShapeFile").get(0).files[0]; //选择上传的文件
		}
		else if("SurfaceRoughnessFile"==ascription){
			file = $("#SurfaceRoughnessFile").get(0).files[0]; //选择上传的文件
		}
		else if("SurfaceHardnessFile"==ascription){
			file = $("#SurfaceHardnessFile").get(0).files[0]; //选择上传的文件
		}
		else if("ExReSectionHardnessFile"==ascription){
			file = $("#ExReSectionHardnessFile").get(0).files[0]; //选择上传的文件
		}
		else if("ExReSurfaceStressFile"==ascription){
			file = $("#ExReSurfaceStressFile").get(0).files[0]; //选择上传的文件
		}
		else if("ExReSectionStressFile"==ascription){
			file = $("#ExReSectionStressFile").get(0).files[0]; //选择上传的文件
		}
		else if("ExReDefined1File"==ascription){
			file = $("#ExReDefined1File").get(0).files[0]; //选择上传的文件
		}
		else if("ExReDefined2File"==ascription){
			file = $("#ExReDefined2File").get(0).files[0]; //选择上传的文件
		}
		else if("ExReDefined3File"==ascription){
			file = $("#ExReDefined3File").get(0).files[0]; //选择上传的文件
		}
		else if("ExReDefined4File"==ascription){
			file = $("#ExReDefined4File").get(0).files[0]; //选择上传的文件
		}
		else if("ExReDefined5File"==ascription){
			file = $("#ExReDefined5File").get(0).files[0]; //选择上传的文件
		}
		else if("ExReWearFile"==ascription){
			file = $("#ExReWearFile").get(0).files[0]; //选择上传的文件
		}
		if(file==null||file==""){
			alert("请选择文件");
			return false;
		}
		var formData = new FormData();
		formData.append("resultFile",file);
		formData.append("ascription",ascription);
		
		$.ajax({  
	          url: '/experimentParameterResult/saveResultFile' ,  
	          type: 'POST',  
	          data: formData,  
	          async: false,  
	          cache: false,  
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data.url!=null&&data.url!=""){
	            	  if(data.ascription=="ExReForceFile"){
		            	  $("#span_ExReForceFile").append("<div><span name='ExReForceFiles_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelExReForceFileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#ExReForceFile").remove();
		            	  $("#ExReForce").html('<input type="file" name="ExReForceFile" id="ExReForceFile" />');
		            	  var array_ExReForceFile = $("#array_ExReForceFile").val();
		            	  var array_ExReForceFile_name = $("#array_ExReForceFile_name").val();
		            	  array_ExReForceFile_name = array_ExReForceFile_name + data.fileName + ",";
		            	  array_ExReForceFile = array_ExReForceFile + data.url + "," ;
		            	  $("#array_ExReForceFile").val(array_ExReForceFile);
		            	  $("#array_ExReForceFile_name").val(array_ExReForceFile_name);
	            	  }
	            	  if(data.ascription=="ExReTemperatureFile"){
		            	  $("#span_ExReTemperatureFile").append("<div><span name='ExReTemperatureFiles_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelExReTemperatureFileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#ExReTemperatureFile").remove();
		            	  $("#ExReTemperature").html('<input type="file" name="ExReTemperatureFile" id="ExReTemperatureFile" />');
		            	  var array_ExReTemperatureFile = $("#array_ExReTemperatureFile").val();
		            	  var array_ExReTemperatureFile_name = $("#array_ExReTemperatureFile_name").val();
		            	  array_ExReTemperatureFile_name = array_ExReTemperatureFile_name + data.fileName + ",";
		            	  array_ExReTemperatureFile = array_ExReTemperatureFile + data.url + "," ;
		            	  $("#array_ExReTemperatureFile").val(array_ExReTemperatureFile);
		            	  $("#array_ExReTemperatureFile_name").val(array_ExReTemperatureFile_name);
	            	  }
	            	  if(data.ascription=="SurfaceFile"){
		            	  $("#span_SurfaceFile").append("<div><span name='SurfaceFiles_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelSurfaceFileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#SurfaceFile").remove();
		            	  $("#Surface").html('<input type="file" name="SurfaceFile" id="SurfaceFile" />');
		            	  var array_SurfaceFile = $("#array_SurfaceFile").val();
		            	  var array_SurfaceFile_name = $("#array_SurfaceFile_name").val();
		            	  array_SurfaceFile_name = array_SurfaceFile_name + data.fileName + ",";
		            	  array_SurfaceFile = array_SurfaceFile + data.url + "," ;
		            	  $("#array_SurfaceFile").val(array_SurfaceFile);
		            	  $("#array_SurfaceFile_name").val(array_SurfaceFile_name);
	            	  }
	            	  if(data.ascription=="ShapeFile"){
		            	  $("#span_ShapeFile").append("<div><span name='ShapeFiles_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelShapeFileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#ShapeFile").remove();
		            	  $("#Shape").html('<input type="file" name="ShapeFile" id="ShapeFile" />');
		            	  var array_ShapeFile = $("#array_ShapeFile").val();
		            	  var array_ShapeFile_name = $("#array_ShapeFile_name").val();
		            	  array_ShapeFile_name = array_ShapeFile_name + data.fileName + ",";
		            	  array_ShapeFile = array_ShapeFile + data.url + "," ;
		            	  $("#array_ShapeFile").val(array_ShapeFile);
		            	  $("#array_ShapeFile_name").val(array_ShapeFile_name);
	            	  }
	            	  if(data.ascription=="SurfaceRoughnessFile"){
		            	  $("#span_SurfaceRoughnessFile").append("<div><span name='SurfaceRoughnessFiles_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelSurfaceRoughnessFileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#SurfaceRoughnessFile").remove();
		            	  $("#SurfaceRoughness").html('<input type="file" name="SurfaceRoughnessFile" id="SurfaceRoughnessFile" />');
		            	  var array_SurfaceRoughnessFile = $("#array_SurfaceRoughnessFile").val();
		            	  var array_SurfaceRoughnessFile_name = $("#array_SurfaceRoughnessFile_name").val();
		            	  array_SurfaceRoughnessFile_name = array_SurfaceRoughnessFile_name + data.fileName + ",";
		            	  array_SurfaceRoughnessFile = array_SurfaceRoughnessFile + data.url + "," ;
		            	  $("#array_SurfaceRoughnessFile").val(array_SurfaceRoughnessFile);
		            	  $("#array_SurfaceRoughnessFile_name").val(array_SurfaceRoughnessFile_name);
	            	  }
	            	  if(data.ascription=="SurfaceHardnessFile"){
		            	  $("#span_SurfaceHardnessFile").append("<div><span name='SurfaceHardnessFiles_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelSurfaceHardnessFileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#SurfaceHardnessFile").remove();
		            	  $("#SurfaceHardness").html('<input type="file" name="SurfaceHardnessFile" id="SurfaceHardnessFile" />');
		            	  var array_SurfaceHardnessFile = $("#array_SurfaceHardnessFile").val();
		            	  var array_SurfaceHardnessFile_name = $("#array_SurfaceHardnessFile_name").val();
		            	  array_SurfaceHardnessFile_name = array_SurfaceHardnessFile_name + data.fileName + ",";
		            	  array_SurfaceHardnessFile = array_SurfaceHardnessFile + data.url + "," ;
		            	  $("#array_SurfaceHardnessFile").val(array_SurfaceHardnessFile);
		            	  $("#array_SurfaceHardnessFile_name").val(array_SurfaceHardnessFile_name);
	            	  }
	            	  if(data.ascription=="ExReSectionHardnessFile"){
		            	  $("#span_ExReSectionHardnessFile").append("<div><span name='ExReSectionHardnessFiles_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelExReSectionHardnessFileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#ExReSectionHardnessFile").remove();
		            	  $("#ExReSectionHardness").html('<input type="file" name="ExReSectionHardnessFile" id="ExReSectionHardnessFile" />');
		            	  var array_ExReSectionHardnessFile = $("#array_ExReSectionHardnessFile").val();
		            	  var array_ExReSectionHardnessFile_name = $("#array_ExReSectionHardnessFile_name").val();
		            	  array_ExReSectionHardnessFile_name = array_ExReSectionHardnessFile_name + data.fileName + ",";
		            	  array_ExReSectionHardnessFile = array_ExReSectionHardnessFile + data.url + "," ;
		            	  $("#array_ExReSectionHardnessFile").val(array_ExReSectionHardnessFile);
		            	  $("#array_ExReSectionHardnessFile_name").val(array_ExReSectionHardnessFile_name);
	            	  }
	            	  if(data.ascription=="ExReSurfaceStressFile"){
		            	  $("#span_ExReSurfaceStressFile").append("<div><span name='ExReSurfaceStressFiles_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelExReSurfaceStressFileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#ExReSurfaceStressFile").remove();
		            	  $("#ExReSurfaceStress").html('<input type="file" name="ExReSurfaceStressFile" id="ExReSurfaceStressFile" />');
		            	  var array_ExReSurfaceStressFile = $("#array_ExReSurfaceStressFile").val();
		            	  var array_ExReSurfaceStressFile_name = $("#array_ExReSurfaceStressFile_name").val();
		            	  array_ExReSurfaceStressFile_name = array_ExReSurfaceStressFile_name + data.fileName + ",";
		            	  array_ExReSurfaceStressFile = array_ExReSurfaceStressFile + data.url + "," ;
		            	  $("#array_ExReSurfaceStressFile").val(array_ExReSurfaceStressFile);
		            	  $("#array_ExReSurfaceStressFile_name").val(array_ExReSurfaceStressFile_name);
	            	  }
	            	  if(data.ascription=="ExReSectionStressFile"){
		            	  $("#span_ExReSectionStressFile").append("<div><span name='ExReSectionStressFiles_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelExReSectionStressFileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#ExReSectionStressFile").remove();
		            	  $("#ExReSectionStress").html('<input type="file" name="ExReSectionStressFile" id="ExReSectionStressFile" />');
		            	  var array_ExReSectionStressFile = $("#array_ExReSectionStressFile").val();
		            	  var array_ExReSectionStressFile_name = $("#array_ExReSectionStressFile_name").val();
		            	  array_ExReSectionStressFile_name = array_ExReSectionStressFile_name + data.fileName + ",";
		            	  array_ExReSectionStressFile = array_ExReSectionStressFile + data.url + "," ;
		            	  $("#array_ExReSectionStressFile").val(array_ExReSectionStressFile);
		            	  $("#array_ExReSectionStressFile_name").val(array_ExReSectionStressFile_name);
	            	  }
	            	  if(data.ascription=="ExReDefined1File"){
		            	  $("#span_ExReDefined1File").append("<div><span name='ExReDefined1Files_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelExReDefined1FileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#ExReDefined1File").remove();
		            	  $("#ExReDefined1").html('<input type="file" name="ExReDefined1File" id="ExReDefined1File" />');
		            	  var array_ExReDefined1File = $("#array_ExReDefined1File").val();
		            	  var array_ExReDefined1File_name = $("#array_ExReDefined1File_name").val();
		            	  array_ExReDefined1File_name = array_ExReDefined1File_name + data.fileName + ",";
		            	  array_ExReDefined1File = array_ExReDefined1File + data.url + "," ;
		            	  $("#array_ExReDefined1File").val(array_ExReDefined1File);
		            	  $("#array_ExReDefined1File_name").val(array_ExReDefined1File_name);
	            	  }
	            	  if(data.ascription=="ExReDefined2File"){
		            	  $("#span_ExReDefined2File").append("<div><span name='ExReDefined2Files_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelExReDefined2FileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#ExReDefined2File").remove();
		            	  $("#ExReDefined2").html('<input type="file" name="ExReDefined2File" id="ExReDefined2File" />');
		            	  var array_ExReDefined2File = $("#array_ExReDefined2File").val();
		            	  var array_ExReDefined2File_name = $("#array_ExReDefined2File_name").val();
		            	  array_ExReDefined2File_name = array_ExReDefined2File_name + data.fileName + ",";
		            	  array_ExReDefined2File = array_ExReDefined2File + data.url + "," ;
		            	  $("#array_ExReDefined2File").val(array_ExReDefined2File);
		            	  $("#array_ExReDefined2File_name").val(array_ExReDefined2File_name);
	            	  }
	            	  if(data.ascription=="ExReDefined3File"){
		            	  $("#span_ExReDefined3File").append("<div><span name='ExReDefined3Files_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelExReDefined3FileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#ExReDefined3File").remove();
		            	  $("#ExReDefined3").html('<input type="file" name="ExReDefined3File" id="ExReDefined3File" />');
		            	  var array_ExReDefined3File = $("#array_ExReDefined3File").val();
		            	  var array_ExReDefined3File_name = $("#array_ExReDefined3File_name").val();
		            	  array_ExReDefined3File_name = array_ExReDefined3File_name + data.fileName + ",";
		            	  array_ExReDefined3File = array_ExReDefined3File + data.url + "," ;
		            	  $("#array_ExReDefined3File").val(array_ExReDefined3File);
		            	  $("#array_ExReDefined3File_name").val(array_ExReDefined3File_name);
	            	  }
	            	  if(data.ascription=="ExReDefined4File"){
		            	  $("#span_ExReDefined4File").append("<div><span name='ExReDefined4Files_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelExReDefined4FileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#ExReDefined4File").remove();
		            	  $("#ExReDefined4").html('<input type="file" name="ExReDefined4File" id="ExReDefined4File" />');
		            	  var array_ExReDefined4File = $("#array_ExReDefined4File").val();
		            	  var array_ExReDefined4File_name = $("#array_ExReDefined4File_name").val();
		            	  array_ExReDefined4File_name = array_ExReDefined4File_name + data.fileName + ",";
		            	  array_ExReDefined4File = array_ExReDefined4File + data.url + "," ;
		            	  $("#array_ExReDefined4File").val(array_ExReDefined4File);
		            	  $("#array_ExReDefined4File_name").val(array_ExReDefined4File_name);
	            	  }
	            	  if(data.ascription=="ExReDefined5File"){
		            	  $("#span_ExReDefined5File").append("<div><span name='ExReDefined5Files_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelExReDefined5FileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#ExReDefined5File").remove();
		            	  $("#ExReDefined5").html('<input type="file" name="ExReDefined5File" id="ExReDefined5File" />');
		            	  var array_ExReDefined5File = $("#array_ExReDefined5File").val();
		            	  var array_ExReDefined5File_name = $("#array_ExReDefined5File_name").val();
		            	  array_ExReDefined5File_name = array_ExReDefined5File_name + data.fileName + ",";
		            	  array_ExReDefined5File = array_ExReDefined5File + data.url + "," ;
		            	  $("#array_ExReDefined5File").val(array_ExReDefined5File);
		            	  $("#array_ExReDefined5File_name").val(array_ExReDefined5File_name);
	            	  }
	            	  if(data.ascription=="ExReWearFile"){
		            	  $("#span_ExReWearFile").append("<div><span name='ExReWearFiles_img' url='"+data.url+"' >"+data.fileName+"</span><a class='btn btn_shanchu' onclick='onDelExReWearFileImg(\""+data.url+"\");'>删除</a><br/></div>");
		            	  $("#ExReWearFile").remove();
		            	  $("#ExReWear").html('<input type="file" name="ExReWearFile" id="ExReWearFile" />');
		            	  var array_ExReWearFile = $("#array_ExReWearFile").val();
		            	  var array_ExReWearFile_name = $("#array_ExReWearFile_name").val();
		            	  array_ExReWearFile_name = array_ExReWearFile_name + data.fileName + ",";
		            	  array_ExReWearFile = array_ExReWearFile + data.url + "," ;
		            	  $("#array_ExReWearFile").val(array_ExReWearFile);
		            	  $("#array_ExReWearFile_name").val(array_ExReWearFile_name);
	            	  }
	            	  
	              }
	              else {
	            	  alert("请选择文件");
	              }
	          }  
	     });  
	}
	

	
	//折叠
	function zd(index){
		$("#box_clcs"+index).css("display","block");
		$("#zd_"+index).css("display","none");
		$("#zd1_"+index).css("display","block");
	}
	function zd1(index){
		$("#box_clcs"+index).css("display","none");
		$("#zd_"+index).css("display","block");
		$("#zd1_"+index).css("display","none");
	}
	
	
	//动态添加列
	function editCl(id){
		var clTdLength = $("#clTable td").length;//table列数
		var dataName = $(id).attr("data-name");
		if(dataName == 0){//变为“保存”
			$("#btn_add_ConstituentsMaterial").show();
			$(id).attr("data-name","1");
				$(id).val("保存");
		}else{
			$("#btn_add_ConstituentsMaterial").hide();
			$(id).attr("data-name","0");
				$(id).val("点击输入");
		}
		if(clTdLength != 0) {
			if(dataName == 0){//需变为“保存”
				var inputs1 = $("#clTable td.edit_1");
				var inputs2 = $("#clTable td.edit_2");
				for(var i = 0;i<inputs1.length;i++){
					$(inputs1[i]).html('<input type="text" value="'+$(inputs1[i]).text()+'" />');
					$(inputs2[i]).html('<input type="text" value="'+$(inputs2[i]).text()+'" />');
				}
			}else{
				var ExReSectionHardness_str = '';
				//执行保存事件
				var inputs1 = $("#clTable td.edit_1");
				var inputs2 = $("#clTable td.edit_2");
				for(var i = 0;i<inputs1.length;i++){
					ExReSectionHardness_str = ExReSectionHardness_str + ($(inputs1[i]).children('input').val()==""?" ":$(inputs1[i]).children('input').val()) + "-" + ($(inputs2[i]).children('input').val()==""?" ":$(inputs2[i]).children('input').val()) + ",";
					$("#ExReSectionHardness_userForm").val(ExReSectionHardness_str);
					$(inputs1[i]).html($(inputs1[i]).children('input').val());
					$(inputs2[i]).html($(inputs2[i]).children('input').val());
				}
				$("#clTable td.edit input").remove();//td变为不可编辑
				
			}
		}
	}
	//添加材料
	function addCl(id){
		
		var clTdLength = document.getElementById("clTable").rows.item(0).cells.length;//材料table列数
		
		
		var addTrId = $("#clTable tr.cl_tr_0 td").eq(clTdLength-2).attr("id");//获取table表格最后一列的td的ID
		
		
		if(addTrId != undefined || addTrId != null){
			addTrIdNum = parseInt(addTrId.substring(addTrId.lastIndexOf("td")+2));
			
		
			var clTrLength = $("#clTable tr").length;//材料table行数

			var htmlTr = new Array();
	
			htmlTr[0] = '<td class="td edit_1" id="cl_tr0_td' + (addTrIdNum+1)  +'"><input type="text" value="" /></td>';
			htmlTr[1] = '<td class="td edit_2" id="cl_tr1_td' + (addTrIdNum+1)  +'"><input type="text" value="" /></td>';
			htmlTr[2] = '<td class="td" id="cl_tr2_td' + (addTrIdNum+1)  +'"><a class="btn btn_bg_orange b_block" onclick="delCl(' + (addTrIdNum+1) + ')">删除</a></td>';
			for(var i=0;i<clTrLength;i++){
				$(".cl_tr_" + i).append(htmlTr[i]);
			}
	
		}else{
		
			var clTrLength = $("#clTable tr").length;//材料table行数

			var htmlTr = new Array();
	
			htmlTr[0] = '<td class="td edit_1" id="cl_tr0_td' + (clTdLength-1)  +'"><input type="text" value="" /></td>';
			htmlTr[1] = '<td class="td edit_2" id="cl_tr1_td' + (clTdLength-1)  +'"><input type="text" value="" /></td>';
			htmlTr[2] = '<td class="td" id="cl_tr2_td' + (clTdLength-1)  +'"><a class="btn btn_bg_orange b_block" onclick="delCl(' + (clTdLength-1) + ')">删除</a></td>';
			for(var i=0;i<clTrLength;i++){
				$(".cl_tr_" + i).append(htmlTr[i]);
			}
		
		
		}
	}

	//删除材料整列
	function delCl(id){
		var dataName = $("#ExReSectionHardness_btn").attr("data-name");
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
			}
			var ExReSectionHardness = $("#ExReSectionHardness_userForm").val();
			ExReSectionHardness = ExReSectionHardness.replace(str, '');
			$("#ExReSectionHardness_userForm").val(ExReSectionHardness);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//动态添加列1
	function editCl1(id){
		var clTdLength = $("#clTable1 td").length;//table列数
		var dataName = $(id).attr("data-name");
		if(dataName == 0){//变为“保存”
			$("#btn_add_ConstituentsMaterial1").show();
			$(id).attr("data-name","1");
				$(id).val("保存");
		}else{
			$("#btn_add_ConstituentsMaterial1").hide();
			$(id).attr("data-name","0");
				$(id).val("点击输入");
		}
		if(clTdLength != 0) {
			if(dataName == 0){//需变为“保存”
				var inputs1 = $("#clTable1 td.edit_1");
				var inputs2 = $("#clTable1 td.edit_2");
				for(var i = 0;i<inputs1.length;i++){
					$(inputs1[i]).html('<input type="text" value="'+$(inputs1[i]).text()+'" />');
					$(inputs2[i]).html('<input type="text" value="'+$(inputs2[i]).text()+'" />');
				}
			}else{
				var ExReSectionStress_str = '';
				//执行保存事件
				var inputs1 = $("#clTable1 td.edit_1");
				var inputs2 = $("#clTable1 td.edit_2");
				for(var i = 0;i<inputs1.length;i++){
					ExReSectionStress_str = ExReSectionStress_str + ($(inputs1[i]).children('input').val()==""?" ":$(inputs1[i]).children('input').val()) + "-" + ($(inputs2[i]).children('input').val()==""?" ":$(inputs2[i]).children('input').val()) + ",";
					$("#ExReSectionStress_userForm").val(ExReSectionStress_str);
					$(inputs1[i]).html($(inputs1[i]).children('input').val());
					$(inputs2[i]).html($(inputs2[i]).children('input').val());
				}
				$("#clTable1 td.edit input").remove();//td变为不可编辑
				
			}
		}
	}
	//添加材料
	function addCl1(id){
		
		var clTdLength = document.getElementById("clTable1").rows.item(0).cells.length;//材料table列数
		
		
		var addTrId = $("#clTable1 tr.cl_tr_0 td").eq(clTdLength-2).attr("id");//获取table表格最后一列的td的ID
		
		
		if(addTrId != undefined || addTrId != null){
			addTrIdNum = parseInt(addTrId.substring(addTrId.lastIndexOf("td")+2));
			
		
			var clTrLength = $("#clTable1 tr").length;//材料table行数

			var htmlTr = new Array();
	
			htmlTr[0] = '<td class="td edit_1" id="cl1_tr0_td' + (addTrIdNum+1)  +'"><input type="text" value="" /></td>';
			htmlTr[1] = '<td class="td edit_2" id="cl1_tr1_td' + (addTrIdNum+1)  +'"><input type="text" value="" /></td>';
			htmlTr[2] = '<td class="td" id="cl1_tr2_td' + (addTrIdNum+1)  +'"><a class="btn btn_bg_orange b_block" onclick="delCl1(' + (addTrIdNum+1) + ')">删除</a></td>';
			for(var i=0;i<clTrLength;i++){
				$(".cl1_tr_" + i).append(htmlTr[i]);
			}
	
		}else{
		
			var clTrLength = $("#clTable1 tr").length;//材料table行数

			var htmlTr = new Array();
	
			htmlTr[0] = '<td class="td edit_1" id="cl1_tr0_td' + (clTdLength-1)  +'"><input type="text" value="" /></td>';
			htmlTr[1] = '<td class="td edit_2" id="cl1_tr1_td' + (clTdLength-1)  +'"><input type="text" value="" /></td>';
			htmlTr[2] = '<td class="td" id="cl1_tr2_td' + (clTdLength-1)  +'"><a class="btn btn_bg_orange b_block" onclick="delCl1(' + (clTdLength-1) + ')">删除</a></td>';
			for(var i=0;i<clTrLength;i++){
				$(".cl1_tr_" + i).append(htmlTr[i]);
			}
		
		
		}
	}

	//删除材料整列
	function delCl1(id){
		var dataName = $("#ExReSectionStress_btn").attr("data-name");
		var str = '';
		if(dataName == 0){//保存
			str = str + $("#cl1_tr" + 0 + "_td" + id ).html() + "-";
			str = str + $("#cl1_tr" + 1 + "_td" + id ).html() + ",";
		}else{//点击输入
			str = str + $("#cl1_tr" + 0 + "_td" + id + " input").val() + "-";
			str = str + $("#cl1_tr" + 1 + "_td" + id + " input").val() + ",";
		}
		if(confirm("确定要删除吗?")){
			var clTrLength = $("#clTable1 tr").length;//材料table行数
			for(var i=0;i<clTrLength;i++){
				$("#cl1_tr" + i + "_td" + id).remove();
			}
			var ExReSectionStress = $("#ExReSectionStress_userForm").val();
			ExReSectionStress = ExReSectionStress.replace(str, '');
			$("#ExReSectionStress_userForm").val(ExReSectionStress);
		}
	}
	
	
	
	
	
	/* 添加行 */
	function addRow(){
		var rowNum = $("#yblTable tr").length;//行数
		var colNum = 6; //列数
		var html = '';
		html += '<tr id = "row_' + (rowNum-1) + '">';
		
		html += '<td class="td edit_1" id="ybl_td1_tr' + (rowNum-1) +'"><input type="text"/></td>';
		html += '<td class="td edit_2" id="ybl_td2_tr' + (rowNum-1) +'"><input type="text"/></td>';
		
		html += '<input type ="hidden" id = "array_ExReQianDaoPicture' + (rowNum-1) +'" value="" /><td class="td edit_3" id="ybl_td3_tr' + (rowNum-1) +'" width="105px"><span id="span_ExReQianDaoPicture' + (rowNum-1) +'"><input type="file" name="ExReQianDaoPicture' + (rowNum-1) +'" id="ExReQianDaoPicture' + (rowNum-1) +'" onchange="upExReQianDaoPicture(\'ExReQianDaoPicture\',this,' + (rowNum-1) +');" /></span><div id="div_ExReQianDaoPicture' + (rowNum-1) +'"></div></td>'
		html += '<input type ="hidden" id = "array_ExReHouDaoPicture' + (rowNum-1) +'" value="" /><td class="td edit_4" id="ybl_td4_tr' + (rowNum-1) +'" width="105px"><span id="span_ExReHouDaoPicture' + (rowNum-1) +'"><input type="file" name="ExReHouDaoPicture' + (rowNum-1) +'" id="ExReHouDaoPicture' + (rowNum-1) +'" onchange="upExReQianDaoPicture(\'ExReHouDaoPicture\',this,' + (rowNum-1) +');" /></span><div id="div_ExReHouDaoPicture' + (rowNum-1) +'"></div></td>'
		html += '<input type ="hidden" id = "array_ExReDaojianPicture' + (rowNum-1) +'" value="" /><td class="td edit_5" id="ybl_td5_tr' + (rowNum-1) +'" width="105px"><span id="span_ExReDaojianPicture' + (rowNum-1) +'"><input type="file" name="ExReDaojianPicture' + (rowNum-1) +'" id="ExReDaojianPicture' + (rowNum-1) +'" onchange="upExReQianDaoPicture(\'ExReDaojianPicture\',this,' + (rowNum-1) +');" /></span><div id="div_ExReDaojianPicture' + (rowNum-1) +'"></div></td>'
		html += '<input type ="hidden" id = "array_ExReotherPicture' + (rowNum-1) +'" value="" /><td class="td edit_6" id="ybl_td6_tr' + (rowNum-1) +'" width="105px"><span id="span_ExReotherPicture' + (rowNum-1) +'"><input type="file" name="ExReotherPicture' + (rowNum-1) +'" id="ExReotherPicture' + (rowNum-1) +'" onchange="upExReQianDaoPicture(\'ExReotherPicture\',this,' + (rowNum-1) +');" /></span><div id="div_ExReotherPicture' + (rowNum-1) +'"></div></td>'
		
		html += '<td class="td" id = "ybl_td7_tr' + (rowNum-1) +'"><a class="btn btn_bg_orange b_block" onclick="delRow(' + (rowNum-1) +');">删除</a></td>';
		
		html += '</tr>'
		$("#row_"+(rowNum-2)).after(html);
	}
	
	
	/* 删除行 */
	function delRow(id){
		$("#row_"+id).remove();
		var clTdLength = document.getElementById("yblTable").rows.item(0).cells.length;//材料table列数
		var rowNum = $("#yblTable tr").length;	
		for(var j=id;j<(rowNum-1);j++){		
			$("#row_" + (j+1)).attr("id","row_" + j);//该行下的所有行上移一行
			$("#ybl_td1_tr" + (j+1)).attr("id","ybl_td1_tr" + j);
			$("#ybl_td2_tr" + (j+1)).attr("id","ybl_td2_tr" + j);
			$("#array_ExReQianDaoPicture" + (j+1)).attr("id","array_ExReQianDaoPicture" + j);
			$("#ybl_td3_tr" + (j+1)).attr("id","ybl_td3_tr" + j);
			$("#span_ExReQianDaoPicture" + (j+1)).attr("id","span_ExReQianDaoPicture" + j);
			$("#ExReQianDaoPicture" + (j+1)).attr("onchange","upExReQianDaoPicture(\'ExReQianDaoPicture\',this," + j +");");
			$("#ExReQianDaoPicture" + (j+1)).attr("name","ExReQianDaoPicture" + j);
			$("#ExReQianDaoPicture" + (j+1)).attr("id","ExReQianDaoPicture" + j);
			$("#div_ExReQianDaoPicture" + (j+1)+">div>img").attr("name","ExReQianDaoPictures_img" + j);
			var url=$("#div_ExReQianDaoPicture" + (j+1)+">div>img").attr("src");
			$("#div_ExReQianDaoPicture" + (j+1)+">div>a").attr("onclick","onDelExReQianDaoPictureImg(\'"+url+"\',"+j+");");
			$("#div_ExReQianDaoPicture" + (j+1)).attr("id","div_ExReQianDaoPicture" + j);
			
			
			$("#array_ExReHouDaoPicture" + (j+1)).attr("id","array_ExReHouDaoPicture" + j);
			$("#ybl_td4_tr" + (j+1)).attr("id","ybl_td4_tr" + j);
			$("#span_ExReHouDaoPicture" + (j+1)).attr("id","span_ExReHouDaoPicture" + j);
			$("#ExReHouDaoPicture" + (j+1)).attr("onchange","upExReQianDaoPicture(\'ExReHouDaoPicture\',this," + j +");");
			$("#ExReHouDaoPicture" + (j+1)).attr("name","ExReHouDaoPicture" + j);
			$("#ExReHouDaoPicture" + (j+1)).attr("id","ExReHouDaoPicture" + j);
			$("#div_ExReHouDaoPicture" + (j+1)+">div>img").attr("name","ExReHouDaoPictures_img" + j);
			var url=$("#div_ExReHouDaoPicture" + (j+1)+">div>img").attr("src");
			$("#div_ExReHouDaoPicture" + (j+1)+">div>a").attr("onclick","onDelExReHouDaoPictureImg(\'"+url+"\',"+j+");");
			$("#div_ExReHouDaoPicture" + (j+1)).attr("id","div_ExReHouDaoPicture" + j);
			
			$("#array_ExReDaojianPicture" + (j+1)).attr("id","array_ExReDaojianPicture" + j);
			$("#ybl_td5_tr" + (j+1)).attr("id","ybl_td5_tr" + j);
			$("#span_ExReDaojianPicture" + (j+1)).attr("id","span_ExReDaojianPicture" + j);
			$("#ExReDaojianPicture" + (j+1)).attr("onchange","upExReQianDaoPicture(\'ExReDaojianPicture\',this," + j +");");
			$("#ExReDaojianPicture" + (j+1)).attr("name","ExReDaojianPicture" + j);
			$("#ExReDaojianPicture" + (j+1)).attr("id","ExReDaojianPicture" + j);
			$("#div_ExReDaojianPicture" + (j+1)+">div>img").attr("name","ExReDaojianPictures_img" + j);
			var url=$("#div_ExReDaojianPicture" + (j+1)+">div>img").attr("src");
			$("#div_ExReDaojianPicture" + (j+1)+">div>a").attr("onclick","onDelExReDaojianPictureImg(\'"+url+"\',"+j+");");
			$("#div_ExReDaojianPicture" + (j+1)).attr("id","div_ExReDaojianPicture" + j);
			
			$("#array_ExReotherPicture" + (j+1)).attr("id","array_ExReotherPicture" + j);
			$("#ybl_td6_tr" + (j+1)).attr("id","ybl_td6_tr" + j);
			$("#span_ExReotherPicture" + (j+1)).attr("id","span_ExReotherPicture" + j);
			$("#ExReotherPicture" + (j+1)).attr("onchange","upExReQianDaoPicture(\'ExReotherPicture\',this," + j +");");
			$("#ExReotherPicture" + (j+1)).attr("name","ExReotherPicture" + j);
			$("#ExReotherPicture" + (j+1)).attr("id","ExReotherPicture" + j);
			$("#div_ExReotherPicture" + (j+1)+">div>img").attr("name","ExReotherPictures_img" + j);
			var url=$("#div_ExReotherPicture" + (j+1)+">div>img").attr("src");
			$("#div_ExReotherPicture" + (j+1)+">div>a").attr("onclick","onDelExReotherPictureImg(\'"+url+"\',"+j+");");
			$("#div_ExReotherPicture" + (j+1)).attr("id","div_ExReotherPicture" + j);
			
			$("#ybl_td7_tr"+ (j+1)+">a").attr("onclick","delRow("+j+");");
			$("#ybl_td7_tr"+ (j+1)).attr("id","ybl_td7_tr"+ j);
		}
	}
	
	
	
	
	function save(){
		var rowNum = $("#yblTable tr").length;//行数
		var life = new Array();
		for(var i = 0;i<rowNum-1;i++){
			var ExReWearTime = $("#ybl_td1_tr"+i+">input").val();
			var ExReWearValue = $("#ybl_td2_tr"+i+">input").val();
			var array_ExReQianDaoPicture = $("#array_ExReQianDaoPicture"+i).val();
			var array_ExReHouDaoPicture = $("#array_ExReHouDaoPicture"+i).val();
			var array_ExReDaojianPicture = $("#array_ExReDaojianPicture"+i).val();
			var array_ExReotherPicture = $("#array_ExReotherPicture"+i).val();
			life.push({"ExReWearTime":ExReWearTime,"ExReWearValue":ExReWearValue,"array_ExReQianDaoPicture":array_ExReQianDaoPicture,"array_ExReHouDaoPicture":array_ExReHouDaoPicture,"array_ExReDaojianPicture":array_ExReDaojianPicture,"array_ExReotherPicture":array_ExReotherPicture});
		}
		
		var formData = new FormData(document.getElementById("MyForm"));
		formData.append("life",JSON.stringify(life));
		$.ajax({  
	          url: '/experimentParameterResult/saveResultInfo',  
	          type: 'POST',  
	          data: formData,
	          contentType: false,  
	          processData: false,  
	          success: function (data) {  
	              if(data==1){
	            	  alert("保存成功");
	              }else if(data==0){
	            	  alert("保存失败！！");
	              }
	          }
	     }); 
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
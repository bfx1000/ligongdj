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
					ExReForceFiles_str = ExReForceFiles_str + "<div><span name='ExReForceFiles_img' url='"+ExReForceFiles[i]+"' >"+ExReForceFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onShowPdf(\""+ExReForceFiles[i]+"\");'>浏览</a><br/></div>";
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
					ExReTemperatureFiles_str = ExReTemperatureFiles_str + "<div><span name='ExReTemperatureFiles_img' url='"+ExReTemperatureFiles[i]+"' >"+ExReTemperatureFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onShowPdf(\""+ExReTemperatureFiles[i]+"\");'>浏览</a><br/></div>";
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
					SurfaceFiles_str = SurfaceFiles_str + "<div><span name='SurfaceFiles_img' url='"+SurfaceFiles[i]+"' >"+SurfaceFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onShowPdf(\""+SurfaceFiles[i]+"\");'>浏览</a><br/></div>";
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
					ShapeFiles_str = ShapeFiles_str + "<div><span name='ShapeFiles_img' url='"+ShapeFiles[i]+"' >"+ShapeFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onShowPdf(\""+ShapeFiles[i]+"\");'>浏览</a><br/></div>";
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
					SurfaceRoughnessFiles_str = SurfaceRoughnessFiles_str + "<div><span name='SurfaceRoughnessFiles_img' url='"+SurfaceRoughnessFiles[i]+"' >"+SurfaceRoughnessFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onShowPdf(\""+SurfaceRoughnessFiles[i]+"\");'>浏览</a><br/></div>";
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
					SurfaceHardnessFiles_str = SurfaceHardnessFiles_str + "<div><span name='SurfaceHardnessFiles_img' url='"+SurfaceHardnessFiles[i]+"' >"+SurfaceHardnessFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onShowPdf(\""+SurfaceHardnessFiles[i]+"\");'>浏览</a><br/></div>";
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
					ExReSectionHardnessFiles_str = ExReSectionHardnessFiles_str + "<div><span name='ExReSectionHardnessFiles_img' url='"+ExReSectionHardnessFiles[i]+"' >"+ExReSectionHardnessFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onShowPdf(\""+ExReSectionHardnessFiles[i]+"\");'>浏览</a><br/></div>";
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
					ExReSurfaceStressFiles_str = ExReSurfaceStressFiles_str + "<div><span name='ExReSurfaceStressFiles_img' url='"+ExReSurfaceStressFiles[i]+"' >"+ExReSurfaceStressFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onShowPdf(\""+ExReSurfaceStressFiles[i]+"\");'>浏览</a><br/></div>";
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
					ExReSectionStressFiles_str = ExReSectionStressFiles_str + "<div><span name='ExReSectionStressFiles_img' url='"+ExReSectionStressFiles[i]+"' >"+ExReSectionStressFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onShowPdf(\""+ExReSectionStressFiles[i]+"\");'>浏览</a><br/></div>";
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
					ExReDefined1Files_str = ExReDefined1Files_str + "<div><span name='ExReDefined1Files_img' url='"+ExReDefined1Files[i]+"' >"+ExReDefined1Files_name[i]+"</span><a class='btn btn_shanchu' onclick='onShowPdf(\""+ExReDefined1Files[i]+"\");'>浏览</a><br/></div>";
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
					ExReDefined2Files_str = ExReDefined2Files_str + "<div><span name='ExReDefined2Files_img' url='"+ExReDefined2Files[i]+"' >"+ExReDefined2Files_name[i]+"</span><a class='btn btn_shanchu' onclick='onShowPdf(\""+ExReDefined2Files[i]+"\");'>浏览</a><br/></div>";
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
					ExReDefined3Files_str = ExReDefined3Files_str + "<div><span name='ExReDefined3Files_img' url='"+ExReDefined3Files[i]+"' >"+ExReDefined3Files_name[i]+"</span><a class='btn btn_shanchu' onclick='onShowPdf(\""+ExReDefined3Files[i]+"\");'>浏览</a><br/></div>";
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
					ExReDefined4Files_str = ExReDefined4Files_str + "<div><span name='ExReDefined4Files_img' url='"+ExReDefined4Files[i]+"' >"+ExReDefined4Files_name[i]+"</span><a class='btn btn_shanchu' onclick='onShowPdf(\""+ExReDefined4Files[i]+"\");'>浏览</a><br/></div>";
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
					ExReDefined5Files_str = ExReDefined5Files_str + "<div><span name='ExReDefined5Files_img' url='"+ExReDefined5Files[i]+"' >"+ExReDefined5Files_name[i]+"</span><a class='btn btn_shanchu' onclick='onShowPdf(\""+ExReDefined5Files[i]+"\");'>浏览</a><br/></div>";
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
					ExReWearFiles_str = ExReWearFiles_str + "<div><span name='ExReWearFiles_img' url='"+ExReWearFiles[i]+"' >"+ExReWearFiles_name[i]+"</span><a class='btn btn_shanchu' onclick='onShowPdf(\""+ExReWearFiles[i]+"\");'>浏览</a><br/></div>";
				}
			}
			$("#span_ExReWearFile").html(ExReWearFiles_str);
		}
		
		
	});
	
	//折叠
	function zd(index){
		$("#box_clcs"+index).css("display","block");
		$("#zd_"+index).css("display","none");
		$("#zd1_"+index).css("display","block");
		bodyHeight();
	}
	function zd1(index){
		$("#box_clcs"+index).css("display","none");
		$("#zd_"+index).css("display","block");
		$("#zd1_"+index).css("display","none");
		bodyHeight();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
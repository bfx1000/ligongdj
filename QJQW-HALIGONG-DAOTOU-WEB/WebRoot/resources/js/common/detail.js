function selectData(){
			
			$(".each_list_wrap>span").addClass('skz_hide');
			
			
			/*$(".each_list_wrap>span").show();*/
			//控制点击的选项卡数量
			var checks = $(".check_wrap input[type=checkbox]");
		    n = 0;
		    for(i=0;i<checks.length;i++){
		        if(checks[i].checked){
		        	n++;
		        }          
		    }
		    
		    trNum = $(".each_list_wrap").length;//行数			
			tdNum = ($(".each_list_wrap>span").length)/trNum;//列数
		    
		    if(n == 0){
		    	
		    	for(s=0;s<4;s++){
		    		$(".each_list_wrap>span.skz_list" + s).removeClass('skz_hide');	
		    		$(".each_list_wrap>span.skz_list" + (tdNum-1)).removeClass('skz_hide');//操作列	
		    	}
		    	$(".skz_hide").hide();
		    	
		    }else if(n > 6){
		    	alert("最多仅可同时筛选5类信息！");
		    	
		    }else{ 
		    	$(".each_list_wrap>span").show();
		    	//显示筛选的信息
		    	
		    	obj = $(".check_wrap input[type=checkbox]");			    	
				
				$(".each_list_wrap>span.skz_list" + (tdNum-1)).removeClass('skz_hide');//操作列	

			    for(k in obj){//k从0开始				    	
			    	
			        if(obj[k].checked){		        	
			        	$(".each_list_wrap>span.skz_list" + k).removeClass('skz_hide');		
			        }	
			    } 
			    $(".skz_hide").hide();
		    }   	
		}
	
		
		//搜索展开与收起
		function changeOpera(obj){
			var dataName = $(obj).attr("data-name");
			if(dataName == 0){//当前为收起
				$(obj).attr("src","/resources/images/ico_pre.png");
				$(obj).attr("data-name","1")
				$(obj).parents('div.search_wrap').css({height:"auto"});
			}else{
				$(obj).attr("src","/resources/images/ico_n.png");
				$(obj).attr("data-name","0")
				$(obj).parents('div.search_wrap').css({height:"40px"});
			}
		}
		
		
		
		
		function arrayToJson(o) {
		    var r = [];
		    if (typeof o == "string") return "\"" + o.replace(/([\'\"\\])/g, "\\$1").replace(/(\n)/g, "\\n").replace(/(\r)/g, "\\r").replace(/(\t)/g, "\\t") + "\"";
		    if (typeof o == "object") {
		      if (!o.sort) {
		        for (var i in o)
		          r.push(i + ":" + arrayToJson(o[i]));
		        if (!!document.all && !/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/.test(o.toString)) {
		          r.push("toString:" + o.toString.toString());
		        }
		        r = "{" + r.join() + "}";
		      } else {
		        for (var i = 0; i < o.length; i++) {
		          r.push(arrayToJson(o[i]));
		        }
		        r = "[" + r.join() + "]";
		      }
		      return r;
		    }
		    return o.toString();
		  }
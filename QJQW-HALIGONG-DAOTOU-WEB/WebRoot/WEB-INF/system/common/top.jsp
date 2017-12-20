<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!--  弹出登录  -->
<form action="/index/login_login" method="post" id="loginForm">
<div id="box_login" style="display:none">
	<div id="login_box">	
		<div class="title_box_dl">登录</div>
		<ul class="list_box">
			<li class="li_half"><span>用户名： </span><input type="text" id ="loginname" name ="loginname" class="input_text" placeholder="请输入用户名"/></li>
			<li class="li_half"><span>密<i class="li_halfi"></i>码： </span><input type="password" id ="password" name ="password" class="input_text" /><div class="clear"></div></li><div class="clear"></div>
			<li class="li_half"><span class="li_haifs">验证码： </span><input type="text" id ="code" name ="code" class="input_yzm" maxlength="4"/><i><img style="height:22px;" id="codeImg" class = "yzm" alt="点击更换" title="点击更换" src=""/></i></li>
			<div class="box_btn"><a onclick="denglu();" class="btn">确认</a><a onclick="qx();" class="btn">取消</a></div>
		</ul>
	</div>
	<div id="divbg">0</div>
</div>
</form>
<div class="wrap">
  <!--  头部   -->
  <div class="head_content">
	<div class="head_top">
	  <span class="hy">汽车覆盖件数据库设计平台</span>
	  <c:choose>
	  <c:when test="${not empty userName}">
	  	<span class="box_user"><span>${userName }</span><a href="logout" class="btn_tc">| 退出</a></span>
	  </c:when>
	  <c:otherwise>
       	  <span class="box_login"><a href="#" class="btn_dl" id = "dl">登陆</a></span>   			
      </c:otherwise>
      </c:choose>
	</div>	
	<div class="box_logo">
	  <div class="logo" alt="哈理工刀头" title="哈理工刀头"></div>
		<div class="search_box">
		  <div class="search">
			<input type="text" id = "NumberTurningBlade" class="search_input" placeholder="请输入编号查询" />
			<div onclick="search();" class="search_btn">搜索</div>
		  </div>
		  <div class="box_a"><!-- <a href="#">切断切槽</a><a href="#">仿形切削</a><a href="#">外圆切槽刀</a><a href="#">内圆切槽刀</a><a href="#">端面切槽</a> --></div>
		</div>
	  </div>
	  <!--  导航   -->
	  <div class="nav">
		<ul>
		  <li class="active"><a href="index.html">首页</a></li>
		    <c:forEach items="${topMenuList}" var="var" varStatus="vs">
		      <li><a onclick="onShowSecondMenu(${var.menu_id}, '${var.menu_name }');" href="#">${var.menu_name }</a></li>
		    </c:forEach>
<!-- 		  <li><a href="dtcp.html">刀具产品</a></li> -->
<!-- 		  <li><a href="#">工艺</a></li> -->
<!-- 		  <li><a href="#">实验</a></li> -->
<!-- 		  <li><a href="#">生产</a></li> -->
<!-- 		  <li><a href="#">道具设计</a></li> -->
<!-- 		  <li><a href="#">切削仿真</a></li> -->
<!-- 		  <li><a href="#">文档</a></li> -->
<!-- 		  <li><a href="#">帮助</a></li> -->
		  <div class="clear"></div>
		</ul>
	  </div>
	</div>

  </div>
<!--  获取高度  -->
<script type="text/javascript">
autodivheight();
function autodivheight(){ //函数：获取尺寸
    //获取浏览器窗口高度
    var winHeight=0;
    if (window.innerHeight)
        winHeight = window.innerHeight;
    else if ((document.body) && (document.body.scrollHeight))
        winHeight = document.body.scrollHeight;
    //通过深入Document内部对body进行检测，获取浏览器窗口高度
    if (document.documentElement && document.documentElement.scrollHeight)
        winHeight = document.documentElement.scrollHeight;
    //DIV高度为浏览器窗口的高度
    //document.getElementById("test").style.height= winHeight +"px";
    //DIV高度为浏览器窗口高度的一半
    document.getElementById("divbg").style.height= winHeight-0 +"px";
}
window.onresize=autodivheight; //浏览器窗口发生变化时同时变化DIV高度

function genTimestamp(){
	var time = new Date();
	return time.getTime();
}


 function changeCode(){
	$("#codeImg").attr("src","<%=path%>/code?t="+genTimestamp());
}
var errInfo = "${errInfo}";
function qx(){
//	location.replace("/index/index");
	$("#loginname").val($.cookie('loginname'));
	$("#password").val($.cookie('password'));
	$("#code").val("");
	$("#box_login").css("display","none");
	
}

$(document).ready(function(){
	changeCode();
	$("#codeImg").bind("click",changeCode);
	 if(errInfo!=""){  
		$("#dl").trigger("click"); 
		if(errInfo.indexOf("验证码")>-1){
			$("#code").tips({
				side:1,
	            msg:errInfo,
	            bg:'#FF5080',
	            time:5
	        });
			
			$("#code").focus();
		}else{
			$("#loginname").tips({
				side:1,
	            msg:errInfo,
	            bg:'#FF5080',
	            time:5
	        });
		}
	}
	$("#loginname").focus(); 
});



function denglu(){
	if($("#loginname").val()==""){

		$("#loginname").tips({
			side:2,
            msg:'用户名不得为空',
            bg:'#AE81FF',
            time:3
        });
		
		$("#loginname").focus();
		return false;
	}else{
		$("#loginname").val(jQuery.trim($('#loginname').val()));
	}
	
	if($("#password").val()==""){

		$("#password").tips({
			side:2,
            msg:'密码不得为空',
            bg:'#AE81FF',
            time:3
        });
		
		$("#password").focus();
		return false;
	}
	if($("#code").val()==""){

		$("#code").tips({
			side:1,
            msg:'验证码不得为空',
            bg:'#AE81FF',
            time:3
        });

		$("#code").focus();
		return false;
	}
	
	$("#loginbox").tips({
		side:1,
        msg:'正在登录 , 请稍后 ...',
        bg:'#68B500',
        time:1000
    });
	$.cookie('loginname', $("#loginname").val(), { expires: 7 });
	$.cookie('password', $("#password").val(), { expires: 7 });
	$("#loginForm").submit();
}

</script>
<script type="text/javascript">
	function search(){
		var NumberTurningBlade = $("#NumberTurningBlade").val();
		window.open('/index/search?NumberTurningBlade='+NumberTurningBlade);
	}
</script>

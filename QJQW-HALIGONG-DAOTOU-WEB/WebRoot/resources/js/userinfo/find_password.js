$(function(){
    //	var screenHeight=$(window).height();
    //	$(".main").css({height: screenHeight });
    //登录注册模块的Tab页
    $(".denglu_tab_menu .denglu_yhdl").click(function(){
        $(this).css({borderRight:"1px solid #ccc",borderTop:"1px solid #ccc",borderBottom:"1px solid white",backgroundColor:"white",color:"#555555"})
               .siblings().css({border:"none",backgroundColor:"#7bb7c4",color:"white"});
    });
    $(".denglu_tab_menu .denglu_mfzc").click(function(){
        $(this).css({marginTop:"0",borderLeft:"1px solid #ccc",borderRight:"1px solid #ccc",borderBottom:"1px solid white",backgroundColor:"white",color:"#555555"})
               .siblings().css({border:"none",borderBottom:"1px solid #ccc",backgroundColor:"#7bb7c4",color:"white"});
    });
    $(".denglu_tab_menu>li").click(function(){
        var v2=$(this).index();
        $(".denglu_tab_content>div").eq(v2).removeClass("denglu_content_hide").siblings().addClass("denglu_content_hide");
    });

    //去除input点击时的边框
    $("input").focus(function(){
        $(this).css({outline:"none"});
    });  
    window.onload=function(){
    	document.getElementById('em').focus();
    };
    
    $(".tel_radio").click(function(){
    	document.getElementById('em').focus();

    	$(this).css({color:"#4bacf1"});
    	$(".input_tel input").css({color:"#4bacf1",border:"2px solid #4bacf1"});
    	$(".email_radio").css({color:"#a3a3a3"});
    	$(".input_email input  ,  .yzm_input input , .zhanghao_inp input").css({color:" ",border:"2px solid #a3a3a3"});
    	
    	$(".use_tel_find input , .use_tel_find span").removeAttr("readonly");
    	$(".use_email_find input , .email_msg input , .use_email_find span , .email_msg span").attr("readonly","readonly");
    	$(".sear_email").css({backgroundColor:"#a3a3a3",cursor:"auto"});
    	$(".sear_email").attr("onclick"," ");
    });
    
    $(".email_radio").click(function(){
    	document.getElementById('email').focus();
    	
    	
    	$(this).css({color:"#4bacf1"});
    	$(".input_email input  ,  .yzm_input input , .zhanghao_inp input").css({color:"#4bacf1",border:"2px solid #4bacf1"});
    	$(".tel_radio").css({color:"#a3a3a3"});
    	$(".input_tel input").css({color:" ",border:"2px solid #a3a3a3"});
    	
    	$(".use_tel_find input,.use_tel_find span").attr("readonly","readonly");
    	$(".use_email_find input , .email_msg input , .use_email_find span , .email_msg span").removeAttr("readonly");
    	$(".sear_email").css({backgroundColor:"#4bacf1",cursor:"pointer"});
    	$(".sear_email").attr("onclick","findEmail();");
    });
});

	//不识别placeholder时执行
	var JPlaceHolder = {
	    //检测
	    _check : function(){
	        return 'placeholder' in document.createElement('input');
	    },
	    //初始化
	    init : function(){
	        if(!this._check()){
	            this.fix();
	        }
	    },
	    //修复
	    fix : function(){
	        jQuery(':input[placeholder]').each(function(index, element) {
	            var self = $(this), txt = self.attr('placeholder');
	            self.wrap($('<div></div>').css({position:'relative', zoom:'1', border:'none', background:'none', padding:'none', margin:'none'}));
	            var pos = self.position(), h = self.outerHeight(true), paddingleft = self.css('padding-left');
	            var holder = $('<span></span>').text(txt).css({position:'absolute', left:pos.left, top:pos.top, height:h, lineHeight:"38px", paddingLeft:paddingleft, color:'#aaa'}).appendTo(self.parent());
	            self.focusin(function(e) {
	                holder.hide();
	            }).focusout(function(e) {
	                if(!self.val()){
	                    holder.show();
	                }
	            });
	            holder.click(function(e) {
	                holder.hide();
	                self.focus();
	            });
	        });
	    }
	};
	//执行
	jQuery(function(){
	    JPlaceHolder.init();    
	});
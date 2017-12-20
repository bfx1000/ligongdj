$(function(){
//    登录注册模块的Tab页
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

//    去除input点击时的边框
    $("input").focus(function(){
        $(this).css({outline:"none"});
    });
});

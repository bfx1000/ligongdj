$(document).ready(function(){
    $(".navbar .collapse ul li.btn").click(function(){
        $(this).css({borderBottom:"none"});
    });

    //������
    $(".imgtext").hide();
    $(".sy_wzqf .row>div").hover(function(){
        $(".imgtext",this).slideToggle(500);
    });

    $("input").click(function(){
        $(this).css({border:"0px solid #6fb5de"});
    });


    //$("#Tab>div div").css({display:"none"});
    //$("#Tab>div div").toggle(function(){
    //   $(this).css({background:"url(images/sy_mk_bottom.png)"});
    //},function(){
    //    $(this).css({background:"url(images/sy_mk_top.png)"});
    //});


    //�˵���
    $("nav .collapse>ul.nav>li").click(function(){
        $(this).css({borderBottom:"2px solid #6fb5de",backgroundColor:"white"})
            .siblings().css({borderBottom:"none",backgroundColor:"white"});
    });



    //�������
    $(".sy_tsjn div.panel-heading").click(function(){
        var v1=$(this).attr("rel");
        $($(".panel-default")[v1]).animate({width:"545px"},500)
            .siblings().animate({width:"153px"},500);
    });
});


